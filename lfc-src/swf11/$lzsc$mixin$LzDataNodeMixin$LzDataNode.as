package {
class $lzsc$mixin$LzDataNodeMixin$LzDataNode extends LzDataNode implements LzDataNodeMixin {
var onownerDocument:LzDeclaredEventClass = LzDeclaredEvent;var onDocumentChange:LzDeclaredEventClass = LzDeclaredEvent;var onparentNode:LzDeclaredEventClass = LzDeclaredEvent;var onchildNode:LzDeclaredEventClass = LzDeclaredEvent;var onchildNodes:LzDeclaredEventClass = LzDeclaredEvent;var onattributes:LzDeclaredEventClass = LzDeclaredEvent;var onnodeName:LzDeclaredEventClass = LzDeclaredEvent;var nodeType:int;var parentNode = null;var ownerDocument:LzDataElementMixin;var childNodes:Array = null;var __LZo:int = -1;var __LZcoDirty:Boolean = true;var sel:Boolean = false;var __LZuserData:Object = null;var __LZuserHandler:Object = null;public function getParent () {
return this.parentNode
}public function getOffset ():int {
if (!this.parentNode) return 0;
if (this.parentNode.__LZcoDirty) this.parentNode.__LZupdateCO();
return this.__LZo
}public function getPreviousSibling () {
if (!this.parentNode) return null;
if (this.parentNode.__LZcoDirty) this.parentNode.__LZupdateCO();
return this.parentNode.childNodes[this.__LZo - 1]
}function $lzc$getPreviousSibling_dependencies ($0:*, $1:*):Array {
return [this.parentNode, "childNodes", this, "parentNode"]
}public function getNextSibling () {
if (!this.parentNode) return null;
if (this.parentNode.__LZcoDirty) this.parentNode.__LZupdateCO();
return this.parentNode.childNodes[this.__LZo + 1]
}function $lzc$getNextSibling_dependencies ($0:*, $1:*):Array {
return [this.parentNode, "childNodes", this, "parentNode"]
}function childOfNode ($0, $1:Boolean = false):Boolean {
var $2 = $1 ? this : this.parentNode;
while ($2) {
if ($2 === $0) return true;
$2 = $2.parentNode
};
return false
}override function childOf ($0, $1 = false) {
return this.childOfNode($0, $1)
}function $lzc$set_ownerDocument ($0:LzDataElementMixin):void {
this.ownerDocument = $0;
if (this.childNodes) {
for (var $1:int = 0;$1 < this.childNodes.length;$1++) {
this.childNodes[$1].$lzc$set_ownerDocument($0)
}};
if (this.onownerDocument.ready) {
this.onownerDocument.sendEvent($0)
}}public function cloneNode ($0:Boolean = false) {
return undefined
}public function serialize ():String {
return undefined
}function __LZlockFromUpdate ($0:LzDatapath):void {
this.ownerDocument.__LZdoLock($0)
}function __LZunlockFromUpdate ($0:LzDatapath):void {
this.ownerDocument.__LZdoUnlock($0)
}public function setUserData ($0:String, $1:*, $2:* = null):* {
if (this.__LZuserData == null) {
this.__LZuserData = {}};
var $3:* = this.__LZuserData[$0];
if ($1 != null) {
this.__LZuserData[$0] = $1
} else if ($3 != null) {
delete this.__LZuserData[$0]
};
return $3 != null ? $3 : null
}public function getUserData ($0:String):* {
if (this.__LZuserData == null) {
return null
} else {
var $1:* = this.__LZuserData[$0];
return $1 != null ? $1 : null
}}function $lzsc$mixin$LzDataNodeMixin$LzDataNode () {
super()
}}
}
