package {

    import flash.display.Sprite;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.ContextMenuEvent;
    import flash.text.TextField;
    import flash.ui.*;
    import flash.utils.getDefinitionByName;
    class LzMouseKernel {
static function handleMouseEvent ($0:*, $1:String):void {
if (LzSprite.quirks.ignorespuriousff36events) {
if ($1 == "onclick") {
__ignoreoutover = true
} else if (__ignoreoutover) {
if ($1 == "onmouseout") {
return
} else if ($1 == "onmouseover") {
__ignoreoutover = false;
return
}}};
if (__callback) __scope[__callback]($1, $0)
}static function createdContextMenu ($0:ContextMenu):void {
$0.addEventListener(ContextMenuEvent.MENU_SELECT, __menuSelectHandler)
}static function __menuSelectHandler ($0:ContextMenuEvent):void {
if (LzSprite.quirks.ignoreextramenuevents) {
__inContextMenu = 2
}}static var __ignoreoutover:Boolean = false;static var __callback:String = null;static var __scope:* = null;static var __lastMouseDown:LzSprite = null;static var __mouseLeft:Boolean = false;static var __listeneradded:Boolean = false;static var __inContextMenu:int = 0;static var __prevStageX:int = -1;static var __prevStageY:int = -1;static var __lastStageX:int = -1;static var __lastStageY:int = -1;static var showhandcursor:Boolean = true;static function setCallback ($0:*, $1:String):void {
__scope = $0;
__callback = $1;
if (__listeneradded == false) {
LFCApplication.stage.addEventListener(MouseEvent.MOUSE_MOVE, __mouseHandler);
LFCApplication.stage.addEventListener(MouseEvent.MOUSE_UP, __mouseHandler);
LFCApplication.stage.addEventListener(MouseEvent.MOUSE_DOWN, __mouseHandler);
LFCApplication.stage.addEventListener(Event.MOUSE_LEAVE, __mouseLeaveHandler);
__listeneradded = true
}}static function nearXY ($0:int, $1:int, $2:int, $3:int) {
return $0 < 0 && $1 < 0 || Math.abs($0 - $2) < 50 && Math.abs($1 - $3) < 50
}static function ignoreMouseEvent ($0:String, $1:MouseEvent):Boolean {
var $2:Boolean = false;
if ($0 == "onmousemove") {
$2 = nearXY(__lastStageX, __lastStageY, $1.stageX, $1.stageY)
} else if ($0 == "onmouseover") {
$2 = nearXY(__prevStageX, __prevStageY, $1.stageX, $1.stageY)
} else {
return false
};
__prevStageX = __lastStageX;
__prevStageY = __lastStageY;
__lastStageX = $1.stageX;
__lastStageY = $1.stageY;
return !$2
}static function __mouseHandler ($0:MouseEvent):void {
var $1:String = "on" + $0.type.toLowerCase();
if (__inContextMenu > 0) {
__inContextMenu--;
if ($1 == "onmousemove") {
return
}};
if (LzSprite.quirks.ignoreextramenuevents && ignoreMouseEvent($1, $0)) {
return
};
if ($1 == "onmouseup" && __lastMouseDown != null) {
__lastMouseDown.__globalmouseup($0);
__lastMouseDown = null
} else {
if (__mouseLeft) {
__mouseLeft = false;
if ($0.buttonDown) __mouseUpOutsideHandler();
if (LzSprite.quirks.fixtextselection) {
LFCApplication.stage.focus = null
};
handleMouseEvent(null, "onmouseenter")
};
handleMouseEvent(null, $1)
}}static function __mouseUpOutsideHandler ():void {
if (__lastMouseDown != null) {
var $0:MouseEvent = new MouseEvent("mouseup");
__lastMouseDown.__globalmouseup($0);
__lastMouseDown = null
}}static function __mouseLeaveHandler ($0:Event = null):void {
if (__inContextMenu > 0) {
__inContextMenu = 0;
__lastStageX = -1;
__lastStageY = -1;
__prevStageX = -1;
__prevStageY = -1;
return
};
__mouseLeft = true;
handleMouseEvent(null, "onmouseleave")
}static function showHandCursor ($0:Boolean):void {
showhandcursor = $0;
LzSprite.rootSprite.setGlobalHandCursor($0)
}static var __amLocked:Boolean = false;static var useBuiltinCursor:Boolean = false;static var cursorSprite:Sprite = null;static var cursorOffsetX:int = 0;static var cursorOffsetY:int = 0;static var globalCursorResource:String = null;static var lastCursorResource:String = null;
        private static var __MouseCursor:Object = null;
        private static function get MouseCursor () :Object {
            if (__MouseCursor == null) {
                __MouseCursor = getDefinitionByName('flash.ui.MouseCursor');
            }
            return __MouseCursor;
        }

        private static var __builtinCursors:Object = null;
        static function get builtinCursors () :Object {
            if (__builtinCursors == null) {
                var cursors:Object = {};
                if ($as3) {
                    cursors[MouseCursor.ARROW] = true;
                    cursors[MouseCursor.AUTO] = true;
                    cursors[MouseCursor.BUTTON] = true;
                    cursors[MouseCursor.HAND] = true;
                    cursors[MouseCursor.IBEAM] = true;
                }
                __builtinCursors = cursors;
            }
            return __builtinCursors;
        }

        static function get hasGlobalCursor () :Boolean {
            var gcursor:String = globalCursorResource;
            if ($as3) {
                return ! (gcursor == null || (gcursor == MouseCursor.AUTO && useBuiltinCursor));
            } else {
                return ! (gcursor == null);
            }
        }
    ;static function setCursorGlobal ($0:String):void {
globalCursorResource = $0;
setCursorLocal($0)
}static function setCursorLocal ($0:String):void {
if (__amLocked) {
return
};
if ($0 == null) {
return
} else if (lastCursorResource != $0) {
var $1:DisplayObject = getCursorResource($0);
if ($1 != null) {
if (cursorSprite.numChildren > 0) {
cursorSprite.removeChildAt(0)
};
cursorSprite.addChild($1);
useBuiltinCursor = false
} else if (builtinCursors[$0] != null) {
useBuiltinCursor = true
} else {
return
};
lastCursorResource = $0
};
if (useBuiltinCursor) {
Mouse["cursor"] = $0;
cursorSprite.stopDrag();
cursorSprite.visible = false;
LFCApplication.stage.removeEventListener(Event.MOUSE_LEAVE, mouseLeaveHandler);
LFCApplication.stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
Mouse.show()
} else {
Mouse["cursor"] = MouseCursor.AUTO;
Mouse.hide();
cursorSprite.x = LFCApplication.stage.mouseX + cursorOffsetX;
cursorSprite.y = LFCApplication.stage.mouseY + cursorOffsetY;
LFCApplication.setChildIndex(cursorSprite, LFCApplication._sprite.numChildren - 1);
cursorSprite.startDrag();
LFCApplication.stage.addEventListener(Event.MOUSE_LEAVE, mouseLeaveHandler);
LFCApplication.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
cursorSprite.visible = true
}}private static function mouseLeaveHandler ($0:Event):void {
cursorSprite.visible = false;
Mouse.show();
LFCApplication.stage.addEventListener(MouseEvent.MOUSE_OVER, mouseEnterHandler, true)
}private static function mouseEnterHandler ($0:Event):void {
cursorSprite.visible = true;
Mouse.hide();
LFCApplication.stage.removeEventListener(MouseEvent.MOUSE_OVER, mouseEnterHandler, true)
}private static function mouseMoveHandler ($0:MouseEvent):void {
var $1:Object = $0.target;
if ($1 is TextField && $1.selectable) {
cursorSprite.visible = false;
Mouse.show()
} else {
Mouse.hide();
cursorSprite.visible = true
}}private static function getCursorResource ($0:String):DisplayObject {
var $1:Object = LzResourceLibrary[$0];
var $2:Class;
if ($1 == null) {
return null
};
if ($1.assetclass is Class) {
$2 = $1.assetclass
} else {
var $3:Array = $1.frames;
$2 = $3[0]
};
var $4:DisplayObject = new $2();
$4.scaleX = 1;
$4.scaleY = 1;
if ($1["offsetx"] != null) {
cursorOffsetX = $1["offsetx"]
} else {
cursorOffsetX = 0
};
if ($1["offsety"] != null) {
cursorOffsetY = $1["offsety"]
} else {
cursorOffsetY = 0
};
return $4
}static function restoreCursor ():void {
if (__amLocked) {
return
};
cursorSprite.stopDrag();
cursorSprite.visible = false;
LFCApplication.stage.removeEventListener(Event.MOUSE_LEAVE, mouseLeaveHandler);
LFCApplication.stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
globalCursorResource = null;
Mouse["cursor"] = MouseCursor.AUTO;
Mouse.show()
}static function restoreCursorLocal ():void {
if (__amLocked) {
return
};
if (globalCursorResource == null) {
restoreCursor()
} else {
setCursorLocal(globalCursorResource)
}}static function lock ():void {
__amLocked = true
}static function unlock ():void {
__amLocked = false;
restoreCursor()
}static function initCursor ():void {
cursorSprite = new Sprite();
cursorSprite.mouseChildren = false;
cursorSprite.mouseEnabled = false;
cursorSprite.visible = false;
LFCApplication.addChild(cursorSprite);
cursorSprite.x = -10000;
cursorSprite.y = -10000
}}
}
