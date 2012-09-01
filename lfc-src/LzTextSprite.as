package {

        import flash.display.Bitmap;
        import flash.display.DisplayObject;
        import flash.display.DisplayObjectContainer;
        import flash.display.InteractiveObject;
        import flash.display.SimpleButton;
        import flash.display.Sprite;
        import flash.display.Stage;
        import flash.events.Event;
        import flash.events.MouseEvent;
        import flash.events.TextEvent;
        import flash.geom.Point;
        import flash.net.URLRequest;
        import flash.text.AntiAliasType;
        import flash.text.StyleSheet;
        import flash.text.TextField;
        import flash.text.TextFieldAutoSize;
        import flash.text.TextFormat;
        import flash.text.TextLineMetrics;
        import flash.text.TextFieldType;
        import flashx.textLayout.formats.Direction;
        import flash.ui.*;
        import flash.utils.getDefinitionByName;

    public class LzTextSprite extends LzSprite {
public var textfield:* = null;public var textformat:TextFormat = null;public static var PAD_TEXTWIDTH:Number = 4;public static var PAD_TEXTHEIGHT:Number = 4;public static var PAD_MULTI_TEXTHEIGHT:Number = 0;public static var DEFAULT_SIZE:Number = 11;var font:LzFont = null;public var scroll:Number = 0;public var maxscroll:Number = 0;public var hscroll:Number = 0;public var maxhscroll:Number = 0;public var lineheight:Number = 1;public var textcolor:Number = 0;public var text:String = "";public var resize:Boolean = true;public var multiline:Boolean = false;public var underline:Boolean = false;public var textalign:String = "left";public var textindent:Number = 0;public var letterspacing:Number = 0;public var textdecoration:String = "none";public var password:Boolean = false;public var scrollheight:Number = 0;public var html:Boolean = true;public var direction:String = Direction.LTR;public function LzTextSprite ($0:LzView = null, $1:Object = null, $2:Boolean = false) {
super($0, false);
if ($2) {
textfield = createTLFTextField(0, 0, 400, 20)
} else {
textfield = createTextField(0, 0, 400, 20)
}}private var _ignoreclick:Boolean = false;private var _usecursor:Boolean = true;private var _lastobject:DisplayObject = null;private function handleTextfieldMouse ($0:MouseEvent):void {
var $1:String = $0.type;
if ($1 == MouseEvent.MOUSE_UP && this._ignoreclick) {
$0.stopPropagation()
} else if ($1 == MouseEvent.CLICK && this._ignoreclick) {
this._ignoreclick = false;
$0.stopPropagation()
} else if (this.clickable) {
if ($1 == MouseEvent.MOUSE_OVER) {
setTextfieldCursor(this)
};
if ($1 == MouseEvent.DOUBLE_CLICK) {
this.handleMouse_DOUBLE_CLICK($0)
} else {
this.__mouseEvent($0)
}} else if (textfield.selectable) {
if ($1 == MouseEvent.DOUBLE_CLICK) {
this.handleMouse_DOUBLE_CLICK($0)
} else {
this.__ignoreMouseEvent($0)
}} else {
this.__forwardMouseEventToSprite($0)
};
if ($1 == MouseEvent.MOUSE_OUT) {
if (this._usecursor) {
LzMouseKernel.restoreCursorLocal();
this._usecursor = false
};
this._lastobject = null
}}private function __ignoreMouseEvent ($0:MouseEvent):void {
if ($0.type != MouseEvent.MOUSE_UP || LzMouseKernel.__lastMouseDown === this) {
$0.stopPropagation()
};
var $1:String = "on" + $0.type.toLowerCase();
LzMouseKernel.handleMouseEvent(this.owner, $1)
}public function setDirection ($0:String):void {
if ($0 == "ltr") {
this.direction = Direction.LTR
} else if ($0 == "rtl") {
this.direction = Direction.RTL
} else {
Debug.error('setDirection value "', $0, '" unknown, use "ltr" or "rtl"')
};
textfield.direction = $0
}private function setTextfieldCursor ($0:LzSprite):void {
var $1:String = null;
if ($0.clickable) {
var $2:Boolean = $0.showhandcursor == null ? LzMouseKernel.showhandcursor : $0.showhandcursor;
if ($2 && !LzMouseKernel.hasGlobalCursor) {
$1 = MouseCursor.BUTTON
}};
if ($0.cursorResource != null) {
$1 = $0.cursorResource
};
if ($1 != null) {
this._usecursor = true;
LzMouseKernel.setCursorLocal($1)
}}private function __forwardMouseEventToSprite ($0:MouseEvent):void {
var $1:DisplayObject = this.getNextMouseObject($0) || this._lastobject;
if ($1 != null) {
this._lastobject = $1;
if ($1 is InteractiveObject) {
var $2:String = $0.type;
var $3:Boolean = true;
if ($2 == MouseEvent.MOUSE_OVER || $2 == MouseEvent.MOUSE_OUT) {
var $4:InteractiveObject = $0.relatedObject;
if (($4 is TextField || $4 is LzTLFTextField) && $4.parent is LzTextSprite) {
var $5:LzTextSprite = LzTextSprite($4.parent);
if ($5.forwardsMouse) {
$4 = $5.getNextMouseObject($0) as InteractiveObject
}};
if ($4 === $1) {
$3 = false
} else if ($4 is SimpleButton) {
var $6:DisplayObjectContainer = $4.parent;
if ($6 is LzSprite && $6 === $1) {
$3 = false
}}};
if ($2 == MouseEvent.MOUSE_OVER) {
if ($1 is LzSprite) {
setTextfieldCursor(LzSprite($1))
}};
$0.stopPropagation();
if ($3) {
$1.dispatchEvent($0)
}} else {
$0.stopPropagation();
$1.dispatchEvent($0)
}}}private static var __MouseCursor:Object = null;
        private static function get MouseCursor () :Object {
            if (__MouseCursor == null) {
                __MouseCursor = getDefinitionByName('flash.ui.MouseCursor');
            }
            return __MouseCursor;
        }

        function get forwardsMouse () :Boolean {
            return ! (this.clickable || textfield.selectable);
        }
;private static var ZERO_POINT:Point = new Point(0, 0);function getNextMouseObject ($0:MouseEvent):DisplayObject {
var $1:int = 1;
var $2:int = 4;
var $3:Stage = LFCApplication.stage;
var $4:Number = $0.stageX, $5:Number = $0.stageY;
if ($0.type == MouseEvent.MOUSE_OUT) {
if ($4 == -1 && $5 == -1) {
$4 = $3.mouseX, $5 = $3.mouseY
} else {
var $6:Point = textfield.localToGlobal(ZERO_POINT);
$4 = Math.max($6.x + $1, Math.min($4, $6.x + textfield.width - $2));
$5 = Math.max($6.y + $1, Math.min($5, $6.y + textfield.height - $1))
}} else if ($0.type == MouseEvent.MOUSE_OVER) {
var $6:Point = textfield.localToGlobal(ZERO_POINT);
$4 = Math.max($6.x + $1, Math.min($4, $6.x + textfield.width - $2));
$5 = Math.max($6.y + $1, Math.min($5, $6.y + textfield.height - $1))
};
var $7:int = -1;
var $8:Array = $3.getObjectsUnderPoint(new Point($4, $5));
for (var $9:int = $8.length - 1;$9 >= 0;--$9) {
var $a:DisplayObject = $8[$9];
if ($a === textfield) {
$7 = $9;
break
}};
if ($7 == -1) {
return null
};
for (var $9:int = $7 - 1;$9 >= 0;--$9) {
var $a:DisplayObject = $8[$9];
if ($a is Bitmap) {
$a = $a.parent
} else if (($a is TextField || $a is LzTLFTextField) && $a.parent is LzTextSprite) {
if (LzTextSprite($a.parent).forwardsMouse) {
continue
}};
if ($a is InteractiveObject) {
var $b:InteractiveObject = InteractiveObject($a);
if ($b.mouseEnabled) {
if ($b is Sprite) {
var $c:Sprite = Sprite($b).hitArea;
if ($c != null) {
if (!$c.hitTestPoint($4, $5)) {
continue
}}};
return $b
}} else {
return $a
}};
return null
}public override function setClickable ($0:Boolean):void {
if (this.clickable == $0) return;
setShowHandCursor($0);
this.clickable = $0;
this.updateMouseEnabled()
}public function addScrollEventListener ():void {
textfield.addEventListener(Event.SCROLL, __handleScrollEvent)
}var scrollevents = false;function setScrollEvents ($0) {
this.scrollevents = $0;
if (textfield is LzTLFTextField) {
textfield.renderImmediate = true
}}function __handleScrollEvent ($0:Event = null):void {
if (!this.scrollevents) return;
if (scroll !== textfield.scrollV) {
scroll = textfield.scrollV;
owner.scrollevent("scrollTop", lineNoToPixel(textfield.scrollV))
};
if (maxscroll !== textfield.maxScrollV) {
maxscroll = textfield.maxScrollV;
owner.scrollevent("scrollHeight", lineNoToPixel(textfield.maxScrollV) + owner.height)
};
if (hscroll !== textfield.scrollH) {
hscroll = textfield.scrollH;
owner.scrollevent("scrollLeft", textfield.scrollH)
};
if (maxhscroll !== textfield.maxScrollH) {
maxhscroll = textfield.maxScrollH;
owner.scrollevent("scrollWidth", textfield.maxScrollH + owner.width)
}}public function textLinkHandler ($0:TextEvent):void {
this._ignoreclick = true;
this.owner.ontextlink.sendEvent($0.text)
}var nakedCrRegExp = new RegExp("\\r(.)", "mg");var crLfRegExp = new RegExp("\\r\\n", "mg");var crRegExp = new RegExp("\\r", "mg");public function textInputHandler ($0:TextEvent):void {
var $1 = $0.text;
if ($1.search(nakedCrRegExp) != -1 || $1.length > 0 && $1.charAt(length - 1) == "\r") {
try {
var $2 = $1.replace(crLfRegExp, "\n");
$2 = $2.replace(crRegExp, "\n");
textfield.replaceSelectedText($2);
$0.preventDefault()
}
catch ($0) {}}}public function makeTextLink ($0:String, $1:String):String {
return '<a href="event:' + $1 + '">' + $0 + "</a>"
}public override function setWidth ($0:Number):void {
super.setWidth($0);
textfield.width = $0;
__handleScrollEvent()
}public override function setHeight ($0:Number):void {
if (owner.hassetheight) {
setClip(true);
super.setHeight($0);
textfield.height = Math.ceil($0 / lineheight) * lineheight + (textfield.multiline ? PAD_MULTI_TEXTHEIGHT : PAD_TEXTHEIGHT)
} else {
setClip(false);
super.setHeight($0);
textfield.height = $0
};
__handleScrollEvent()
}private function createTextField ($0:Number, $1:Number, $2:Number, $3:Number):TextField {
var $4:TextField = new TextField();
$4.antiAliasType = AntiAliasType.ADVANCED;
$4.x = $0;
$4.y = $1;
$4.width = $2;
$4.height = $3;
$4.border = false;
$4.tabEnabled = LFCApplication.textfieldTabEnabled;
addChild($4);
return $4
}private function createTLFTextField ($0:Number, $1:Number, $2:Number, $3:Number):LzTLFTextField {
var $4:LzTLFTextField = new LzTLFTextField();
$4.width = $2;
$4.height = $3;
$4.x = $0;
$4.y = $1;
$4.border = false;
$4.antiAliasType = AntiAliasType.ADVANCED;
$4.text = "";
$4.tabEnabled = LFCApplication.textfieldTabEnabled;
addChild($4);
$4.renderImmediate = true;
return $4
}public function __initTextProperties ($0:Object):void {
textfield.autoSize = TextFieldAutoSize.NONE;
this.fontname = $0.font;
this.fontsize = $0.fontsize;
this.fontstyle = $0.fontstyle;
this.textcolor = $0.fgcolor;
textfield.background = false;
if (!$0.hassetheight) {
if (this.multiline) {
textfield.autoSize = TextFieldAutoSize.LEFT
}} else if ($0["height"] != null) {
setClip(true);
textfield.height = Math.ceil($0.height / lineheight) * lineheight + (textfield.multiline ? PAD_MULTI_TEXTHEIGHT : PAD_TEXTHEIGHT)
};
this.scrollheight = this.height;
this.__setFormat();
if (!$0.hassetheight) {
var $1 = this.lineheight;
if (this.multiline) $1 *= textfield.numLines;
$1 += textfield.multiline ? PAD_MULTI_TEXTHEIGHT : PAD_TEXTHEIGHT;
this.setHeight($1)
};
addScrollEventListener();
__handleScrollEvent()
}public function setBorder ($0:Boolean):void {
textfield.border = $0 == true
}public function setEmbedFonts ($0:Boolean):void {
textfield.embedFonts = $0 == true
}public function setFontSize ($0:Number):void {
this.fontsize = $0;
this.__setFormat();
this.setText(this.text)
}public function setFontStyle ($0:String):void {
this.fontstyle = $0;
this.__setFormat();
this.setText(this.text)
}public function setFontName ($0:String, $1:* = null):void {
this.fontname = $0;
this.__setFormat();
this.setText(this.text)
}function setFontInfo ():void {
this.font = LzFontManager.getFont(this.fontname, this.fontstyle)
}public function setTextColor ($0:*):void {
if ($0 == null || this.textcolor === $0) return;
this.textcolor = $0;
this.__setFormat();
this.setText(this.text)
}function setHTML ($0:Boolean):void {
this.html = $0
}public function appendText ($0:String):void {
this.text += $0;
if (!this.html) {
textfield.appendText($0)
} else if (textfield.styleSheet == null) {
textfield.defaultTextFormat = this.textformat;
textfield.htmlText = this.text
} else {
textfield.htmlText = this.text
};
__handleScrollEvent();
if (this.initted) this.owner._updateSize()
}public function getText ():String {
return this.text
}public function setText ($0:String):void {
this.text = $0;
if (!this.html) {
textfield.text = $0
} else if (textfield.styleSheet == null && this.textformat != null) {
textfield.defaultTextFormat = this.textformat;
textfield.htmlText = $0
} else {
textfield.htmlText = $0
};
if (this.resize && this.multiline == false) {
var $1:Number = this.getTextWidth();
if ($1 != this.lzwidth) {
this.setWidth($1)
}};
if (!owner.hassetheight) {
var $2:Number = textfield.textHeight;
if ($2 == 0) {
this.__setFormat();
$2 = this.lineheight;
if (this.multiline) $2 *= textfield.numLines
};
this.setHeight($2 + LzTextSprite.PAD_TEXTHEIGHT)
};
__handleScrollEvent();
if (this.initted) this.owner._updateSize()
}public function __setFormat ():void {
if (this.fontname == null || this.fontsize == 0) {
return
};
this.setFontInfo();
var $0:String = LzFontManager.__fontnameCacheMap[this.fontname];
if ($0 == null) {
$0 = LzFontManager.__findMatchingFont(this.fontname);
LzFontManager.__fontnameCacheMap[this.fontname] = $0
};
var $1:TextFormat = new TextFormat();
this.textformat = $1;
$1.kerning = true;
$1.size = this.fontsize;
$1.font = this.font == null ? $0 : this.font.name;
$1.color = this.textcolor;
textfield.embedFonts = this.font != null;
$1.bold = this.fontstyle == "bold" || this.fontstyle == "bolditalic";
$1.italic = this.fontstyle == "italic" || this.fontstyle == "bolditalic";
$1.underline = this.underline || this.textdecoration == "underline";
$1.align = this.textalign;
$1.indent = this.textindent;
if (this.textindent < 0) {
$1.leftMargin = this.textindent * -1
} else {
$1.leftMargin = 0
};
$1.letterSpacing = this.letterspacing;
var $2:StyleSheet = textfield.styleSheet;
textfield.styleSheet = null;
textfield.defaultTextFormat = $1;
var $3:String = this.text;
if (textfield is LzTLFTextField) {
textfield.renderImmediate = true;
textfield.htmlText = "__ypgSAMPLE__"
} else {
textfield.text = "__ypgSAMPLE__"
};
var $4:TextLineMetrics = textfield.getLineMetrics(0);
textfield.styleSheet = $2;
textfield[this.html ? "htmlText" : "text"] = $3;
if (textfield is LzTLFTextField) {
textfield.renderImmediate = false
};
var $5:Number = $4.ascent + $4.descent + $4.leading;
if ($5 !== this.lineheight) {
this.lineheight = $5;
this.owner.scrollevent("lineHeight", $5)
};
if (this.initted) this.owner._updateSize()
}public function setMultiline ($0:Boolean):void {
this.multiline = $0 == true;
if (this.multiline) {
textfield.multiline = true;
textfield.wordWrap = true
} else {
textfield.multiline = false;
textfield.wordWrap = false
};
if (this.initted) this.owner._updateSize()
}public function setSelectable ($0:Boolean):void {
textfield.selectable = $0;
this.updateMouseEnabled()
}public function getTextWidth ($0 = null):Number {
var $1:Boolean = textfield.multiline;
var $2:Boolean = textfield.wordWrap;
textfield.multiline = false;
textfield.wordWrap = false;
var $3:Number = textfield.textWidth == 0 ? 0 : textfield.textWidth + LzTextSprite.PAD_TEXTWIDTH;
textfield.multiline = $1;
textfield.wordWrap = $2;
return $3
}public function getLineHeight ():Number {
return textfield.textHeight
}public function getTextfieldHeight ($0 = null):Number {
if (textfield is LzTLFTextField) {
return textfield.textHeight
};
var $1:String = textfield.autoSize;
var $2:Number = textfield.width;
var $3:Number = textfield.height;
var $4:Number = textfield.scrollV;
var $5:Number = textfield.scrollH;
textfield.autoSize = TextFieldAutoSize.LEFT;
var $6:Number = textfield.height;
if ($6 == (textfield.multiline ? LzTextSprite.PAD_MULTI_TEXTHEIGHT : LzTextSprite.PAD_TEXTHEIGHT)) {
var $7:Boolean = textfield.wordWrap;
textfield.wordWrap = false;
textfield.htmlText = "__ypgSAMPLE__";
$6 = textfield.height;
textfield.wordWrap = $7;
textfield.htmlText = ""
};
textfield.autoSize = $1;
textfield.height = $3;
textfield.width = $2;
textfield.scrollV = $4;
textfield.scrollH = $5;
return $6
}function setHScroll ($0:Number):void {
textfield.scrollH = this.hscroll = $0
}function setAntiAliasType ($0:String):void {
var $1:String = $0 == "advanced" ? AntiAliasType.ADVANCED : AntiAliasType.NORMAL;
textfield.antiAliasType = $1;
if (this.initted) this.owner._updateSize()
}function getAntiAliasType ():String {
return textfield.antiAliasType
}function setGridFit ($0:String):void {
textfield.gridFitType = $0;
if (this.initted) this.owner._updateSize()
}function getGridFit ():String {
return textfield.gridFitType
}function setSharpness ($0:Number):void {
textfield.sharpness = $0
}function getSharpness ():Number {
return textfield.sharpness
}function setThickness ($0:Number):void {
textfield.thickness = $0
}function getThickness ():Number {
return textfield.thickness
}function setMaxLength ($0:Number) {
if ($0 == Infinity) {
$0 = null
};
textfield.maxChars = $0;
if (this.initted) this.owner._updateSize()
}function setPattern ($0:String):void {
if ($0 == null || $0 == "") {
textfield.restrict = null
} else if ($0.substring(0, 1) == "[" && $0.substring($0.length - 2, $0.length) == "]*") {
textfield.restrict = $0.substring(1, $0.length - 2)
}}function setSelection ($0:Number, $1:Number):void {
textfield.setSelection($0, $1);
textfield.alwaysShowSelection = true
}function setResize ($0:Boolean):void {
this.resize = $0;
if (this.initted) this.owner._updateSize()
}function setScroll ($0:Number):void {
textfield.scrollV = this.scroll = $0
}function getScroll ():Number {
return textfield.scrollV
}function getMaxScroll ():Number {
return textfield.maxScrollV
}function getBottomScroll ():Number {
return textfield.bottomScrollV
}function lineNoToPixel ($0:Number):Number {
return ($0 - 1) * lineheight
}function pixelToLineNo ($0:Number):Number {
return Math.ceil($0 / lineheight) + 1
}function setYScroll ($0:Number):void {
textfield.scrollV = this.scroll = this.pixelToLineNo(-$0)
}function setXScroll ($0:Number):void {
textfield.scrollH = this.hscroll = -$0
}function setWordWrap ($0:Boolean):void {
Debug.warn("LzTextSprite.setWordWrap not yet implemented")
}function getSelectionPosition ():int {
return textfield.selectionBeginIndex
}function getSelectionSize ():int {
return textfield.selectionEndIndex - textfield.selectionBeginIndex
}function setTextAlign ($0:String):void {
this.textalign = $0;
this.__setFormat();
this.setText(this.text)
}function setTextIndent ($0:Number):void {
this.textindent = $0;
this.__setFormat();
this.setText(this.text)
}function setLetterSpacing ($0:Number):void {
this.letterspacing = $0;
this.__setFormat();
this.setText(this.text)
}function setTextDecoration ($0:String):void {
this.textdecoration = $0;
this.__setFormat()
}protected var mouseactive:Boolean = false;function activateLinks ($0:Boolean):void {
if (this.mouseactive == $0) return;
this.mouseactive = $0;
if ($0) {
textfield.addEventListener(TextEvent.LINK, textLinkHandler);
textfield.addEventListener(TextEvent.TEXT_INPUT, textInputHandler);
textfield.addEventListener(MouseEvent.CLICK, handleTextfieldMouse);
textfield.addEventListener(MouseEvent.DOUBLE_CLICK, handleTextfieldMouse);
textfield.addEventListener(MouseEvent.MOUSE_DOWN, handleTextfieldMouse);
textfield.addEventListener(MouseEvent.MOUSE_UP, handleTextfieldMouse);
textfield.addEventListener(MouseEvent.MOUSE_OVER, handleTextfieldMouse);
textfield.addEventListener(MouseEvent.MOUSE_OUT, handleTextfieldMouse)
} else {
textfield.removeEventListener(TextEvent.LINK, textLinkHandler);
textfield.removeEventListener(TextEvent.TEXT_INPUT, textInputHandler);
textfield.removeEventListener(MouseEvent.CLICK, handleTextfieldMouse);
textfield.removeEventListener(MouseEvent.DOUBLE_CLICK, handleTextfieldMouse);
textfield.removeEventListener(MouseEvent.MOUSE_DOWN, handleTextfieldMouse);
textfield.removeEventListener(MouseEvent.MOUSE_UP, handleTextfieldMouse);
textfield.removeEventListener(MouseEvent.MOUSE_OVER, handleTextfieldMouse);
textfield.removeEventListener(MouseEvent.MOUSE_OUT, handleTextfieldMouse)
}}protected function updateMouseEnabled ():void {
var $0:Boolean = !forwardsMouse;
this.mouseEnabled = $0;
this.mouseChildren = $0;
this.activateLinks($0)
}}
}
