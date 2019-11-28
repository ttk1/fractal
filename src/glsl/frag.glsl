#version 300 es

precision mediump float;
out vec4 color;
uniform vec2 size;
const int level = 8;

void main() {
  color = vec4(1.0, 1.0, 1.0, 1.0);
  vec2 p = gl_FragCoord.xy / size;
  if (p.x + p.y / 2.0 > 1.0 ||
      p.x - p.y / 2.0 < 0.0 ||
      p.y < 0.0) {
    discard;
    return;
  }
  for (int i = 0; i < level; i++) {
    p *= 2.0;
    if (floor(mod(p.x + p.y / 2.0, 2.0)) == 1.0 &&
        floor(mod(p.x - p.y / 2.0, 2.0)) == 0.0 &&
        floor(mod(p.y, 2.0)) == 0.0) {
      discard;
      return;
    }
  }
}