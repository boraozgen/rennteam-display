#include "displaydrv.h"

#include <QDebug>

DisplayDrv::DisplayDrv(QObject *parent) : QObject(parent)
{
    m_canData = {};
    m_displayData.gear = "N";
    m_displayData.grid = {0, 0, 0, 0, 0, 0, 0, 0};
    m_displayLabels.gridLabel = {"Water Temp", "Oil Temp", "Amb Temp", "Airbox Temp",
                              "Fuel Temp", "Oil Pres", "Amb Pres", "Fuel Pres"};
}

displayData_t DisplayDrv::readDisplayData()
{
    return m_displayData;
}

displayLabels_t DisplayDrv::readDisplayLabels()
{
    return m_displayLabels;
}


void DisplayDrv::setCanData(canData_t canData)
{
    m_canData = canData;

    switch (m_canData.displaySetting) {
    case 0:
        m_displayData.grid[0] = m_canData.engineWaterTemperature;
        m_displayData.grid[1] = m_canData.engineOilTemperature;
        m_displayData.grid[2] = m_canData.ambientTemperature;
        m_displayData.grid[3] = m_canData.airboxTemperature;
        m_displayData.grid[4] = m_canData.fuelTemperature;
        m_displayData.grid[5] = m_canData.engineOilPressure;
        m_displayData.grid[6] = m_canData.ambientPressure;
        m_displayData.grid[7] = m_canData.fuelPressure;
        break;
    case 1:
        break;
    default:
        break;
    }

    qDebug() << "setCanData: " << m_displayData.grid[0];

    emit newDisplayData();
}
