import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Window
import LingmoUI

LingmoButton {
    id: control
    default property alias contentData: menu.contentData
    rightPadding:35
    verticalPadding: 0
    horizontalPadding:12
    LingmoIcon{
        id: icon
        iconSource: LingmoIcons.ChevronDown
        iconSize: 15
        anchors{
            right: parent.right
            rightMargin: 10
            verticalCenter: parent.verticalCenter
        }
        iconColor:control.textColor
    }
    Item{
        id: d
        property var window: Window.window
    }
    onClicked: {
        if(menu.count !==0){
            var pos = control.mapToItem(null, 0, 0)
            var containerHeight = menu.count*36
            if(d.window.height>pos.y+control.height+containerHeight){
                menu.y = control.height
            }else if(pos.y>containerHeight){
                menu.y = -containerHeight
            }else{
                menu.y = d.window.height-(pos.y+containerHeight)
            }
            menu.open()
        }
    }
    LingmoMenu{
        id:menu
        modal:true
        width: control.width
        onAboutToHide: {
            icon.iconSource = LingmoIcons.ChevronDown
        }
        onAboutToShow: {
            icon.iconSource = LingmoIcons.ChevronUp
        }
    }
}
