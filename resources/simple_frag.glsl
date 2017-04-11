#version 330 core 
in vec3 fragNor;
out vec4 color;

void main()
{
        vec3 light = vec3(1.0, 1.0, 0.0);
        vec3 vColor = vec3(0.5, 0.1, 0.1);
	vec3 normal = normalize(fragNor);
        
        //original normal colors
        vec3 Ncolor = 0.5*normal +0.5;
        color = vec4(Ncolor, 1.0);

        //code for rotating red sphere with fixed light
        //float diffuse = max(0.0, dot(normal, light));
        //vec3 i = vColor * diffuse;
        //color = vec4(i, 1.0);
}
