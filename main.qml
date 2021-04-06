import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Window {
    id: winn
    visible: true
    //visibility: Window.FullScreen //для малинки
    width: 600 //для пк
    height: 1024 //для пк
    flags: Qt.FramelessWindowHint

    //property real buttons_width: 230
    //property real buttons_height: 240
    //property real buttons_width: 171
    //property real buttons_height: 196
    //property real buttons_width: 157
    //property real buttons_height: 180
    property real buttons_width: 191
    property real buttons_height: 219

    property real mouse_range1_x: 22
    property real mouse_range1_y: 52
    property real mouse_range1_width: 200
    property real mouse_range1_height: 110
    property real mouse_range2_x: 55
    property real mouse_range2_y: 35
    property real mouse_range2_width: 140
    property real mouse_range2_height: 18
    property real mouse_range3_x: 50
    property real mouse_range3_y: 160
    property real mouse_range3_width: mouse_range2_width
    property real mouse_range3_height: mouse_range2_height
    property real mouse_range4_x: 83
    property real mouse_range4_y: 10
    property real mouse_range4_width: 80
    property real mouse_range4_height: 25
    property real mouse_range5_x: 83
    property real mouse_range5_y: 180
    property real mouse_range5_width: mouse_range4_width
    property real mouse_range5_height: mouse_range4_height

    property real recBut148X: 128
    property real recBut26X: 17
    property real recBut37X: 239
    property real recBut23Y: 220
    property real recBut45Y: 397
    property real recBut67Y: 573
    property real shiftX: 65
    property real shiftY: 30
    property real clearances: 20

    property int hours
    property int minutes
    property int seconds


    function timeChanged() {
        var date = new Date();
        hours = date.getHours();
        minutes = date.getMinutes();
        seconds = date.getSeconds();
    }

    function stateRecB5(){
        if(but13.pressed || but14.pressed || but15.pressed || but5_1.pressed|| but5_2.pressed){
            imBye5.source = "images/МЕНЮ Разогрев 1 страница2.png";
            nameButton5.color = "white";
            textTemperature.color = "white";
        }
        else {
            imBye5.source = "images/МЕНЮ Разогрев 1 страница.png";
            nameButton5.color = "white";
            textTemperature.color = "white";
        }
    }

    Timer {
        interval: 100
        repeat: true
        running: true
        onTriggered: timeChanged()
    }


    StackView {
        id: stack
        initialItem: mainView
        anchors.fill: parent
/*
        delegate: StackViewDelegate {
            pushTransition: StackViewTransition {
            }
        }
        */

        delegate: StackViewDelegate {
            pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "scale"
                    from: 0
                    to: 1

                }

                PropertyAnimation {
                    target: exitItem
                    property: "scale"
                    from: 1
                    to: 0


                }
            }
        }

    }

    Page {
        id: mainView

        Rectangle {
            id: recB1
            width: buttons_width
            height: buttons_height
            color: "transparent"
            //border.color: "black"
            x: recBut148X + shiftX
            y: ((44 + shiftY) + (clearances * 2))



            Image {
                id: imBye
                anchors.fill: recB1
                anchors.margins: 1
                source: (but1.pressed || but2.pressed || but3.pressed || but1_1.pressed|| but1_2.pressed)
                    ? "images/МЕНЮ Измерения 1 страница2.png"
                    : "images/МЕНЮ Измерения 1 страница.png"

                Text {
                    id: nameButton1
                    x: 20
                    y: 135

                    text: qsTr("ИЗМЕРЕНИЕ")
                    color: (but1.pressed || but2.pressed || but3.pressed || but1_1.pressed|| but1_2.pressed)
                    ? "white"
                    : "#A84A84"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: 17
                }

                DropShadow {
                      anchors.fill: nameButton1
                      source: nameButton1
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }

            }

            Rectangle {
                id:rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but1
                    anchors.fill: rec1
                    onClicked: {
                        console.log("Button 11111111 clicked.");
                        stack.push(view2);
                    }
                }
            }

            Rectangle {
                id:rec2
                x: mouse_range2_x
                y: mouse_range2_y
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but2
                    anchors.fill: rec2
                    onClicked: {
                        console.log("Button 11111111 clicked.");
                        stack.push(view2);
                    }
                }
            }

            Rectangle {
                id:rec3
                x: mouse_range3_x
                y: mouse_range3_y
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but3
                    anchors.fill: rec3
                    onClicked: {
                        console.log("Button 11111111 clicked.");
                        stack.push(view2);
                    }
                }
            }

            Rectangle {
                id:rec1_4
                x: mouse_range4_x
                y: mouse_range4_y
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but1_1
                    anchors.fill: rec1_4
                    onClicked: {
                        console.log("Button 11111111 clicked.");
                        stack.push(view2);
                    }
                }
            }

            Rectangle {
                id:rec1_5
                x: mouse_range5_x
                y: mouse_range5_y
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but1_2
                    anchors.fill: rec1_5
                    onClicked: {
                        console.log("Button 11111111 clicked.");
                        stack.push(view2);
                    }
                }
            }

        }

        Rectangle {
            id: recB2
            width: buttons_width
            height: buttons_height
            color: "transparent"
            //border.color: "black"
            x: ((recBut26X + shiftX) + clearances)
            y: ((recBut23Y + shiftY) + clearances)
            //z: -1

            Image {
                id: imBye2
                anchors.fill: recB2
                anchors.margins: 1
                source: "images/МЕНЮ Часы 1 страница.png"

                Rectangle {
                    x: 114
                    y: 96
                    //color: "#818282"
                    color: "transparent"
                    width: 14
                    height: 14
                    radius: 7
                }

            }

            Image {
                id: imArrow1
                x: 118
                y: 76
                width: 21
                height: 33
                source: "images/МЕНЮ Часы 1 страница маленькая стрелка.png"

                transform: Rotation {
                    id: hourRotation
                    angle: (hours * 30) - 29
                    //angle: (minutes * 6) - 29
                    origin.x: 4
                    origin.y: 28
                }
            }

            Image {
                id: imArrow2
                x: 118
                y: 73
                width: 38
                height: 36

                source: "images/МЕНЮ Часы 1 страница большая стрелка.png"

                transform: Rotation {
                    id: minuteRotation
                    angle: (minutes * 6) - 48
                    //angle: (seconds * 6) - 48
                    origin.x: 4
                    origin.y: 31
                }
            }

            Image {
                id: imArrow3
                x: 120
                y: 69
                width: 20
                height: 40

                source: "images/МЕНЮ Часы 1 страница большая стрелка.png"

                transform: Rotation {
                    id: secondRotation
                    //angle: (seconds * 6) - 27
                    angle: (seconds * 6) - 27
                    origin.x: 2
                    origin.y: 35
                }
            }




/*
            Rectangle {
                id:rec4
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                //border.color: "red"
                MouseArea {
                    id: but4
                    anchors.fill: rec4
                    onClicked: {
                        console.log("Button 2222222 clicked.");
                    }
                }
            }
            Rectangle {
                id:rec5
                x: mouse_range2_x
                y: mouse_range2_y
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                //border.color: "red"
                MouseArea {
                    id: but5
                    anchors.fill: rec5
                    onClicked: {
                        console.log("Button 2222222 clicked.");
                    }
                }
            }
            Rectangle {
                id:rec6
                x: mouse_range3_x
                y: mouse_range3_y
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                //border.color: "red"
                MouseArea {
                    id: but6
                    anchors.fill: rec6
                    onClicked: {
                        console.log("Button 2222222 clicked.");
                    }
                }
            }
            Rectangle {
                id:rec2_4
                x: mouse_range4_x
                y: mouse_range4_y
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                //border.color: "red"
                MouseArea {
                    id: but2_1
                    anchors.fill: rec2_4
                    onClicked: {
                        console.log("Button 222222 clicked.");
                    }
                }
            }
            Rectangle {
                id:rec2_5
                x: mouse_range5_x
                y: mouse_range5_y
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                //border.color: "red"
                MouseArea {
                    id: but2_2
                    anchors.fill: rec2_5
                    onClicked: {
                        console.log("Button 222222 clicked.");
                    }
                }
            }
*/

        }

        Rectangle {
            id: recB3
            width: buttons_width
            height: buttons_height
            color: "transparent"
            //border.color: "black"
            x: ((recBut37X + shiftX) - clearances)
            y: ((recBut23Y + shiftY) + clearances)
            //z: -1
            Image {
                id: imBye3
                anchors.fill: recB3
                anchors.margins: 1
                source: (but7.pressed || but8.pressed || but9.pressed || but3_1.pressed|| but3_2.pressed)
                    ? "images/МЕНЮ Результаты 1 страница2.png"
                    : "images/МЕНЮ Результаты 1 страница.png"

                Text {
                    id: nameButton3
                    x: 65
                    y: 143
                    text: qsTr("РЕЗУЛЬТАТЫ")
                    color: (but7.pressed || but8.pressed || but9.pressed || but3_1.pressed|| but3_2.pressed)
                    ? "white"
                    : "#5F9ECE"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: 17
                }

            }

            Rectangle {
                id:rec7
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but7
                    anchors.fill: rec7
                    onClicked: {
                        console.log("Button 3333333 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec8
                x: mouse_range2_x
                y: mouse_range2_y
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but8
                    anchors.fill: rec8
                    onClicked: {
                        console.log("Button 3333333 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec9
                x: mouse_range3_x
                y: mouse_range3_y
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but9
                    anchors.fill: rec9
                    onClicked: {
                        console.log("Button 3333333 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec3_4
                x: mouse_range4_x
                y: mouse_range4_y
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but3_1
                    anchors.fill: rec3_4
                    onClicked: {
                        console.log("Button 33333 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec3_5
                x: mouse_range5_x
                y: mouse_range5_y
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but3_2
                    anchors.fill: rec3_5
                    onClicked: {
                        console.log("Button 333333 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB4
            width: buttons_width
            height: buttons_height
            color: "transparent"
            //border.color: "black"
            x: recBut148X + shiftX
            y: recBut45Y + shiftY
            //z: -1
            Image {
                id: imBye4
                anchors.fill: recB4
                anchors.margins: 1
                source: (but10.pressed || but11.pressed || but12.pressed || but4_1.pressed|| but4_2.pressed)
                    ? "images/МЕНЮ Контроль качества 1 страница2.png"
                    : "images/МЕНЮ Контроль качества 1 страница.png"

                Text {
                    id: nameButton4
                    x: 78
                    y: 130
                    text: qsTr("КОНТРОЛЬ<br>КАЧЕСТВА")
                    color: (but10.pressed || but11.pressed || but12.pressed || but4_1.pressed|| but4_2.pressed)
                    ? "white"
                    : "#9A8DCC"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: 17
                }

            }

            Rectangle {
                id:rec10
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but10
                    anchors.fill: rec10
                    onClicked: {
                        console.log("Button 4444 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec11
                x: mouse_range2_x
                y: mouse_range2_y
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but11
                    anchors.fill: rec11
                    onClicked: {
                        console.log("Button 44444 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec12
                x: mouse_range3_x
                y: mouse_range3_y
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but12
                    anchors.fill: rec12
                    onClicked: {
                        console.log("Button 444444 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec4_4
                x: mouse_range4_x
                y: mouse_range4_y
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but4_1
                    anchors.fill: rec4_4
                    onClicked: {
                        console.log("Button 444444 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec4_5
                x: mouse_range5_x
                y: mouse_range5_y
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but4_2
                    anchors.fill: rec4_5
                    onClicked: {
                        console.log("Button 444444 clicked.");
                    }
                }
            }

        }
/*
        Rectangle {
            id: recB5
            width: buttons_width
            height: buttons_height
            color: "transparent"
            //border.color: "black"
            x: ((350 + shiftX) - clearances)
            y: recBut45Y + shiftY
            //z: -1
            Image {
                id: imBye5
                anchors.fill: recB5
                anchors.margins: 1

                source: {
                    if(but13.pressed || but14.pressed || but15.pressed || but5_1.pressed|| but5_2.pressed){
                        return "images/МЕНЮ Разогрев 1 страница2.png"
                    }
                    else {
                        if(0) return "images/МЕНЮ Разогрев 1 страница3.png"
                        else return "images/МЕНЮ Разогрев 1 страница.png"
                    }
                }




                source: (but13.pressed || but14.pressed || but15.pressed || but5_1.pressed|| but5_2.pressed)
                    ? "images/МЕНЮ Разогрев 1 страница2.png"
                    : "images/МЕНЮ Разогрев 1 страница.png"

                Text {
                    id: nameButton5
                    x: 78
                    y: 130
                    text: qsTr("РАЗОГРЕВ")
                    color: {
                        if(but13.pressed || but14.pressed || but15.pressed || but5_1.pressed || but5_2.pressed){
                            return "white"
                        }
                        else {
                            if(0) return "images/МЕНЮ Разогрев 1 страница3.png"
                            else return "images/МЕНЮ Разогрев 1 страница.png"
                        }

                    color: "#979A9B"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: 17
                }

                Text {
                    id: textTemperature
                    x: 92
                    y: 150
                    text: "-0.8 °C"
                    color: "#979A9B"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: 17
                }

            }

            Rectangle {
                id:rec13
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but13
                    anchors.fill: rec13
                    onClicked: {
                        console.log("Button 5555 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec14
                x: mouse_range2_x
                y: mouse_range2_y
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but14
                    anchors.fill: rec14
                    onClicked: {
                        console.log("Button 55555 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec15
                x: mouse_range3_x
                y: mouse_range3_y
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but15
                    anchors.fill: rec15
                    onClicked: {
                        console.log("Button 5555 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec5_4
                x: mouse_range4_x
                y: mouse_range4_y
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but5_1
                    anchors.fill: rec5_4
                    onClicked: {
                        console.log("Button 55555 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec5_5
                x: mouse_range5_x
                y: mouse_range5_y
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but5_2
                    anchors.fill: rec5_5
                    onClicked: {
                        console.log("Button 55555 clicked.");
                    }
                }
            }

        }
*/
        Rectangle {
            id: recB6
            width: buttons_width
            height: buttons_height
            color: "transparent"
            //border.color: "black"
            x: ((recBut26X + shiftX) + clearances)
            y: ((recBut67Y + shiftY) - clearances)
            //z: -1
            Image {
                id: imBye6
                anchors.fill: recB6
                anchors.margins: 1
                source: (but16.pressed || but17.pressed || but18.pressed || but6_1.pressed|| but6_2.pressed)
                    ? "images/МЕНЮ Ошибка 1 страница2.png"
                    : "images/МЕНЮ Ошибка 1 страница.png"

                Text {
                    id: nameButton6
                    x: 80
                    y: 140
                    text: qsTr("ОШИБКА")
                    color: "#979A9B"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: 17
                }
            }

            Rectangle {
                id:rec16
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but16
                    anchors.fill: rec16
                    onClicked: {
                        console.log("Button 666666 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec17
                x: mouse_range2_x
                y: mouse_range2_y
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but17
                    anchors.fill: rec17
                    onClicked: {
                        console.log("Button 6666 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec18
                x: mouse_range3_x
                y: mouse_range3_y
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but18
                    anchors.fill: rec18
                    onClicked: {
                        console.log("Button 666666 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec6_4
                x: mouse_range4_x
                y: mouse_range4_y
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but6_1
                    anchors.fill: rec6_4
                    onClicked: {
                        console.log("Button 66666 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec6_5
                x: mouse_range5_x
                y: mouse_range5_y
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but6_2
                    anchors.fill: rec6_5
                    onClicked: {
                        console.log("Button 66666 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB7
            width: buttons_width
            height: buttons_height
            color: "transparent"
            //border.color: "black"
            x: ((recBut37X + shiftX) - clearances)
            y: ((recBut67Y + shiftY) - clearances)
            //z: -1
            Image {
                id: imBye7
                anchors.fill: recB7
                anchors.margins: 1
                source: (but19.pressed || but20.pressed || but21.pressed || but7_1.pressed|| but7_2.pressed)
                    ? "images/МЕНЮ Служебные 1 страница2.png"
                    : "images/МЕНЮ Служебные 1 страница.png"

                Text {
                    id: nameButton7
                    x: 67
                    y: 145
                    text: qsTr("СЛУЖЕБНЫЕ")
                    color: "#66B2CC"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: 17
                }
            }

            Rectangle {
                id:rec19
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but19
                    anchors.fill: rec19
                    onClicked: {
                        console.log("Button 77777 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec20
                x: mouse_range2_x
                y: mouse_range2_y
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but20
                    anchors.fill: rec20
                    onClicked: {
                        console.log("Button 77777 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec21
                x: mouse_range3_x
                y: mouse_range3_y
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but21
                    anchors.fill: rec21
                    onClicked: {
                        console.log("Button 7777 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec7_4
                x: mouse_range4_x
                y: mouse_range4_y
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but7_1
                    anchors.fill: rec7_4
                    onClicked: {
                        console.log("Button 77777 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec7_5
                x: mouse_range5_x
                y: mouse_range5_y
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but7_2
                    anchors.fill: rec7_5
                    onClicked: {
                        console.log("Button 77777 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB8
            width: buttons_width
            height: buttons_height
            color: "transparent"
            //border.color: "black"
            x: recBut148X + shiftX
            y: ((750 + shiftY) - (clearances * 2))
            //z: -1
            Image {
                id: imBye8
                anchors.fill: recB8
                anchors.margins: 1
                source: (but22.pressed || but23.pressed || but24.pressed || but8_1.pressed|| but8_2.pressed)
                    ? "images/МЕНЮ Калибровка 1 страница2.png"
                    : "images/МЕНЮ Калибровка 1 страница.png"

                Text {
                    id: nameButton8
                    x: 65
                    y: 135
                    text: qsTr("КАЛИБРОВКА")
                    color: "#979A9B"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: 17
                }


                Text {
                    id: textTime
                    x: 98
                    y: 155
                    text: "00:00"
                    color: "#979A9B"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: 17
                }
            }

            Rectangle {
                id:rec22
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but22
                    anchors.fill: rec22
                    onClicked: {
                        console.log("Button 88888 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec23
                x: mouse_range2_x
                y: mouse_range2_y
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but23
                    anchors.fill: rec23
                    onClicked: {
                        console.log("Button 888 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec24
                x: mouse_range3_x
                y: mouse_range3_y
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but24
                    anchors.fill: rec24
                    onClicked: {
                        console.log("Button 8888 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec8_4
                x: mouse_range4_x
                y: mouse_range4_y
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but8_1
                    anchors.fill: rec8_4
                    onClicked: {
                        console.log("Button 88888 clicked.");
                    }
                }
            }

            Rectangle {
                id:rec8_5
                x: mouse_range5_x
                y: mouse_range5_y
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                //border.color: "red"

                MouseArea {
                    id: but8_2
                    anchors.fill: rec8_5
                    onClicked: {
                        console.log("Button 88888 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB9
            width: buttons_width / 2
            height: buttons_height / 2
            color: "transparent"
            //border.color: "black"
            x: ((337 + shiftX) - clearances)
            y: ((117 + shiftY) + (clearances * 2))
            //z: -1

            Image {
                id: imBye9
                anchors.fill: recB9
                anchors.margins: 1
                source: "images/МЕНЮ пустой шестиугольник 1 страница.png"
            }

        }

        Rectangle {
            id: recB10
            width: buttons_width / 4
            height: buttons_height / 4
            color: "transparent"
            //border.color: "black"
            x: ((69 + shiftX) + clearances)
            y: ((154 + shiftY) + (clearances * 2))
            //z: -1

            Image {
                id: imBye10
                anchors.fill: recB10
                anchors.margins: 1
                source: "images/МЕНЮ пустой шестиугольник 1 страница.png"
            }
        }

        Rectangle {
            id: recB11
            width: buttons_width / 2
            height: buttons_height / 2
            color: "transparent"
            //border.color: "black"
            x: ((337 + shiftX) - clearances)
            y: ((776 + shiftY) - (clearances * 2))
            //z: -1

            Image {
                id: imBye11
                anchors.fill: recB11
                anchors.margins: 1
                source: "images/МЕНЮ пустой шестиугольник 1 страница.png"
            }
        }
    }

    Page {
        id: view2
        visible: false

        Row {
            spacing: 100
            anchors.centerIn: parent

            Button {
                text: "BACK"
                onClicked: stack.pop(mainView);
            }

            Button {
                text: "EXIT"
                onClicked: Qt.quit();

            }
        }
    }
}

