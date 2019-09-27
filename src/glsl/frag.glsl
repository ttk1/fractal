#version 300 es

precision mediump float;

out vec4 color;

uniform vec2 size;

const vec2 p1 = vec2(-1.0, 0.5);
const vec2 p2 = vec2(0.0, 0.0);
const vec2 p3 = vec2(0.0, 1.0);

void main() {
  if (dot(gl_FragCoord.xy / size, p1 - p2) < 0.0 &&
      dot(gl_FragCoord.xy / size, p2 - p3) < 0.0 &&
      dot(gl_FragCoord.xy / size, p3 - p1) < 1.0) {
    color = vec4(1.0, 1.0, 1.0, 1.0);
  } else {
    discard;
  }
}
