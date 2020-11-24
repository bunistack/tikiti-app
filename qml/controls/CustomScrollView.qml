import QtQuick 2.12
import QtQuick.Controls 2.12

ScrollView {
    id: root

    signal scrollingUp()
    signal scrollingDown()
    signal newPosition(real pos)

    property real position: 0

    ScrollBar.vertical: ScrollBar{
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        property real lastPosition: position

        onPositionChanged: {            

            root.position = position;

            newPosition(position)

            if(position > lastPosition){
                scrollingUp();
            }else{
                scrollingDown();
            }

        }
    }
}
