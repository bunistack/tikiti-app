import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls 1.4 as Controls
import QtQuick.Controls.Styles 1.4
import AppUtil 1.0

Popup {
    id: root
    width: 320
    height: 440
    modal: true
    padding: 5
    x: (parent.width-width)/2
    y: (parent.height-height)/2

    background: Rectangle{
        radius: 8
    }

    property alias calendar: calendar

    property string currentDate: Qt.formatDate(new Date(), dateFormat)
    property string dateFormat: "yyyy-MM-dd"

    property alias selectedDate: calendar.selectedDate

    property var callback
    property bool isCallbackSet: false

    Component.onCompleted: {
        setNavigationDateText()
    }

    function run(callable){

        if(callable !== null){
            callback = callable;
            isCallbackSet = true;
        }else{
            isCallbackSet = false;
        }

        root.open();
    }

    Column{
        anchors.fill: parent
        anchors.margins: root.background.radius
        clip: true

        // calendar header
        Rectangle{
            id: navigationBar
            width: parent.width
            height: 50
            clip: true

            Rectangle{
                id: prevoiusYear
                width: 30
                height: parent.height
                anchors.left: parent.left
                color: parent.color

                Image {
                    width: 20
                    height: 20
                    anchors.centerIn: parent
                    source: "qrc:/assets/images/icons/double_left_grey.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        calendar.showPreviousYear();
                        setNavigationDateText();
                    }
                }
            }

            Rectangle{
                id: prevoiusMonth
                width: 30
                height: parent.height
                anchors.left: prevoiusYear.right
                color: parent.color

                Image {
                    width: 20
                    height: 20
                    anchors.centerIn: parent
                    source: "qrc:/assets/images/icons/left_grey.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        calendar.showPreviousMonth();
                        setNavigationDateText();
                    }
                }
            }

            Text {
                id: navigationDateText
                anchors.left: prevoiusMonth.right
                anchors.right: nextMonth.left
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: AppUtil.font1.name
                font.pixelSize: 16
                color: "#323232"
            }

            Rectangle{
                id: nextMonth
                width: 30
                height: parent.height
                anchors.right: nextYear.left
                color: parent.color

                Image {
                    width: 20
                    height: 20
                    anchors.centerIn: parent
                    source: "qrc:/assets/images/icons/right_grey.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        calendar.showNextMonth();
                        setNavigationDateText();
                    }
                }
            }

            Rectangle{
                id: nextYear
                width: 30
                height: parent.height
                anchors.right: parent.right
                color: parent.color

                Image {
                    width: 20
                    height: 20
                    anchors.centerIn: parent
                    source: "qrc:/assets/images/icons/double_right_grey.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        calendar.showNextYear();
                        setNavigationDateText();
                    }
                }
            }

            //end of nav bar
        }

        // the calendar
        Controls.Calendar {
            id: calendar
            width: parent.width
            height: 200
            clip: true
            navigationBarVisible: false
            frameVisible: false

            onClicked: {
                setNavigationDateText()
            }

            style: CalendarStyle {
                gridVisible: false

                dayDelegate: Rectangle {

                    Rectangle{
                        anchors.centerIn: parent
                        width: parent.width > parent.height ? parent.height : parent.width
                        height: width
                        color: currentDate === Qt.formatDate(styleData.date,"yyyy-MM-dd") ? "#02EF61" : "white"
                        radius: (height/2)
                        border.width: styleData.selected ? 2 : 0
                        border.color: styleData.selected ? "#02EF61" : "white"

                        Label {
                            text: styleData.date.getDate()
                            anchors.centerIn: parent
                            font.family: AppUtil.font1.name
                            font.pixelSize: 12
                            color: currentDate === Qt.formatDate(styleData.date,"yyyy-MM-dd") ? "white" : (!styleData.visibleMonth ? "grey" : "#323232")
                        }

                    }

                }

                dayOfWeekDelegate: Rectangle{
                    height: 20
                    width: calendar.width/7

                    Label{
                        text: getDayOfTheWeek(styleData.dayOfWeek)
                        anchors.centerIn: parent
                        font.family: AppUtil.font1.name
                        font.pixelSize: 12
                    }
                }
            }

        }

        // time selection
        Text {
            width: parent.width
            height: 30
            leftPadding: 10
            font.family: AppUtil.font1.name
            font.bold: true
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            color: "#323232"
            text: "Time"
        }

        Row{
            width: parent.width
            height: 70

            Row {
                id: row
                width: parent.width - 50
                height: parent.height

                Tumbler {
                    id: hoursTumbler
                    model: 24
                    delegate: delegateComponent
                    height: parent.height
                    width: parent.width / 2
                    visibleItemCount: 3
                }

                Tumbler {
                    id: minutesTumbler
                    model: 60
                    delegate: delegateComponent
                    height: parent.height
                    width: parent.width / 2
                    visibleItemCount: 3
                }

            }

            Column{
                width: 50
                height: parent.height
                spacing: 10

                ColoredImage{
                    width: 30
                    height: 30
                    source: "qrc:/assets/images/icons/sun_grey.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: hoursTumbler.currentIndex >= 6 && hoursTumbler.currentIndex < 18 ? "#02EF61" : "#323232"
                }

                ColoredImage{
                    width: 30
                    height: 30
                    source: "qrc:/assets/images/icons/moon_grey.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: hoursTumbler.currentIndex < 6 || hoursTumbler.currentIndex >= 18 ? "#02EF61" : "#323232"
                }

            }
        }

        Row{
            width: parent.width
            height: 80
            spacing: 10
            rightPadding: 5
            layoutDirection: Qt.RightToLeft

            MaterialButton{
                width: 100
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                text: "Ok"
                font.family: AppUtil.font1.name
                font.pixelSize: 16
                colorUp: "white"
                backgroundColor: "#02EF61"

                onClicked: {

                    let date = new Date(
                            selectedDate.getFullYear(),
                            selectedDate.getMonth(),
                            selectedDate.getDate(),
                            hoursTumbler.currentIndex,
                            minutesTumbler.currentIndex,
                            0,
                            0);

                    callback(date);

                    root.close();

                }
            }

            MaterialButton{
                width: 100
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                text: "Close"
                font.family: AppUtil.font1.name
                font.pixelSize: 16
                colorUp: "#02EF61"
                backgroundColor: "white"

                onClicked: {
                    root.close();
                }
            }

            //end of row
        }

        //end of column
    }

    Component {
        id: delegateComponent

        Text {
            text: formatText(Tumbler.tumbler.count, modelData)
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 25
            font.family: AppUtil.font1.name
            font.bold: true
            color: "#02EF61"
        }
    }

    function formatText(count, modelData) {
        var data = count === 12 ? modelData + 1 : modelData;
        return data.toString().length < 2 ? "0" + data : data;
    }

    function setNavigationDateText(){
        var year = getYear();
        var month = getMonth();
        navigationDateText.text = month + " " + year;
    }

    function getDayOfTheWeek(index){
        var dayString;

        switch(index){
        case 0:
            dayString = "Sun"
            break;
        case 1:
            dayString = "Mon"
            break;
        case 2:
            dayString = "Tue"
            break;
        case 3:
            dayString = "Wed"
            break;
        case 4:
            dayString = "Thur"
            break;
        case 5:
            dayString = "Fri"
            break;
        case 6:
            dayString = "Sat"
            break;
        default:
            dayString = "Mon"
            break;
        }

        return dayString;
    }

    function getMonth(){

        switch(calendar.visibleMonth){
        case 0:
            return "January";
        case 1:
            return "February";
        case 2:
            return "March";
        case 3:
            return "April";
        case 4:
            return "May";
        case 5:
            return "June";
        case 6:
            return "July";
        case 7:
            return "August";
        case 8:
            return "September";
        case 9:
            return "October";
        case 10:
            return "November";
        case 11:
            return "December";
        default:
            break;
        }

        //end of function
    }

    function getYear(){
        return (calendar.visibleYear);
    }

    //end of root
}
