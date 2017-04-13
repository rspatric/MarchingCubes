/*
 * Marching Cubes Lab
 * Roslyn Patrick-Sunnes
 * Rohin Chander
 */
#include <iostream>
#define GLEW_STATIC
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <glm/gtx/transform.hpp>
#include "GLSL.h"
#include "Program.h"
#include "MatrixStack.h"
#include "Shape.h"
// value_ptr for glm
#include <glm/gtc/type_ptr.hpp>
#include <glm/gtc/matrix_transform.hpp>

/* to use glee */
//#define GLEE_OVERWRITE_GL_FUNCTIONS
//#include "glee.hpp"

using namespace std;

GLFWwindow *window; // Main application window
string RESOURCE_DIR = ""; // Where the resources are loaded from
shared_ptr<Program> prog; //original roject 2b

int g_width, g_height; 
int cubeSize = 10;
GLuint VertexArrayID;
GLfloat g_vertex_buffer_data[3000]; //3*cubeSize^3, vertex data for all x, y, z points
GLuint vertexbuffer;

struct Point {
	float x;
	float y;
	float z;
};

struct Triangle {
	Point p1;
	Point p2;
	Point p3;
};

struct Cube {
	Point p[8];
};

//cubeSize^3
Point points[1000];
//(cubeSize - 1)^2
Cube cubes[81];

void createPerspectiveMat(float *m, float fovy, float aspect, float zNear, float zFar)
{
   // http://www-01.ibm.com/support/knowledgecenter/ssw_aix_61/com.ibm.aix.opengl/doc/openglrf/gluPerspective.htm%23b5c8872587rree
   float f = 1.0f/tan(0.5f*fovy);
   m[ 0] = f/aspect;
   m[ 1] = 0.0f;
   m[ 2] = 0.0f;
   m[ 3] = 0.0f;
   m[ 4] = 0;
   m[ 5] = f;
   m[ 6] = 0.0f;
   m[ 7] = 0.0f;
   m[ 8] = 0.0f;
   m[ 9] = 0.0f;
   m[10] = (zFar + zNear)/(zNear - zFar);
   m[11] = -1.0f;
   m[12] = 0.0f;
   m[13] = 0.0f;
   m[14] = 2.0f*zFar*zNear/(zNear - zFar);
   m[15] = 0.0f;
}

/*
 * This method initializes all the x, y, and z coordinates for all the points in 
 * a 100 * 100 * 100 cube.
 */
void initPoints() {
   float i = 0, j = 0, k = 0; //x, y, z,
   int count = 0; //the rows going down
   int count2 = 0; //the layers coming forward
   int current = 0.0;
   //initialize points for 100*100*100 cube
   while (current < 3 * cubeSize * cubeSize * cubeSize) {
      g_vertex_buffer_data[current++] = (float) (i++) / (float) cubeSize - 0.5f; //x
      g_vertex_buffer_data[current++] = (float) j / (float) cubeSize - 0.5f; //y
      g_vertex_buffer_data[current++] = (float) k / (float) cubeSize; //z
      if (count++ == cubeSize) {
         count = 0;
         count2++;
         j++;
         i = 0;
      }
      else if (count2 == cubeSize) {
         count = 0;
         count2 = 0;
         i = 0;
         j = 0;
         k++;         
      }
	  points[current/3 - 1] = { i, j, k };
      cout << i << "," << j << "," << k << endl;
   }
}

void initAllCubes() {

}

void initCube() {
	float radius = 1;
	// implicit sphere eq x^2 + y^2 + z^2 = 1
	float maxX = sqrt(radius);
	float maxY = sqrt(radius);
	float maxZ = sqrt(radius);
	float minX = -sqrt(radius);
	float minY = -sqrt(radius);
	float minZ = -sqrt(radius);
	float difx = maxX - minX;
	float dify = maxY - minY;
	float difz = maxZ - minZ;
	float sideOfCube = max(max(difx, dify), difz);
}

static void error_callback(int error, const char *description)
{
   cerr << description << endl;
}

static void key_callback(GLFWwindow *window, int key, int scancode, int action, int mods)
{
   if(key == GLFW_KEY_ESCAPE && action == GLFW_PRESS) {
      glfwSetWindowShouldClose(window, GL_TRUE);
   }
}


static void mouse_callback(GLFWwindow *window, int button, int action, int mods)
{
   double posX, posY;
   if (action == GLFW_PRESS) {
      glfwGetCursorPos(window, &posX, &posY);
      cout << "Pos X " << posX <<  " Pos Y " << posY << endl;
   }
}

