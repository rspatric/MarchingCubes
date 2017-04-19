#version 120

varying vec3 vMyColor;
uniform int H;
uniform int W;

void main()
{
	gl_FragColor = vec4(vMyColor.r, vMyColor.g, vMyColor.b, 1.0);
}
