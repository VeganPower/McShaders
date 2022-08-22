#version 150

in vec2 vaUV0; 
noperspective out vec2 tex_coord;

void main()
{
    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
    tex_coord = vaUV0;//
}
