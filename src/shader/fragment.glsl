uniform vec3 uDepthColor;
uniform vec3 uSurfaceColor;
uniform float uColorOffset;
uniform float uColorMultiplier;

uniform vec3 fogColor;
uniform float fogNear;
uniform float fogFar;

varying vec2 vUv; 
varying float vElevation;

void main() {
    float mixStrength = (vElevation + uColorOffset) * uColorMultiplier;
    float depth = gl_FragCoord.z / gl_FragCoord.w;
    float fogFactor = smoothstep( fogNear, fogFar, depth );

    vec3 mixColor = mix(uDepthColor,uSurfaceColor, mixStrength );
    mixColor = mix( mixColor, fogColor, fogFactor );


      gl_FragColor = vec4(mixColor,1.0);

}