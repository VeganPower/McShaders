#version 150

// flat in vec2 lm_coord;
// flat in vec3 normal;
// flat in vec3 sunVec;
// flat in vec3 upVec;
// flat in vec3 northVec;
// flat in vec3 eastVec;
in vec2 tex_coord;
uniform sampler2D gcolor;
/* DRAWBUFFERS:0 */
out vec4 frag_0;

//Uniforms//
// uniform int isEyeInWater;
// uniform int frameCounter;
// 
// uniform float viewWidth;
// uniform float viewHeight;
// uniform float nightVision;
// 
// uniform vec3 fogColor;
// uniform vec3 skyColor;
// uniform vec3 cameraPosition;
// 
// uniform mat4 gbufferProjectionInverse;
// uniform mat4 gbufferModelViewInverse;
// uniform mat4 shadowModelView;
// uniform mat4 shadowProjection;

//Program//
void main()
{
    vec3 color = texture2D(gcolor, tex_coord).rgb;
    frag_0 = vec4(color,  1);
}
