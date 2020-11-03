import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12

Page {
    width: 600
    height: 400

    title: qsTr("recv")

    Text {
        id: recv_text
        text: qsTr("recv2")

    }

    Button{
        id: btn_click
        anchors.top: recv_text.bottom
        anchors.topMargin: 10
        height: 40
        width: 200

        text: qsTr("click")
        onClicked: {
            var str = recv_text.text
            console.log(str)
            if (str === qsTr("233")){
                recv_text.text =  qsTr("click again")
            }else {
                recv_text.text = qsTr("233")
            }
        }
    }
}


