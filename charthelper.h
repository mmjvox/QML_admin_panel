#ifndef CHARTHELPER_H
#define CHARTHELPER_H

#include <QObject>
#include <QtQuick>
#include <QtWidgets>
#include <QtCharts>

class ChartHelper : public QObject
{
    Q_OBJECT
public:
    explicit ChartHelper(QObject *parent = nullptr);

    QStringList months{
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"};

    //    Q_INVOKABLE void update_chart(QQuickItem *item){
    //        if(QGraphicsScene *scene = item->findChild<QGraphicsScene *>()){
    //            for(QGraphicsItem *it : scene->items()){
    //                if(QtCharts::QChart *chart = dynamic_cast<QtCharts::QChart *>(it)){
    //                    // Customize chart background
    //                    QLinearGradient backgroundGradient;
    //                    backgroundGradient.setStart(QPointF(0, 0));
    //                    backgroundGradient.setFinalStop(QPointF(0, 1));
    //                    backgroundGradient.setColorAt(0.0, QRgb(0xd2d0d1));
    //                    backgroundGradient.setColorAt(1.0, QRgb(0x4c4547));
    //                    backgroundGradient.setCoordinateMode(QGradient::ObjectBoundingMode);
    //                    chart->setBackgroundBrush(backgroundGradient);
    //                    // Customize plot area background
    //                    QLinearGradient plotAreaGradient;
    //                    plotAreaGradient.setStart(QPointF(0, 1));
    //                    plotAreaGradient.setFinalStop(QPointF(1, 0));
    //                    plotAreaGradient.setColorAt(0.0, QRgb(0x555555));
    //                    plotAreaGradient.setColorAt(1.0, QRgb(0x55aa55));
    //                    plotAreaGradient.setCoordinateMode(QGradient::ObjectBoundingMode);
    //                    chart->setPlotAreaBackgroundBrush(plotAreaGradient);
    //                    chart->setPlotAreaBackgroundVisible(true);
    //                }
    //            }
    //        }
    //    }
    void removeAllCategories(QtCharts::QCategoryAxis *axisX)
    {
        auto categories=axisX->categoriesLabels();
        for(auto label : categories)
            axisX->remove(label);
    }
    Q_INVOKABLE void update_axes_year(QtCharts::QCategoryAxis *axisX){
        if(axisX ){
            removeAllCategories(axisX);
            int index=0;
            foreach (QString month, months) {
                axisX->append(month,index);
                index++;
            }
            axisX->setMax(--index);
        }
    }
    Q_INVOKABLE void update_axes_mount(QtCharts::QCategoryAxis *axisX){
        if(axisX ){
            removeAllCategories(axisX);
            int index=0;
            for (; index<31; index++) {
                axisX->append(QString::number(index+1),index);
            }
            axisX->setMax(--index);
        }
    }
    Q_INVOKABLE void update_axes_week(QtCharts::QCategoryAxis *axisX){
        if(axisX ){
            removeAllCategories(axisX);
            int index=0;
            for (; index<7; index++) {
                axisX->append(QString::number(index+1),index);
            }
            axisX->setMax(--index);
        }
    }



};

#endif // CHARTHELPER_H
