import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0

import "../controls"

Popup {
    id: root
    modal: true
    width: 320
    height: 420
    x: (parent.width-width)/2
    y: (parent.height-height)/2

    background: Rectangle{
        color: "white"
        radius: 12
    }

    Column{
        anchors.fill: parent
        anchors.margins: 2
        spacing: 10

        Row{
            width: parent.width
            height: 25

            Text {
                text: "Ticket"
                width: parent.width - parent.height
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                color: "#02EF61"
                font.pixelSize: 18
                font.family: AppUtil.font1.name
                leftPadding: 3
            }
        }

        ComboBoxStyle4{
            anchors.horizontalCenter: parent.horizontalCenter
            model: AppUtil.cities
            label: "From"
        }

        ComboBoxStyle4{
            anchors.horizontalCenter: parent.horizontalCenter
            model: AppUtil.cities
            label: "To"
        }

        DateTimeDisplay{
            anchors.horizontalCenter: parent.horizontalCenter
            label: "Departure Time"
            icon.source: "qrc:/assets/images/icons/airplane_take_off.png"
        }

        ComboBoxStyle4{
            anchors.horizontalCenter: parent.horizontalCenter
            model: ["First Class", "Business", "Economy"]
            label: "Ticket Class"
        }

        MaterialButton{
            width: 280
            height: 50
            btnRadius: height / 2
            anchors.horizontalCenter: parent.horizontalCenter
            backgroundColor: "#04192C"
            text: "Reserve"

            onClicked: {

            }
        }
    }

    // end of root
}
