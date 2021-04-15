#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSurfaceFormat>

#include "charthelper.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QSurfaceFormat format=QSurfaceFormat::defaultFormat();
    format.setDepthBufferSize(24);
    format.setSamples(16);
        QSurfaceFormat::setDefaultFormat(format);

        QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    ChartHelper helper;
    engine.rootContext()->setContextProperty(QStringLiteral("ChartHelper"), &helper);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