static void resize_callback(GLFWwindow *window, int width, int height) {
   g_width = width;
   g_height = height;
   glViewport(0, 0, width, height);
}

static void init()
{
   GLSL::checkVersion();

   // Set background color.
   glClearColor(.12f, .34f, .56f, 1.0f);
   // Enable z-buffer test.
   glEnable(GL_DEPTH_TEST);

   // Initialize the GLSL program.
   prog = make_shared<Program>();
   prog->setVerbose(true);
   prog->setShaderNames(RESOURCE_DIR + "simple_vert.glsl", RESOURCE_DIR + "simple_frag.glsl");
   prog->init();
   prog->addUniform("P");
   prog->addUniform("MV");
   prog->addAttribute("vertPos");

   //initGeom
   //Generate the VAO
   glGenVertexArrays(1, &VertexArrayID);
   glBindVertexArray(VertexArrayID);
   //generate vertex buffer to hand off to OGL
   glGenBuffers(1, &vertexbuffer);
   //set the current state to focus on our vertex buffer
   glBindBuffer(GL_ARRAY_BUFFER, vertexbuffer);
   glBufferData(GL_ARRAY_BUFFER, sizeof(g_vertex_buffer_data), g_vertex_buffer_data, GL_DYNAMIC_DRAW);
}

static void render()
{
   int width, height;
   glfwGetFramebufferSize(window, &width, &height);
   float aspect = width/(float)height;
   glViewport(0, 0, width, height);

   // Clear framebuffer.
   glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

   auto P = make_shared<MatrixStack>();
   auto MV = make_shared<MatrixStack>();
   // Apply orthographic projection.
   P->pushMatrix();
    
   if (width > height) {
      P->ortho(-1*aspect, aspect, -1, 1, -1, 100.0f);
   } else {
      P->ortho(-1, 1, -1/aspect, 1/aspect, -1, 100.0f);
   }
   MV->pushMatrix();
   
   prog->bind();
   //send the matrices to the shaders
   glUniformMatrix4fv(prog->getUniform("P"), 1, GL_FALSE, value_ptr(P->topMatrix()));
   glUniformMatrix4fv(prog->getUniform("MV"), 1, GL_FALSE, value_ptr(MV->topMatrix()));
   //we need to set up the vertex array
   glEnableVertexAttribArray(0);
   glBindBuffer(GL_ARRAY_BUFFER, vertexbuffer);
   //key function to get up how many elements to pull out at a time (2)
   glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, (void*) 0);
   //send timer value here
   glPointSize(25);
   //actually draw from vertex 0, 2 vertices
   glDrawArrays(GL_POINTS, 0, cubeSize * cubeSize * cubeSize);
   glDisableVertexAttribArray(0);
   prog->unbind();
}

int main(int argc, char **argv)
{
   if(argc < 2) {
      cout << "Please specify the resource directory." << endl;
      return 0;
   }
   RESOURCE_DIR = argv[1] + string("/");

   // Set error callback.
   glfwSetErrorCallback(error_callback);
   // Initialize the library.
   if(!glfwInit()) {
      return -1;
   }
   //request the highest possible version of OGL - important for mac
   glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
   glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
   glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
   glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);

   // Create a windowed mode window and its OpenGL context.
   window = glfwCreateWindow(640, 480, "Marching Cubes", NULL, NULL);
   if(!window) {
      glfwTerminate();
      return -1;
   }
   // Make the window's context current.
   glfwMakeContextCurrent(window);
   // Initialize GLEW.
   glewExperimental = true;
   if(glewInit() != GLEW_OK) {
      cerr << "Failed to initialize GLEW" << endl;
      return -1;
   }
   //weird bootstrap of glGetError
   glGetError();
   cout << "OpenGL version: " << glGetString(GL_VERSION) << endl;
   cout << "GLSL version: " << glGetString(GL_SHADING_LANGUAGE_VERSION) << endl;

   // Set vsync.
   glfwSwapInterval(1);
   // Set keyboard callback.
   glfwSetKeyCallback(window, key_callback);
   //set the mouse call back
   glfwSetMouseButtonCallback(window, mouse_callback);
   //set the window resize call back
   glfwSetFramebufferSizeCallback(window, resize_callback);

   initCube();
   initPoints();

   // Initialize scene. Note geometry initialized in init now
   init();

   // Loop until the user closes the window.
   while(!glfwWindowShouldClose(window)) {
      // Render scene.
      render();
      // Swap front and back buffers.
      glfwSwapBuffers(window);
      // Poll for and process events.
      glfwPollEvents();
   }
   // Quit program.
   glfwDestroyWindow(window);
   glfwTerminate();
   return 0;
}
