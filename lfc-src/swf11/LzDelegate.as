package {
public final class LzDelegate {
var __delegateID:int = 0;var __events:Array = null;public function LzDelegate ($0, $1:String, $2 = null, $3:String = null) {
super();
if (!($0 is LzEventable)) {};
if ($0 == null || $0["__LZdeleted"]) {
return
};
this.c = $0;
var m:* = $0[$1];
if (!(m is Function)) {
return
};
this.m = m;
if (m.length != 1) {
var a:Array = new Array(m.length);
this.m = function ($0:*):* {
return m.apply(this, a)
}};
if ($2 != null) {
this.register($2, $3)
};
this.__delegateID = LzDelegate.__nextID++
}static var __nextID:int = 1;var c:LzEventable;var m:Function;var hasevents:Boolean = false;var enabled:Boolean = true;var event_called:Boolean = false;public function execute ($0:*):* {
var $1:LzEventable = this.c;
if (this.enabled && $1) {
if ($1["__LZdeleted"]) {
return
};
var $2:Function = this.m;
return $2 && $2.call($1, $0)
}}public function register ($0, $1:String):void {
var $2 = false;
if (!($0 is LzEventable)) {};
if (this.c == null || this.c["__LZdeleted"]) {
return
};
if ($0 !== this.c && !$2) {
if (this.__tracked == false) {
this.__tracked = true;
var $3:Array = this.c["__delegates"];
if ($3 == null) {
this.c.__delegates = [this]
} else {
$3.push(this)
}}};
var $4:* = $0[$1];
if ($4 is LzEvent) {
($4 as LzEvent).addDelegate(this)
} else {
if ($4 && !($4 is LzDeclaredEventClass)) {
return
};
var $5 = $4 && $4.actual || LzEvent;
$4 = new $5($0, $1, this)
};
var $6:Array = this.__events;
if ($6 == null) {
this.__events = [$4]
} else {
$6.push($4)
};
this.hasevents = true
}public function unregisterAll ():void {
if (this.hasevents == false) return;
var $0:Array = this.__events;
for (var $1:int = 0, $2:int = $0.length;$1 < $2;$1++) {
$0[$1].removeDelegate(this)
};
$0.length = 0;
this.hasevents = false
}public function unregisterFrom ($0:LzDeclaredEventClass):void {
if (this.hasevents == false) return;
var $1:Array = this.__events;
for (var $2:int = 0, $3:int = $1.length;$2 < $3;$2++) {
var $4:LzEvent = $1[$2];
if ($4 === $0) {
$4.removeDelegate(this);
$1.splice($2, 1)
}};
this.hasevents = $1.length > 0
}public function disable ():void {
this.enabled = false
}public function enable ():void {
this.enabled = true
}static function __LZdrainDelegatesQueue ($0:Array):void {
var $1:int = $0.length;
var $2:int = 0;
if ($2 < $1) {
var $3:Array = new Array();
var $4:Array = new Array();
while ($2 < $1) {
var $5:LzEvent = $0[$2];
var $6:LzDelegate = $0[$2 + 1];
var $7:* = $0[$2 + 2];
$5.locked = true;
$5.ready = false;
$4.push($5);
if (!$6.event_called) {
$6.event_called = true;
$3.push($6);
if ($6.c && !$6.c.__LZdeleted && $6.m) {
$6.m.call($6.c, $7)
}};
$2 += 3
};
while ($6 = $3.pop()) {
$6.event_called = false
};
while ($5 = $4.pop()) {
$5.locked = false;
$5.ready = $5.delegateList.length != 0
}};
$0.length = 0
}public function toString () {
return "Delegate for " + this.c + " calls " + this.m + " " + this.__delegateID
}private var __tracked = false;public var __LZdeleted = false;public function destroy ($0 = true):void {
if (this.__LZdeleted == true) return;
this.__LZdeleted = true;
if (this.hasevents) this.unregisterAll();
this.hasevents = false;
this.__events = null;
if ($0 && this.__tracked) {
this.__tracked = false;
var $1:Array = this.c.__delegates;
for (var $2 = $1.length - 1;$2 >= 0;$2--) {
if ($1[$2] === this) {
$1.splice($2, 1);
break
}}};
this.c = null;
this.m = null
}}
}
