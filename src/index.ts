window.onload = () => {
  const canvas = document.getElementById('canvas') as HTMLCanvasElement;
  canvas.width = 800;
  canvas.height = 700;

  const gl = canvas.getContext('webgl2');
  gl.clearColor(0.0, 0.0, 0.0, 1.0);
  gl.clear(gl.COLOR_BUFFER_BIT);

  function getShader(type: number, source: string) {
    const shader = gl.createShader(type);
    gl.shaderSource(shader, source);
    gl.compileShader(shader);
    if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
      throw new Error(gl.getShaderInfoLog(shader));
    }
    return shader;
  }

  const program = gl.createProgram();
  const vertexShader =
    getShader(gl.VERTEX_SHADER, require('./glsl/vert.glsl').default);
  gl.attachShader(program, vertexShader);
  const fragmentShader =
    getShader(gl.FRAGMENT_SHADER, require('./glsl/frag.glsl').default);
  gl.attachShader(program, fragmentShader);
  gl.linkProgram(program);
  gl.useProgram(program);

  let count = 0;
  const rate = 100;
  step();

  function step() {
    const sizeLoc = gl.getUniformLocation(program, 'size');
    gl.uniform2fv(sizeLoc, [(1 + count / rate) * canvas.width, (1 + count / rate) * canvas.height]);

    gl.clear(gl.COLOR_BUFFER_BIT);
    gl.drawArrays(gl.TRIANGLE_FAN, 0, 4);

    count = (count + 1) % rate;
    requestAnimationFrame(step);
  }
};
