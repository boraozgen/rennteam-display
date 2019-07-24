import QtQuick 2.6
import QtQuick.Window 2.2
import CanDrv 1.0
import DisplayDrv 1.0

Window {
    id: window
    visible: true
    // visibility: "FullScreen"
    width: 800
    height: 480
    color: "#000000"
    property alias window: window
    title: qsTr("Rennteam 11-14 Display")

    /* Test
    Timer {
        interval: 100; running: true; repeat: true
        onTriggered: cd.mockCanData()
    }
    */

    CanDrv {
        id: cd
        onNewCanData: dd.setCanData(cd.canData)
    }

    DisplayDrv {
        id: dd
    }

    // TODO: parametrize x/y/h/w dimensions

    // Background picture
    BorderImage {
        id: borderImage
        x: 0
        y: 0
        width: 800
        height: 480
        visible: true
        source: "img/carbonfiber_background.png"

        Image {
            id: image
            /*
            x: 375
            y: 380
            width: 50
            height: 50
            */
            /* Temporary position while no gear sensor is available */
            x: 350
            y: 250
            width: 100
            height: 100
            source: "img/horse.png"
            fillMode: Image.PreserveAspectFit
        }

        // Circles in the bottom
        Rectangle {
            id: screen1
            x: 350
            y: 440
            width: 20
            height: 20
            color: "#808080"
            radius: 10
        }

        Rectangle {
            id: screen2
            x: 390
            y: 440
            width: 20
            height: 20
            color: "#808080"
            radius: 10
        }

        Rectangle {
            id: screen3
            x: 430
            y: 440
            width: 20
            height: 20
            color: "#808080"
            radius: 10
        }
    }

    // Reference to RevStyle that display the rmp count
    RevStyle {
        id: rev
        width: 800
        height: 200
        currentRev: dd.displayData.rev.toFixed(1)

        minRev: 0
        maxRev: 10000

        numRec: 20
    }

/* Temporarily disabled while no gear sensor is available */
/*
    // Get the gear number
    Text {
        id: gear
        x: 300
        y: 202.5
        color: "#ffffff"
        width: 200
        height: 145
        text: dd.displayData.gear
        //text: qsTr("#dd.displayData.gear#")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideRight
        ///wrapMode: Text.NoWrap
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        clip: false
        font.pixelSize: 200
    }
*/

    // Display 1
    Item {
        id: display1
        x: 0
        y: 0
        width: 800
        height: 480
        visible: (dd.displayData.page === 0)

        // Bottom Circle Highlight
        Rectangle {
            id: screen1_check
            x: 350
            y: 440
            width: 20
            height: 20
            color: "#ffffff"
            radius: 10
        }

        // Following graphic is for the left hand side

        Text {
            id: water_temp
            x: 200
            y: 380
            width: 140
            height: 40
            color: "#ffffff"
            text: "Water Temp"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Text {
            id: oil_temp
            x: 200
            y: 260
            width: 140
            height: 40
            color: "#ffffff"
            text: "Oil Temp"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Text {
            id: oil_pres
            x: 50
            y: 380
            width: 140
            height: 40
            color: "#ffffff"
            text: "Oil Pres"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Text {
            id: fuel_pres
            x: 50
            y: 260
            width: 140
            height: 40
            color: "#ffffff"
            text: "Fuel Pres"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Rectangle {
            color: (dd.displayData.limit[0] === true ? "blue" : "transparent")
            x: 200
            y: 320
            width: 120
            height: 60

            Text {
                id: water_temp_data
                color: "#ffffff"
                text: dd.displayData.grid[0].toFixed(1)
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        Rectangle {
            color: (dd.displayData.limit[1] === true ? "blue" : "transparent")
            x: 200
            y: 200
            width: 120
            height: 60

            Text {
                id: oil_temp_data
                color: "#ffffff"
                text: dd.displayData.grid[1].toFixed(1)
                wrapMode: Text.NoWrap
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        Rectangle {
            color: (dd.displayData.limit[2] === true ? "blue" : "transparent")
            x: 50
            y: 320
            width: 120
            height: 60

            Text {
                id: fuel_pres_data
                color: "#ffffff"
                text: dd.displayData.grid[2].toFixed(1)
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        Rectangle {
            color: (dd.displayData.limit[3] === true ? "blue" : "transparent")
            x: 50
            y: 200
            width: 120
            height: 60

            Text {
                id: oil_pres_data
                color: "#ffffff"
                text: dd.displayData.grid[3].toFixed(1)
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        // Following graphic is for the right hand side

        Text {
            id: throttle_pos
            x: 650
            y: 380
            width: 140
            height: 40
            color: "#ffffff"
            text: "Throttle"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Text {
            id: battery_voltage
            x: 650
            y: 260
            width: 140
            height: 40
            color: "#ffffff"
            text: "Battery"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Text {
            id: brake_front
            x: 500
            y: 260
            width: 140
            height: 40
            color: "#ffffff"
            text: "Brake Front"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Text {
            id: brake_rear
            x: 500
            y: 380
            width: 140
            height: 40
            color: "#ffffff"
            text: "Brake Rear"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Rectangle {
            color: (dd.displayData.limit[4] === true ? "blue" : "transparent")
            x: 650
            y: 320
            width: 120
            height: 60

            Text {
                id: throttle_pos_data
                color: "#ffffff"
                text: (dd.displayData.grid[4] === 100 ? dd.displayData.grid[4].toFixed(0) : dd.displayData.grid[4].toFixed(1))
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        Rectangle {
            color: (dd.displayData.limit[5] === true ? "blue" : "transparent")
            x: 650
            y: 200
            width: 120
            height: 60

            Text {
                id: battery_voltage_data
                color: "#ffffff"
                text: dd.displayData.grid[5].toFixed(1)
                wrapMode: Text.NoWrap
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        Rectangle {
            color: (dd.displayData.limit[6] === true ? "blue" : "transparent")
            x: 500
            y: 200
            width: 120
            height: 60

            Text {
                id: brake_front_data
                color: "#ffffff"
                text: dd.displayData.grid[6].toFixed(1)
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        Rectangle {
            color: (dd.displayData.limit[7] === true ? "blue" : "transparent")
            x: 500
            y: 320
            width: 120
            height: 60

            Text {
                id: brake_rear_data
                color: "#ffffff"
                text: dd.displayData.grid[7].toFixed(1)
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        /* Rev count */

        Text {
            id: rev_count
            x: 50
            y: 100
            width: 100
            height: 40
            color: "#ffffff"
            text: "RPM"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Rectangle {
            color: (dd.displayData.limit[8] === true ? "blue" : "transparent")
            x: 50
            y: 50
            width: 120
            height: 60

            Text {
                id: rev_count_data
                color: "#ffffff"
                text: dd.displayData.grid[8].toFixed(0)
                wrapMode: Text.NoWrap
                elide: Text.ElideRight
                font.pixelSize: 50
            }
        }
    }

    // Display 2
    Item {
        id: display2
        x: 0
        y: 0
        width: 800
        height: 480
        visible: (dd.displayData.page === 1)

        // Bottom Circle Highlight
        Rectangle {
            id: screen2_check
            x: 390
            y: 440
            width: 20
            height: 20
            color: "#ffffff"
            radius: 10
        }

        // Following graphic is for the left hand side

        Text {
            id: water_temp_2
            x: 200
            y: 380
            width: 140
            height: 40
            color: "#ffffff"
            text: "Water Temp"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Text {
            id: oil_temp_2
            x: 200
            y: 260
            width: 140
            height: 40
            color: "#ffffff"
            text: "Oil Temp"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Text {
            id: aab
            x: 50
            y: 380
            width: 140
            height: 40
            color: "#ffffff"
            text: "AAB"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Text {
            id: arb
            x: 50
            y: 260
            width: 140
            height: 40
            color: "#ffffff"
            text: "ARB"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Rectangle {
            color: (dd.displayData.limit[0] === true ? "red" : "transparent")
            x: 200
            y: 320
            width: 120
            height: 60

            Text {
                id: water_temp_data_2
                color: "#ffffff"
                text: dd.displayData.grid[0].toFixed(1)
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        Rectangle {
            color: (dd.displayData.limit[1] === true ? "red" : "transparent")
            x: 200
            y: 200
            width: 120
            height: 60

            Text {
                id: oil_temp_data_2
                color: "#ffffff"
                text: dd.displayData.grid[1].toFixed(1)
                wrapMode: Text.NoWrap
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        Rectangle {
            color: (dd.displayData.limit[2] === true ? "red" : "transparent")
            x: 50
            y: 330
            width: 120
            height: 60

            Text {
                id: aab_data
                color: "#ffffff"
                text: (dd.displayData.grid[2] === 0 ? "Off" : "On")
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                elide: Text.ElideRight
                font.pixelSize: 50
            }
        }

        Rectangle {
            color: (dd.displayData.limit[3] === true ? "red" : "transparent")
            x: 50
            y: 210
            width: 120
            height: 60

            Image {
                id: arb_logo
                width: 50
                height: 50
                source: (dd.displayData.grid[3] === 0 ? "img/arb_inactive.png" : "img/arb.png")
                fillMode: Image.PreserveAspectFit
            }
        }

        // Following graphic is for the right hand side

        Text {
            id: throttle_pos_2
            x: 650
            y: 380
            width: 140
            height: 40
            color: "#ffffff"
            text: "Throttle"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Text {
            id: battery_voltage_2
            x: 650
            y: 260
            width: 140
            height: 40
            color: "#ffffff"
            text: "Battery"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Text {
            id: brake_front_percent
            x: 500
            y: 260
            width: 140
            height: 40
            color: "#ffffff"
            text: "Brake F %"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Text {
            id: traction_control
            x: 500
            y: 380
            width: 140
            height: 40
            color: "#ffffff"
            text: "Trac Cont"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Rectangle {
            color: (dd.displayData.limit[4] === true ? "red" : "transparent")
            x: 650
            y: 320
            width: 120
            height: 60

            Text {
                id: throttle_pos_data_2
                color: "#ffffff"
                text: (dd.displayData.grid[4] === 100 ? dd.displayData.grid[4].toFixed(0) : dd.displayData.grid[4].toFixed(1))
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        Rectangle {
            color: (dd.displayData.limit[5] === true ? "red" : "transparent")
            x: 650
            y: 200
            width: 120
            height: 60

            Text {
                id: battery_voltage_data_2
                color: "#ffffff"
                text: dd.displayData.grid[5].toFixed(1)
                wrapMode: Text.NoWrap
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        Rectangle {
            color: (dd.displayData.limit[6] === true ? "red" : "transparent")
            x: 500
            y: 200
            width: 120
            height: 60

            Text {
                id: brake_front_percent_data
                color: "#ffffff"
                text: dd.displayData.grid[6].toFixed(1)
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        Rectangle {
            color: (dd.displayData.limit[7] === true ? "red" : "transparent")
            x: 500
            y: 320
            width: 120
            height: 60

            Text {
                id: traction_control_data
                color: "#ffffff"
                text: dd.displayData.grid[7].toFixed(0)
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                elide: Text.ElideRight
                font.pixelSize: 60
            }
        }

        /* Rev count */

        Text {
            id: rev_count_2
            x: 50
            y: 100
            width: 100
            height: 40
            color: "#ffffff"
            text: "RPM"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 20
        }

        Rectangle {
            color: (dd.displayData.limit[8] === true ? "blue" : "transparent")
            x: 50
            y: 50
            width: 120
            height: 60

            Text {
                id: rev_count_data_2
                color: "#ffffff"
                text: dd.displayData.grid[8].toFixed(0)
                wrapMode: Text.NoWrap
                elide: Text.ElideRight
                font.pixelSize: 50
            }
        }
    }
}
