package {
public final class LzTrackService extends LzEventable {
var __LZreg:Object = new Object();var __LZactivegroups:Array = null;var __LZtrackDel:LzDelegate = null;var __LZmouseupDel:LzDelegate = null;var __LZdestroydel:LzDelegate = null;var __LZlastmouseup:LzView = null;public static var LzTrack:LzTrackService;function LzTrackService () {
super();
this.__LZtrackDel = new LzDelegate(this, "__LZtrack");
this.__LZmouseupDel = new LzDelegate(this, "__LZmouseup", lz.GlobalMouse, "onmouseup");
this.__LZdestroydel = new LzDelegate(this, "__LZdestroyitem");
this.__LZactivegroups = []
}LzTrackService.LzTrack = new LzTrackService();function register ($0:LzView, $1:String):void {
if ($0 == null || $1 == null) return;
var $2:Array = this.__LZreg[$1];
if (!$2) {
this.__LZreg[$1] = $2 = [];
$2.__LZlasthit = null;
$2.__LZactive = false;
$2.__LZuids = {}};
if ($2.__LZuids[$0.__LZUID] != true) {
$2.__LZuids[$0.__LZUID] = true;
$2.push($0);
this.__LZdestroydel.register($0, "ondestroy")
}}function unregister ($0:LzView, $1:String):void {
if ($0 == null || $1 == null) return;
var $2:Array = this.__LZreg[$1];
if ($2) {
if ($2.__LZuids[$0.__LZUID]) {
delete $2.__LZuids[$0.__LZUID];
for (var $3:int = 0;$3 < $2.length;$3++) {
if ($2[$3] === $0) {
if ($2.__LZlasthit === $0) {
if (this.__LZlastmouseup === $0) {
this.__LZlastmouseup = null
};
$2.__LZlasthit = null
};
$2.splice($3, 1);
break
}}};
if ($2.length == 0) {
if ($2.__LZactive) {
this.deactivate($1)
};
delete this.__LZreg[$1]
}};
this.__LZdestroydel.unregisterFrom($0.ondestroy)
}function __LZdestroyitem ($0:LzView):void {
for (var $1:String in this.__LZreg) {
this.unregister($0, $1)
}}function activate ($0:String):void {
var $1:Array = this.__LZreg[$0];
if ($1 && !$1.__LZactive) {
$1.__LZactive = true;
var $2:Array = this.__LZactivegroups;
if ($2.length == 0) {
this.__LZtrackDel.register(lz.Idle, "onidle")
};
$2.push($1)
}}function deactivate ($0:String):void {
var $1:Array = this.__LZreg[$0];
if ($1 && $1.__LZactive) {
var $2:Array = this.__LZactivegroups;
for (var $3:int = 0;$3 < $2.length;++$3) {
if ($2[$3] === $1) {
$2.splice($3, 1);
break
}};
if ($2.length == 0) {
this.__LZtrackDel.unregisterAll()
};
$1.__LZactive = false;
if (this.__LZlastmouseup === $1.__LZlasthit) {
this.__LZlastmouseup = null
};
$1.__LZlasthit = null
}}function __LZtopview ($0:LzView, $1:LzView):LzView {
var $2:LzView = $0;
var $3:LzView = $1;
while ($2.nodeLevel < $3.nodeLevel) {
$3 = $3.immediateparent;
if ($3 === $0) return $1
};
while ($3.nodeLevel < $2.nodeLevel) {
$2 = $2.immediateparent;
if ($2 === $1) return $0
};
while ($2.immediateparent !== $3.immediateparent) {
$2 = $2.immediateparent;
$3 = $3.immediateparent
};
return $2.getZ() > $3.getZ() ? $0 : $1
}function __LZfindTopmost ($0:Array):LzView {
var $1:LzView = $0[0];
for (var $2:int = 1;$2 < $0.length;$2++) {
$1 = this.__LZtopview($1, $0[$2])
};
return $1
}function __LZtrackgroup ($0:Array, $1:Array):void {
for (var $2:int = 0;$2 < $0.length;$2++) {
var $3:LzView = $0[$2];
if ($3.visible) {
var $4:Object = $3.getMouse(null);
if ($3.containsPt($4.x, $4.y)) {
$1.push($3)
}}}}function __LZtrack ($0:*):void {
var $1:Array = [];
var $2:Array = this.__LZactivegroups;
for (var $3:int = 0;$3 < $2.length;++$3) {
var $4:Array = $2[$3];
var $5:Array = [];
this.__LZtrackgroup($4, $5);
var $6:LzView = $4.__LZlasthit;
if ($5.length) {
var $7:LzView = this.__LZfindTopmost($5);
if ($7 === $6) continue;
$1.push($7)
} else {
var $7:LzView = null
};
if ($6) {
var $8:LzDeclaredEventClass = $6.onmousetrackout;
if ($8.ready) $8.sendEvent($6)
};
$4.__LZlasthit = $7
};
for (var $3:int = 0, $9:int = $1.length;$3 < $9;++$3) {
var $a:LzView = $1[$3];
if ($a.onmousetrackover.ready) $a.onmousetrackover.sendEvent($a)
}}function __LZmouseup ($0:*):void {
var $1:Array = this.__LZactivegroups.slice();
for (var $2:int = 0;$2 < $1.length;++$2) {
var $3:LzView = $1[$2].__LZlasthit;
if ($3) {
var $4:LzDeclaredEventClass = $3.onmousetrackup;
if ($4.ready) {
if (this.__LZlastmouseup === $3) {
this.__LZlastmouseup = null
} else {
this.__LZlastmouseup = $3;
$4.sendEvent($3)
}}}}}}
}
