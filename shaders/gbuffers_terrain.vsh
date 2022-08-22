#version 150

#define SH_IS_LIT
#define SH_IS_TEXTURED
#define SH_IS_TERRAIN

#include "lib/vx_transform.glsl"

void main()
{
    vx_transformation();
}
