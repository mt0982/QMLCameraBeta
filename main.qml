import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2
import QtMultimedia 5.2
import QtQuick.Controls.Material 2.0

ApplicationWindow {
    visible: true
    width: 480
    height: 640
    title: qsTr("Hello World")

    //Material.theme: Material.Dark
    //Material.accent: Material.color(Material.Green)

    MyCamera {
        id: myCamera
        anchors.fill: parent
    }

    MyMenu {
        id: myMenu
        anchors.fill: parent
    }


}




























