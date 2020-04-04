import QtQuick 2.0
import Felgo 3.0

Page {
    title: qsTr("Camera")

    Column {
        id: columnContent
        y: contentPadding
        anchors.fill: parent
        anchors.margins: contentPadding
        spacing: contentPadding

        AppImage {
            id: image
            width: columnContent.width
            autoTransform: true
            fillMode: Image.PreserveAspectFit
        }

        Row {
            AppText {
                text: qsTr("Artista:")
            }
        }


        Row {
            id: rowIcons
            anchors.centerIn: parent
            IconButton {
                icon: IconType.save
            }
            IconButton {
                icon: IconType.trash
            }
        }
        AppButton {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rowIcons.bottom
            text: qsTr("Camera")
            icon: IconType.camera
            onClicked: nativeUtils.displayCameraPicker("test")
        }

    }

    Connections {
        target: nativeUtils
        onCameraPickerFinished: {
            if (accepted) image.source = path
        }
    }

}
