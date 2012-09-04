package {
class LzEventable {
function LzEventable () {}var __LZdeleted:Boolean = false;var _events:Array = null;var __delegates:Array = null;var ondestroy = LzDeclaredEvent;function destroy () {
if (this.ondestroy.ready) this.ondestroy.sendEvent(this);
this.__LZdeleted = true;
this.__LZdelegatesQueue = null;
this.__LZdeferDelegates = false;
if (this._events != null) {
for (var $0 = this._events.length - 1;$0 >= 0;$0--) {
this._events[$0].clearDelegates()
};
this._events = null
};
if (this.__delegates != null) this.removeDelegates()
}function removeDelegates () {
if (this.__delegates != null) {
for (var $0 = this.__delegates.length - 1;$0 >= 0;$0--) {
var $1 = this.__delegates[$0];
if ($1.__LZdeleted != true) {
$1.destroy(false)
}};
this.__delegates = null
}}var __LZdeferDelegates:Boolean = false;var __LZdelegatesQueue:Array = null;function childOf ($0, $1 = null) {
return false
}protected var customSetters:Object = {};protected function __invokeCustomSetter ($0:String, $1):Boolean {
return false
}final function setAttribute ($0:String, $1):void {
if (this.__LZdeleted) {
return
};
if (this.customSetters[$0]) {
if (this.__invokeCustomSetter($0, $1) == true) {
return
}};
var $2 = "$lzc$set_" + $0;
if (this[$2] is Function) {
this[$2]($1)
} else {
this[$0] = $1;
var $3 = this["on" + $0];
if ($3 is LzEvent) {
if ($3.ready) $3.sendEvent($1)
}}}final function __setAttr ($0:String, $1):void {
if (this.__LZdeleted) {
return
};
var $2 = "$lzc$set_" + $0;
if (this[$2] is Function) {
this[$2]($1)
} else {
this[$0] = $1;
var $3 = this["on" + $0];
if ($3 is LzEvent) {
if ($3.ready) $3.sendEvent($1)
}}}prototype.toString = function () {
if (arguments.callee !== this.toString) {
return this.toString()
} else {
return Object.prototype.toString.call(this)
}};}
}
