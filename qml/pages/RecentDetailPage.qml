import QtQuick 2.0
import Felgo 3.0

FlickablePage {

    title: qsTr("Detalhes da Arte")

    property var model: ({})

    clip: true // recorte o conteudo atrás da barra de navegação ao rolar

    flickable.contentWidth: parent.width
    flickable.contentHeight: contentCol.height + contentPadding
    flickable.bottomMargin: contentPadding

    Column {
        id: contentCol
        y: contentPadding
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: contentPadding
        spacing: contentPadding

        AppCard {
            id: card
            width: parent.width
            margin: contentPadding
            paper.radius: dp(5)

            header: SimpleRow {
                imageSource: "https://cdn.pixabay.com/photo/2016/06/24/10/47/architecture-1477041_960_720.jpg"
                text: model.artist
                detailText: model.label

                enabled: false
                image.radius: image.width/2
                image.fillMode: Image.PreserveAspectCrop
                style: StyleSimpleRow {
                    showDisclosure: false
                    backgroundColor: "transparent"
                }
            }

            // Para a celula de media usamos um AppImage Simple
            media: AppImage {
                width: parent.width
                fillMode: Image.PreserveAspectFit
                source: "https://cdn.pixabay.com/photo/2016/06/24/10/47/architecture-1477041_960_720.jpg"
            }

            // Para a celula de conteudo
            /*content: AppText {
                width: parent.width
                padding: contentPadding
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
            }*/

            // Alguns botões na celula de ações
            actions: Row {
                IconButton {
                    icon: IconType.thumbsup
                }
                IconButton {
                    icon: IconType.sharealt
                }
                AppButton {
                    text: qsTr("Seguir")
                    flat: true
                }
            }
        }
    }

}
