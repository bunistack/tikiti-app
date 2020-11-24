import Felgo 3.0
import QtQuick 2.12
import AppUtil 1.0

import "./components"
import "./pages"
import "./models"
import "./controls"

App {
    id: mainAppWindow
    width: 900
    height: 600
    opacity: 0

    property int currentNavigationIndex: 0

    SplashScreen{
        mainWindow: mainAppWindow
    }

    Column{
        anchors.fill: parent

        // status bar
        Rectangle{
            id: appStatusBar
            width: parent.width
            height: AppUtil.isMobile() ? (visible ? AppUtil.statusBarHeight() : 0) : 0
            z: 20
        }

        // content
        Item {
            width: parent.width
            height: parent.height - appStatusBar.height - navigationArea.height

            NavigationStack{
                id: mainNavigationStack
                anchors.fill: parent
                navigationBarShadow: false
                navigationBar.visible: false
                navigationBar.height: 0

                Tickets{}
            }
        }

        // navigation
        Rectangle {
            id: navigationArea
            width: parent.width
            height: 60
            color: "#04192C"

            Row{
                anchors.fill: parent

                Repeater{
                    id: menuItemRepeater
                    model: NavigationModel{}

                    Item {
                        width: parent.width/menuItemRepeater.count
                        height: parent.height

                        Column{
                            anchors.fill: parent
                            topPadding: 7

                            property color itemColor: currentNavigationIndex === index ? "#f0f0f0" : "#aaaaaa"

                            ColoredImage{
                                width: 30
                                height: 30
                                source: menuIcon
                                color: parent.itemColor
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Text {
                                text: menuName
                                width: parent.width
                                height: 20
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                font.pixelSize: 14
                                font.family: AppUtil.font1.name
                                font.bold: true
                                font.weight: Font.ExtraBold
                                color: parent.itemColor
                            }
                        }

                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                currentNavigationIndex = index;
                            }
                        }
                    }

                }

                // end of row
            }

            // end of navigation
        }

        // end of Column
    }

    DateTimePicker{
        id: dateTimePicker
    }

}
