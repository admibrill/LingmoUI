/****************************************************************************
**
** Copyright (C) 2020 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Graphical Effects module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.12
import LingmoUI.GraphicalEffects

/*!
    \qmltype LinearGradient
    \inqmlmodule QtGraphicalEffects
    \since QtGraphicalEffects 1.0
    \inherits QtQuick2::Item
    \ingroup qtgraphicaleffects-gradient
    \brief Draws a linear gradient.

    A gradient is defined by two or more colors, which are blended seamlessly.
    The colors start from the given start point and end to the given end point.

    \table
    \header
        \li Effect applied
    \row
        \li \image LinearGradient.png
    \endtable

    \section1 Example

    The following example shows how to apply the effect.
    \snippet LinearGradient-example.qml example

*/
Item {
    id: rootItem

    /*!
        This property defines the starting point where the color at gradient
        position of 0.0 is rendered. Colors at larger position values are
        rendered linearly towards the end point. The point is given in pixels
        and the default value is Qt.point(0, 0). Setting the default values for
        the start and \l{LinearGradient::end}{end} results in a full height
        linear gradient on the y-axis.

        \table
        \header
        \li Output examples with different start values
        \li
        \li
        \row
            \li \image LinearGradient_start1.png
            \li \image LinearGradient_start2.png
            \li \image LinearGradient_start3.png
        \row
            \li \b { start: QPoint(0, 0) }
            \li \b { start: QPoint(150, 150) }
            \li \b { start: QPoint(300, 0) }
        \row
            \li \l end: QPoint(300, 300)
            \li \l end: QPoint(300, 300)
            \li \l end: QPoint(300, 300)
        \endtable

    */
    property variant start: Qt.point(0, 0)

    /*!
        This property defines the ending point where the color at gradient
        position of 1.0 is rendered. Colors at smaller position values are
        rendered linearly towards the start point. The point is given in pixels
        and the default value is Qt.point(0, height). Setting the default values
        for the \l{LinearGradient::start}{start} and end results in a full
        height linear gradient on the y-axis.

        \table
        \header
        \li Output examples with different end values
        \li
        \li
        \row
            \li \image LinearGradient_end1.png
            \li \image LinearGradient_end2.png
            \li \image LinearGradient_end3.png
        \row
            \li \b { end: Qt.point(300, 300) }
            \li \b { end: Qt.point(150, 150) }
            \li \b { end: Qt.point(300, 0) }
        \row
            \li \l start: Qt.point(0, 0)
            \li \l start: Qt.point(0, 0)
            \li \l start: Qt.point(0, 0)
        \endtable

    */
    property variant end: Qt.point(0, height)

    /*!
        This property allows the effect output pixels to be cached in order to
        improve the rendering performance.

        Every time the source or effect properties are changed, the pixels in
        the cache must be updated. Memory consumption is increased, because an
        extra buffer of memory is required for storing the effect output.

        It is recommended to disable the cache when the source or the effect
        properties are animated.

        By default, the property is set to \c false.
    */
    property bool cached: false

    /*!
        This property defines the item that is going to be filled with gradient.
        Source item gets rendered into an intermediate pixel buffer and the
        alpha values from the result are used to determine the gradient's pixels
        visibility in the display. The default value for source is undefined and
        in that case whole effect area is filled with gradient.

        \table
        \header
        \li Output examples with different source values
        \li
        \li
        \row
            \li \image LinearGradient_maskSource1.png
            \li \image LinearGradient_maskSource2.png
        \row
            \li \b { source: undefined }
            \li \b { source: Image { source: images/butterfly.png } }
        \row
            \li \l start: Qt.point(0, 0)
            \li \l start: Qt.point(0, 0)
        \row
            \li \l end: Qt.point(300, 300)
            \li \l end: Qt.point(300, 300)
        \endtable

        \note It is not supported to let the effect include itself, for
        instance by setting source to the effect's parent.
    */
    property variant source


    /*!
        A gradient is defined by two or more colors, which are blended
        seamlessly. The colors are specified as a set of GradientStop child
        items, each of which defines a position on the gradient from 0.0 to 1.0
        and a color. The position of each GradientStop is defined by the
        position property, and the color is definded by the color property.

        \table
        \header
        \li Output examples with different gradient values
        \li
        \li
        \row
            \li \image LinearGradient_gradient1.png
            \li \image LinearGradient_gradient2.png
            \li \image LinearGradient_gradient3.png
            \row
            \li \b {gradient:} \code
    Gradient {
      GradientStop {
         position: 0.000
         color: Qt.rgba(1, 0, 0, 1)
      }
      GradientStop {
         position: 0.167
         color: Qt.rgba(1, 1, 0, 1)
      }
      GradientStop {
         position: 0.333
         color: Qt.rgba(0, 1, 0, 1)
      }
      GradientStop {
         position: 0.500
         color: Qt.rgba(0, 1, 1, 1)
      }
      GradientStop {
         position: 0.667
         color: Qt.rgba(0, 0, 1, 1)
      }
      GradientStop {
         position: 0.833
         color: Qt.rgba(1, 0, 1, 1)
      }
      GradientStop {
         position: 1.000
         color: Qt.rgba(1, 0, 0, 1)
      }
    }
        \endcode
            \li \b {gradient:} \code
    Gradient {
      GradientStop {
        position: 0.0
        color: "#F0F0F0"
      }
      GradientStop {
        position: 0.5
        color: "#000000"
      }
      GradientStop {
        position: 1.0
        color: "#F0F0F0"
      }
    }
        \endcode
            \li \b {gradient:} \code
    Gradient {
      GradientStop {
        position: 0.0
        color: "#00000000"
      }
      GradientStop {
        position: 1.0
        color: "#FF000000"
      }
    }
        \endcode
        \row
            \li \l start: Qt.point(0, 0)
            \li \l start: Qt.point(0, 0)
            \li \l start: Qt.point(0, 0)
        \row
            \li \l end: Qt.point(300, 300)
            \li \l end: Qt.point(300, 300)
            \li \l end: Qt.point(300, 300)
        \endtable

    */
    property Gradient gradient: Gradient {
        GradientStop { position: 0.0; color: "white" }
        GradientStop { position: 1.0; color: "black" }
    }

    SourceProxy {
        id: maskSourceProxy
        input: rootItem.source
    }

    ShaderEffectSource {
        id: gradientSource
        sourceItem: Rectangle {
            width: 16
            height: 256
            gradient: rootItem.gradient
            smooth: true
        }
        smooth: true
        hideSource: true
        visible: false
    }

   ShaderEffectSource {
        id: cacheItem
        anchors.fill: parent
        visible: rootItem.cached
        smooth: true
        sourceItem: shaderItem
        live: true
        hideSource: visible
    }

    ShaderEffect {
        id: shaderItem

        anchors.fill: parent

        property variant source: gradientSource
        property variant maskSource: maskSourceProxy.output
        property variant startPoint: Qt.point(start.x / width, start.y / height)
        property real dx: end.x - start.x
        property real dy: end.y - start.y
        property real l: 1.0 / Math.sqrt(Math.pow(dx / width, 2.0) + Math.pow(dy / height, 2.0))
        property real angle: Math.atan2(dx, dy)
        property variant matrixData: Qt.point(Math.sin(angle), Math.cos(angle))

        vertexShader: "qrc:/lingmoui/kit/GraphicalEffects/LingmoUI/GraphicalEffects/shaders_ng/lineargradient.vert.qsb"

        fragmentShader: maskSource == undefined ? noMaskShader : maskShader

        onFragmentShaderChanged: lChanged()

        property string maskShader: "qrc:/lingmoui/kit/GraphicalEffects/LingmoUI/GraphicalEffects/shaders_ng/lineargradient_mask.frag.qsb"
        property string noMaskShader: "qrc:/lingmoui/kit/GraphicalEffects/LingmoUI/GraphicalEffects/shaders_ng/lineargradient_nomask.frag.qsb"
    }
}
