#version 330 core 
in vec3 fragNor;
out vec4 color;
in vec3 pos;
uniform float xLight;
uniform float mat;

void main()
{
        

        vec3 light = vec3(xLight, 1.0, 0.0);
        vec3 vColor = vec3(0.5, 0.1, 0.1);
	vec3 normal = normalize(fragNor);
        float diffuse = max(0.0, dot(normal, light));
        vec3 toEye = -normalize(pos);
        vec3 h = normalize(toEye + light);
        float phongExp = 64.0;
        phongExp -= mat * 5.0;
        float specular = pow(max(0.0, dot(h, normal)), phongExp);
        vec3 ambient = vec3(0.2, 0.1 + 0.2 * mat, 0.1);
        vec3 lightcolor = vec3(0.0, 0.0, 1.0);
        vec3 i = (vColor + ambient) * diffuse + specular * lightcolor;
        color = vec4(i, 1.0);
}
