#include "common.glsl"
#include "uniforms.glsl"

in  vec3 vaPosition;
in  vec4 vaColor;           // Vertex Color

#ifdef SH_IS_TEXTURED
in  vec2 vaUV0;             // Texture UV
#endif

#if defined SH_IS_LIT && defined SH_IS_TERRAIN
#define USE_LIGHTMAP
#endif

#ifdef USE_LIGHTMAP
in ivec2 vaUV2;             // Lightmap UV
#endif

#ifdef SH_IS_LIT
in  vec3 vaNormal;          // Geometric Normal
in  vec4 at_tangent;
#endif

#if 0
in ivec2 vaUV1;             // Overlay UV
in  vec3 mc_Entity;
in  vec2 mc_midTexCoord;
in  vec3 at_velocity;
in  vec3 at_midBlock;
#endif

out vec4 vx_color;

#if defined SH_IS_LIT && defined SH_IS_TERRAIN
out vec2 lm_coord;
// flat out vec3 normal;
#endif
// flat out vec3 sunVec;
// flat out vec3 upVec;
// flat out vec3 northVec;
// flat out vec3 eastVec;
#ifdef SH_IS_TEXTURED
out vec2 tx_coord;
#endif


#if defined SH_IS_LIT && defined SH_IS_TERRAIN
vec2 get_light_map_coordinates()
{
    vec2 coord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    return vec2(vaUV2);//clamp((coord - 0.03125) * 1.06667, 0.0, 1.0);
}
#endif

// vec3 GetSunVector()
// {
//     const vec2 sunRotationData = vec2(cos(sunPathRotation * 0.01745329251994), -sin(sunPathRotation * 0.01745329251994));
//     #ifdef OVERWORLD
//         float ang = fract(timeAngle - 0.25);
//         ang = (ang + (cos(ang * 3.14159265358979) * -0.5 + 0.5 - ang) / 3.0) * 6.28318530717959;
//         return normalize((gbufferModelView * vec4(vec3(-sin(ang), cos(ang) * sunRotationData) * 2000.0, 1.0)).xyz);
//     #elif defined END
//         float ang = 0.0;
//         return normalize((gbufferModelView * vec4(vec3(0.0, sunRotationData * 2000.0), 1.0)).xyz);
//     #else
//         return vec3(0.0);
//     #endif
// }

void vx_transformation()
{
#ifdef SH_IS_TERRAIN
    vec3 vx_position = vaPosition + chunkOffset;
#else
    vec3 vx_position = vaPosition;
#endif
    vec4 w_pos = (modelViewMatrix * vec4(vx_position, 1));


    gl_Position = projectionMatrix * w_pos;//ftransform();
    vx_color = vaColor;

#if defined SH_IS_LIT && defined SH_IS_TERRAIN
    lm_coord  = get_light_map_coordinates();
#endif

#ifdef SH_IS_TEXTURED
    tx_coord = (textureMatrix * vec4(vaUV0, 0, 1)).xy;
#endif
}