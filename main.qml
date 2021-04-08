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
    //property real buttons_width: 191
    //property real buttons_height: 219
    property real buttons_width: 191
    property real buttons_height: 210

    property real mouse_range1_x: 18
    property real mouse_range1_y: 48
    property real mouse_range1_width: 169
    property real mouse_range1_height: 100
    property real mouse_range2_width: 130
    property real mouse_range2_height: 18
    property real mouse_range3_width: 110
    property real mouse_range3_height: 18
    property real mouse_range4_width: 60
    property real mouse_range4_height: 20
    property real mouse_range5_width: 50
    property real mouse_range5_height: 17

    property real recBut148X: 161
    property real recBut26X: 70
    property real recBut37X: 252
    property real recBut23Y: 263
    property real recBut45Y: 415
    property real recBut67Y: 566
    property real shiftX: 0
    property real shiftY: 0
    property real clearances: 0

    property int hours
    property int minutes
    property int seconds
    property real clock_arrow_shift_x: 0
    property real clock_arrow_shift_y: 0

    property real but_text_size: 17
    property bool rec_range_color_set: true

    function timeChanged() {
        var date = new Date();
        hours = date.getHours();
        minutes = date.getMinutes();
        seconds = date.getSeconds();
    }

    function rec_range_color(){
        return rec_range_color_set ? "red" : "transparent"
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
            border.color: rec_range_color_set ? "black" : "transparent"
            x: recBut148X + shiftX
            y: ((112 + shiftY) + (clearances * 2))

            Image {
                id: imBye1
                anchors.fill: recB1
                anchors.margins: 1
                source: (recB1But1.pressed || recB1But2.pressed || recB1But3.pressed || recB1But4.pressed || recB1But5.pressed)
                    ? "images/МЕНЮ Измерения 1 страница2.png"
                    : "images/МЕНЮ Измерения 1 страница.png"
            }

            Rectangle {
                id:recB1Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB1But1
                    anchors.fill: recB1Rec1
                    onClicked: {
                        console.log("Button 11111111 clicked.");
                        stack.push(view2);
                    }
                }

                Text {
                    id: nameButton1
                    anchors.bottom: recB1Rec1.bottom
                    anchors.horizontalCenter: recB1Rec1.horizontalCenter
                    text: qsTr("ИЗМЕРЕНИЕ")
                    color: (recB1But1.pressed || recB1But2.pressed || recB1But3.pressed || recB1But4.pressed || recB1But5.pressed)
                    ? "white"
                    : "#A84A84"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                }

                DropShadow {
                      id: shadowTextBut1
                      visible: (recB1But1.pressed || recB1But2.pressed || recB1But3.pressed || recB1But4.pressed || recB1But5.pressed)
                        ? false : true
                      anchors.fill: nameButton1
                      source: nameButton1
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }

            }

            Rectangle {
                id:recB1Rec2
                anchors.horizontalCenter: recB1Rec1.horizontalCenter
                anchors.bottom: recB1Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()
                MouseArea {
                    id: recB1But2
                    anchors.fill: recB1Rec2
                    onClicked: {
                        console.log("Button 11111111 clicked.");
                        stack.push(view2);
                    }
                }
            }

            Rectangle {
                id:recB1Rec3
                anchors.horizontalCenter: recB1Rec1.horizontalCenter
                anchors.top: recB1Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB1But3
                    anchors.fill: recB1Rec3
                    onClicked: {
                        console.log("Button 11111111 clicked.");
                        stack.push(view2);
                    }
                }
            }

            Rectangle {
                id:recB1Rec4
                anchors.bottom: recB1Rec2.top
                anchors.horizontalCenter: recB1Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB1But4
                    anchors.fill: recB1Rec4
                    onClicked: {
                        console.log("Button 11111111 clicked.");
                        stack.push(view2);
                    }
                }
            }

            Rectangle {
                id:recB1Rec5
                anchors.top: recB1Rec3.bottom
                anchors.horizontalCenter: recB1Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB1But5
                    anchors.fill: recB1Rec5
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
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((recBut26X + shiftX) + clearances)
            y: ((recBut23Y + shiftY) + clearances)
            //z: -1

            Image {
                id: imBye2
                anchors.fill: recB2
                anchors.margins: 1
                source: "images/МЕНЮ Часы 1 страница.png"
            }

            Image {
                id: imArrow1
                x: 98 + clock_arrow_shift_x
                y: 65 + clock_arrow_shift_y
                width: 21
                height: 33
                source: "images/МЕНЮ Часы 1 страница маленькая стрелка.png"

                transform: Rotation {
                    id: hourRotation
                    angle: (hours * 30) - 29
                    origin.x: 4
                    origin.y: 28
                }
            }

            Image {
                id: imArrow2
                x: 98 + clock_arrow_shift_x
                y: 62 + clock_arrow_shift_y
                width: 38
                height: 36

                source: "images/МЕНЮ Часы 1 страница большая стрелка.png"

                transform: Rotation {
                    id: minuteRotation
                    angle: (minutes * 6) - 48
                    origin.x: 4
                    origin.y: 31
                }
            }

            Image {
                id: imArrow3
                x: 100 + clock_arrow_shift_x
                y: 58 + clock_arrow_shift_y
                width: 20
                height: 40
                source: "images/МЕНЮ Часы 1 страница большая стрелка.png"
                transform: Rotation {
                    id: secondRotation
                    angle: (seconds * 6) - 27
                    origin.x: 2
                    origin.y: 35
                }
            }
        }

        Rectangle {
            id: recB3
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((recBut37X + shiftX) - clearances)
            y: ((recBut23Y + shiftY) + clearances)
            z: -1
            Image {
                id: imBye3
                anchors.fill: recB3
                anchors.margins: 1
                source: (recB3But1.pressed || recB3But2.pressed || recB3But3.pressed || recB3But4.pressed || recB3But5.pressed)
                    ? "images/МЕНЮ Результаты 1 страница2.png"
                    : "images/МЕНЮ Результаты 1 страница.png"
            }

            Rectangle {
                id:recB3Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                Text {
                    id: nameButton3
                    anchors.bottom: recB3Rec1.bottom
                    anchors.horizontalCenter: recB3Rec1.horizontalCenter
                    text: qsTr("РЕЗУЛЬТАТЫ")
                    color: (recB3But1.pressed || recB3But2.pressed || recB3But3.pressed || recB3But4.pressed || recB3But5.pressed)
                    ? "white"
                    : "#5F9ECE"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                }

                DropShadow {
                      id: shadowTextBut3
                      visible: (recB3But1.pressed || recB3But2.pressed || recB3But3.pressed || recB3But4.pressed || recB3But5.pressed)
                               ? false : true
                      anchors.fill: nameButton3
                      source: nameButton3
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }

                MouseArea {
                    id: recB3But1
                    anchors.fill: recB3Rec1
                    onClicked: {
                        console.log("Button 3333333 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB3Rec2
                anchors.horizontalCenter: recB3Rec1.horizontalCenter
                anchors.bottom: recB3Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB3But2
                    anchors.fill: recB3Rec2
                    onClicked: {
                        console.log("Button 3333333 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB3Rec3
                anchors.horizontalCenter: recB3Rec1.horizontalCenter
                anchors.top: recB3Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB3But3
                    anchors.fill: recB3Rec3
                    onClicked: {
                        console.log("Button 3333333 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB3Rec4
                anchors.bottom: recB3Rec2.top
                anchors.horizontalCenter: recB3Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB3But4
                    anchors.fill: recB3Rec4
                    onClicked: {
                        console.log("Button 33333 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB3Rec5
                anchors.top: recB3Rec3.bottom
                anchors.horizontalCenter: recB3Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB3But5
                    anchors.fill: recB3Rec5
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
            border.color: rec_range_color_set ? "black" : "transparent"
            x: recBut148X + shiftX
            y: recBut45Y + shiftY
            //z: -1
            Image {
                id: imBye4
                anchors.fill: recB4
                anchors.margins: 1
                source: (recB4But1.pressed || recB4But2.pressed || recB4But3.pressed || recB4But4.pressed || recB4But5.pressed)
                    ? "images/МЕНЮ Контроль качества 1 страница2.png"
                    : "images/МЕНЮ Контроль качества 1 страница.png"



            }

            Rectangle {
                id:recB4Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB4But1
                    anchors.fill: recB4Rec1
                    onClicked: {
                        console.log("Button 4444 clicked.");
                    }
                }

                Text {
                    id: nameButton4
                    anchors.bottom: recB4Rec1.bottom
                    anchors.horizontalCenter: recB4Rec1.horizontalCenter
                    text: qsTr("КОНТРОЛЬ<br>КАЧЕСТВА")
                    color: (recB4But1.pressed || recB4But2.pressed || recB4But3.pressed || recB4But4.pressed || recB4But5.pressed)
                    ? "white"
                    : "#9A8DCC"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                }

                DropShadow {
                      id: shadowTextBut4
                      visible: (recB4But1.pressed || recB4But2.pressed || recB4But3.pressed || recB4But4.pressed || recB4But5.pressed)
                             ? false : true
                      anchors.fill: nameButton4
                      source: nameButton4
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }
            }

            Rectangle {
                id:recB4Rec2
                anchors.horizontalCenter: recB4Rec1.horizontalCenter
                anchors.bottom: recB4Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB4But2
                    anchors.fill: recB4Rec2
                    onClicked: {
                        console.log("Button 44444 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB4Rec3
                anchors.horizontalCenter: recB4Rec1.horizontalCenter
                anchors.top: recB4Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB4But3
                    anchors.fill: recB4Rec3
                    onClicked: {
                        console.log("Button 444444 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB4Rec4
                anchors.bottom: recB4Rec2.top
                anchors.horizontalCenter: recB4Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB4But4
                    anchors.fill: recB4Rec4
                    onClicked: {
                        console.log("Button 444444 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB4Rec5
                anchors.top: recB4Rec3.bottom
                anchors.horizontalCenter: recB4Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB4But5
                    anchors.fill: recB4Rec5
                    onClicked: {
                        console.log("Button 444444 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB5
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((343 + shiftX) - (clearances * 2))
            y: recBut45Y + shiftY
            z: -1

            Image {
                id: imBye5
                anchors.fill: recB5
                anchors.margins: 1
                source: {
                    if(recB5But1.pressed || recB5But2.pressed || recB5But3.pressed || recB5But4.pressed|| recB5But5.pressed){
                        return "images/МЕНЮ Разогрев 1 страница2.png"
                    }
                    else {
                        if(1) return "images/МЕНЮ Разогрев 1 страница3.png"
                        else return "images/МЕНЮ Разогрев 1 страница.png"
                    }
                }         
            }

            Rectangle {
                id:recB5Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()


                MouseArea {
                    id: recB5But1
                    anchors.fill: recB5Rec1
                    onClicked: {
                        console.log("Button 5555 clicked.");
                    }
                }

                Text {
                    id: nameButton5
                    anchors.bottom: textTemperature.top
                    anchors.horizontalCenter: textTemperature.horizontalCenter
                    text: qsTr("РАЗОГРЕВ")
                    color: {
                        if(recB5But1.pressed || recB5But2.pressed || recB5But3.pressed || recB5But4.pressed|| recB5But5.pressed){
                            return "white"
                        }
                        else {
                            if(1) return "#EF4C26"
                            else return "#979A9B"
                        }
                    }
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                }

                Text {
                    id: textTemperature
                    anchors.bottom: recB5Rec1.bottom
                    anchors.horizontalCenter: recB5Rec1.horizontalCenter
                    text: "-0.8 °C"
                    color: {
                        if(recB5But1.pressed || recB5But2.pressed || recB5But3.pressed || recB5But4.pressed|| recB5But5.pressed){
                            return "white"
                        }
                        else {
                            if(1) return "#EF4C26"
                            else return "#979A9B"
                        }
                    }
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                }

                DropShadow {
                      id: shadowTextBut5
                      visible: {
                          if(recB5But1.pressed || recB5But2.pressed || recB5But3.pressed || recB5But4.pressed|| recB5But5.pressed){
                              return false
                          }
                          else {
                              return true
                          }
                      }
                      anchors.fill: nameButton5
                      source: nameButton5
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }

                DropShadow {
                      id: shadowTexTemperatBut5
                      visible: {
                          if(recB5But1.pressed || recB5But2.pressed || recB5But3.pressed || recB5But4.pressed|| recB5But5.pressed){
                              return false
                          }
                          else {
                              return true
                          }
                      }
                      anchors.fill: textTemperature
                      source: textTemperature
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }
            }

            Rectangle {
                id:recB5Rec2
                anchors.horizontalCenter: recB5Rec1.horizontalCenter
                anchors.bottom: recB5Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB5But2
                    anchors.fill: recB5Rec2
                    onClicked: {
                        console.log("Button 55555 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB5Rec3
                anchors.horizontalCenter: recB5Rec1.horizontalCenter
                anchors.top: recB5Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB5But3
                    anchors.fill: recB5Rec3
                    onClicked: {
                        console.log("Button 5555 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB5Rec4
                anchors.bottom: recB5Rec2.top
                anchors.horizontalCenter: recB5Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB5But4
                    anchors.fill: recB5Rec4
                    onClicked: {
                        console.log("Button 55555 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB5Rec5
                anchors.top: recB5Rec3.bottom
                anchors.horizontalCenter: recB5Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB5But5
                    anchors.fill: recB5Rec5
                    onClicked: {
                        console.log("Button 55555 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB6
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((recBut26X + shiftX) + clearances)
            y: ((recBut67Y + shiftY) - clearances)
            //z: -1
            Image {
                id: imBye6
                anchors.fill: recB6
                anchors.margins: 1
                source: (recB6But1.pressed || recB6But2.pressed || recB6But3.pressed || recB6But4.pressed|| recB6But5.pressed)
                    ? "images/МЕНЮ Ошибка 1 страница2.png"
                    : "images/МЕНЮ Ошибка 1 страница.png"


            }

            Rectangle {
                id:recB6Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB6But1
                    anchors.fill: recB6Rec1
                    onClicked: {
                        console.log("Button 666666 clicked.");
                    }
                }

                Text {
                    id: nameButton6
                    anchors.bottom: recB6Rec1.bottom
                    anchors.horizontalCenter: recB6Rec1.horizontalCenter
                    text: qsTr("ОШИБКА")
                    color: (recB6But1.pressed || recB6But2.pressed || recB6But3.pressed || recB6But4.pressed || recB6But5.pressed)
                    ? "white"
                    : "#979A9B"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                }

                DropShadow {
                      id: shadowTextBut6
                      visible: (recB6But1.pressed || recB6But2.pressed || recB6But3.pressed || recB6But4.pressed || recB6But5.pressed)
                             ? false : true
                      anchors.fill: nameButton6
                      source: nameButton6
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }
            }

            Rectangle {
                id:recB6Rec2
                anchors.horizontalCenter: recB6Rec1.horizontalCenter
                anchors.bottom: recB6Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB6But2
                    anchors.fill: recB6Rec2
                    onClicked: {
                        console.log("Button 6666 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB6Rec3
                anchors.horizontalCenter: recB6Rec1.horizontalCenter
                anchors.top: recB6Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB6But3
                    anchors.fill: recB6Rec3
                    onClicked: {
                        console.log("Button 666666 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB6Rec4
                anchors.bottom: recB6Rec2.top
                anchors.horizontalCenter: recB6Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB6But4
                    anchors.fill: recB6Rec4
                    onClicked: {
                        console.log("Button 66666 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB6Rec5
                anchors.top: recB6Rec3.bottom
                anchors.horizontalCenter: recB6Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB6But5
                    anchors.fill: recB6Rec5
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
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((recBut37X + shiftX) - clearances)
            y: ((recBut67Y + shiftY) - clearances)
            z: -1
            Image {
                id: imBye7
                anchors.fill: recB7
                anchors.margins: 1
                source: (recB7But1.pressed || recB7But2.pressed || recB7But3.pressed || recB7But4.pressed|| recB7But5.pressed)
                    ? "images/МЕНЮ Служебные 1 страница2.png"
                    : "images/МЕНЮ Служебные 1 страница.png"
            }

            Rectangle {
                id:recB7Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB7But1
                    anchors.fill: recB7Rec1
                    onClicked: {
                        console.log("Button 77777 clicked.");
                    }
                }

                Text {
                    id: nameButton7
                    anchors.bottom: recB7Rec1.bottom
                    anchors.horizontalCenter: recB7Rec1.horizontalCenter
                    text: qsTr("СЛУЖЕБНЫЕ")
                    color: (recB7But1.pressed || recB7But2.pressed || recB7But3.pressed || recB7But4.pressed|| recB7But5.pressed)
                    ? "white"
                    : "#66B2CC"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                }

                DropShadow {
                      id: shadowTextBut7
                      visible: (recB7But1.pressed || recB7But2.pressed || recB7But3.pressed || recB7But4.pressed|| recB7But5.pressed)
                           ? false : true
                      anchors.fill: nameButton7
                      source: nameButton7
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }
            }

            Rectangle {
                id:recB7Rec2
                anchors.horizontalCenter: recB7Rec1.horizontalCenter
                anchors.bottom: recB7Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB7But2
                    anchors.fill: recB7Rec2
                    onClicked: {
                        console.log("Button 77777 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB7Rec3
                anchors.horizontalCenter: recB7Rec1.horizontalCenter
                anchors.top: recB7Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB7But3
                    anchors.fill: recB7Rec3
                    onClicked: {
                        console.log("Button 7777 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB7Rec4
                anchors.bottom: recB7Rec2.top
                anchors.horizontalCenter: recB7Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB7But4
                    anchors.fill: recB7Rec4
                    onClicked: {
                        console.log("Button 77777 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB7Rec5
                anchors.top: recB7Rec3.bottom
                anchors.horizontalCenter: recB7Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB7But5
                    anchors.fill: recB7Rec5
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
            border.color: rec_range_color_set ? "black" : "transparent"
            x: recBut148X + shiftX
            y: ((718 + shiftY) - (clearances * 2))
            //z: -1
            Image {
                id: imBye8
                anchors.fill: recB8
                anchors.margins: 1
                source: (recB8But1.pressed || recB8But2.pressed || recB8But3.pressed || recB8But4.pressed|| recB8But5.pressed)
                    ? "images/МЕНЮ Калибровка 1 страница2.png"
                    : "images/МЕНЮ Калибровка 1 страница.png"
            }

            Rectangle {
                id:recB8Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB8But1
                    anchors.fill: recB8Rec1
                    onClicked: {
                        console.log("Button 88888 clicked.");
                    }
                }

                Text {
                    id: nameButton8
                    anchors.bottom: textTime.top
                    anchors.horizontalCenter: textTime.horizontalCenter
                    text: qsTr("КАЛИБРОВКА")
                    color: "#979A9B"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                }

                DropShadow {
                      anchors.fill: nameButton8
                      source: nameButton8
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }

                Text {
                    id: textTime
                    anchors.bottom: recB8Rec1.bottom
                    anchors.horizontalCenter: recB8Rec1.horizontalCenter
                    text: "00:00"
                    color: "#979A9B"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                }

                DropShadow {
                      anchors.fill: textTime
                      source: textTime
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }
            }

            Rectangle {
                id:recB8Rec2
                anchors.horizontalCenter: recB8Rec1.horizontalCenter
                anchors.bottom: recB8Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB8But2
                    anchors.fill: recB8Rec2
                    onClicked: {
                        console.log("Button 888 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB8Rec3
                anchors.horizontalCenter: recB8Rec1.horizontalCenter
                anchors.top: recB8Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB8But3
                    anchors.fill: recB8Rec3
                    onClicked: {
                        console.log("Button 8888 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB8Rec4
                anchors.bottom: recB8Rec2.top
                anchors.horizontalCenter: recB8Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB8But4
                    anchors.fill: recB8Rec4
                    onClicked: {
                        console.log("Button 88888 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB8Rec5
                anchors.top: recB8Rec3.bottom
                anchors.horizontalCenter: recB8Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB8But5
                    anchors.fill: recB8Rec5
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
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((350 + shiftX) - clearances)
            y: ((185 + shiftY) + (clearances * 2))
            //z: -1

            Image {
                id: imBye9
                anchors.fill: recB9
                anchors.margins: 1
                source: "images/МЕНЮ пустой шестиугольник 1 страница.png"
            }

            MouseArea {
                id: recB9But1
                anchors.fill: imBye9
                anchors.margins: 10
                onClicked: Qt.quit();
            }



        }

        Rectangle {
            id: recB10
            width: buttons_width / 4
            height: buttons_height / 4
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((122 + shiftX) + clearances)
            y: ((219 + shiftY) + (clearances * 2))
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
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((350 + shiftX) - clearances)
            y: ((742 + shiftY) - (clearances * 2))
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

