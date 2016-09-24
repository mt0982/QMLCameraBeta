uniform highp mat4 qt_Matrix;

/* In */
attribute highp vec4 qt_Vertex;
attribute highp vec2 qt_MultiTexCoord0;

/* Out */
varying vec2 UV;

void main()
{
    UV = qt_MultiTexCoord0;
    gl_Position = qt_Matrix * qt_Vertex;
}
