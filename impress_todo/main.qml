import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Stack")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.5
        height: window.height
        background: Rectangle {
            color: "#898989"
            opacity: .8
        }

        Column {
            anchors.fill: parent
            width: parent.width

            ItemDelegate {
                Text {
                    anchors.fill: parent
                    text: qsTr("recv")
                    color: "white"
                    font.pixelSize: 30
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }

                width: parent.width
                onClicked: {
                    stackView.push("recv_panel.qml")
                    drawer.close()
                }
            }
            ItemDelegate {

                Text {
                    anchors.fill: parent
                    text: qsTr("send")
                    color: "white"
                    font.pixelSize: 30
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }

                width: parent.width
                onClicked: {
                    stackView.push("send_panel.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "main_panel.qml"
        anchors.fill: parent
    }
}
