package {
public class LzEvent extends LzDeclaredEventClass {
var delegateList:Array = null;function LzEvent ($0:LzEventable, $1:String, $2:* = null) {
super();
var $3:Array = $0["_events"];
if ($3 == null) {
$0._events = [this]
} else {
$3.push(this)
};
$0[$1] = this;
if ($2) {
this.delegateList = [$2];
this.ready = true
} else {
this.delegateList = []
}}var locked:Boolean = false;public function addDelegate ($0:LzDelegate):void {
this.ready = true;
this.delegateList.push($0)
}public override function sendEvent ($0:* = null):void {
if (this.locked || !this.ready) {
return
};
this.locked = true;
this.ready = false;
var $1:Array = this.delegateList;
var $2:Array = new Array();
var $3:LzDelegate;
var $4:int = $1.length;
while (--$4 >= 0) {
$3 = $1[$4];
if ($3 && $3.enabled && !$3.event_called) {
$3.event_called = true;
$2.push($3);
var $5:LzEventable = $3.c;
if ($5 && !$5.__LZdeleted) {
if ($5.__LZdeferDelegates) {
var $6:Array = $5.__LZdelegatesQueue;
if (!$6) {
$5.__LZdelegatesQueue = [this, $3, $0]
} else {
$6.push(this, $3, $0)
}} else if ($3.m) {
$3.m.call($5, $0)
}}}};
while ($3 = $2.pop()) {
$3.event_called = false
};
this.locked = false;
this.ready = $1.length != 0
}public override function removeDelegate ($0:LzDelegate = null):void {
var $1:Array = this.delegateList;
for (var $2:int = 0, $3:int = $1.length;$2 < $3;$2++) {
if ($1[$2] === $0) {
$1.splice($2, 1);
break
}};
this.ready = $1.length != 0
}public override function clearDelegates ():void {
var $0:Array = this.delegateList;
while ($0.length) {
$0[0].unregisterFrom(this)
};
this.ready = false
}public override function getDelegateCount ():int {
return this.delegateList.length
}public override function toString () {
return "LzEvent"
}}
}
