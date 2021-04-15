import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12


Window {
    id:mainWindow
    visible: true
    width: 1026
    height: 600
    title: qsTr("Hello World")
    color: "#ffffff"
    Behavior on color{ColorAnimation{}}


    //onWidthChanged: periodChart.chart.requestPaint()
    //onHeightChanged: periodChart.chart.requestPaint()

    Switch{
        onCheckedChanged: {
            if(checked)
                mainWindow.color="#000000"
            else
                mainWindow.color="#ffffff"
        }

    }

    Row{
        id:cards1
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 60
        spacing: 6

        Card_Bar{}
        Card_Line{}
        Card_Line_Point{}
        Card_Area_Line{}
        Card_Pie{}
    }

    Card_Period{
        id:periodChart
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: cards1.bottom
        anchors.leftMargin: 24
        anchors.rightMargin: 24
        anchors.topMargin: 20
        height: 340
    }

}
