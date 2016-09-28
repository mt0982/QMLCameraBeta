import QtQuick 2.0
import QtQuick.Controls 2.0

Item {

    Component {
        id: listDelegate

        Item {
            width: parent.width //250
            height: 50

            Row {
                Column {
                    width: 200
                    Text {id: title; text: name; font.family: "Helvetica"; font.pointSize:12; font.bold: true }
                    Text { text: 'Path: ' + path }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log(name)
                    myCamera.fragmentShaderSource = openFile(path)
                }
                onPressed: { title.color = "#3F51B5" }
                onReleased: { title.color = "black" }
            }
        }
    }

    ListModel {
        id: listModel

        ListElement {
            name: "Default"
            path: "qrc:/shader/normal.frag"
        }

        ListElement {
            name: "Grayscale"
            path: "qrc:/shader/grayscale.frag"
        }

        ListElement {
            name: "Red Isolation"
            path: "qrc:/shader/red.frag"
        }

        ListElement {
            name: "Green Isolation"
            path: "qrc:/shader/green.frag"
        }

        ListElement {
            name: "Blue Isolation"
            path: "qrc:/shader/blue.frag"
        }
    }

    ListView {
        id: listView
        anchors.fill: parent; anchors.margins: 5
        model: listModel
        delegate: listDelegate
        focus: true
    }
}



















