/*********
*
* In the name of the Father, and of the Son, and of the Holy Spirit.
*
* This file is part of BibleTime's source code, https://bibletime.info/
*
* Copyright 1999-2026 by the BibleTime developers.
* The BibleTime source code is licensed under the GNU General Public License
* version 2.0.
*
**********/

import BibleTime 1.0
import QtQuick 2.2

Item {
    id: delegate
    property int spacing: 1.5 * BtQmlInterface.pixelsPerMM
    property int textWidth: (listView.width / listView.columns)
    property int vertSpace: 1 * BtQmlInterface.pixelsPerMM
    property bool updating: false
    required property int index
    property var texts: Array(BibleTimeConfig::maxColumns).fill("")
    property var titles: Array(BibleTimeConfig::maxColumns).fill("")

    function positionAt(x, y, column) {
        var columnViewItem = getColumnItem(column);
        return columnViewItem.positionAt(x - columnViewItem.x, y - columnViewItem.y);
    }

    function linkAt(x, y) {
        var textItem;
        var i;
        for (i = listView.columns; i >= 0; --i) {
            textItem = getColumnItem(i);
            if (x > textItem.x)
                break;
        }
        return textItem.linkAt(x - textItem.x, y - textItem.y);
    }

    function dragStart(index, active) {
        if (active) {
            BtQmlInterface.dragHandler(index);
        }
    }

    function selectSingle(column,posFirst1, posLast1) {
        var item = getColumnItem(column);
        item.select(posFirst1, posLast1);
    }

    function selectFirst(column, posFirst1) {
        var item = getColumnItem(column);
        item.select(posFirst1, item.length);
    }

    function selectLast(column, posLast1) {
        var item = getColumnItem(column);
        item.select(0, posLast1);
    }

    function selectAll(column) {
        var item = getColumnItem(column);
        item.selectAll();
    }

    function deselect(column) {
        var item = getColumnItem(column);
        item.deselect();
    }

    function getDelegateHeight() {
        var h = 30;
        var i;
        for (i = 0; i < listView.columns; ++i) {
            let columnItem = getColumnItem(i);
            if (columnItem) {
                h = Math.max(columnItem.minHeight(), h);
            }
        }
        return h + vertSpace;
    }

    function getColumnItem(column) {
        return [columnView0, columnView1, columnView2, columnView3,
                columnView4, columnView5, columnView6, columnView7,
                columnView8, columnView9][column];
    }

    width: listView.width
    height: getDelegateHeight()

    ColumnItem {
        id: columnView0
        property int column: 0
        property string displayText: texts[0]
        property string displayTitle: titles[0]
        anchors.top: delegate.top
        anchors.bottom: delegate.bottom
        anchors.left: delegate.left
        font: BtQmlInterface.getFonts()[0]
        width: delegate.textWidth
        onHovered: function(link) { BtQmlInterface.setHoveredLink(link) }
    }

    ColumnItem {
        id: columnView1
        property int column: 1
        property string displayText: texts[1]
        property string displayTitle: titles[1]
        anchors.top: delegate.top
        anchors.bottom: delegate.bottom
        anchors.left: columnView0.right
        font: BtQmlInterface.getFonts()[1]
        width: delegate.textWidth
        onHovered: function(link) { BtQmlInterface.setHoveredLink(link) }
    }

    ColumnItem {
        id: columnView2
        property int column: 2
        property string displayText: texts[2]
        property string displayTitle: titles[2]
        anchors.top: delegate.top
        anchors.bottom: delegate.bottom
        anchors.left: columnView1.right
        font: BtQmlInterface.getFonts()[2]
        width: delegate.textWidth
        onHovered: function(link) { BtQmlInterface.setHoveredLink(link) }
    }

    ColumnItem {
        id: columnView3
        property int column: 3
        property string displayText: texts[3]
        property string displayTitle: titles[3]
        anchors.top: delegate.top
        anchors.bottom: delegate.bottom
        anchors.left: columnView2.right
        font: BtQmlInterface.getFonts()[3]
        width: delegate.textWidth
        onHovered: function(link) { BtQmlInterface.setHoveredLink(link) }
    }

    ColumnItem {
        id: columnView4
        property int column: 4
        property string displayText: texts[4]
        property string displayTitle: titles[4]
        anchors.top: delegate.top
        anchors.bottom: delegate.bottom
        anchors.left: columnView3.right
        font: BtQmlInterface.getFonts()[4]
        width: delegate.textWidth
        onHovered: function(link) { BtQmlInterface.setHoveredLink(link) }
    }

    ColumnItem {
        id: columnView5
        property int column: 5
        property string displayText: texts[5]
        property string displayTitle: titles[5]
        anchors.top: delegate.top
        anchors.bottom: delegate.bottom
        anchors.left: columnView4.right
        font: BtQmlInterface.getFonts()[5]
        width: delegate.textWidth
        onHovered: function(link) { BtQmlInterface.setHoveredLink(link) }
    }

    ColumnItem {
        id: columnView6
        property int column: 6
        property string displayText: texts[6]
        property string displayTitle: titles[6]
        anchors.top: delegate.top
        anchors.bottom: delegate.bottom
        anchors.left: columnView5.right
        font: BtQmlInterface.getFonts()[6]
        width: delegate.textWidth
        onHovered: function(link) { BtQmlInterface.setHoveredLink(link) }
    }

    ColumnItem {
        id: columnView7
        property int column: 7
        property string displayText: texts[7]
        property string displayTitle: titles[7]
        anchors.top: delegate.top
        anchors.bottom: delegate.bottom
        anchors.left: columnView6.right
        font: BtQmlInterface.getFonts()[7]
        width: delegate.textWidth
        onHovered: function(link) { BtQmlInterface.setHoveredLink(link) }
    }

    ColumnItem {
        id: columnView8
        property int column: 8
        property string displayText: texts[8]
        property string displayTitle: titles[8]
        anchors.top: delegate.top
        anchors.bottom: delegate.bottom
        anchors.left: columnView7.right
        font: BtQmlInterface.getFonts()[8]
        width: delegate.textWidth
        onHovered: function(link) { BtQmlInterface.setHoveredLink(link) }
    }

    ColumnItem {
        id: columnView9
        property int column: 9
        property string displayText: texts[9]
        property string displayTitle: titles[9]
        anchors.top: delegate.top
        anchors.bottom: delegate.bottom
        anchors.left: columnView8.right
        font: BtQmlInterface.getFonts()[9]
        width: delegate.textWidth
        onHovered: function(link) { BtQmlInterface.setHoveredLink(link) }
    }
}
