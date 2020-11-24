import Felgo 3.0
import QtQuick 2.12
import QtQuick.Window 2.13
import AppUtil 1.0

Window{
    id: splashScreen
    x: mainWindow.x
    y: mainWindow.y
    width: mainWindow.width
    height: mainWindow.height
    visible: true

    property App mainWindow

    property bool closeAppOnClosed: true

    property var cities: ["Nairobi", "London", "Moscow", "Beijin", "Washington"]

    property int cityIndex: 1

    onClosing: {

        if(closeAppOnClosed){
            mainWindow.close();
        }
    }

    Rectangle{
        color: "#02EF61"
        anchors.fill: parent

        Image {
            width: 300
            height: 300
            source: "qrc:/assets/images/logos/tikiti-logo.png"
            anchors.centerIn: parent
        }

        Row{
            width: childrenRect.width
            height: 50
            spacing: 3
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Item {
                width: 40
                height: 40
                anchors.verticalCenter: parent.verticalCenter

                Image {
                    anchors.fill: parent
                    anchors.margins: 5
                    source: "qrc:/assets/images/icons/airplane_take_off.png"
                }
            }

            Text {
                width: contentWidth
                height: parent.height
                text: "fly to "
                font.family: AppUtil.font1.name
                font.pixelSize: 16
                font.bold: true
                font.weight: Font.ExtraBold
                color: "#04192C"
                verticalAlignment: Text.AlignVCenter
            }

            Text {
                id: cityText
                width: 80
                height: parent.height
                text: "Nairobi"
                font.family: AppUtil.font1.name
                font.pixelSize: 16
                font.weight: Font.ExtraBold
                font.bold: true
                color: "#04192C"
                verticalAlignment: Text.AlignVCenter

                OpacityAnimator{
                    id: opacityAnimatorOut
                    target: cityText
                    from: 1
                    to: 0
                    duration: 700
                    easing.type: Easing.InOutQuad

                    onStopped: {
                        cityText.text = cities[cityIndex];
                        opacityAnimatorIn.start();
                        cityIndex++;
                    }
                }

                OpacityAnimator{
                    id: opacityAnimatorIn
                    target: cityText
                    from: 0
                    to: 1
                    duration: 1000
                    easing.type: Easing.InOutQuad

                    onStopped: {

                        if(cityIndex > cities.length-1){
                            closeSplashScreen();
                            return;
                        }

                        opacityAnimatorOut.start();
                    }
                }
            }
        }

    }

    Timer{
        interval: 700
        running: true
        onTriggered: opacityAnimatorOut.start()
    }

    function closeSplashScreen(){
        mainWindow.opacity = 1;
        closeAppOnClosed = false;
        opacityAnimatorIn.stop();
        opacityAnimatorOut.stop();
        splashScreen.close();
    }

//    Connections{
//        target: mainWindow

//        onSplashScreenFinished: {

//        }
//    }
}
