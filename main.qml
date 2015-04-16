import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Particles 2.0

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    Rectangle {
        id: leftpaddle
        color: "red"
        width: 20
        height: 80
        anchors.left: parent.left
        y: parent.height/2 - height/2
    }

    Rectangle {
        id: rightpaddle
        color: "green"
        width: 20
        height: 80
        anchors.right: parent.right
        y: parent.height/2 - height/2
    }

    Item {
        focus: true
        Keys.onPressed: {
            if (event.key === Qt.Key_W) {
                leftpaddle.y = leftpaddle.y - 5
            }
            if (event.key === Qt.Key_S) {
                leftpaddle.y = leftpaddle.y + 5
            }
            if (event.key === Qt.Key_I) {
                rightpaddle.y = rightpaddle.y - 5
            }
            if (event.key === Qt.Key_K) {
                rightpaddle.y = rightpaddle.y + 5
            }
        }
    }

    ParticleSystem {
        id: ps
    }
    Gravity {
        system: ps
        magnitude: 32
        angle: 0
    }
    ItemParticle {
        system: ps
        delegate: Rectangle {
            width: 30
            height: width
            color: "pink"
            radius: width/2
        }
    }
    Emitter {
        system: ps
        emitRate: 1
        anchors.centerIn: parent
//        lifeSpan: Emitter.InfiniteLife
        lifeSpan: 10000
        size: 64
//        Component.onCompleted: {
//            burst(10);
//        }
    }
}
