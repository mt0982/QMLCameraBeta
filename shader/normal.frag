uniform sampler2D src;

/* In */
varying vec2 UV;

void main()
{
    vec4 color = texture2D(src, UV);
    gl_FragColor = color;
}
