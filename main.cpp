#include <QApplication>
#include <FelgoApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "utility.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setOrganizationName("Tikiti Inc");
    QCoreApplication::setOrganizationDomain("tikiti.com");
    QCoreApplication::setApplicationName("Tikiti");

    QApplication app(argc, argv);

    FelgoApplication felgo;

    QQmlApplicationEngine engine;
    felgo.initialize(&engine);

    // utility functions
    Utility *utility = new Utility();

    // register context types
    engine.rootContext()->setContextProperty("Utility", utility);

    // register singetons
    qmlRegisterSingletonType(QUrl("qrc:/qml/singletons/AppUtil.qml"), "AppUtil", 1, 0, "AppUtil");

    felgo.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));

    engine.load(QUrl(felgo.mainQmlFileName()));

    return app.exec();
}
