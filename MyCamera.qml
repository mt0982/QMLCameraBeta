import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2
import QtMultimedia 5.2

Item {
    property string fragmentShaderSource: openFile("qrc:/shader/normal.frag")
    property int flashMode: Camera.FlashOff

    function openFile(fileUrl) {
        var request = new XMLHttpRequest();
        request.open("GET", fileUrl, false);
        request.send(null);
        return request.responseText;
    }

    Image {
        id: photoPreview
        anchors.fill: parent
    }

    Camera {
        id: camera

        //imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }

        flash.mode: flashMode

        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview
            }
        }

        focus {
            focusMode: Camera.FocusMacro
            focusPointMode: Camera.FocusPointAuto
        }
    }

    VideoOutput {
        id: myVideo
        source: camera
        anchors.fill: parent
        focus : visible
        autoOrientation: true
        fillMode : VideoOutput.PreserveAspectCrop

        Image {
            id: photoIcon
            source: "qrc:/icon/camera.png"
            width: 48
            height: 48
            x: parent.width / 2 - 24
            y: parent.height - 58

            /* Take Photo */
            MouseArea {
                anchors.fill: parent

                onPressed: {
                    console.log(qsTr("Photo Button Pressed"))
                    camera.searchAndLock();
                }

                onClicked: {
                    console.log(qsTr("Photo Button Clicked"))
                    camera.imageCapture.capture();
                }

                onReleased: {
                    console.log(qsTr("Photo Button Released"))
                    camera.unlock();
                }
            }
        }
    }

    ShaderEffect {
        id: myShaderEffect
        anchors.fill: parent

        property var src: ShaderEffectSource {
            sourceItem: myVideo
            hideSource: false
            recursive: false
            live: true
        }

        vertexShader: openFile("qrc:/shader/zshader.vsh")
        fragmentShader: fragmentShaderSource
        onFragmentShaderChanged: {
            console.log("Fragment Shader Was Changed")
        }
    }
}









