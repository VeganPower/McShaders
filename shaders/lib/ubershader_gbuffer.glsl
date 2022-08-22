#include "uniforms.glsl"

#ifdef SH_IS_TEXTURED
uniform sampler2D texture;
uniform sampler2D normals;
uniform sampler2D specular;

in vec2 tx_coord;
#endif

#if defined SH_IS_LIT && defined SH_IS_TERRAIN
#define USE_LIGHTMAP
#endif

#ifdef USE_LIGHTMAP
uniform sampler2D lightmap;
in vec2 lm_coord;
#endif

in vec4 vx_color;

/* RENDERTARGETS:0,4 */
out vec4 colortex0; // albedo
out vec2 colortex4; // lightmap


void fill_gbuffer()
{
    vec3 albedo = vx_color.rgb;
#ifdef SH_IS_TEXTURED
    vec3 tx_color = texture2D(texture, tx_coord).rgb;
    albedo *= tx_color;
#endif
#ifdef USE_LIGHTMAP
    // Lighmap doesn't clamp to the last textel
    vec2 l_map_uv = (lm_coord/255.0 * 15.0/16.0) + 0.5/16.0;
    // vec2 l_map_uv = clamp(lm_coord / 255.0, 0.5/16, 15.5/16);
    vec2 l_map = texture2D(lightmap, l_map_uv).xy;

    colortex4 = l_map;
#endif
    int material_ID = 0;
#ifdef SH_IS_TERRAIN
    material_ID = 1;
#elif defined SH_IS_LIT
    material_ID = 2;
#endif

    colortex0 = vec4(albedo, float(material_ID) / 255.0);
}