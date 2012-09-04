package {
public dynamic final class LzFocusService extends LzEventable {
var onfocus:LzDeclaredEventClass = LzDeclaredEvent;var onescapefocus:LzDeclaredEventClass = LzDeclaredEvent;var lastfocus:LzView = null;var csel:LzView = null;var cseldest:LzView = null;public var FOCUS_MANUAL:int = 0;public var FOCUS_KEYBOARD:int = -1;public var FOCUS_KEYBOARD_PREV:int = -2;public var FOCUS_MOUSE:int = 1;public static var LzFocus:LzFocusService;function LzFocusService () {
super();
this.upDel = new LzDelegate(this, "gotKeyUp", lz.Keys, "onkeyup");
this.downDel = new LzDelegate(this, "gotKeyDown", lz.Keys, "onkeydown");
this.lastfocusDel = new LzDelegate(lz.Keys, "gotLastFocus", this, "onescapefocus")
}LzFocusService.LzFocus = new LzFocusService();var upDel:LzDelegate;var downDel:LzDelegate;var lastfocusDel:LzDelegate;var focusmethod:int = 0;var focuswithkey:Boolean = false;var __LZskipblur:Boolean = false;var __LZsfnextfocus:* = -1;var __LZsfrunning:Boolean = false;var focuscount:int = 0;function gotKeyUp ($0):void {
if (this.csel && this.csel.onkeyup.ready) this.csel.onkeyup.sendEvent($0)
}function gotKeyDown ($0):void {
if (this.csel && this.csel.onkeydown.ready) this.csel.onkeydown.sendEvent($0);
if ($0 == lz.Keys.keyCodes.tab) {
if (lz.Keys.isKeyDown("shift")) {
this.prev()
} else {
this.next()
}}}function __LZcheckFocusChange ($0:LzView):void {
if ($0.focusable) {
this.setFocus($0, FOCUS_MOUSE)
} else {
this.clearFocus()
}}function setFocus ($0:LzView, $1:* = null):void {
this.focusmethod = FOCUS_MANUAL;
if ($1 != null) {
if (typeof $1 == "number") {
this.focusmethod = $1
} else this.focusmethod = FOCUS_KEYBOARD
};
if (this.__LZsfrunning) {
this.__LZsfnextfocus = $0;
return
};
this.focuscount++;
if (this.cseldest == $0) {
return
};
var $2:LzView = this.csel;
if ($2 && !$2.shouldYieldFocus()) {
return
};
if ($0 && !$0.focusable) {
$0 = this.getNext($0);
if (this.cseldest == $0) {
return
}};
if ($2) {
$2.blurring = true
};
this.__LZsfnextfocus = -1;
this.__LZsfrunning = true;
this.cseldest = $0;
this.focuswithkey = this.focusmethod <= FOCUS_KEYBOARD;
if (!this.__LZskipblur) {
this.__LZskipblur = true;
if ($2 && $2.onblur.ready) {
$2.onblur.sendEvent($0);
var $3:* = this.__LZsfnextfocus;
if ($3 != -1) {
if ($3 && !$3.focusable) {
$3 = this.getNext($3)
};
if ($3 != $0) {
this.__LZsfrunning = false;
this.setFocus($3, this.focusmethod);
return
}}}};
this.lastfocus = $2;
this.csel = $0;
this.__LZskipblur = false;
if ($2) {
$2.blurring = false
};
if ($0 && $0.onfocus.ready) {
$0.onfocus.sendEvent($0);
var $3:* = this.__LZsfnextfocus;
if ($3 != -1) {
if ($3 && !$3.focusable) {
$3 = this.getNext($3)
};
if ($3 != $0) {
this.__LZsfrunning = false;
this.setFocus($3, this.focusmethod);
return
}}};
if (this.onfocus.ready) {
this.onfocus.sendEvent($0);
var $3:* = this.__LZsfnextfocus;
if ($3 != -1) {
if ($3 && !$3.focusable) {
$3 = this.getNext($3)
};
if ($3 != $0) {
this.__LZsfrunning = false;
this.setFocus($3, this.focusmethod);
return
}}};
this.__LZsfrunning = false
}function clearFocus ():void {
this.setFocus(null)
}function getFocus ():LzView {
return this.csel
}function next ():void {
this.genMoveSelection(1)
}function prev ():void {
this.genMoveSelection(-1)
}function getNext ($0:LzView = null):LzView {
return this.moveSelSubview($0 || this.csel, 1, false)
}function getPrev ($0:LzView = null):LzView {
return this.moveSelSubview($0 || this.csel, -1, false)
}function genMoveSelection ($0:int):void {
var $1:LzView = this.csel;
var $2:LzView = $1;
while ($1 && $2 != canvas) {
if (!$2.visible) {
$1 = null
};
$2 = $2.immediateparent
};
if ($1 == null) {
$1 = lz.ModeManager.getModalView()
};
var $3:String = "get" + ($0 == 1 ? "Next" : "Prev") + "Selection";
var $4:LzView = $1 ? $1[$3]() : null;
if ($4 == null) {
$4 = this.moveSelSubview($1, $0, true)
};
if (lz.ModeManager.__LZallowFocus($4)) {
this.setFocus($4, $0 == 1 ? FOCUS_KEYBOARD : FOCUS_KEYBOARD_PREV)
}}function accumulateSubviews ($0:Array, $1:LzView, $2:LzView, $3:Boolean):void {
if ($1 == $2 || $1.focusable && $1.visible) $0.push($1);
if ($3 || !$1.focustrap && $1.visible) for (var $4:int = 0;$4 < $1.subviews.length;$4++) this.accumulateSubviews($0, $1.subviews[$4], $2, false)
}function moveSelSubview ($0:LzView, $1:int, $2:Boolean):LzView {
var $3:LzView = $0 || canvas;
while (!$3.focustrap && $3.immediateparent && $3 != $3.immediateparent) $3 = $3.immediateparent;
var $4:Array = [];
this.accumulateSubviews($4, $3, $0, true);
var $5:int = -1;
var $6:int = $4.length;
var $7:Boolean = false;
for (var $8:int = 0;$8 < $6;++$8) {
if ($4[$8] === $0) {
$7 = $1 == -1 && $8 == 0 || $1 == 1 && $8 == $6 - 1;
$5 = $8;
break
}};
if ($2 && $7 && this.onescapefocus.ready) {
this.onescapefocus.sendEvent()
};
if ($5 == -1 && $1 == -1) $5 = 0;
$5 = ($5 + $1 + $6) % $6;
return $4[$5]
}}
}
