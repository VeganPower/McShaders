// GBuffers Uniforms
// ================= 
// Programs: basic, textured, textured_lit, skybasic, skytextured, clouds, terrain, terrain_solid, terrain_cutout_mip, terrain_cutout, damagedblock, water, block, beaconbeam, item, entities, armor_glint, spidereyes, hand, hand_water, weather)
// ==================
// Source                                          Value                                                    
// =====================================================================================================================================================================
uniform sampler2D texture;                      // 0
uniform sampler2D lightmap;                     // 1
uniform sampler2D normals;                      // 2         
uniform sampler2D specular;                     // 3
// uniform sampler2D shadow;                       // waterShadowEnabled ? 5 : 4
// uniform sampler2D watershadow;                  // 4
uniform sampler2D shadowtex0;                   // 4
uniform sampler2D shadowtex1;                   // 5
uniform sampler2D depthtex0;                    // 6
uniform sampler2D gaux1;                        // 7  <custom texture or output from deferred programs>
uniform sampler2D gaux2;                        // 8  <custom texture or output from deferred programs>
uniform sampler2D gaux3;                        // 9  <custom texture or output from deferred programs>
uniform sampler2D gaux4;                        // 10 <custom texture or output from deferred programs>
uniform sampler2D depthtex1;                    // 11
uniform sampler2D shadowcolor;                  // 13
uniform sampler2D shadowcolor0;                 // 13
uniform sampler2D shadowcolor1;                 // 14
uniform sampler2D noisetex;                     // 15
uniform sampler2D colortex8;                    // 16 <custom texture or output from deferred programs>
uniform sampler2D colortex9;                    // 17 <custom texture or output from deferred programs>
uniform sampler2D colortex10;                   // 18 <custom texture or output from deferred programs>
uniform sampler2D colortex11;                   // 19 <custom texture or output from deferred programs>
uniform sampler2D colortex12;                   // 20 <custom texture or output from deferred programs>
uniform sampler2D colortex13;                   // 21 <custom texture or output from deferred programs>
uniform sampler2D colortex14;                   // 22 <custom texture or output from deferred programs>
uniform sampler2D colortex15;                   // 23 <custom texture or output from deferred programs>