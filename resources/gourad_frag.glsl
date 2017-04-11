#version 330 core 
in vec3 fragNor;
out vec4 color;
in vec3 pos;
uniform float xLight;
uniform float mat;

void main()
{
        vec3 light = vec3(xLight, 1.0, 2.0);
        vec3 vColor = vec3(0.2 + 0.2 * mat, 0.2, 0.6);
	vec3 normal = normalize(fragNor);
        float diffuse = max(0.0, dot(normal, light));
        vec3 i = vColor * diffuse;
        color = vec4(i, 1.0);
}
