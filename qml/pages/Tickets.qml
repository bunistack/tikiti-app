import QtQuick 2.12
import AppUtil 1.0

import "../controls"
import "../components"
import "../models"

FelgoPage {
    id: root

    property real scrollPosition: scrollView.position

    Column{
        anchors.fill: parent

        ShadowedRectangle{
            id: header
            width: parent.width
            height: 60
            shadowEnabled: scrollPosition > 0
            z: 5

            Text{
                height: parent.height
                text: "Tickets"
                font.pixelSize: 20
                font.bold: true
                font.family: AppUtil.font1.name
                verticalAlignment: Text.AlignVCenter
                color: "#04192C"
                leftPadding: 15
            }

            Image{
                width: 30
                height: 30
                anchors.right: parent.right
                anchors.rightMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/assets/images/icons/new_ticket.png"

                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: addTicket.open()
                }
            }

        }

        CustomScrollView {
            id: scrollView
            width: parent.width
            height: parent.height - header.height
            clip: true
            contentWidth: -1

            Flow{
                width: parent.width
                height: childrenRect.height
                topPadding: 20
                bottomPadding: 20
                spacing: 20

                onWidthChanged: {

                    let cols = Math.floor(width/360);

                    if(cols < 2){
                        leftPadding = (width-320)/2;
                        return;
                    }

                    leftPadding = (width - ((320*cols) + ((cols-1)*spacing)))/2;
                }

                Repeater{
                    model: TicketsModel{}

                    TicketListCard{

                    }
                }

                // end of flow
            }

            //end of ScrollView
        }
        // end of Column
    }

    AddTicket{
        id: addTicket
    }

    // end of root
}
