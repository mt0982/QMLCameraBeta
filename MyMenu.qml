import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Item {
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
            }
        }
    }
}
