uniform sampler2D src;

/* In */
varying vec2 UV;

void main()
{
    vec4 color = texture2D(src, UV);
    gl_FragColor = vec4(vec3(dot(color.rgb, vec3(0.344, 0.5, 0.156))), color.a);
}
