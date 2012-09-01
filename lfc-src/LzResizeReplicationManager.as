package {
dynamic class LzResizeReplicationManager extends LzLazyReplicationManager {
var datasizevar:String;var __LZresizeupdating:Boolean;function LzResizeReplicationManager ($0, $1, $2:* = null, $3:* = null) {
super($0, $1, $2, $3)
}protected override function getDefaultPooling ():Boolean {
return false
}override function construct ($0, $1) {
super.construct($0, $1);
this.datasizevar = "$" + this.getUID() + "track"
}var __LZHandleCloneResize = function ($0:Number):void {
var $1 = this.datapath.p;
if ($1) {
var $2:LzResizeReplicationManager = this.cloneManager as LzResizeReplicationManager;
var $3:String = $2.datasizevar;
var $4:Number = $1.getUserData($3) || $2.viewsize;
if ($0 != $4) {
$1.setUserData($3, $0);
$2.__LZadjustVisibleClones(null, false)
}}};override function __LZsetCloneAttrs ():void {
super.__LZsetCloneAttrs();
var $0:Object = this.cloneAttrs;
$0.__LZHandleCloneResize = this.__LZHandleCloneResize;
if (!$0["$delegates"]) {
$0.$delegates = []
};
$0.$delegates.push("on" + (this.axis == "y" ? "height" : "width"), "__LZHandleCloneResize", null)
}function getPositionByNode ($0):Number? {
var $1:Number = -this.spacing;
var $2;
if (this.nodes != null) {
for (var $3:int = 0;$3 < this.nodes.length;$3++) {
$2 = this.nodes[$3];
if ($0 == this.nodes[$3]) {
return $1 + this.spacing
};
$1 += this.spacing + ($2.getUserData(this.datasizevar) || this.viewsize)
}};
return undefined
}function __LZreleaseClone ($0:LzView):void {
this.detachClone($0);
this.clonePool.push($0)
}override function __LZadjustVisibleClones ($0:Array, $1:Boolean):void {
if (!this.mask["hasset" + this.sizeAxis]) return;
if (this.__LZresizeupdating) return;
this.__LZresizeupdating = true;
var $2:int = this.nodes != null ? this.nodes.length : 0;
var $3:int = Math.floor(-this.cloneimmediateparent[this.axis]);
if (0 > $3) $3 = 0;
var $4:Number = this.mask[this.sizeAxis];
var $5:int = -1;
var $6:int = this.__LZdataoffset;
if ($1) {
while (this.clones.length) this.poolClone();
var $7:Array = null;
var $8:int = 0
} else {
var $7:Array = this.clones;
var $8:int = $7.length
};
this.clones = [];
var $9:Number = -this.spacing;
var $a:Boolean = false;
var $b:int = -1;
var $c:Number;
var $d:Boolean = true;
for (var $e:int = 0;$e < $2;$e++) {
var $f = this.nodes[$e];
var $g:* = $f.getUserData(this.datasizevar);
var $h:Number = $g == null ? this.viewsize : $g;
$9 += this.spacing;
if (!$a && $5 == -1 && $9 - $3 + $h >= 0) {
$d = $e != 0;
$a = true;
$c = $9;
$5 = $e;
var $i = $e - $6;
$i = $i > $8 ? $8 : $i;
if ($i > 0) {
for (var $j:int = 0;$j < $i;$j++) {
var $k:LzView = $7[$j];
this.__LZreleaseClone($k)
}}} else if ($a && $9 - $3 > $4) {
$a = false;
$b = $e - $5;
var $l:int = $e - $6;
$l = $l < 0 ? 0 : $l;
if ($l < $8) {
for (var $j:int = $l;$j < $8;$j++) {
var $k:LzView = $7[$j];
this.__LZreleaseClone($k)
}}};
if ($a) {
if ($e >= $6 && $e < $6 + $8) {
var $m:LzView = $7[$e - $6]
} else {
var $m:LzView = null
};
this.clones[$e - $5] = $m
};
$9 += $h
};
var $n:Number = $c;
if ($d) $n += this.spacing;
for (var $e:int = 0;$e < this.clones.length;$e++) {
var $f = this.nodes[$e + $5];
var $m:LzView = this.clones[$e] as LzView;
if (!$m) {
$m = this.getNewClone() as LzView;
$m.clonenumber = $e + $5;
$m.datapath.setClonePointer($f);
if ($m.onclonenumber.ready) $m.onclonenumber.sendEvent($e + $5);
this.clones[$e] = $m
};
this.clones[$e] = $m;
$m.setAttribute(this.axis, $n);
var $g:* = $f.getUserData(this.datasizevar);
var $h:Number = $g == null ? this.viewsize : $g;
if ($m[this.sizeAxis] != $h) {
$m.setAttribute(this.sizeAxis, $h)
};
$n += $h + this.spacing
};
this.__LZdataoffset = $5;
this.cloneimmediateparent.setAttribute(this.sizeAxis, $9);
this.__LZresizeupdating = false
}}
}
