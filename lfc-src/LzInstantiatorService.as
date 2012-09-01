package {
public dynamic final class LzInstantiatorService extends LzEventable {
var checkQDel:LzDelegate = null;static var LzInstantiator:LzInstantiatorService;function LzInstantiatorService () {
super();
this.checkQDel = new LzDelegate(this, "checkQ")
}LzInstantiatorService.LzInstantiator = new LzInstantiatorService();var halted:Boolean = false;var isimmediate:Boolean = false;var isdatareplicating:Boolean = false;var istrickling:Boolean = false;var isUpdating:Boolean = false;var safe:Boolean = true;var timeout:Number = 500;var makeQ:Array = [];var trickleQ:Array = [];var tricklingQ:Array = [];var datareplQ:Array = null;var dataQ:Array = [];var syncNew:Boolean = true;var trickletime:Number = 10;function setSafeInstantiation ($0:Boolean):void {
this.safe = $0;
if (this.instanceQ.length) {
this.timeout = Infinity
}}function requestInstantiation ($0:LzNode, $1:Array):void {
if (this.isimmediate) {
this.createImmediate($0, $1.concat())
} else {
var $2:Array = this.newReverseArray($1);
if (this.isdatareplicating) {
this.datareplQ.push($2, $0)
} else if (this.istrickling) {
this.tricklingQ.push($0, $2)
} else {
this.makeQ.push($0, $2);
this.checkUpdate()
}}}function enableDataReplicationQueuing ($0:*):void {
if (this.isdatareplicating) {
this.dataQ.push(this.datareplQ)
} else {
this.isdatareplicating = true
};
this.datareplQ = []
}function clearDataReplicationQueue ($0:*):void {
var $1:Array = this.datareplQ;
if (this.dataQ.length > 0) {
this.datareplQ = this.dataQ.pop()
} else {
this.isdatareplicating = false;
this.datareplQ = null
};
var $2:LzNode = $0.cloneParent;
var $3:Array = this.makeQ;
var $4:int = $3.length;
var $5:int = $4;
for (var $6:int = 0;$6 < $4;$6 += 2) {
if ($3[$6].parent === $2) {
$5 = $6;
break
}};
$1.push(0, $5);
$1.reverse();
$3.splice.apply($3, $1);
this.checkUpdate()
}function newReverseArray ($0):Array {
var $1:int = $0.length;
var $2:Array = Array($1);
for (var $3:int = 0, $4:int = $1 - 1;$3 < $1;) {
$2[$3++] = $0[$4--]
};
return $2
}function checkUpdate ():void {
if (!(this.isUpdating || this.halted)) {
this.checkQDel.register(lz.Idle, "onidle");
this.isUpdating = true
}}function checkQ ($0 = null):void {
if (!this.makeQ.length) {
if (!this.tricklingQ.length) {
if (!this.trickleQ.length) {
this.checkQDel.unregisterAll();
this.isUpdating = false;
return
} else {
var $1:LzNode = this.trickleQ.shift();
var $2:Array = this.trickleQ.shift();
this.tricklingQ.push($1, this.newReverseArray($2))
}};
this.istrickling = true;
this.makeSomeViews(this.tricklingQ, this.trickletime);
this.istrickling = false
} else {
canvas.creatednodes += this.makeSomeViews(this.makeQ, this.timeout);
if (canvas.updatePercentCreatedEnabled) {
canvas.updatePercentCreated()
}}}function makeSomeViews ($0:Array, $1:Number):int {
var $2:Number = new Date().getTime();
var $3:int = 0;
while (new Date().getTime() - $2 < $1 && $0.length) {
var $4:int = $0.length;
var $5:Array = $0[$4 - 1];
var $6:LzNode = $0[$4 - 2];
var $7:Boolean = false;
if ($6["__LZdeleted"] || $5[0] && $5[0]["__LZdeleted"]) {
$0.length -= 2;
continue
};
try {
while (new Date().getTime() - $2 < $1) {
if ($4 != $0.length) {
break
};
if (!$5.length) {
$7 = true;
break
};
var $8:Object = $5.pop();
if ($8) {
$6.makeChild($8, true);
$3++
}}}
finally {};
if ($7) {
$0.length = $4 - 2;
$6.__LZinstantiationDone()
}};
return $3
}function trickleInstantiate ($0:LzNode, $1:Array):void {
this.trickleQ.push($0, $1);
this.checkUpdate()
}function createImmediate ($0:LzNode, $1:Array):void {
var $2:Array = this.newReverseArray($1);
var $3:Boolean = this.isimmediate;
this.isimmediate = true;
this.makeSomeViews([$0, $2], Infinity);
this.isimmediate = $3
}function completeTrickle ($0:LzNode):void {
if (this.tricklingQ[0] == $0) {
var $1:Boolean = this.isimmediate;
this.isimmediate = true;
this.makeSomeViews(this.tricklingQ, Infinity);
this.isimmediate = $1;
this.tricklingQ = []
} else {
var $2:Array = this.trickleQ;
var $3:int = $2.length;
for (var $4:int = 0;$4 < $3;$4 += 2) {
if ($2[$4] == $0) {
var $5:Array = $2[$4 + 1];
$2.splice($4, 2);
this.createImmediate($0, $5);
return
}}}}function halt ():void {
this.isUpdating = false;
this.halted = true;
this.checkQDel.unregisterAll()
}function resume ():void {
this.halted = false;
this.checkUpdate()
}function drainQ ($0:Number):Boolean {
var $1:Number = this.timeout;
var $2:Number = this.trickletime;
var $3:Boolean = this.halted;
this.timeout = $0;
this.trickletime = $0;
this.halted = false;
this.isUpdating = true;
this.checkQ();
this.halted = $3;
this.timeout = $1;
this.trickletime = $2;
return !this.isUpdating
}}
}
