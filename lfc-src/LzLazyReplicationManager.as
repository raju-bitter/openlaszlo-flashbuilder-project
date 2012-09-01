package {
dynamic class LzLazyReplicationManager extends LzReplicationManager {
var sizeAxis:String;var cloneimmediateparent:LzView;var updateDel:LzDelegate;var __LZoldnodelen:int;var viewsize:Number = 0;var totalsize:Number = 0;var mask:LzView = null;function LzLazyReplicationManager ($0, $1, $2:* = null, $3:* = null) {
super($0, $1, $2, $3)
}protected override function getDefaultPooling ():Boolean {
return true
}override function construct ($0, $1) {
if ($1.pooling != null) {
$1.pooling = true
};
if ($1.axis != null) {
this.axis = $1.axis
};
this.sizeAxis = this.axis == "x" ? "width" : "height";
super.construct($0, $1);
this.mask = $0.immediateparent.immediateparent.mask;
var $2:Object;
if (this.cloneAttrs.options != null) {
$2 = new LzInheritedHash(this.cloneAttrs.options);
$2["ignorelayout"] = true
} else {
$2 = {ignorelayout: true}};
var $3:LzView = this.clones[0];
if ($3) {
$3.setOption("ignorelayout", true);
var $4:Array = $3.immediateparent.layouts;
if ($4 != null) {
for (var $5:int = 0;$5 < $4.length;$5++) {
$4[$5].removeSubview($3)
}}};
this.cloneAttrs.options = $2;
var $6:LzView = this.getNewClone(true) as LzView;
this.cloneimmediateparent = $6.immediateparent;
if (this.initialnodes) {
$6.datapath.setClonePointer(this.initialnodes[1])
};
this.viewsize = $6[this.sizeAxis];
$6.datapath.setClonePointer(null);
this.clones.push($6);
if ($1.spacing == null) {
$1.spacing = 0
};
this.totalsize = this.viewsize + $1.spacing;
$6.setAttribute(this.axis, this.totalsize);
this.__LZdataoffset = 0;
this.updateDel = new LzDelegate(this, "__LZhandleUpdate");
this.updateDel.register(this.cloneimmediateparent, "on" + this.axis);
this.updateDel.register(this.mask, "on" + this.sizeAxis)
}function __LZhandleUpdate ($0):void {
this.__LZadjustVisibleClones(null, null)
}override function __LZsetCloneAttrs ():void {
var $0:Object;
if (this.cloneAttrs.options != null) {
$0 = new LzInheritedHash(this.cloneAttrs.options);
$0["ignorelayout"] = true
} else {
$0 = {ignorelayout: true}};
this.cloneAttrs.options = $0
}override function __LZHandleNoNodes ():void {
this.__LZHandleMultiNodes([])
}override function __LZadjustVisibleClones ($0:Array, $1:Boolean):void {
var $2:LzView = this.cloneimmediateparent;
var $3:Array = this.nodes;
var $4:String = this.axis;
var $5:String = this.sizeAxis;
var $6:Number = this.totalsize;
if ($3) {
var $7:int = $3.length;
if (this.__LZoldnodelen != $7) {
$2.setAttribute($5, $7 * $6 - this.spacing);
this.__LZoldnodelen = $7
}};
if (!(this.mask && this.mask["hasset" + $5])) return;
var $8:int = 0;
if ($6 != 0) {
$8 = Math.floor(-$2[$4] / $6);
if (0 > $8) $8 = 0
};
var $9:int = 0;
var $a:int = this.clones.length;
var $b:int = $8 - this.__LZdataoffset;
var $c:* = $8 * $6 + $2[$4];
var $d:int = 0;
if (typeof $c == "number") {
$d = 1 + Math.floor((this.mask[$5] - $c) / $6)
};
if ($3 != null) {
var $7:int = $3.length;
if ($d + $8 > $7) {
$d = $7 - $8
}};
if ($b == 0 && $d == $a) return;
lz.Instantiator.enableDataReplicationQueuing(this);
var $e:Array = this.clones;
this.clones = [];
for (var $f:int = 0;$f < $d;$f++) {
var $g:LzView = null;
if ($f + $b < 0) {
if ($d + $b < $a && $a > 0) {
$g = $e[--$a]
} else {
$g = this.getNewClone() as LzView
}} else if ($f + $b >= $a) {
if ($9 < $b && $9 < $a) {
$g = $e[$9++]
} else {
$g = this.getNewClone() as LzView
}};
if ($g) {
this.clones[$f] = $g;
$g.setAttribute($4, ($f + $8) * $6);
$g.clonenumber = $8 + $f;
if ($3) {
$g.datapath.setClonePointer($3[$8 + $f])
};
if ($g.onclonenumber.ready) $g.onclonenumber.sendEvent($f)
} else {
this.clones[$f] = $e[$f + $b]
}};
var $h:Array = this.clonePool;
while ($9 < $b && $9 < $a) {
var $i:LzView = $e[$9++];
this.detachClone($i);
$h.push($i)
};
while ($a > $d + $b && $a > 0) {
var $i:LzView = $e[--$a];
this.detachClone($i);
$h.push($i)
};
this.__LZdataoffset = $8;
lz.Instantiator.clearDataReplicationQueue(this)
}override function toString () {
return "Lazy clone manager in " + this.cloneimmediateparent
}override function getCloneForNode ($0:LzDataElement, $1:Boolean = false):LzNode {
var $2:LzView = super.getCloneForNode($0) as LzView || null;
if (!$2 && !$1) {
$2 = this.getNewClone() as LzView;
$2.datapath.setClonePointer($0);
this.detachClone($2);
this.clonePool.push($2)
};
return $2
}override function getCloneNumber ($0:int):LzNode {
return this.getCloneForNode(this.nodes[$0])
}}
}
