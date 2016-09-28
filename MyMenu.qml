import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.2

Item {

    function openFile(fileUrl) {
        var request = new XMLHttpRequest();
        request.open("GET", fileUrl, false);
        request.send(null);
        return request.responseText;
    }

    /* HEADER */
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

    BusyIndicator {
        width: 42
        height: 42
        x: parent.width * 0.05
        anchors.verticalCenter: mySwitch.verticalCenter

        MouseArea {
            anchors.fill: parent
            onClicked: {
                myDrawer.open()
            }
        }
    }

    /* DRAWER */
    Drawer {
        id: myDrawer
        width: parent.width * 0.8
        height: parent.height

        background: Rectangle {
            Rectangle {
                x: parent.width - 3
                width: 3
                height: parent.height
                color: "#607D8B"
            }

            MyComponent {
                anchors.fill: parent
            }
        }

//        Column {
//            id: myColum
//            anchors.fill: parent
//            spacing: -7

//            Button {
//                id: btnDisableShader
//                width: parent.width
//                height: myDrawer.width * 0.2
//                text: qsTr("Disable Shader Effects")
//                onClicked: {
//                    myCamera.fragmentShaderSource = openFile("qrc:/shader/normal.frag")
//                }
//            }

//            Button {
//                id: btnGrayScale
//                width: parent.width
//                height: myDrawer.width * 0.2
//                text: qsTr("Grayscale")
//                onClicked: {
//                    myCamera.fragmentShaderSource = openFile("qrc:/shader/grayscale.frag")
//                }
//            }

//            Button {
//                id: btnRedIsolation
//                width: parent.width
//                height: myDrawer.width * 0.2
//                text: qsTr("Red Isolation")
//                onClicked: {
//                    myCamera.fragmentShaderSource = openFile("qrc:/shader/red.frag")
//                }
//            }

//            Button {
//                id: btnGreenIsolation
//                width: parent.width
//                height: myDrawer.width * 0.2
//                text: qsTr("Green Isolation")
//                onClicked: {
//                    myCamera.fragmentShaderSource = openFile("qrc:/shader/green.frag")
//                }
//            }

//            Button {
//                id: btnBlueIsolation
//                width: parent.width
//                height: myDrawer.width * 0.2
//                text: qsTr("Blue Isolation")
//                onClicked: {
//                    myCamera.fragmentShaderSource = openFile("qrc:/shader/blue.frag")
//                }
//            }
//        }
    }
}























