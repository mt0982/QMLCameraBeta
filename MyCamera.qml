import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2
import QtMultimedia 5.2

Item {
    Camera {
        id: camera

        //imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash
        //imageProcessing {
        //    whiteBalanceMode: CameraImageProcessing.WhiteBalanceTungsten
        //    contrast: 0.66
        //    saturation: -0.5
        //}

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

        Rectangle {
            id: btnBackground
            color: "#80ffffff"
            x: 0
            y: parent.height - parent.height * 0.15
            width: parent.width
            height: parent.height * 0.15

            Rectangle {
                id: buttonFrame
                color: "transparent" //"#ffffff"
                anchors.centerIn: parent
                width: parent.height * 0.9
                height: parent.height * 0.9
                radius: width * 0.5

                Image {
                    id: imageButton
                    source: "qrc:/icon/takephoto.png"
                    height: parent.height
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }
}
