import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12

Page {
//    width: 600
//    height: 400

    title: qsTr("Home")

    ListView{
        id: listview
        anchors.fill: parent
        model: model
        delegate:  contactDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 1 }
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


