import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.6
import QtQuick.Controls 2.4
import QtQuick.Controls.Styles 1.4

Item {

    property bool h_fone: true;
    property bool t_view: false;
    property bool b_view:false


    width: 300
    height: 300

    Image {
        id: image
        x: 0
        y: 0
        source: "fone.jpg"
        fillMode: Image.PreserveAspectFit
        visible: h_fone

        Button {
            id: button9
            x: 382
            y: 365
            width: 98
            height: 33
            text: qsTr("Закрыть")
            visible: b_view
            font.pointSize: 11
            onClicked:
            {
                b_view = false;
                t_view = false;
                button.visible = true
                button1.visible = true
                if(image_play.visible)
                {button2.visible = true;}
                button3.visible = true
                button4.visible = true

            }
        }


    }


    ListModel {
        id: dataModel

        ListElement {
            color: "Amelia"
            text: "6543"
        }
        ListElement {
            color: "Jessica"
            text: "3452"
        }
        ListElement {
            color: "Mia"
            text: "1234"
        }
        ListElement {
            color: "William"
            text: "800"
        }
    }

    TableView {
        id: tableview
        anchors.verticalCenterOffset: 132
        anchors.horizontalCenterOffset: 274
        visible: t_view
        anchors.margins: 10
        anchors.centerIn: parent
        model: dataModel
        clip: true

        TableViewColumn {
            width: 100
            title: "Имя"
            role: "color"
        }
        TableViewColumn {
            width: 100
            title: "Очки"
            role: "text"
        }

        itemDelegate: Item {
            Text {
                anchors.centerIn: parent
                renderType: Text.NativeRendering
                text: styleData.value
            }
        }
    }



}
