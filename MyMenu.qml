import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Item {

    function openFile(fileUrl) {
        var request = new XMLHttpRequest();
        request.open("GET", fileUrl, false);
        request.send(null);
        return request.responseText;
    }

    Drawer {
        id: myDrawer
        width: parent.width * 0.8
        height: parent.height

        Column {
            id: myColum
            anchors.fill: parent
            spacing: 1

            Button {
                id: btnDisableShader
                width: parent.width
                height: 48
                text: qsTr("Disable Shader Effects")
                onClicked: {
                    myCamera.fragmentShaderSource = openFile("qrc:/shader/normal.frag")
                }
            }

            Button {
                id: btnGrayScale
                width: parent.width
                height: 48
                text: qsTr("Grayscale")
                onClicked: {
                    myCamera.fragmentShaderSource = openFile("qrc:/shader/grayscale.frag")
                }
            }

            Button {
                id: btnRedIsolation
                width: parent.width
                height: 48
                text: qsTr("Red Isolation")
                onClicked: {
                    myCamera.fragmentShaderSource = openFile("qrc:/shader/red.frag")
                }
            }

            Button {
                id: btnGreenIsolation
                width: parent.width
                height: 48
                text: qsTr("Green Isolation")
                onClicked: {
                    myCamera.fragmentShaderSource = openFile("qrc:/shader/green.frag")
                }
            }

            Button {
                id: btnBlueIsolation
                width: parent.width
                height: 48
                text: qsTr("Blue Isolation")
                onClicked: {
                    myCamera.fragmentShaderSource = openFile("qrc:/shader/blue.frag")
                }
            }
        }
    }
}























