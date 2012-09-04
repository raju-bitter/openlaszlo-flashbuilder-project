package {
dynamic class LzDataAttrBind extends LzDatapointer {
function LzDataAttrBind ($0:LzDatapath, $1:String, $2:String, $3:String) {
super($0);
this.type = $3;
this.setAttr = $1;
this.pathparent = $0;
this.node = $0.immediateparent;
this.setXPath($2);
this.rerunxpath = true;
if ($0.__LZdepChildren == null) {
$0.__LZdepChildren = [this]
} else {
$0.__LZdepChildren.push(this)
}}var $pathbinding:Boolean = true;var setAttr:String;var pathparent:LzDatapath;var node:LzNode;var type:String;var __LZlast:int = -1;override function __LZsendUpdate ($0:Boolean = false, $1:Boolean = false):Boolean {
var $2:Boolean = this.__LZpchanged;
var $3:Boolean = super.__LZsendUpdate($0, $1);
if ($3) {
var $4:* = this.data;
var $5:LzNode = this.node;
var $6:String = this.setAttr;
if ($4 == null) {
$4 = null
};
var $7 = lz.Type.acceptTypeValue(this.type, $4, $5, $6);
if ($2 || $5[$6] !== $7 || !$5.inited || this.parsedPath.operator == "attributes") {
$5.setAttribute($6, $7)
}};
return $3
}override function destroy () {
if (this.__LZdeleted) return;
var $0:Array = this.pathparent.__LZdepChildren;
if ($0 != null) {
for (var $1:int = 0;$1 < $0.length;$1++) {
if ($0[$1] === this) {
$0.splice($1, 1);
break
}}};
super.destroy()
}override function setDataContext ($0, $1:Boolean = false):void {
super.setDataContext($0 || this.pathparent, $1)
}override function updateData () {
this.__LZupdateData()
}function __LZupdateData ($0:Boolean = false):void {
var $1 = this.parsedPath.operator;
if ($1 != null) {
var $2 = this.node.presentAttribute(this.setAttr, this.type);
if (this.data != $2) {
if ($1 == "name") {
this.setNodeName($2)
} else if ($1 == "text") {
this.setNodeText($2)
} else if ($1 == "attributes") {
this.p.$lzc$set_attributes($2)
} else {
this.setNodeAttribute($1.substring(11), $2)
}}}}override function __LZHandleMultiNodes ($0:Array):LzReplicationManager {
var $1:LzParsedPath = this.parsedPath;
if ($1 && $1.aggOperator == "last") {
this.__LZlast = $0.length;
this.__LZHandleSingleNode($0[0]);
return null
} else {
return super.__LZHandleMultiNodes($0)
}}override function __LZgetLast ():int {
return this.__LZlast != -1 ? this.__LZlast : super.__LZgetLast()
}override function runXPath ():Boolean {
this.__LZlast = -1;
return super.runXPath()
}override function toString () {
return "binder " + this.xpath
}}
}
