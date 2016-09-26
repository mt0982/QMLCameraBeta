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

    MyCamera {
        id: myCamera
        anchors.fill: parent
    }

    MyMenu {
        id: myMenu
        anchors.fill: parent
    }



    Switch {
        id: mySwitch
        x: parent.width * 0.75
        y: 20

        onCheckedChanged: {
            if(mySwitch.checked) {
                console.log("On")
                myLabel.status = "On"
                myCamera.flashMode = Camera.FlashOn
            } else {
                console.log("Off")
                myLabel.status = "Off"
                myCamera.flashMode = Camera.FlashOff
            }
        }
    }

    Label {
        id: myLabel
        property string status: "Off"
        text: status
        font.pixelSize: 18
        color: "white"
        anchors.left: mySwitch.right
        anchors.verticalCenter: mySwitch.verticalCenter
    }
}




























