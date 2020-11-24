#ifndef UTILITY_H
#define UTILITY_H

#include <QObject>
#include <QDir>
#include <QStandardPaths>
#include <QDebug>
#include <QFile>

using namespace std;

class Utility : public QObject
{
    Q_OBJECT
public:
    explicit Utility(QObject *parent = nullptr);

    Q_INVOKABLE QString currencyFormat(double value);

signals:


};

#endif // UTILITY_H
