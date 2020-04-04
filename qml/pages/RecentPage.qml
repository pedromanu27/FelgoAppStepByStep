import QtQuick 2.0
import Felgo 3.0

ListPage {

    title: qsTr("Recentes")

    Component {
        id: detailPageComponent
        RecentDetailPage { }
    }

    // list model for json data
    JsonListModel {
        id: recentModel
        source: dataModel.recentData
        keyField: "id"
    }

    model: recentModel
    delegate: AppCard {
            id: card
            width: parent.width
            margin: contentPadding
            paper.radius: dp(5)

            header: SimpleRow {
                imageSource: "https://cdn.pixabay.com/photo/2016/06/24/10/47/architecture-1477041_960_720.jpg"
                text: model.artist
                detailText: model.label

                enabled: true
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
                    text: qsTr("Detalhes")
                    flat: true
                    onClicked: navigationStack.popAllExceptFirstAndPush(detailPageComponent, { model: model })
                }
            }
        }

        //onSelected: navigationStack.popAllExceptFirstAndPush(detailPageComponent, { model: model })


}
