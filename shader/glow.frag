uniform sampler2D src;

/* In */
varying vec2 UV;

const float step_w = 0.0015625;
const float step_h = 0.0027778;

void main()
{
    /* Pixel Color */
    vec4 color = texture2D(src, UV);

    /* Grid */
    vec3 g1 = texture2D(src, vec2(UV.x - step_w, UV.y - step_h)).bgr;
    vec3 g2 = texture2D(src, vec2(UV.x, UV.y - step_h)).bgr;
    vec3 g3 = texture2D(src, vec2(UV.x + step_w, UV.y - step_h)).bgr;
    vec3 g4 = texture2D(src, vec2(UV.x - step_w, UV.y)).bgr;
    vec3 g5 = texture2D(src, UV).bgr;
    vec3 g6 = texture2D(src, vec2(UV.x + step_w, UV.y)).bgr;
    vec3 g7 = texture2D(src, vec2(UV.x - step_w, UV.y + step_h)).bgr;
    vec3 g8 = texture2D(src, vec2(UV.x, UV.y + step_h)).bgr;
    vec3 g9 = texture2D(src, vec2(UV.x + step_w, UV.y + step_h)).bgr;

    vec3 xx = g1 + 2.0 * g2 + g3 - g7 - 2.0 * g8 - g9;
    vec3 yy = g1 - g3 + 2.0 * g4 - 2.0 * g6 + g7 - g9;
    vec3 pixel = sqrt(xx * xx + yy * yy);

    /* Output Color */
    gl_FragColor = vec4(pixel * 2.0 * g5, 1.0);
}
