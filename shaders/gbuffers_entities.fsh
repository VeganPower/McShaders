#version 150

#define SH_IS_LIT
#define SH_IS_TEXTURED
#define SH_ENTITIES

#include "lib/ubershader_gbuffer.glsl"

//Program//
void main()
{
    fill_gbuffer();
}
