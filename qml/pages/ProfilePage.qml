import QtQuick 2.0
import Felgo 3.0

Page {

    title: qsTr("Perfil")

    signal logoutClicked

    AppButton {
        anchors.centerIn: parent
        text: qsTr("Logout")
        onClicked: {
            console.debug("Logout ...")
            logoutClicked()
        }
    }

}
