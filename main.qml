import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2
import QtMultimedia 5.2

ApplicationWindow {
    visible: true
    width: 480
    height: 640
    title: qsTr("Hello World")


    Camera {
        id: camera

        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }

        //flash.mode: Camera.FlashRedEyeReduction
        flash.mode: Camera.FlashAuto
    }

    VideoOutput {
        source: camera
        anchors.fill: parent
        focus : visible
        autoOrientation: true
        fillMode : VideoOutput.PreserveAspectCrop
        //scale : height/width
    }
}















