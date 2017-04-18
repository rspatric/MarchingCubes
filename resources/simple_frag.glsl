#version 330 core 
out vec4 color;
in vec3 position;

void main()
{
   color = vec4(0.6, 0.4, 2 * position.z, 1.0);
   //implicit eq of circle x^2 + y^2 + z^2 < 1
//   if (pow(position.x, 2) + pow(position.y - 0.3, 2) + pow(position.z - 0.5, 2) < 0.4) {
  //    discard;
   //}
}
