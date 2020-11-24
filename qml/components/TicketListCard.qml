import QtQuick 2.12
import AppUtil 1.0

import "../controls"

Item {
    id: root
    width: 320
    height: 210

    property var arrivalDateTime: Date.fromLocaleString(Qt.locale(), arrival, "dd-MM-yyyy H:mm:ss");

    property var departureDateTime: Date.fromLocaleString(Qt.locale(), departure, "dd-MM-yyyy H:mm:ss");

    ColoredImage {
        id: backgroundImage
        anchors.fill: parent
        source: "qrc:/assets/images/clipart/ticket.png"
        color: "#f0f0f0"
    }

    Row{
       anchors.fill: parent
       anchors.margins: 10

       Column{
           width: parent.width - rightSideColumn.width
           height: parent.height

           // serial
           Row{
               width: parent.width
               height: 30
               spacing: 40

               Row{
                   id: serialNoRow
                   height: parent.height
                   width: childrenRect.width
                   spacing: 10
                   leftPadding: 5

                   Image{
                       width: 20
                       height: 20
                       anchors.verticalCenter: parent.verticalCenter
                       source: "qrc:/assets/images/icons/airplane.png"
                   }

                   Text {
                       text: serial_no
                       width: contentWidth
                       height: parent.height
                       font.pixelSize: 14
                       font.bold: true
                       font.weight: Font.ExtraBold
                       font.family: AppUtil.font1.name
                       verticalAlignment: Text.AlignVCenter
                       color: "#04192C"
                   }
               }


               Text {
                   text: "USD " + Utility.currencyFormat(fare)
                   width: contentWidth
                   height: parent.height
                   font.pixelSize: 16
                   font.bold: true
                   font.weight: Font.ExtraBold
                   font.family: AppUtil.font1.name
                   verticalAlignment: Text.AlignVCenter
                   color: "#02EF61"
               }
           }

           // from
           Row{
               height: 40
               width: childrenRect.width
               spacing: 10
               leftPadding: 40

               Image{
                   width: 25
                   height: 25
                   anchors.verticalCenter: parent.verticalCenter
                   source: "qrc:/assets/images/icons/airplane_take_off.png"
               }

               Text {
                   text: from
                   width: contentWidth
                   height: parent.height
                   font.pixelSize: 18
                   font.bold: true
                   font.weight: Font.ExtraBold
                   font.family: AppUtil.font1.name
                   verticalAlignment: Text.AlignVCenter
                   color: "#04192C"
               }
           }

           Text {
               text: {
                   return Qt.formatDateTime(departureDateTime, "hh:mm");
               }

               width: contentWidth
               height: 20
               leftPadding: 80
               font.pixelSize: 14
               font.bold: true
               font.weight: Font.ExtraBold
               font.family: AppUtil.font1.name
               verticalAlignment: Text.AlignVCenter
               color: "#04192C"
           }

           Text {
               text: {
                   return Qt.formatDateTime(departureDateTime, "ddd, MMM d");
               }

               width: contentWidth
               height: 20
               leftPadding: 80
               font.pixelSize: 14
               font.family: AppUtil.font1.name
               verticalAlignment: Text.AlignVCenter
               color: "#04192C"
           }

           // to
           Row{
               height: 40
               width: childrenRect.width
               spacing: 10
               leftPadding: 40

               Image{
                   width: 25
                   height: 25
                   anchors.verticalCenter: parent.verticalCenter
                   source: "qrc:/assets/images/icons/airplane_landing.png"
               }

               Text {
                   text: to
                   width: contentWidth
                   height: parent.height
                   font.pixelSize: 18
                   font.bold: true
                   font.weight: Font.ExtraBold
                   font.family: AppUtil.font1.name
                   verticalAlignment: Text.AlignVCenter
                   color: "#04192C"
               }
           }

           Text {
               text: {
                   return Qt.formatDateTime(arrivalDateTime, "hh:mm");
               }

               width: contentWidth
               height: 20
               leftPadding: 80
               font.pixelSize: 14
               font.bold: true
               font.weight: Font.ExtraBold
               font.family: AppUtil.font1.name
               verticalAlignment: Text.AlignVCenter
               color: "#04192C"
           }

           Text {
               text: {
                   return Qt.formatDateTime(arrivalDateTime, "ddd, MMM d");
               }

               width: contentWidth
               height: 20
               leftPadding: 80
               font.pixelSize: 14
               font.family: AppUtil.font1.name
               verticalAlignment: Text.AlignVCenter
               color: "#04192C"
           }

       }

       Column{
           id: rightSideColumn
           width: 35
           height: parent.height
           topPadding: 10
           spacing: 120

           Image{
               width: 25
               height: 25
               anchors.horizontalCenter: parent.horizontalCenter
               source: "qrc:/assets/images/icons/trash.png"
           }

           ColoredImage{
               width: 25
               height: 25
               anchors.horizontalCenter: parent.horizontalCenter
               source: "qrc:/assets/images/icons/qr_code.png"
               color: "#02EF61"
           }
       }
    }

    // end of root
}
