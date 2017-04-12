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
#define GLEE_OVERWRITE_GL_FUNCTIONS
#include "glee.hpp"

using namespace std;

GLFWwindow *window; // Main application window
string RESOURCE_DIR = ""; // Where the resources are loaded from
shared_ptr<Program> prog; //original roject 2b

int g_width, g_height; 
int cubeSize = 20;
GLuint VertexArrayID;
GLfloat g_vertex_buffer_data[240000]; //100*100*100 cube, vertex data for all x, y, z points
GLuint vertexbuffer;

void printMat(float *A, const char *name = 0)
{
   // OpenGL uses col-major ordering:
   // [ 0  4  8 12]
   // [ 1  5  9 13]
   // [ 2  6 10 14]
   // [ 3  7 11 15]
   // The (i,j)th element is A[i+4*j].
   if(name) {
      printf("%s=[\n", name);
   }
   for(int i = 0; i < 4; ++i) {
      for(int j = 0; j < 4; ++j) {
         printf("%- 5.2f ", A[i+4*j]);
      }
      printf("\n");
   }
   if(name) {
      printf("];");
   }
   printf("\n");
}

void createIdentityMat(float *M)
{
   //set all values to zero
   for(int i = 0; i < 4; ++i) {
      for(int j = 0; j < 4; ++j) {
         M[i*4+j] = 0;
      }
   }
   //overwrite diagonal with 1s
   M[0] = M[5] = M[10] = M[15] = 1;
}

void createTranslateMat(float *T, float x, float y, float z)
{
   for(int i = 0; i < 4; ++i) {
      for(int j = 0; j < 4; ++j) {
         T[i*4+j] = 0;
      }
   }
   T[0] = T[5] = T[10] = T[15] = 1;
   T[12] = x;
   T[13] = y;
   T[14] = z;
}

void createScaleMat(float *S, float x, float y, float z)
{
   for(int i = 0; i < 4; ++i) {
      for(int j = 0; j < 4; ++j) {
         S[i*4+j] = 0;
      }
   }
   S[15] = 1;
   S[0] = x;
   S[5] = y;
   S[10] = z;
}

void createRotateMatX(float *R, float radians)
{ 
   for(int i = 0; i < 4; ++i) {
      for(int j = 0; j < 4; ++j) {
         R[i*4+j] = 0;
      }
   }
   R[0] = R[5] = R[10] = R[15] = 1;
   R[5] = cos(radians);
   R[9] = sin(radians);
   R[6] = -1 * sin(radians);
   R[10] = cos(radians);
}

void createRotateMatY(float *R, float radians)
{
   for(int i = 0; i < 4; ++i) {
      for(int j = 0; j < 4; ++j) {
         R[i*4+j] = 0;
      }
   }
   R[0] = R[5] = R[10] = R[15] = 1;
   R[0] = cos(radians);
   R[8] = -1 * sin(radians);          
   R[2] = sin(radians);
   R[10] = cos(radians);
}

void createRotateMatZ(float *R, float radians)
{
   for(int i = 0; i < 4; ++i) {
      for(int j = 0; j < 4; ++j) {
         R[i*4+j] = 0;
      }
   }
   R[0] = R[5] = R[10] = R[15] = 1;
   R[0] = cos(radians);
   R[4] = sin(radians);
   R[1] = -1 * sin(radians);
   R[5] = cos(radians);
}

void multMat(float *C, const float *A, const float *B)
{
   float c = 0;
   for(int k = 0; k < 4; ++k) {
      // Process kth column of C
      for(int i = 0; i < 4; ++i) {
         // Process ith row of C.
         // The (i,k)th element of C is the dot product
         // of the ith row of A and kth col of B.
         c = 0;
         //vector dot
         for(int j = 0; j < 4; ++j) {
            c += A[k+j*4]*B[j+4*i]; 
         }
         C[k+4*i] = c;

      }
   }
}

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
      g_vertex_buffer_data[current++] = (float) (i++) / 100.0f - 0.5f; //x
      g_vertex_buffer_data[current++] = (float) j / 100.0f - 0.5f; //y
      g_vertex_buffer_data[current++] = (float) k / 100.0f; //z
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
      cout << i << "," << j << "," << k << endl;
   }
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
   glPointSize(50);
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
