import QtQuick 2.0
import Felgo 3.0

Item {
    property alias dispatcher: logicConnection.target
    readonly property bool  userLoggedIn: _.userLoggedIn

    // property with json data
    property var recentData: [
        {
            "id": 1,
            "artist": "Pedro",
            "label": "Entry 1"
        },
        {
            "id": 2,
            "artist": "Keyla",
            "label": "Entry 2"
        },
        {
            "id": 3,
            "artist": "Emanuelle",
            "label": "Entry 3"
        },

    ]

    Connections {
        id: logicConnection

        onLogin: _.userLoggedIn = true
        onLogout: _.userLoggedIn = false
    }

    Item {
        id: _
        property bool  userLoggedIn: false

    }

}
