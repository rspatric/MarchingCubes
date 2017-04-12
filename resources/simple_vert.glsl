#version  330 core
layout(location = 0) in vec3 vertPos;
uniform mat4 P;
uniform mat4 MV;
uniform float radius = 1.0;
out vec3 position;

void main()
{
   //implicit eq of circle x^2 + y^2 + z^2 < 1 

   gl_Position =  P * MV * vec4(vertPos.x, vertPos.y, vertPos.z, 1.0);
   position = vertPos;
}
