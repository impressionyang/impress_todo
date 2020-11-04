import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12

Page {

    title: qsTr("分类")

    Rectangle {
        id: cb_frame
        width: parent.width
        height: 50
        z: 1

        Text {
            id: cb_frame_text
            height: parent.height
            width: 60
            anchors.leftMargin: 10
            text: qsTr("类别:")
            font.pixelSize: 20
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

        }

        ComboBox {
            id: cb
            width: parent.width - cb_frame_text.width
            height: parent.height
            anchors.left: cb_frame_text.right
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            model: ["class1", "class2", "class3"]

        }
    }



    ListView{
        id: listview
        width: parent.width
        anchors.top: cb_frame.bottom
        height: parent.height - cb_frame.height
        model: model
        delegate:  contactDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 10 }
//        focus: true
        flickableDirection: Flickable.VerticalFlick
        spacing: 1

    }

    Component {
      id: contactDelegate
      Item {
          width: listview.width
          height: 60
          Column {
              width: parent.width
              Text { id: title; text: '<h2>' + note_title + '</h2>'}
              Text { text: '.<sup>' +  create_time + '</sup>'; anchors.right: parent.right }
              Text { text: ' ' }
          }

          //add click fuction
          MouseArea {
              anchors.fill: parent
              onClicked: {
                  listview.currentIndex = index;
              }
              onPressAndHold: {
//                    title.text = qsTr("<b>") + name.text + qsTr("</b>")
                    listview.currentIndex = index;
              }
          }
      }
    }

    ListModel {
        id: model
        ListElement {
          note_title: "note001"
          note_contens: "Bill Smith"
          create_time: "2020-11-03 19:31"
          end_time: ""
          type: 0
        }
        ListElement {
          note_title: "note002"
          note_contens: "Bill Smith"
          create_time: "2020-11-03 19:31"
          end_time: ""
          type: 0
        }
        ListElement {
          note_title: "note003"
          note_contens: "Bill Smith"
          create_time: "2020-11-03 19:31"
          end_time: ""
          type: 0
        }
    }
}
