#include "displaydrv.h"

#include <QDebug>

bool inRange(double low, double high, double x);

DisplayDrv::DisplayDrv(QObject *parent) : QObject(parent)
{
    m_canData = {};
    m_displayData.gear = "N";
    m_displayData.page = 0;
    m_displayData.rev = 0;
    m_displayData.grid = {0, 0, 0, 0, 0, 0, 0, 0, 0};
    //m_displayData.grid = {100, 90, 3.5, 5.5, 50, 4000, 50, 50}; // Test
    m_displayData.limit = {false, false, false, false, false, false, false, false, false};
    m_displayLabels.gridLabel = {"Water Temp", "Oil Temp", "Amb Temp", "Airbox Temp",
                              "Fuel Temp", "Oil Pres", "Amb Pres", "Fuel Pres"};
    m_displayData.prevButton = 0;
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

    if (m_canData.pageButton > m_displayData.prevButton) {
        if (m_displayData.page < PAGE_COUNT - 1) {
            m_displayData.page++;
        } else {
            m_displayData.page = 0;
        }
    }

    m_displayData.prevButton = (quint8)m_canData.pageButton;

    switch (m_displayData.page) {
    case 0:
    case 1:
        m_displayData.grid[0] = m_canData.engineWaterTemperature;
        m_displayData.grid[1] = m_canData.engineOilTemperature;
        m_displayData.grid[2] = m_canData.fuelPressure;
        m_displayData.grid[3] = m_canData.engineOilPressure;
        m_displayData.grid[4] = m_canData.throttlePosition;
        m_displayData.grid[5] = m_canData.batteryVoltage;
        m_displayData.grid[6] = m_canData.brakePressureFront;
        m_displayData.grid[7] = m_canData.brakePressureRear;
        m_displayData.grid[8] = m_canData.engineSpeed;

        // DaPe: AAB
        // Limit checks
        // rpm > 3000, one vale over limit, whole displayy red
        // TODO: not the ideal place for this. CanDrv instead?
        m_displayData.limit[0] = !inRange(20, 90, m_canData.engineWaterTemperature); // 20-80 gelb
        m_displayData.limit[1] = !inRange(20, 130, m_canData.engineOilTemperature); // 20-60 gelb
        m_displayData.limit[2] = !inRange(5.8, 6.0, m_canData.fuelPressure);
        m_displayData.limit[3] = !inRange(1.0, 4.5, m_canData.engineOilPressure);
        m_displayData.limit[4] = !inRange(8, 100, m_canData.throttlePosition);
        m_displayData.limit[5] = !inRange(12, 14, m_canData.batteryVoltage);
        m_displayData.limit[6] = !inRange(3, 60, m_canData.brakePressureFront);
        m_displayData.limit[7] = !inRange(3, 60, m_canData.brakePressureRear);
        m_displayData.limit[8] = !inRange(-1, 11000, m_canData.engineSpeed);
        break;
    default:
        break;
    }

    m_displayData.rev = m_canData.engineSpeed;

    // qDebug() << "setCanData: " << m_displayData.grid[0];

    emit newDisplayData();
}

// Returns true if x is in range [low..high], else false
bool inRange(double low, double high, double x)
{
    return (low <= x && x <= high);
}
