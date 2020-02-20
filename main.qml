import QtQuick 2.11
import QtQuick.Window 2.11
import QtGraphicalEffects 1.0
import QtQuick.Particles 2.0


Window {
    visible: true
    width: 1024
    height: 480
    title: qsTr("Hello World")
    id: mainWindow
    LinearGradient{
        anchors.fill: parent
        start: Qt.point(parent.width,0)
        end: Qt.point(parent.width / 4 , parent.height)
        gradient: Gradient {

            GradientStop { position: 0.0; color: "#010A26" }
            GradientStop { position: 0.6; color:"#031740" }
            GradientStop { position: 1; color:"#3D3870" }
        }

    }

    Item {
        property int animationDuration: 3000
        property int animationEasing: Easing.OutExpo
        property var animationCurves: [0,0, 0.5,1, 1, 1]
        id: viewport
        x: (mainWindow.width - width) / 2
        y: mainWindow.height - 200
        width: mainWindow.width - 200
        height: 100
        clip: true


        Rectangle {
            x: 50
            y: parent.height -  height / 2
            height: 50
            width: 50
            radius: 20
            id: spRect

            SequentialAnimation on x {
                loops: Animation.Infinite
                NumberAnimation {
                    to: viewport.width - 100
                    duration: viewport.animationDuration
                    easing.type: viewport.animationDuration

                }

                NumberAnimation {
                    to: 0
                    duration: viewport.animationDuration
                    easing.type: viewport.animationEasing
                }

            }


            SequentialAnimation on rotation {
                loops: Animation.Infinite
                RotationAnimation  {
                    to: 360
                    duration: viewport.animationDuration
                    easing.type: viewport.animationEasing
                    easing.period: viewport.animationDuration / 2

                }

                RotationAnimation  {
                    to: 0
                    duration: viewport.animationDuration
                    easing.type: viewport.animationEasing
                    easing.period: viewport.animationDuration / 2
                }
            }

            SequentialAnimation on width {
                loops: Animation.Infinite
                NumberAnimation {
                    to: 100
                    duration: viewport.animationDuration
                    easing.type: viewport.animationEasing
                    easing.period: viewport.animationDuration / 2
                }

                NumberAnimation {
                    to: 50
                    duration: viewport.animationDuration
                    easing.type: viewport.animationEasing
                    easing.period: viewport.animationDuration / 2
                }
            }


           SequentialAnimation on height {
               loops: Animation.Infinite
               NumberAnimation {
                   to: 100
                   duration: viewport.animationDuration
                   easing.type: viewport.animationEasing
                   easing.period: viewport.animationDuration / 2
               }

               NumberAnimation {
                   to: 50
                   duration: viewport.animationDuration
                   easing.type: viewport.animationEasing
                   easing.period: viewport.animationDuration / 2
               }
           }

        }


                Text {
                    x: parent.width - 90
                    y: parent.height - 30
                    text: "Loading ..."
                    color: "#010A26"
                    font.pixelSize: 16
                    font.bold: true
                }
    }

    Rectangle {
        x: (mainWindow.width - width) / 2
        y: mainWindow.height - 100
        width: mainWindow.width - 200
        height: 2
        color: "white"
    }

//    ParticleSystem {
//        anchors.fill: parent
//        id: syssy
//        //! [0]
//        ParticleGroup {
//            name: "fire"
//            duration: 2000
//            durationVariation: 2000
//            to: {"splode":1}
//        }
//        //! [0]
//        //! [1]
//        //        ParticleGroup {
//        //            name: "splode"
//        //            duration: 400
//        //            to: {"dead":1}
//        //            TrailEmitter {
//        //                group: "works"
//        //                emitRatePerParticle: 100
//        //                lifeSpan: 1000
//        //                maximumEmitted: 1200
//        //                size: 8
//        //                velocity: AngleDirection {angle: 270; angleVariation: 45; magnitude: 20; magnitudeVariation: 20;}
//        //                acceleration: PointDirection {y:100; yVariation: 20}
//        //            }
//        //        }
//        //! [1]
//        //! [2]
//        //        ParticleGroup {
//        //            name: "dead"
//        //            duration: 1000
//        //            Affector {
//        //                once: true
//        //                onAffected: worksEmitter.burst(400,x,y)
//        //            }
//        //        }
//        //! [2]

//        //        Timer {
//        //            interval: 6000
//        //            running: true
//        //            triggeredOnStart: true
//        //            repeat: true
//        //            onTriggered: startingEmitter.pulse(100);
//        //        }

//        Emitter {
//            id: startingEmitter
//            group: "fire"
//            width: parent.width
//            height: parent.height
//            y: 0
//            enabled: true
//            emitRate: 80
//            //            lifeSpan: 6000
//            //            velocity: PointDirection {y:-100;}
//            size: 32
//        }

//        Emitter {
//            id: worksEmitter
//            group: "works"
//            enabled: false
//            emitRate: 100
//            lifeSpan: 1600
//            maximumEmitted: 6400
//            size: 8
//            velocity: CumulativeDirection {
//                PointDirection {y:-100}
//                AngleDirection {angleVariation: 360; magnitudeVariation: 80;}
//            }
//            acceleration: PointDirection {y:100; yVariation: 20}
//        }

//        ImageParticle {
//            groups: ["works", "fire", "splode"]
//            source: "qrc:///particleresources/glowdot.png"
//            entryEffect: ImageParticle.Scale
//        }
//        //        ItemParticle {
//        //            groups: ["fire"]
//        //            Rectangle {
//        //                width: 20
//        //                height: 20
//        //                color: "red"
//        //            }
//        //        }
//    }

//        Rectangle {
//            x: 100
//            y: 100
//            id: triBlock
//            width: 50; height: 50; color: Qt.rgba(1, 1, 1, 0.0)
//            border.color: Qt.rgba(1, 1, 1, 0.5)
//            border.width: 1

//        }

//        Image {
//            id: shImage
//            source: "qrc:///particleresources/glowdot.png"
//        }

//    ShaderEffect {
//                x: 100
//                y: 100
//                width: 50; height: 50
//                property variant source: shImage
//                property real frequency: 8
//                property real amplitude: 0.1
//                property real time: 0.0
//                NumberAnimation on time {
//                    from: 0; to: Math.PI*2; duration: 1000; loops: Animation.Infinite
//                }

//                fragmentShader: "
//                    varying highp vec2 qt_TexCoord0;
//                    uniform sampler2D source;
//                    uniform lowp float qt_Opacity;
//                    uniform highp float frequency;
//                    uniform highp float amplitude;
//                    uniform highp float time;
//                    void main() {
//                        highp vec2 pulse = sin(time - frequency * qt_TexCoord0);
//                        highp vec2 coord = qt_TexCoord0 + amplitude * vec2(pulse.x, -pulse.x);
//                        gl_FragColor = texture2D(source, coord) * qt_Opacity;
//                    }"
//            }



//    Path {

//        startX: 0;
//        startY: 100

//        PathLine { x: 200; y: 100 ;}

//    }

//    flags: Qt.FramelessWindowHint // Disable window frame

//    // Declare properties that will store the position of the mouse cursor
//    property int previousX
//    property int previousY

//    MouseArea {
//        id: topArea
//        height: 5
//        anchors {
//            top: parent.top
//            left: parent.left
//            right: parent.right
//        }
//        // We set the shape of the cursor so that it is clear that this resizing
//        cursorShape: Qt.SizeVerCursor

//        onPressed: {
//            // We memorize the position along the Y axis
//            previousY = mouseY
//        }

//        // When changing a position, we recalculate the position of the window, and its height
//        onMouseYChanged: {
//            var dy = mouseY - previousY
//            mainWindow.setY(mainWindow.y + dy)
//            mainWindow.setHeight(mainWindow.height - dy)
//        }
//    }

//    // Similar calculations for the remaining three areas of resize
//    MouseArea {
//        id: bottomArea
//        height: 5
//        anchors {
//            bottom: parent.bottom
//            left: parent.left
//            right: parent.right
//        }
//        cursorShape: Qt.SizeVerCursor

//        onPressed: {
//            previousY = mouseY
//        }

//        onMouseYChanged: {
//            var dy = mouseY - previousY
//            mainWindow.setHeight(mainWindow.height + dy)
//        }
//    }

//    MouseArea {
//        id: leftArea
//        width: 5
//        anchors {
//            top: topArea.bottom
//            bottom: bottomArea.top
//            left: parent.left
//        }
//        cursorShape: Qt.SizeHorCursor

//        onPressed: {
//            previousX = mouseX
//        }

//        onMouseXChanged: {
//            var dx = mouseX - previousX
//            mainWindow.setX(mainWindow.x + dx)
//            mainWindow.setWidth(mainWindow.width - dx)
//        }
//    }

//    MouseArea {
//        id: rightArea
//        width: 5
//        anchors {
//            top: topArea.bottom
//            bottom: bottomArea.top
//            right: parent.right
//        }
//        cursorShape:  Qt.SizeHorCursor

//        onPressed: {
//            previousX = mouseX
//        }

//        onMouseXChanged: {
//            var dx = mouseX - previousX
//            mainWindow.setWidth(mainWindow.width + dx)
//        }
//    }

//    // The central area for moving the application window
//    // Here you already need to use the position both along the X axis and the Y axis
//    MouseArea {
//        anchors {
//            top: topArea.bottom
//            bottom: bottomArea.top
//            left: leftArea.right
//            right: rightArea.left
//        }

//        onPressed: {
//            previousX = mouseX
//            previousY = mouseY
//        }

//        onMouseXChanged: {
//            var dx = mouseX - previousX
//            mainWindow.setX(mainWindow.x + dx)
//        }

//        onMouseYChanged: {
//            var dy = mouseY - previousY
//            mainWindow.setY(mainWindow.y + dy)
//        }
//    }

}
