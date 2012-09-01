package {
public final class LzModeManagerService extends LzEventable {
var onmode:LzDeclaredEventClass = LzDeclaredEvent;var __LZlastclick:LzView = null;var __LZlastClickTime:Number = 0;var willCall:Boolean = false;var eventsLocked:Boolean = false;var modeArray:Array = new Array();var remotedebug:* = null;public static var LzModeManager:LzModeManagerService;function LzModeManagerService () {
super()
}LzModeManagerService.LzModeManager = new LzModeManagerService();function makeModal ($0:LzView):void {
if ($0 && (this.modeArray.length == 0 || !this.hasMode($0))) {
this.modeArray.push($0);
if (this.onmode.ready) this.onmode.sendEvent($0);
var $1:LzView = lz.Focus.getFocus();
if ($1 && !$1.childOf($0)) {
lz.Focus.clearFocus()
}}}function release ($0:LzView):void {
var $1:Array = this.modeArray;
for (var $2:int = $1.length - 1;$2 >= 0;$2--) {
if ($1[$2] === $0) {
$1.splice($2, $1.length - $2);
var $3:LzView = $1[$2 - 1];
if (this.onmode.ready) this.onmode.sendEvent($3 || null);
var $4:LzView = lz.Focus.getFocus();
if ($3 && $4 && !$4.childOf($3)) {
lz.Focus.clearFocus()
};
return
}}}function releaseAll ():void {
this.modeArray = new Array();
if (this.onmode.ready) this.onmode.sendEvent(null)
}function handleMouseEvent ($0:LzView, $1:String):void {
if ($1 == "onmouseup") lz.Track.__LZmouseup(null);
if ($0 == null) {
$0 = this.__findInputtextSelection()
};
lz.GlobalMouse.__mouseEvent($1, $0);
if (this.eventsLocked) {
return
};
var $2:Boolean = true;
for (var $3:int = this.modeArray.length - 1;$2 && $3 >= 0;--$3) {
var $4:LzView = this.modeArray[$3];
if (!$4) {
continue
};
if ($0 && $0.childOf($4)) {
break
} else {
$2 = $4.passModeEvent ? $4.passModeEvent($1, $0) : false
}};
if (!$0) {
return
};
if ($2) {
if ($1 == "onclick") {
if (this.__LZlastclick === $0 && LzTimeKernel.getTimer() - this.__LZlastClickTime < $0.DOUBLE_CLICK_TIME) {
$1 = "ondblclick";
lz.GlobalMouse.__mouseEvent($1, $0);
this.__LZlastclick = null
} else {
this.__LZlastclick = $0;
this.__LZlastClickTime = LzTimeKernel.getTimer()
}};
var $5 = lz.Focus.focuscount;
$0.mouseevent($1);
if (lz.Focus.focuscount == $5 && $1 == "onmousedown") {
lz.Focus.__LZcheckFocusChange($0)
}}}function __LZallowInput ($0:LzView, $1:LzInputText):Boolean {
return $1.childOf($0)
}function __LZallowFocus ($0:LzView):Boolean {
var $1:int = this.modeArray.length;
return $1 == 0 || $0.childOf(this.modeArray[$1 - 1])
}function globalLockMouseEvents ():void {
this.eventsLocked = true
}function globalUnlockMouseEvents ():void {
this.eventsLocked = false
}function hasMode ($0:LzView):Boolean {
var $1:Array = this.modeArray;
for (var $2:int = $1.length - 1;$2 >= 0;$2--) {
if ($0 === $1[$2]) {
return true
}};
return false
}function getModalView ():LzView {
return this.modeArray[this.modeArray.length - 1] || null
}function __findInputtextSelection ():LzView {
return LzInputTextSprite.findSelection()
}function rawMouseEvent ($0:String, $1:LzView, $2 = null):void {
if ($0 == "ongesture" || $0 == "ontouch") {
$1.mouseevent($0, $2)
} else if ($0 == "onmousemove") {
lz.GlobalMouse.__mouseEvent("onmousemove", null)
} else {
this.handleMouseEvent($1, $0)
}}}
}
