#version 300 es

precision mediump float;

out vec4 color;

uniform vec2 size;

const int level = 8;
const vec2 p1 = vec2(0.0, -1.0);
const vec2 p2 = vec2(-1.0, 0.5);
const vec2 p3 = vec2(1.0, 0.5);

void main() {
  vec2 p = gl_FragCoord.xy / size;
  color = vec4(1.0, 1.0, 1.0, 1.0);
  if (dot(p, p1) < 0.0 && dot(p, p2) < 0.0 && dot(p, p3) < 1.0) {
    for (int i = 0; i < level; i++) {
      if (dot(p, p1) < -0.5) {
        // 上の三角形
        p = (p - vec2(0.25, 0.5)) * 2.0;
      } else if (dot(p, p2) < -0.5) {
        // 右下の三角形
        p = (p - vec2(0.5, 0.0)) * 2.0;
      } else if (dot(p, p3) < 0.5) {
        // 左下の三角形
        p *= 2.0;
      } else {
        discard;
        break;
      }
    }
  } else {
    discard;
  }
}
