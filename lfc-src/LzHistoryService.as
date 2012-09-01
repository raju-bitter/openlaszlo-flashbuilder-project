package {

            import flash.net.SharedObject;
        public final class LzHistoryService extends LzEventable {
public static var LzHistory:LzHistoryService;function LzHistoryService () {
super()
}LzHistoryService.LzHistory = new LzHistoryService();var ready:Boolean = false;var onready:LzDeclaredEventClass = LzDeclaredEvent;var persist:Boolean = false;var _persistso:SharedObject = null;var offset:Number = 0;var __lzdirty:Boolean = false;var __lzhistq:Array = [];var __lzcurrstate:Object = {};var capabilities:* = LzSprite.capabilities;var onoffset:LzDeclaredEventClass = LzDeclaredEvent;function receiveHistory ($0:*):Number {
if (this.persist && !this._persistso) {
this.__initPersist()
};
var $1:int = this.__lzhistq.length;
var $2:Number = $0 * 1;
if (!$2) {
$2 = 0
} else if ($2 > $1 - 1) {
$2 = $1
};
var $3:Object = this.__lzhistq[$2];
for (var $4:String in $3) {
var $5:Object = $3[$4];
global[$5.c].setAttribute($5.n, $5.v)
};
this.offset = $2;
if (this.onoffset.ready) this.onoffset.sendEvent($2);
return $2
}function receiveEvent ($0:String, $1:*):void {
canvas.setAttribute($0, $1)
}function getCanvasAttribute ($0:String):* {
return canvas[$0]
}function setCanvasAttribute ($0:String, $1:*):void {
this.receiveEvent($0, $1)
}function callMethod ($0:String):* {
return LzBrowserKernel.callMethod($0)
}function save ($0:*, $1:String, $2:*):void {
if (typeof $0 != "string") {
if ($0["id"]) $0 = $0["id"];
if (!$0) return
};
if ($2 == null) $2 = global[$0][$1];
this.__lzcurrstate[$0] = {c: $0, n: $1, v: $2};
this.__lzdirty = true
}function commit ():void {
if (!this.__lzdirty) return;
this.__lzhistq[this.offset] = this.__lzcurrstate;
this.__lzhistq.length = this.offset + 1;
if (this.persist) {
if (!this._persistso) {
this.__initPersist()
};
this._persistso.data[this.offset] = this.__lzcurrstate
};
this.__lzcurrstate = {};
this.__lzdirty = false
}function move ($0:int = 1):void {
this.commit();
var $1:Number = this.offset + $0;
if (0 >= $1) $1 = 0;
if (this.__lzhistq.length >= $1) {
LzBrowserKernel.setHistory($1)
}}function next ():void {
this.move(1)
}function prev ():void {
this.move(-1)
}function __initPersist ():void {
if (this.persist) {
if (!this._persistso) {
this._persistso = LzBrowserKernel.getPersistedObject("historystate")
};
if (this._persistso && this._persistso.data) {
var $0:Object = this._persistso.data;
this.__lzhistq = [];
for (var $1:String in $0) {
this.__lzhistq[$1] = $0[$1]
}}} else {
if (this._persistso) this._persistso = null
}}function clear ():void {
if (this.persist) {
if (!this._persistso) {
this._persistso = LzBrowserKernel.getPersistedObject("historystate")
};
this._persistso.clear()
};
this.__lzhistq = [];
this.offset = 0;
if (this.onoffset.ready) this.onoffset.sendEvent(0)
}function setPersist ($0:Boolean):void {
if (this.capabilities.persistence) {
this.persist = $0
}}function __start ($0:String):void {
lz.Browser.callJS("lz.embed.history.listen('" + $0 + "')");
this.ready = true;
if (this.onready.ready) this.onready.sendEvent(true)
}}
}
