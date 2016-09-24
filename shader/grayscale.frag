uniform sampler2D src;
uniform lowp float qt_Opacity;

/* In */
varying vec2 UV;

void main()
{
    vec4 color = texture2D(src, UV);
    float grey = color.r;

    gl_FragColor = vec4(grey, grey, grey, 1.0);
}
