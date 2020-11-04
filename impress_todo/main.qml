import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("impress todo")

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
                    text: qsTr("分类")
                    color: "white"
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }

                width: parent.width
                onClicked: {
                    stackView.push("classes_page.qml")
                    drawer.close()
                }
            }
            ItemDelegate {

                Text {
                    anchors.fill: parent
                    text: qsTr("已完成")
                    color: "white"
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }

                width: parent.width
                onClicked: {
                    stackView.push("finished_page.qml")
                    drawer.close()
                }
            }

            ItemDelegate {

                Text {
                    anchors.fill: parent
                    text: qsTr("设置")
                    color: "white"
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                }

                width: parent.width
                onClicked: {
                    stackView.push("setting_page.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "main_page.qml"
        anchors.fill: parent
    }
}
