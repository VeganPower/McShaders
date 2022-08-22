#version 150

// flat in vec2 lm_coord;
// flat in vec3 normal;
// flat in vec3 sunVec;
// flat in vec3 upVec;
// flat in vec3 northVec;
// flat in vec3 eastVec;
in vec2 tex_coord;


uniform sampler2D colortex0; // Albedo , Material ID
uniform sampler2D colortex1; // depth
uniform sampler2D colortex2; // normal / F0
uniform sampler2D colortex4; // lightmap

// uniform sampler2D lightmap;
/* DRAWBUFFERS:0 */
out vec4 frag_0;


void main()
{
    vec3 color = texture2D(colortex0, tex_coord).rgb;
    vec3 l_map = texture2D(colortex4, tex_coord).rgb;

    vec3 ambient = color * l_map;
    vec3 diffuse = vec3(0, 0, 0);
    vec3 specular = vec3(0, 0, 0);
    frag_0 = vec4(ambient + diffuse + specular, 0);
}
