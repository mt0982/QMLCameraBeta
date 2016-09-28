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

        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }

        flash.mode: flashMode

        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview
                console.log("Image Captured: " + camera.imageCapture.capturedImagePath.toString())
            }
        }

        focus {
            focusMode: Camera.FocusAuto //Focus Macro
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

    Rectangle {
        id: footer
        width: parent.width
        height: parent.height * 0.15
        color: "#660c0c0c"
        y: parent.height - parent.height * 0.15

        Image {
            id: border
            source: "qrc:/icon/photobutton.png"
            anchors.centerIn: parent
            width: parent.height * 0.85
            height: parent.height * 0.85

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
}









