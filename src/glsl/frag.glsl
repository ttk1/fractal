#version 300 es

precision mediump float;

out vec4 color;

void main() {
  if (distance(gl_FragCoord.xy, vec2(250, 250)) < 50.0) {
    discard;
  }
  color = vec4(1.0, 1.0, 1.0, 1.0);
}
