#version 330 core

in vec3 vertex;
in vec3 normal;

out vec4 vertexFS;
out vec3 normalFS;
out vec3 LFS;

in vec3 matambVS;
in vec3 matdiffVS;
in vec3 matspecVS;
in float matshinVS;

out vec3 matamb;
out vec3 matdiff;
out vec3 matspec;
out float matshin;

uniform mat4 proj;
uniform mat4 view;
uniform mat4 TG;
uniform vec3 posFocus;

out vec3 fcolor;

void main()
{
    /*vec3 pF;
	if (foc) { //escena
        vec4 pFaux = view * vec4(posFocus, 1);
        pF = pFaux.xyz;
    }
	else { //càmara
        pF = posFocus;
    }*/
    vec3 pF = posFocus;
    vec4 vSCO = view * TG * vec4(vertex, 1);
    vec3 L = pF.xyz - vSCO.xyz;
    mat3 NormalMatrix = inverse(transpose(mat3(view*TG)));
    vec3 n = NormalMatrix * normal;
    
    gl_Position = proj * view * TG * vec4 (vertex, 1.0);
    
    vertexFS = vSCO;
    normalFS = n;
    LFS = L;
    matamb = matambVS;
    matdiff = matdiffVS;
    matspec = matspecVS;
    matshin = matshinVS;
}
