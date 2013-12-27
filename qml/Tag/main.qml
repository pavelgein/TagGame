import QtQuick 1.1
import "script.js" as MyScript

Rectangle {
    id: page
    width: 400
    height: 200
    color: "#000000"

    Column {
        id: column1
        x: 200
        y: 0
        width: 200
        height: 200
        smooth: false
        Repeater {
            model: 5;
            Row {
                height: 40;
                Repeater
                {
                    model: 5;
                    Rectangle {
                        width: 40;
                        height: 40;
                        color: "#FFFFFF"
                        border.color: "#000000"
                        Text {
                            text: "";
                            font.bold: true
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            width: 40;
                            height: 40;
                            color: "blue"
                            font.pixelSize: 20
                        }
                        MouseArea {
                            anchors.fill: parent
                        }
                    }
                }
            }
        }
    }

    Text {
        id: congrat;
        text: ""
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter;
        horizontalAlignment: Text.AlignHCenter;
        opacity: 1;
        visible: false;
        font.pixelSize:20
        color: "#FFFFFF";
    }

    Rectangle {
        id: newGame
        x: 40
        y: 19
        width: 129
        height: 49
        color: "#ffffff"

        MouseArea {
            id: mouseNewGame
            anchors.fill: parent
            onClicked: {
                page.state = 'base state';
                MyScript.makeStart();
            }
        }

        Text {
            id: textNewGame
            color: "#0000ff"
            text: qsTr("Новая игра")
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
        }
    }

    Rectangle {
        id: quit
        x: 40
        y: 131
        width: 129
        height: 49
        color: "#ffffff"
        MouseArea {
            id: mouseQuit
            anchors.fill: parent
            onClicked: Qt.quit();
        }

        Text {
            id: textQuit
            color: "#0000ff"
            text: qsTr("Выйти")
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
        }
    }
    states: [
        State {
            name: "stateWin"
            PropertyChanges {
                target: column1;
                visible: false;
            }
            PropertyChanges {
                target: congrat;
                x: 0
                y: 0
                visible: true
                text: qsTr("Поздравляем! \nВы решили головоломку за \n") +
                      MyScript.turnNumber + " "
                      + qsTr(MyScript.getEnding(MyScript.turnNumber));
                      anchors.rightMargin: 0
                      anchors.bottomMargin: 0
                      anchors.leftMargin: 0
                      anchors.topMargin: 0
            }

            PropertyChanges {
                target: newGame
                y: 138
                color: "#000000"
                visible: true
            }

            PropertyChanges {
                target: quit
                x: 236
                y: 138
                visible: true
                color: "black";

            }

            PropertyChanges {
                target: textQuit
                x: 14
                y: 0
                text: "Выйти"
                anchors.topMargin: 0
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                color: "white";
            }

            PropertyChanges {
                target: mouseQuit
                x: 0
                y: 0
                anchors.topMargin: 0
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
            }

            PropertyChanges {
                target: textNewGame
                color: "#ffffff"
            }
        }
    ]
    Component.onCompleted: MyScript.makeStart();
}


