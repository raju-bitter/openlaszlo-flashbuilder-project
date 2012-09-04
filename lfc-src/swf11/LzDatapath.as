package {
dynamic class LzDatapath extends LzDatapointer {
static var tagname:String = "datapath";static var __LZCSSTagSelectors:Array = ["datapath", "datapointer", "node"];static var attributes:Object = new LzInheritedHash(LzDatapointer.attributes);var datacontrolsvisibility:Boolean = true;function $lzc$set_datacontrolsvisibility ($0:Boolean):void {
this.datacontrolsvisibility = $0
}var __LZtakeDPSlot:Boolean = true;var storednodes:Array = null;var __LZneedsUpdateAfterInit:Boolean = false;var __LZdepChildren:Array = null;var sel:Boolean = false;var __LZisclone:Boolean = false;var pooling:Boolean = false;var replication:String;var axis:String = "y";var spacing:Number = 0;var sortpath:String;function $lzc$set_sortpath ($0:String):void {
this.setOrder($0)
}function setOrder ($0:String, $1:* = null):void {
if (this.__LZisclone) {
this.immediateparent.cloneManager.setOrder($0, $1)
} else {
this.sortpath = $0;
if ($1 != null) {
this.sortorder = $1
}}}var sortorder:* = "ascending";function $lzc$set_sortorder ($0:*):void {
this.setComparator($0)
}function setComparator ($0:*):void {
if (this.__LZisclone) {
this.immediateparent.cloneManager.setComparator($0)
} else {
this.sortorder = $0
}}function LzDatapath ($0, $1:* = null, $2:* = null, $3:* = null) {
super($0, $1, $2, $3)
}override function construct ($0, $1) {
this.rerunxpath = true;
super.construct($0, $1);
if ($1.datacontrolsvisibility != null) {
this.datacontrolsvisibility = $1.datacontrolsvisibility
};
if (this.__LZtakeDPSlot) {
this.immediateparent.datapath = this;
var $2:LzDatapath = this.immediateparent.searchParents("datapath").datapath;
if ($2 != null) {
var $3:Array = $2.__LZdepChildren;
if ($3 != null) {
$2.__LZdepChildren = [];
for (var $4:int = $3.length - 1;$4 >= 0;$4--) {
var $5:* = $3[$4];
if ($5 !== this && !($5 is LzDataAttrBind) && $5.immediateparent != this.immediateparent && $5.immediateparent.childOf(this.immediateparent)) {
$5.setDataContext(this, true)
} else {
$2.__LZdepChildren.push($5)
}}}}}}override function __LZHandleMultiNodes ($0:Array):LzReplicationManager {
var $1:Class;
if (this.replication == "lazy") {
$1 = LzLazyReplicationManager
} else if (this.replication == "resize") {
$1 = LzResizeReplicationManager
} else {
$1 = LzReplicationManager
};
this.storednodes = $0;
var $2:LzReplicationManager = new $1(this, this._instanceAttrs);
this.storednodes = null;
return $2
}function setNodes ($0:Array):void {
var $1:LzDatapath = this.__LZHandleMultiNodes($0);
if (!$1) $1 = this;
$1.__LZsetTracking(null);
if ($0) {
for (var $2:int = 0;$2 < $0.length;$2++) {
var $3:LzDataElement = $0[$2];
var $4:LzDataElementMixin = $3.ownerDocument;
$1.__LZsetTracking($4, true, $3 != $4)
}}}override function __LZsendUpdate ($0:Boolean = false, $1:Boolean = false):Boolean {
var $2:Boolean = this.__LZpchanged;
if (!super.__LZsendUpdate($0, $1)) {
return false
};
if (this.immediateparent.isinited) {
this.__LZApplyData($2)
} else {
this.__LZneedsUpdateAfterInit = true
};
return true
}function __LZApplyDataOnInit ():void {
if (this.__LZneedsUpdateAfterInit) {
this.__LZApplyData();
this.__LZneedsUpdateAfterInit = false
}}function __LZApplyData ($0:Boolean = false):void {
var $1:LzNode = this.immediateparent;
if (this.datacontrolsvisibility) {
if ($1 is LzView) {
var $2 = $1 as LzView;
$2.__LZvizDat = this.p != null;
$2.__LZupdateShown()
}};
var $3:Boolean = $0 || $1.data != this.data || this.parsedPath && this.parsedPath.operator == "attributes";
this.data = this.data == null ? null : this.data;
$1.data = this.data;
if ($3) {
if ($1.ondata.ready) $1.ondata.sendEvent(this.data);
var $4:LzParsedPath = this.parsedPath;
if ($4 && ($4.operator != null || $4.aggOperator != null)) {
$1.applyData(this.data)
}}}override function setDataContext ($0, $1:Boolean = false):void {
if ($0 == null && this.immediateparent != null) {
$0 = this.immediateparent.searchParents("datapath").datapath;
$1 = true
};
if ($0 == this.context) return;
if ($1) {
if ($0.__LZdepChildren == null) {
$0.__LZdepChildren = [this]
} else {
$0.__LZdepChildren.push(this)
}} else {
if (this.context && this.context is LzDatapath) {
var $2:Array = this.context.__LZdepChildren;
if ($2) {
for (var $3:int = 0;$3 < $2.length;$3++) {
if ($2[$3] === this) {
$2.splice($3, 1);
break
}}}}};
super.setDataContext($0)
}override function destroy () {
if (this.__LZdeleted) return;
this.__LZupdateLocked = true;
var $0:* = this.context;
if ($0 && !$0.__LZdeleted && $0 is LzDatapath) {
var $1:Array = $0.__LZdepChildren;
if ($1 != null) {
for (var $2:int = 0;$2 < $1.length;$2++) {
if ($1[$2] === this) {
$1.splice($2, 1);
break
}}}};
var $3:LzNode = this.immediateparent;
if (!$3.__LZdeleted) {
var $4 = this.__LZdepChildren;
if ($4 != null && $4.length > 0) {
var $5:LzDatapath = $3.searchParents("datapath").datapath;
for (var $2:int = 0;$2 < $4.length;$2++) {
$4[$2].setDataContext($5, true)
};
this.__LZdepChildren = null
}};
if ($3.datapath === this) {
$3.datapath = null
};
super.destroy()
}override function updateData () {
this.__LZupdateData()
}function __LZupdateData ($0:Boolean = false):void {
if (!$0 && this.p) {
this.p.__LZlockFromUpdate(this)
};
var $1:String = this.parsedPath ? this.parsedPath.operator : null;
if ($1 != null) {
var $2 = this.immediateparent.updateData();
if ($2 !== void 0) {
if ($1 == "name") {
this.setNodeName($2)
} else if ($1 == "text") {
this.setNodeText($2)
} else if ($1 == "attributes") {
this.p.$lzc$set_attributes($2)
} else {
this.setNodeAttribute($1.substring(11), $2)
}}};
var $3:Array = this.__LZdepChildren;
if ($3 != null) {
for (var $4:int = 0;$4 < $3.length;$4++) {
$3[$4].__LZupdateData(true)
}};
if (!$0 && this.p) {
this.p.__LZunlockFromUpdate(this)
}}override function toString () {
return "Datapath for " + this.immediateparent
}override function __LZcheckChange ($0:Object):Boolean {
if (!super.__LZcheckChange($0)) {
if ($0.who.childOfNode(this.p, true)) {
if (this.onDocumentChange.ready) this.onDocumentChange.sendEvent($0)
}};
return false
}override function __LZsetTracking ($0, $1:Boolean = false, $2:Boolean = false):void {
if (!$0 || !$1) {
return super.__LZsetTracking($0, true)
};
var $3:Array = this.__LZtracking;
var $4:LzDelegate = this.__LZtrackDel;
if ($2) {
var $5:int = $3.length;
for (var $6:int = 0;$6 < $5;$6++) {
if ($3[$6] === $0) {
return
}}};
if (!$4) {
this.__LZtrackDel = $4 = new LzDelegate(this, "__LZcheckChange")
};
$3.push($0);
$4.register($0, "onDocumentChange")
}function $lzc$set___LZmanager ($0:LzReplicationManager):void {
this.__LZisclone = true;
this.immediateparent.cloneManager = $0;
this.parsedPath = $0.parsedPath;
this.xpath = $0.xpath;
this.setDataContext($0)
}function setClonePointer ($0):void {
var $1:Boolean = this.p != $0;
this.p = $0;
if ($1) {
if ($0 && this.sel != $0.sel) {
this.sel = $0.sel || false;
this.immediateparent.setSelected(this.sel)
};
this.__LZpchanged = true;
this.__LZsetData()
}}override function setSelected ($0) {
this.p.sel = $0;
this.sel = $0;
this.immediateparent.setSelected($0)
}override function __LZgetLast ():int {
var $0:* = this.context;
if (this.__LZisclone) {
return $0.nodes.length
} else if (this.p == $0.getContext() && $0 is LzDatapointer) {
return $0.__LZgetLast()
} else {
return 1
}}override function __LZgetPosition ():int {
if (this.__LZisclone) {
return this.immediateparent.clonenumber + 1
} else {
var $0:* = this.context;
if (this.p == $0.getContext() && $0 is LzDatapointer) {
return $0.__LZgetPosition()
} else {
return 1
}}}}
}
