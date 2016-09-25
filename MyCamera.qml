import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2
import QtMultimedia 5.2

Item {
    property string fragmentShaderSource: " "

    function openFile(fileUrl) {
        var request = new XMLHttpRequest();
        request.open("GET", fileUrl, false);
        request.send(null);
        return request.responseText;
    }

    Camera {
        id: camera

        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash
        //imageProcessing {
        //    whiteBalanceMode: CameraImageProcessing.WhiteBalanceTungsten
        //    contrast: 0.66
        //    saturation: -0.5
        //}

        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }

        flash.mode: Camera.FlashRedEyeReduction
        //flash.mode: Camera.FlashAuto
    }

    VideoOutput {
        id: myVideo
        source: camera
        anchors.fill: parent
        focus : visible
        autoOrientation: true
        fillMode : VideoOutput.PreserveAspectCrop
        //z: 1
        //scale : height/width
    }

    ShaderEffect {
        anchors.fill: myVideo
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









