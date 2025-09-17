#version 320 es

precision highp float;

layout(location = 0) out vec4 fragColor;

// Uniform order (float slots):
// 0: iResolution.x, 1: iResolution.y
// 2: iTime
// 3: uCustomColor.r, 4: uCustomColor.g, 5: uCustomColor.b
// 6: uUseCustomColor
// 7: uSpeed
// 8: uDirection
// 9: uScale
// 10: uOpacity
// 11: uMouse.x, 12: uMouse.y
// 13: uMouseInteractive
layout(location = 0) uniform float iResolutionX;
layout(location = 1) uniform float iResolutionY;
layout(location = 2) uniform float iTime;
layout(location = 3) uniform float uColorR;
layout(location = 4) uniform float uColorG;
layout(location = 5) uniform float uColorB;
layout(location = 6) uniform float uUseCustomColor;
layout(location = 7) uniform float uSpeed;
layout(location = 8) uniform float uDirection;
layout(location = 9) uniform float uScale;
layout(location = 10) uniform float uOpacity;
layout(location = 11) uniform float uMouseX;
layout(location = 12) uniform float uMouseY;
layout(location = 13) uniform float uMouseInteractive;

bool finite1(float x){ return !(isnan(x) || isinf(x)); }
vec3 sanitize(vec3 c){
  return vec3(
    finite1(c.r) ? c.r : 0.0,
    finite1(c.g) ? c.g : 0.0,
    finite1(c.b) ? c.b : 0.0
  );
}

void mainImage(out vec4 o, vec2 C) {
  vec2 iResolution = vec2(iResolutionX, iResolutionY);
  vec2 center = iResolution * 0.5;
  C = (C - center) / max(uScale, 0.0001) + center;

  // Mouse influence similar to JS
  vec2 uMouse = vec2(uMouseX, uMouseY);
  vec2 mouseOffset = (uMouse - center) * 0.0002;
  C += mouseOffset * length(C - center) * step(0.5, uMouseInteractive);

  float i = 0.0; float d; float z = 0.0;
  float T = iTime * uSpeed * uDirection;
  vec3 O = vec3(0.0); vec3 p; vec3 S;
  vec4 col = vec4(0.0);

  // 60 iterations like reference; adjust on low-power externally if needed
  for (int iter = 0; iter < 60; iter++) {
    p = z * normalize(vec3(C - 0.5 * iResolution, iResolution.y));
    p.z -= 4.0;
    S = p;
    d = p.y - T;

    p.x += 0.4 * (1.0 + p.y) * sin(d + p.x * 0.1) * cos(0.34 * d + p.x * 0.05);
    vec2 Q = p.xz;
    float c = cos(p.y + T);
    float s = sin(p.y + T);
    Q *= mat2(c, -s, s, c);
    p.xz = Q;

    z += d = abs(sqrt(dot(Q, Q)) - 0.25 * (5.0 + S.y)) / 3.0 + 8e-4;
    col = 1.0 + sin(S.y + p.z * 0.5 + S.z - length(S - p) + vec4(2, 1, 0, 8));
    O += col.w / d * col.xyz;
    i += 1.0;
  }
  o.xyz = tanh(O / 1e4);
}

void main(){
  vec4 o = vec4(0.0);
  mainImage(o, gl_FragCoord.xy);
  vec3 rgb = sanitize(o.rgb);

  float intensity = (rgb.r + rgb.g + rgb.b) / 3.0;
  vec3 custom = intensity * vec3(uColorR, uColorG, uColorB);
  vec3 finalColor = mix(rgb, custom, step(0.5, uUseCustomColor));

  float alpha = length(rgb) * clamp(uOpacity, 0.0, 1.0);
  fragColor = vec4(finalColor, alpha);
}