#version 300 es

precision mediump float;

out vec4 color;

uniform vec2 size;

const vec2 p1 = vec2(-1.0, 0.5);
const vec2 p2 = vec2(0.0, 0.0);
const vec2 p3 = vec2(0.0, 1.0);

void f(vec2 pos) {}

void main() {
  vec2 p = gl_FragCoord.xy / size;
  if (dot(p, p1 - p2) < 0.0 && dot(p, p2 - p3) < 0.0 && dot(p, p3 - p1) < 1.0) {
    if (dot(p, p2 - p3) < -0.5) {
      color = vec4(1.0, 1.0, 1.0, 1.0);
    } else if (dot(p, p1 - p2) < -0.5) {
      color = vec4(1.0, 1.0, 1.0, 1.0);
    } else if (dot(p, p3 - p1) < 0.5) {
      color = vec4(1.0, 1.0, 1.0, 1.0);
    } else {
      discard;
    }
  } else {
    discard;
  }
}
