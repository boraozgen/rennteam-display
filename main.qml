import QtQuick 2.6
import QtQuick.Window 2.2
import CanDrv 1.0
import DisplayDrv 1.0

Window {
    id: window
    visible: true
    visibility: "FullScreen"
    width: 800
    height: 480
    color: "#000000"
    property alias window: window
    title: qsTr("Rennteam 11-14 Display")

    Timer {
        interval: 100; running: true; repeat: true
        onTriggered: cd.mockCanData()
    }

    CanDrv {
        id: cd
        onNewCanData: dd.setCanData(cd.canData)
    }

    DisplayDrv {
        id: dd
    }

    Text {
        id: grid1
        x: 50
        y: 250
        color: "#ffffff"
        text: dd.displayData.grid[0].toFixed(1)
        font.pixelSize: 50
    }

    Text {
        id: grid2
        x: 50
        y: 350
        color: "#ffffff"
        text: dd.displayData.grid[1].toFixed(1)
        font.pixelSize: 50
    }

    Text {
        id: grid3
        x: 200
        y: 250
        color: "#ffffff"
        text: dd.displayData.grid[2].toFixed(1)
        font.pixelSize: 50
    }

    Text {
        id: grid4
        x: 200
        y: 350
        color: "#ffffff"
        text: dd.displayData.grid[3].toFixed(1)
        font.pixelSize: 50
    }

    Text {
        id: grid5
        x: 500
        y: 250
        color: "#ffffff"
        text: dd.displayData.grid[4].toFixed(1)
        font.pixelSize: 50
    }

    Text {
        id: grid6
        x: 500
        y: 350
        color: "#ffffff"
        text: dd.displayData.grid[5].toFixed(1)
        font.pixelSize: 50
    }

    Text {
        id: grid7
        x: 650
        y: 250
        color: "#ffffff"
        text: dd.displayData.grid[6].toFixed(1)
        font.pixelSize: 50
    }

    Text {
        id: grid8
        x: 650
        y: 350
        color: "#ffffff"
        text: dd.displayData.grid[7].toFixed(1)
        font.pixelSize: 50
    }

    Text {
        id: grid_label1
        x: 50
        y: 312
        color: "#ffffff"
        text: dd.displayLabels.gridLabel[0]
        fontSizeMode: Text.HorizontalFit
        font.pixelSize: 16
    }

    Text {
        id: grid_label2
        x: 50
        y: 412
        color: "#ffffff"
        text: dd.displayLabels.gridLabel[1]
        fontSizeMode: Text.HorizontalFit
        font.pixelSize: 16
    }

    Text {
        id: grid_label3
        x: 200
        y: 312
        color: "#ffffff"
        text: dd.displayLabels.gridLabel[2]
        fontSizeMode: Text.HorizontalFit
        font.pixelSize: 16
    }

    Text {
        id: grid_label4
        x: 200
        y: 412
        color: "#ffffff"
        text: dd.displayLabels.gridLabel[3]
        fontSizeMode: Text.HorizontalFit
        font.pixelSize: 16
    }

    Text {
        id: grid_label5
        x: 500
        y: 312
        color: "#ffffff"
        text: dd.displayLabels.gridLabel[4]
        fontSizeMode: Text.HorizontalFit
        font.pixelSize: 16
    }

    Text {
        id: grid_label6
        x: 500
        y: 412
        color: "#ffffff"
        text: dd.displayLabels.gridLabel[5]
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        renderType: Text.QtRendering
        fontSizeMode: Text.FixedSize
        font.pixelSize: 16
    }

    Text {
        id: grid_label7
        x: 650
        y: 312
        color: "#ffffff"
        text: dd.displayLabels.gridLabel[6]
        fontSizeMode: Text.HorizontalFit
        font.pixelSize: 16
    }

    Text {
        id: grid_label8
        x: 650
        y: 412
        color: "#ffffff"
        text: dd.displayLabels.gridLabel[7]
        fontSizeMode: Text.HorizontalFit
        font.pixelSize: 16
    }

    Text {
        id: gear
        x: 320
        y: 220
        color: "#ffffff"
        width: 160
        height: 224
        text: dd.displayData.gear
        wrapMode: Text.NoWrap
        clip: false
        font.pixelSize: 200
    }
}
