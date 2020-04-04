import Felgo 3.0
import QtQuick 2.0
import "pages"
import "model"
import "logic"

App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    readonly property real contentPadding: Theme.navigationBar.defaultBarItemPadding

    Logic {
        id: logic
    }

    DataModel {
        id: dataModel
        dispatcher: logic
    }

    Navigation {
        id: navigation

        NavigationItem {
            title: qsTr("Recentes")
            icon: IconType.clocko

            NavigationStack {

                initialPage: RecentPage {

                }

            }
        }

        NavigationItem {
            title: qsTr("Camera")
            icon: IconType.camera

            NavigationStack {
                initialPage: CameraPage { }
            }
        }

        NavigationItem {
            title: qsTr("Perfil")
            icon: IconType.user

            NavigationStack {

                initialPage: ProfilePage {

                    onLogoutClicked: {
                        logic.logout();

                        navigation.currentIndex = 0
                        navigation.currentNavigationItem.navigationStack.popAllExceptFirst()
                    }
                }

            }
        }
    }

    LoginPage {
        z: 1 // show login above actual app pages
        visible: opacity > 0
        enabled: visible
        opacity: dataModel.userLoggedIn ? 0 : 1 // hide if user is logged in

        Behavior on opacity { NumberAnimation { duration: 350 } } // page fade in/out
    }
}
