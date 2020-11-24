#include "utility.h"

Utility::Utility(QObject *parent) : QObject(parent)
{

}

QString Utility::currencyFormat(double value)
{
    return QString("%L1").arg(value, 0, 'f', 2);
}
