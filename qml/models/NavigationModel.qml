import QtQuick 2.0

ListModel {

    ListElement{
        menuName: "Tickets"
        menuIcon: "qrc:/assets/images/icons/boarding-pass.png"
        menuPage: "Tickets.qml"
    }

    ListElement{
        menuName: "Scan"
        menuIcon: "qrc:/assets/images/icons/qr_code.png"
        menuPage: "ScanTicket.qml"
    }

    ListElement{
        menuName: "Profile"
        menuIcon: "qrc:/assets/images/icons/user.png"
        menuPage: "Profile.qml"
    }
}
