import QtQuick 2.7
import QtQuick.Controls 2.12
import AppUtil 1.0

Rectangle {
    id: root
    width: 300
    height: 60

    property alias icon: displayIcon
    property alias label: labelText.text

    property string outputDateTimeText
    property alias displayDateTimeText: control.text

    function setDateTime(date){
        outputDateTimeText = Qt.formatDateTime(date, "yyyy-MM-dd hh:mm:ss");
        displayDateTimeText = Qt.formatDateTime(date, "ddd, MMM d yyyy hh:mm:ss");
    }

    Component.onCompleted: setDateTime(new Date())

    Column{
        anchors {
            fill: parent
            topMargin: 2
            bottomMargin: 2
            leftMargin: 10
            rightMargin: 10
        }

        Rectangle{
            id: labelContainer
            width: parent.width
            height: 20
            clip: true

            Text {
                id: labelText
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                text: "Date"
                leftPadding: 3
                font.pixelSize: 14
                font.family: AppUtil.font1.name
                color: root.focus ? "#02EF61" : "#04192C"
            }

            //end of labelContainer
        }

        Row{
            width: parent.width
            height: parent.height - labelContainer.height

            Image {
                id: displayIcon
                width: 25
                height: 25
                anchors.verticalCenter: parent.verticalCenter
            }

            Text{
                id: control
                width: (parent.width - displayIcon.width)
                height: parent.height
                font.family: AppUtil.font1.name
                font.pixelSize: 16
                leftPadding: 15
                clip: true
                verticalAlignment: TextField.AlignVCenter
            }

            //end of row
        }

        //end of column
    }

    Rectangle{
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        height: 1.5
        width: parent.width - 20
        radius: height/2
        color: root.focus ? "#02EF61" : "#04192C"
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            root.focus = true;
            dateTimePicker.run(setDateTime)
        }
    }
}
