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
                    Text { id: title; text: name; font.pointSize:18; font.bold: true }
                    Text { text: 'Path: ' + path; font.pointSize:10; font.italic: true }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log(name)
                    myCamera.fragmentShaderSource = openFile(path)
                    title.color = "black"
                }
                onPressed: { title.color = "#3F51B5" }
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

        ListElement {
            name: "Yellow Isolation"
            path: "qrc:/shader/yellow.frag"
        }

        ListElement {
            name: "Outline"
            path: "qrc:/shader/outline.frag"
        }

        ListElement {
            name: "Glow"
            path: "qrc:/shader/glow.frag"
        }
    }

    ListView {
        id: listView
        anchors.fill: parent; anchors.margins: 5
        model: listModel
        delegate: listDelegate
        focus: true
        spacing: 5
    }
}



















