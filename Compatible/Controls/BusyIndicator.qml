/*
 * Copyright (C) 2021 LingmoOS Team.
 *
 * Author:     revenmartin <revenmartin@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
 
import QtQuick
import QtQuick.Controls
import LingmoUI.GraphicalEffects
import LingmoUI.CompatibleModule as LingmoUI

Image {
    id: control
    width: 22
    height: width
    source: "qrc:/lingmoui/kit/images/refresh.svg"
    sourceSize: Qt.size(width, height)
    visible: true

    property alias running: rotationAnimator.running

    ColorOverlay {
        anchors.fill: control
        source: control
        color: LingmoUI.Theme.textColor
        opacity: 1
        visible: true
    }

    RotationAnimator {
        id: rotationAnimator
        target: control
        running: control.visible
        from: 0
        to: 360
        loops: Animation.Infinite
        duration: 1000
    }
}
