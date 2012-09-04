package {
class $lzsc$mixin$LzDataElementMixin$LzDataNodeMixin$LzNode extends $lzsc$mixin$LzDataNodeMixin$LzNode implements LzDataElementMixin {
var __LZchangeQ:Array = null;var __LZlocker:LzDatapath = null;var nodeName:String = null;var attributes:Object = null;public function insertBefore ($0, $1) {
if ($0 == null) {
return null
} else if ($1 == null) {
return this.appendChild($0)
} else {
var $2:int = this.__LZgetCO($1);
if ($2 >= 0) {
var $3:Boolean = $0 === $1;
if ($0.parentNode != null) {
if ($0.parentNode === this) {
if (!$3) {
var $4:int = this.__LZremoveChild($0);
if ($4 != -1 && $4 < $2) {
$2 -= 1
}}} else {
$0.parentNode.removeChild($0)
}};
if (!$3) {
this.__LZcoDirty = true;
this.childNodes.splice($2, 0, $0)
};
$0.$lzc$set_ownerDocument(this.ownerDocument);
$0.parentNode = this;
if ($0.onparentNode.ready) $0.onparentNode.sendEvent(this);
if (this.onchildNodes.ready) this.onchildNodes.sendEvent($0);
this.ownerDocument.handleDocumentChange("insertBefore", this, 0);
return $0
};
return null
}}public function replaceChild ($0, $1) {
if ($0 == null) {
return null
} else {
var $2:int = this.__LZgetCO($1);
if ($2 >= 0) {
var $3:Boolean = $0 === $1;
if ($0.parentNode != null) {
if ($0.parentNode === this) {
if (!$3) {
var $4:int = this.__LZremoveChild($0);
if ($4 != -1 && $4 < $2) {
$2 -= 1
}}} else {
$0.parentNode.removeChild($0)
}};
if (!$3) {
$0.__LZo = $2;
this.childNodes[$2] = $0
};
$0.$lzc$set_ownerDocument(this.ownerDocument);
$0.parentNode = this;
if ($0.onparentNode.ready) $0.onparentNode.sendEvent(this);
if (this.onchildNodes.ready) this.onchildNodes.sendEvent($0);
this.ownerDocument.handleDocumentChange("childNodes", this, 0, $0);
return $0
};
return null
}}public function removeChild ($0) {
var $1:int = this.__LZgetCO($0);
if ($1 >= 0) {
this.__LZcoDirty = true;
this.childNodes.splice($1, 1);
if (this.onchildNodes.ready) this.onchildNodes.sendEvent($0);
this.ownerDocument.handleDocumentChange("removeChild", this, 0, $0);
return $0
};
return null
}public function appendChild ($0) {
if ($0 == null) {
return null
} else {
if ($0.parentNode != null) {
if ($0.parentNode === this) {
this.__LZremoveChild($0)
} else {
$0.parentNode.removeChild($0)
}};
this.childNodes.push($0);
$0.__LZo = this.childNodes.length - 1;
$0.$lzc$set_ownerDocument(this.ownerDocument);
$0.parentNode = this;
if ($0.onparentNode.ready) $0.onparentNode.sendEvent(this);
if (this.onchildNodes.ready) this.onchildNodes.sendEvent($0);
this.ownerDocument.handleDocumentChange("appendChild", this, 0, $0);
return $0
}}public function hasChildNodes ():Boolean {
return this.childNodes.length > 0
}public override function cloneNode ($0:Boolean = false) {
var $1:LzDataElement = new LzDataElement(this.nodeName, this.attributes);
if ($0) {
var $2:Array = this.childNodes;
var $3:Array = [];
for (var $4:int = $2.length - 1;$4 >= 0;--$4) {
$3[$4] = $2[$4].cloneNode(true)
};
$1.$lzc$set_childNodes($3)
};
return $1
}public function getAttr ($0:String):String {
return this.attributes[$0]
}function $lzc$getAttr_dependencies ($0, $1):Array {
return [$1, "attributes"]
}public function setAttr ($0:String, $1:String):String {
this.attributes[$0] = $1;
if (this.onattributes.ready) this.onattributes.sendEvent($0);
this.ownerDocument.handleDocumentChange("attributes", this, 1, {name: $0, value: $1, type: "set"});
return $1
}public function removeAttr ($0:String):String {
var $1:String = this.attributes[$0];
delete this.attributes[$0];
if (this.onattributes.ready) this.onattributes.sendEvent($0);
this.ownerDocument.handleDocumentChange("attributes", this, 1, {name: $0, value: $1, type: "remove"});
return $1
}public function hasAttr ($0:String):Boolean {
return this.attributes[$0] != null
}function $lzc$hasAttr_dependencies ($0:*, $1:*):Array {
return [$1, "attributes"]
}public function getFirstChild () {
return this.childNodes[0]
}function $lzc$getFirstChild_dependencies ($0:*, $1:*):Array {
return [this, "childNodes"]
}public function getLastChild () {
return this.childNodes[this.childNodes.length - 1]
}function $lzc$getLastChild_dependencies ($0:*, $1:*):Array {
return [this, "childNodes"]
}function __LZgetCO ($0):int {
if ($0 != null) {
var $1:Array = this.childNodes;
if (!this.__LZcoDirty) {
var $2:int = $0.__LZo;
if ($1[$2] === $0) {
return $2
}} else {
for (var $2:int = $1.length - 1;$2 >= 0;--$2) {
if ($1[$2] === $0) {
return $2
}}}};
return -1
}function __LZremoveChild ($0):int {
var $1:int = this.__LZgetCO($0);
if ($1 >= 0) {
this.__LZcoDirty = true;
this.childNodes.splice($1, 1)
};
return $1
}function __LZupdateCO ():void {
var $0:Array = this.childNodes;
for (var $1:int = 0, $2:int = $0.length;$1 < $2;$1++) {
$0[$1].__LZo = $1
};
this.__LZcoDirty = false
}function $lzc$set_attributes ($0:Object):void {
var $1:Object = {};
for (var $2:String in $0) {
$1[$2] = $0[$2]
};
this.attributes = $1;
if (this.onattributes.ready) this.onattributes.sendEvent($1);
this.ownerDocument.handleDocumentChange("attributes", this, 1)
}function $lzc$set_childNodes ($0:Array):void {
if (!$0) $0 = [];
this.childNodes = $0;
if ($0.length > 0) {
var $1:Boolean = true;
var $2 = $0[0].parentNode;
if ($2 != null && $2 !== this && $2.childNodes === $0) {
$1 = false;
$2.$lzc$set_childNodes([])
};
for (var $3:int = 0;$3 < $0.length;$3++) {
var $4 = $0[$3];
if ($4) {
if ($1 && $4.parentNode != null) {
if ($4.parentNode !== this) {
$4.parentNode.removeChild($4)
}};
$4.$lzc$set_ownerDocument(this.ownerDocument);
$4.parentNode = this;
if ($4.onparentNode.ready) $4.onparentNode.sendEvent(this);
$4.__LZo = $3
}}};
this.__LZcoDirty = false;
if (this.onchildNodes.ready) this.onchildNodes.sendEvent($0);
this.ownerDocument.handleDocumentChange("childNodes", this, 0)
}function $lzc$set_nodeName ($0:String):void {
this.nodeName = $0;
if (this.onnodeName.ready) this.onnodeName.sendEvent($0);
if (this.parentNode) {
if (this.parentNode.onchildNodes.ready) this.parentNode.onchildNodes.sendEvent(this);
if (this.parentNode.onchildNode.ready) this.parentNode.onchildNode.sendEvent(this)
};
this.ownerDocument.handleDocumentChange("childNodeName", this.parentNode, 0);
this.ownerDocument.handleDocumentChange("nodeName", this, 1)
}function __LZgetText ():String {
var $0:String = "";
var $1:Array = this.childNodes;
for (var $2:int = 0, $3:int = $1.length;$2 < $3;$2++) {
var $4 = $1[$2];
if ($4.nodeType == LzDataElement.TEXT_NODE) {
$0 += $4.data
}};
return $0
}public function getElementsByTagName ($0:String):Array {
var $1:Array = [];
var $2:Array = this.childNodes;
for (var $3:int = 0, $4:int = $2.length;$3 < $4;$3++) {
if ($2[$3].nodeName == $0) {
$1.push($2[$3])
}};
return $1
}var __LZlt:String = "<";var __LZgt:String = ">";public override function serialize ():String {
return this.serializeInternal()
}function serializeInternal ($0:Number = Infinity):String {
var $1:String = this.__LZlt + this.nodeName;
var $2:Object = this.attributes;
for (var $3:String in $2) {
$1 += " " + $3 + '="' + LzDataElement.__LZXMLescape($2[$3]) + '"';
if ($1.length > $0) {
break
}};
var $4:Array = this.childNodes;
if ($1.length <= $0 && $4.length) {
$1 += this.__LZgt;
for (var $5:int = 0, $6:int = $4.length;$5 < $6;$5++) {
$1 += $4[$5].serialize();
if ($1.length > $0) {
break
}};
$1 += this.__LZlt + "/" + this.nodeName + this.__LZgt
} else {
$1 += "/" + this.__LZgt
};
return $1
}public function handleDocumentChange ($0:String, $1, $2:int, $3:Object? = null):void {
var $4:Object = {who: $1, what: $0, type: $2};
if ($3) $4.cobj = $3;
if (this.__LZchangeQ) {
this.__LZchangeQ.push($4)
} else {
if (this.onDocumentChange.ready) this.onDocumentChange.sendEvent($4)
}}override function toString () {
return this.serialize()
}public function __LZdoLock ($0:LzDatapath):void {
if (!this.__LZchangeQ) {
this.__LZchangeQ = [];
this.__LZlocker = $0
}}public function __LZdoUnlock ($0:LzDatapath):void {
if (this.__LZlocker != $0) {
return
};
var $1:Array = this.__LZchangeQ;
this.__LZchangeQ = null;
this.__LZlocker = null;
if ($1 != null) {
for (var $2:int = 0, $3:int = $1.length;$2 < $3;$2++) {
var $4:Boolean = true;
var $5:Object = $1[$2];
for (var $6:int = 0;$6 < $2;$6++) {
var $7:Object = $1[$6];
if ($5.who == $7.who && $5.what == $7.what && $5.type == $7.type) {
$4 = false;
break
}};
if ($4) {
this.handleDocumentChange($5.what, $5.who, $5.type)
}}}}function $lzsc$mixin$LzDataElementMixin$LzDataNodeMixin$LzNode ($0:LzNode? = null, $1:Object? = null, $2:Array? = null, $3:Boolean = false) {
super($0, $1, $2, $3)
}}
}
