import QtQuick 2.12
import QtCharts 2.3
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

Rectangle{
    id:mainRect
    width: 240
    height: 160
    radius: 4
    border.color: "#cecece"
    border.width: 1
    clip: true

    Component.onCompleted: {
                ChartHelper.update_axes_year(axX);
            }

    ChartView {
          anchors.fill: parent
          anchors.rightMargin: 0
          anchors.leftMargin: 0
          anchors.bottomMargin: 0
          anchors.topMargin: 40
          legend.visible: false
          antialiasing: true;
          backgroundColor: "#00000000"
          animationOptions: ChartView.NoAnimation
          //plotArea: Qt.rect(8, 60, width-16, height-80)


          ValueAxis {id:axY; max:6;}
          CategoryAxis {id:axX; labelsPosition: CategoryAxis.AxisLabelsPositionOnValue;}

          SplineSeries {
              id: mySeries
              useOpenGL:true
              axisX:axX
              axisY:axY
              color: "#4dbd74";
              width: 2
              pointsVisible: true

              XYPoint { x: 0; y: 0; }
              XYPoint { x: 1.1; y: 2.1 }
              XYPoint { x: 1.9; y: 3.3 }
              XYPoint { x: 2.1; y: 2.1 }
              XYPoint { x: 2.9; y: 4.9 }
              XYPoint { x: 3.4; y: 3.0 }
              XYPoint { x: 4.1; y: 3.3 }
          }
          SplineSeries {
              id: mySeries2
              useOpenGL:true
              axisX: axX
              axisY: axY
              color: "#20a8d8";
              width: 2
              pointsVisible: true

              XYPoint { x: 0; y: 0; }
              XYPoint { x: 1.1; y: 3.3 }
              XYPoint { x: 1.9; y: 3.0 }
              XYPoint { x: 2.1; y: 4.9 }
              XYPoint { x: 2.9; y: 2.1 }
              XYPoint { x: 3.4; y: 3.3 }
              XYPoint { x: 4.1; y: 2.1 }
          }
          SplineSeries {
              id: mySeries3
              useOpenGL:true
              axisX: axX
              axisY: axY
              color: "#EF9A9A";
              width: 2
              style:Qt.DashLine

              XYPoint { x: 0; y: 1; }
              XYPoint { x: 5; y: 1; }
          }
      }

    TabBar{
        height: 36
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.leftMargin: 24
        TabButton {
            id: toolButton
            height: parent.height
            width: implicitWidth
            text: "Annual"
            onClicked: ChartHelper.update_axes_year(axX);
        }
        TabButton {
            id: toolButton2
            height: parent.height
            width: implicitWidth
            text: "Monthly"
            onClicked: ChartHelper.update_axes_mount(axX);
        }
        TabButton {
            id: toolButton3
            height: parent.height
            width: implicitWidth
            text: "Weekly"
            onClicked: ChartHelper.update_axes_week(axX);
        }
    }

    Label{
        anchors.right: parent.right
        anchors.top: parent.top
        font.bold: true
        font.pointSize: 12
        anchors.topMargin: 16
        anchors.rightMargin: 24
        text: "Comparison"
    }

}
