import QtQuick 2.12
import QtCharts 2.3
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12

Rectangle{
    id:mainRect
    width: 240
    height: 160
    radius: 4
    color: Material.color(Material.Red)
    clip: true

    gradient: Gradient {
        orientation:Gradient.Horizontal
        GradientStop {
            position: 0
            color: "#23dace"
        }
        GradientStop {
            position: 1
            color: "#20c5ba"
        }
    }

    transform: Rotation {
                id: rot
                origin.x: 50; origin.y: 50
                //axis: Qt.vector3d(-0.552483, -0.770076, 0.318976)
                axis { x:0; y: 0; z:0 }
                angle: 10
            }

    ChartView {
          anchors.left: parent.left
          anchors.right: parent.right
          anchors.top: parent.top
          anchors.bottom: parent.bottom
          anchors.topMargin: 20
          anchors.bottomMargin: -20
          legend.visible: false
          antialiasing: true;
          backgroundColor: "#00000000"
          animationOptions: ChartView.SeriesAnimations
          plotArea: Qt.rect(0, 0, width, height)

          PieSeries{
              id: pieSeries
              PieSlice { color:"#8fefe9"; value: 13.5 }
              PieSlice { color:"#5dffe4"; value: 10.9 }
          }

      }

    Label{
        text: "aaaa";
        font.pointSize: 14;
        color: "#ffffff";
        anchors.right: parent.right;
        anchors.rightMargin: 16
        anchors.top: parent.top;
        anchors.topMargin: 10
    }
    Label{
        text: "6113";
        font.pointSize: 14;
        color: "#ffffff";
        anchors.left: parent.left;
        anchors.leftMargin: 16
        anchors.top: parent.top;
        anchors.topMargin: 10
    }

    MouseArea{
        anchors.fill: parent
        focus: false
        id: button
        hoverEnabled: true;
        onPressed: {
            ripple.x=mouseX-(ripple.width/2)
            ripple.y=mouseY-(ripple.height/2)
        }
        onPositionChanged:{
            rot.axis.x=((ripple.height/4)-mouseY)/10000;
            rot.axis.y=(mouseX-(ripple.width/4))/10000;
        }
        onExited: {
            rot.axis.x=0;
            rot.axis.y=0;
        }

        Ripple {
            id: ripple
            clipRadius: 2
            //anchors.fill: mainRect
            x:40
            width: mainRect.width*2
            height: mainRect.height*2
            pressed: button.pressed
            active:  false
            color: "#40FFFFFF"
            layer.enabled: true
        }
    }

}
