
varying highp vec2 coord;
uniform sampler2D src;
uniform lowp float qt_Opacity;
void main() {
    lowp vec4 tex = texture2D(src, coord);
    gl_FragColor = tex + vec4(0.4);
}
