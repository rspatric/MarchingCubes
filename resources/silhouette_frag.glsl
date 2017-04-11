#version 330 core 
in vec3 fragNor;
out vec4 color;

void main()
{
        vec3 light = vec3(1.0, 1.0, 0.0);
        vec3 vColor = vec3(0.5, 0.1, 0.1);
	vec3 normal = normalize(fragNor);
        
        if (normal.z < 0.2) {
            color = vec4(0.0, 0.0, 0.0, 1.0);
        }
        else {
            color = vec4(1.0, 1.0, 1.0, 1.0);
        }
}
