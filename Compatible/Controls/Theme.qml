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

pragma Singleton

import QtQuick 2.4
import LingmoUI.CompatibleModule as LingmoUI

QtObject {
    id: theme

    property real devicePixelRatio: LingmoUI.ThemeManager.devicePixelRatio

    property bool darkMode: LingmoUI.ThemeManager.darkMode

    property color blueColor: LingmoUI.ThemeManager.blueColor
    property color redColor: LingmoUI.ThemeManager.redColor
    property color greenColor: LingmoUI.ThemeManager.greenColor
    property color purpleColor: LingmoUI.ThemeManager.purpleColor
    property color pinkColor: LingmoUI.ThemeManager.pinkColor
    property color orangeColor: LingmoUI.ThemeManager.orangeColor
    property color greyColor: LingmoUI.ThemeManager.greyColor

    property color backgroundColor: darkMode ? "#1C1C1D" : "#F3F4F9"
    property color secondBackgroundColor: darkMode ? "#2C2C2D" : "#FFFFFF"
    property color alternateBackgroundColor: darkMode ? "#3C3C3D" : "#F2F4F5"

    property color textColor: darkMode ? "#FFFFFF" : "#323238"
    property color disabledTextColor: darkMode ? "#888888" : "#64646E"

    property color highlightColor: LingmoUI.ThemeManager.accentColor
    property color highlightedTextColor: darkMode ? "#FFFFFF" : "#FFFFFF"

    property color activeTextColor: "#0176D3"
    property color activeBackgroundColor: "#0176D3"

    property color linkColor: "#2196F3"
    property color linkBackgroundColor: "#2196F3"
    property color visitedLinkColor: "#2196F3"
    property color visitedLinkBackgroundColor: "#2196F3"

    property real fontSize: LingmoUI.ThemeManager.fontSize
    property string fontFamily: LingmoUI.ThemeManager.fontFamily

    property real smallRadius: 8.0
    property real mediumRadius: 10.0
    property real bigRadius: 12.0
    property real hugeRadius: 14.0
    property real windowRadius: 11.0

    property var renderType: Text.QtRendering

    property font defaultFont: fontMetrics.font
    property font smallFont: {
        let font = fontMetrics.font
        if (!!font.pixelSize) {
            font.pixelSize =- 2
        } else {
            font.pointSize =- 2
        }
        return font
    }

    property list<QtObject> children: [
        TextMetrics {
            id: fontMetrics
        }
    ]
}
