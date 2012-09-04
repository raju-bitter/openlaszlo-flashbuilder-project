package {
dynamic class LzReplicationManager extends LzDatapath {
var asyncnew:Boolean = true;var initialnodes:Array;var clonePool:Array;var cloneClass;var cloneParent:LzNode;var cloneAttrs:Object;var cloneChildren:Array;var hasdata:Boolean;var orderpath:String;var comparator:Function;var __LZxpathconstr:Function = null;var __LZxpathdepend:Function = null;var visible:Boolean = true;var __LZpreventXPathUpdate:Boolean = false;var nodes:Array;var clones:Array;var __LZdataoffset:int = 0;var onnodes:LzDeclaredEventClass = LzDeclaredEvent;var onclones:LzDeclaredEventClass = LzDeclaredEvent;var onvisible:LzDeclaredEventClass = LzDeclaredEvent;function LzReplicationManager ($0, $1, $2:* = null, $3:* = null) {
super($0, $1, $2, $3)
}protected function getDefaultPooling ():Boolean {
return false
}override function construct ($0, $1) {
this.pooling = this.getDefaultPooling();
this.__LZtakeDPSlot = false;
this.datacontrolsvisibility = false;
var $2:LzNode = $0.immediateparent;
this.classroot = $2.classroot;
if ($2 === canvas) {
this.nodes = [];
this.clones = [];
this.clonePool = [];
return
};
this.datapath = this;
var $3:String = $2.name;
if ($3 != null) {
$1.name = $3;
$2.immediateparent[$3] = null;
$2.parent[$3] = null
};
var $4:Function = $2.$lzc$bind_id;
if ($4 != null) {
$4.call(null, $2, false);
$2.$lzc$bind_id = null;
this.$lzc$bind_id = $4;
$4.call(null, this)
};
var $5:Function = $2.$lzc$bind_name;
if ($5 != null) {
$5.call(null, $2, false);
$2.$lzc$bind_name = null;
this.$lzc$bind_name = $5;
$5.call(null, this)
};
$1.xpath = LzNode._ignoreAttribute;
if ($0.sortpath != null) {
$1.sortpath = $0.sortpath
};
if ($0.sortorder != null || $0.sortorder) {
$1.sortorder = $0.sortorder
};
this.initialnodes = $0.storednodes;
if ($0.__LZspecialDotDot) {
this.__LZspecialDotDot = true;
if ($0.__LZdotdotCheckDel) {
$0.__LZdotdotCheckDel.unregisterAll()
};
$0.__LZspecialDotDot = false
};
super.construct($2.parent, $1);
if ($1.name != null && $2.parent != $2.immediateparent) {
$2.immediateparent[$1.name] = this
};
this.xpath = $0.xpath;
this.parsedPath = $0.parsedPath;
this.cloneClass = $2.constructor;
this.cloneParent = $2.parent;
var $6:Object = new LzInheritedHash($2._instanceAttrs);
$6.datapath = LzNode._ignoreAttribute;
$6.$datapath = {"class": lz.datapath};
$6.$datapath.attrs = {datacontrolsvisibility: $0.datacontrolsvisibility, __LZmanager: this};
delete $6.id;
delete $6.name;
delete $6.$lzc$bind_id;
delete $6.$lzc$bind_name;
this.cloneAttrs = $6;
if ($0.datacontrolsvisibility) {
this.visible = true
} else {
if (!$2.isinited) {
var $7:* = this.__LZgetInstanceAttr($2, "visible");
if (typeof $7 == "boolean" || $7 is Boolean) {
this.visible = $7
} else {
this.visible = $2.visible
}} else {
this.visible = $2.visible
}};
if ($1.pooling != null) {
this.pooling = $1.pooling
};
var $8:* = this.__LZgetInstanceAttr($2, "datapath");
if ($8 is LzAlwaysExpr) {
var $9:LzAlwaysExpr = $8 as LzAlwaysExpr;
this.__LZxpathconstr = $2[$9.methodName];
this.__LZxpathdepend = $2[$9.dependenciesName];
this.__LZpreventXPathUpdate = true;
this.applyConstraintExpr(new LzAlwaysExpr("__LZxpathconstr", "__LZxpathdepend"));
this.__LZpreventXPathUpdate = false;
if (this.pooling) {
$2.releaseConstraintMethod($9.methodName)
}} else {
var $a:* = this.__LZgetInstanceAttr($0, "xpath");
if ($a is LzAlwaysExpr) {
var $b:LzRefNode = new LzRefNode(this);
var $c:LzAlwaysExpr = $a as LzAlwaysExpr;
$b.__LZxpathconstr = $0[$c.methodName];
$b.__LZxpathdepend = $0[$c.dependenciesName];
this.__LZpreventXPathUpdate = true;
$b.applyConstraintExpr(new LzAlwaysExpr("__LZxpathconstr", "__LZxpathdepend"));
this.__LZpreventXPathUpdate = false;
if (this.pooling) {
$0.releaseConstraintMethod($c.methodName)
}}};
this.__LZsetCloneAttrs();
if ($2._instanceChildren) {
this.cloneChildren = $2._instanceChildren.concat()
} else {
this.cloneChildren = []
};
var $d:* = $0.context;
this.clones = [];
this.clonePool = [];
if (this.pooling) {
$0.$lzc$set___LZmanager(this);
this.clones.push($2);
$2.immediateparent.addSubview($2)
} else {
this.destroyClone($2)
};
this.setDataContext($d, $d instanceof LzDatapointer)
}function __LZgetInstanceAttr ($0:LzNode, $1:String):* {
var $2:Object = $0._instanceAttrs;
if ($2 && ($1 in $2)) {
return $2[$1]
} else {
var $3:Object = $0["constructor"].attributes;
if ($3 && ($1 in $3)) {
return $3[$1]
}};
return void 0
}function __LZsetCloneAttrs ():void {}override function __LZapplyArgs ($0:Object, $1) {
super.__LZapplyArgs($0, $1);
if (this.__LZdeleted) {
return
};
this.__LZHandleMultiNodes(this.initialnodes);
this.initialnodes = null;
if (this.visible == false) {
this.$lzc$set_visible(false)
}}override function setDataContext ($0, $1:Boolean = false):void {
if ($0 == null && this.immediateparent != null && this.immediateparent["datapath"] != null) {
$0 = this.immediateparent.datapath;
$1 = true
};
super.setDataContext($0, $1)
}function getCloneNumber ($0:int):LzNode {
return this.clones[$0]
}override function __LZHandleNoNodes ():void {
this.nodes = [];
var $0:Array = this.clones;
while ($0.length) {
if (this.pooling) {
this.poolClone()
} else {
var $1:LzNode = $0.pop();
this.destroyClone($1)
}}}override function __LZHandleSingleNode ($0):void {
this.__LZHandleMultiNodes([$0])
}override function __LZHandleMultiNodes ($0:Array):LzReplicationManager {
var $1:Array = this.parent && this.parent.layouts ? this.parent.layouts : [];
for (var $2:int = 0;$2 < $1.length;++$2) {
$1[$2].lock()
};
this.hasdata = true;
var $3:Array = this.nodes;
this.nodes = $0;
if (this.onnodes.ready) this.onnodes.sendEvent(this.nodes);
if (this.__LZspecialDotDot) this.__LZsetupDotDot($0[0]);
if (this.orderpath != null && this.nodes) {
this.nodes = this.mergesort(this.nodes, 0, this.nodes.length - 1)
};
this.__LZadjustVisibleClones($3, true);
var $4:int = this.clones.length;
for (var $2:int = 0;$2 < $4;$2++) {
var $5:LzNode = this.clones[$2];
var $6:int = $2 + this.__LZdataoffset;
$5.clonenumber = $6;
if (this.nodes) {
$5.datapath.setClonePointer(this.nodes[$6])
};
if ($5.onclonenumber.ready) $5.onclonenumber.sendEvent($6)
};
if (this.onclones.ready) this.onclones.sendEvent(this.clones);
for (var $2:int = 0;$2 < $1.length;++$2) {
$1[$2].unlock()
};
return null
}function __LZadjustVisibleClones ($0:Array, $1:Boolean):void {
var $2:int = this.__LZdiffArrays($0, this.nodes);
if (!this.pooling) {
while (this.clones.length > $2) {
var $3:LzNode = this.clones.pop();
this.destroyClone($3)
}};
lz.Instantiator.enableDataReplicationQueuing(this);
while (this.nodes && this.nodes.length > this.clones.length) {
var $4:LzNode = this.getNewClone();
if (!$4) break;
this.clones.push($4)
};
lz.Instantiator.clearDataReplicationQueue(this);
while (this.nodes && this.nodes.length < this.clones.length) {
this.poolClone()
}}function mergesort ($0:Array, $1:int, $2:int):Array {
if ($1 < $2) {
var $3:int = $1 + Math.floor(($2 - $1) / 2);
var $4:Array = this.mergesort($0, $1, $3);
var $5:Array = this.mergesort($0, $3 + 1, $2)
} else if ($0.length == 0) {
return []
} else {
return [$0[$1]]
};
var $6:Array = [];
var $7:int = 0;
var $8:int = 0;
var $9:int = $4.length;
var $a:int = $5.length;
while ($7 < $9 && $8 < $a) {
if (this.orderf($5[$8], $4[$7]) == 1) {
$6.push($5[$8++])
} else {
$6.push($4[$7++])
}};
while ($7 < $9) $6.push($4[$7++]);
while ($8 < $a) $6.push($5[$8++]);
return $6
}function orderf ($0, $1):int {
var $2:String = this.orderpath;
this.p = $0;
var $3:* = this.xpathQuery($2);
this.p = $1;
var $4:* = this.xpathQuery($2);
this.p = null;
if ($3 == null || $3 == "") $3 = "\n";
if ($4 == null || $4 == "") $4 = "\n";
return this.comparator($3, $4)
}function ascDict ($0:String, $1:String):int {
if ($0.toLowerCase() < $1.toLowerCase()) {
return 1
} else {
return 0
}}function descDict ($0:String, $1:String):int {
if ($0.toLowerCase() > $1.toLowerCase()) {
return 1
} else {
return 0
}}override function setOrder ($0:String, $1:* = null):void {
this.orderpath = null;
if ($1 != null) {
this.setComparator($1)
};
this.orderpath = $0;
if (this.nodes && this.nodes.length) {
this.__LZHandleMultiNodes(this.nodes)
}}override function setComparator ($0:*):void {
if ($0 == "descending") {
$0 = this.descDict
} else if ($0 == "ascending") {
$0 = this.ascDict
} else if ($0 is Function) {};
this.comparator = $0;
if (this.orderpath != null && this.nodes && this.nodes.length) {
this.__LZHandleMultiNodes(this.nodes)
}}function getNewClone ($0 = null):LzNode {
if (!this.cloneParent) {
return null
};
if (this.clonePool.length) {
var $1:LzNode = this.reattachClone(this.clonePool.pop())
} else {
var $1:LzNode = new (this.cloneClass)(this.cloneParent, this.cloneAttrs, this.cloneChildren, $0 == null ? this.asyncnew : !$0)
};
if (this.visible == false) $1.$lzc$set_visible(false);
return $1
}function poolClone ():void {
var $0:LzView = this.clones.pop();
this.detachClone($0);
this.clonePool.push($0)
}function destroyClone ($0:LzNode):void {
$0.destroy()
}override function $lzc$set_datapath ($0) {
this.setXPath($0)
}override function setXPath ($0:String):Boolean? {
if (this.__LZpreventXPathUpdate) return false;
return super.setXPath($0)
}function handleDeletedNode ($0:int):void {
var $1:LzView = this.clones[$0];
if (this.pooling) {
this.detachClone($1);
this.clonePool.push($1)
} else {
this.destroyClone($1)
};
this.nodes.splice($0, 1);
this.clones.splice($0, 1)
}function getCloneForNode ($0:LzDataElement, $1:Boolean = false):LzNode {
var $2:Array = this.clones;
var $3:int = $2.length;
for (var $4:int = 0;$4 < $3;$4++) {
if ($2[$4].datapath.p == $0) {
return $2[$4]
}};
return null
}override function toString () {
return "ReplicationManager in " + this.immediateparent
}function $lzc$set_visible ($0:Boolean):void {
this.visible = $0;
var $1:Array = this.clones;
var $2:int = $1.length;
for (var $3:int = 0;$3 < $2;$3++) {
$1[$3].$lzc$set_visible($0)
};
if (this.onvisible.ready) this.onvisible.sendEvent($0)
}override function __LZcheckChange ($0:Object):Boolean {
this.p = this.nodes[0];
var $1:Boolean = super.__LZcheckChange($0);
this.p = null;
if (!$1) {
var $2 = $0.who;
var $3:Array = this.clones;
var $4:int = $3.length;
for (var $5:int = 0;$5 < $4;$5++) {
var $6:LzNode = $3[$5];
var $7:LzDatapath = $6.datapath;
if ($7.__LZneedsOpUpdate($0)) {
$7.__LZsetData()
};
if ($2.childOfNode($7.p, true)) {
if ($7.onDocumentChange.ready) $7.onDocumentChange.sendEvent($0)
}}};
return false
}override function __LZneedsOpUpdate ($0:Object? = null):Boolean {
return false
}override function getContext ($0 = null):* {
return this.nodes[0]
}function detachClone ($0:LzView):void {
if ($0.isdetatchedclone) return;
$0.$lzc$set_visible(false);
$0.addedToParent = false;
var $1:Array = $0.immediateparent.subviews;
for (var $2:int = $1.length - 1;$2 >= 0;$2--) {
if ($1[$2] == $0) {
$1.splice($2, 1);
break
}};
$0.datapath.__LZtrackDel.unregisterAll();
var $3:LzDeclaredEventClass = $0.immediateparent.onremovesubview;
if ($3.ready) $3.sendEvent($0);
$0.isdetatchedclone = true;
$0.datapath.p = null
}function reattachClone ($0:LzView):LzView {
if (!$0.isdetatchedclone) return $0;
$0.immediateparent.addSubview($0);
$0.$lzc$set_visible(this.visible);
$0.isdetatchedclone = false;
return $0
}function __LZdiffArrays ($0:Array, $1:Array):int {
var $2:int = 0;
var $3:int = $0 ? $0.length : 0;
var $4:int = $1 ? $1.length : 0;
while ($2 < $3 && $2 < $4) {
if ($0[$2] != $1[$2]) {
return $2
};
$2++
};
return $2
}override function updateData () {
this.__LZupdateData()
}override function __LZupdateData ($0:Boolean = false):void {
var $1:Array = this.clones;
var $2:int = $1.length;
for (var $3:int = 0;$3 < $2;$3++) {
$1[$3].datapath.updateData()
}}}
}
