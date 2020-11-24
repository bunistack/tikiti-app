pragma Singleton

import QtQuick 2.12
import QtQuick.Window 2.13
import Felgo 3.0

QtObject {

    /*********************************************
     * function definitions start here
    **********************************************/

    // checks if mobile
    function isMobile(){
        return Theme.isAndroid || Theme.isIos;
    }

    // checks if string is empty
    function isEmpty(text){

        var reg = "^( )+$";
        var patt = new RegExp(reg);

        var result = patt.test(text);

        if(result || text === ""){
            return true;
        }else{
            return false;
        }
    }

    // returns a random color
    function getRandomColor(){

        let colorIndex = Math.floor(Math.random() * colors.length);
        let color = colors[colorIndex];

        if(typeof color === 'undefined'){
            return "#1D2326";
        }else{
            return color;
        }
    }

    // returns status bar height
    function statusBarHeight(){

        if(Theme.isAndroid){
            return Theme.statusBarHeight / Screen.devicePixelRatio;
        }else{
            return IOSUtils.statusBarHeight();
        }
    }

    // generates a request id
    function generateRequestID(){
        var request_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        request_string = shuffleString(request_string);
        return request_string.substring(1,15);
    }

    // shuffles a string
    function shuffleString(string) {
        var a = string.split(""),
        n = a.length;

        for(var i = n - 1; i > 0; i--) {
            var j = Math.floor(Math.random() * (i + 1));
            var tmp = a[i];
            a[i] = a[j];
            a[j] = tmp;
        }

        return a.join("");
    }

    // populates appConfiguration property
    function initializeConfiguration(){

        var configFile = new XMLHttpRequest();
        configFile.open("GET", "qrc:/qml/config.json", false);
        configFile.onreadystatechange = function ()
        {
            if(configFile.readyState === 4)
            {
                if(configFile.status === 200 || configFile.status === 0)
                {
                    var allText = configFile.responseText;
                    appConfiguration = JSON.parse(allText);
                }
            }
        }

        configFile.send(null);
    }

    /*********************************************
     * function definitions end here
    **********************************************/



    /*********************************************
     * property definitions start here
    **********************************************/

    // defines colors used across the Application
    property var colors: ["#922040","#517E7E","#DC6E4F","#63BDCF","#EFC849","#1D2326","#301E34","#644D52","#55626F",
                          "#35558A","#3190BB","#66D2D5","#BBE4E5","#AED8C7","#7ACBA5","#FEEFA9","#FFFEA2","#FB4668",
                          "#FD6769","#FD9A9B","#FED297","#E6E1B1","#D1DABE","#E7E8D2","#CBDAEC","#D6D0F0","#CECECE",
                          "#ECF0F1","#00887A","#86B2A5"]

    // defines Application font
    property QtObject font1: FontLoader{
        source: "qrc:/assets/fonts/Nunito-Regular.ttf"
    }

    // defines the app configuration; data is fetched from config.json
    property var appConfiguration

    property var cities: ["Nairobi", "London", "Beijin", "Tokyo", "Berlin", "Beirut", "Washington", "Mexico", "Lagos", "Cairo", "Moscow"]

    //end of root
}
