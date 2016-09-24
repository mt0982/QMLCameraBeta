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
                id: btnGrayScale
                width: parent.width
                height: 48
                text: qsTr("Grayscale")
                onClicked: {
                    //MyCamera.fragmentShaderSource = openFile("qrc:/shader/grayscale.frag")
                    myCamera.fragmentShaderSource = openFile("qrc:/shader/grayscale.frag")
                }
            }
        }
    }
}
