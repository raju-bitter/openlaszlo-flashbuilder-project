package {
class LzDataElement extends $lzsc$mixin$LzDataElementMixin$LzDataNodeMixin$LzDataNode {
function LzDataElement ($0:String, $1:Object? = null, $2:Array? = null) {
super();
this.nodeName = $0;
this.nodeType = LzDataElement.ELEMENT_NODE;
this.ownerDocument = this;
if ($1) {
this.$lzc$set_attributes($1)
} else {
this.attributes = {}};
if ($2) {
this.$lzc$set_childNodes($2)
} else {
this.childNodes = [];
this.__LZcoDirty = false
}}public static var NODE_CLONED:int = 1;public static var NODE_IMPORTED:int = 2;public static var NODE_DELETED:int = 3;public static var NODE_RENAMED:int = 4;public static var NODE_ADOPTED:int = 5;static function makeNodeList ($0:int, $1:String):Array {
var $2:Array = [];
for (var $3:int = 0;$3 < $0;$3++) {
$2[$3] = new LzDataElement($1)
};
return $2
}static function valueToElement ($0:*):LzDataElement {
return new LzDataElement("element", {}, LzDataElement.__LZv2E($0))
}static function __LZdateToJSON ($0:Date):String {
var $1;
var $2;
$1 = function ($0:Number):String {
return ($0 < 10 ? "0" : "") + $0
};
$2 = function ($0:Number):String {
return ($0 < 10 ? "00" : ($0 < 100 ? "0" : "")) + $0
};
if (isFinite($0.valueOf())) {
return $0.getUTCFullYear() + "-" + $1($0.getUTCMonth() + 1) + "-" + $1($0.getUTCDate()) + "T" + $1($0.getUTCHours()) + ":" + $1($0.getUTCMinutes()) + ":" + $1($0.getUTCSeconds()) + "." + $2($0.getUTCMilliseconds()) + "Z"
} else {
return null
}}static function __LZv2E ($0:*):Array {
var $1:Array = [];
if (typeof $0 == "object") {
if ($0 is LzDataElement || $0 is LzDataText) {
$1[0] = $0
} else if ($0 is Date) {
var $2:String = LzDataElement.__LZdateToJSON($0);
if ($2 != null) {
$1[0] = new LzDataText($2)
}} else if ($0 is Array) {
var $3:String = $0.__LZtag != null ? $0.__LZtag : "item";
for (var $4:int = 0;$4 < $0.length;$4++) {
var $5:Array = LzDataElement.__LZv2E($0[$4]);
$1[$4] = new LzDataElement($3, null, $5)
}} else {
var $4:int = 0;
for (var $6:String in $0) {
if ($6.indexOf("__LZ") == 0) continue;
$1[$4++] = new LzDataElement($6, null, LzDataElement.__LZv2E($0[$6]))
}}} else if ($0 != null) {
$1[0] = new LzDataText(String($0))
};
return $1.length != 0 ? $1 : null
}public static var ELEMENT_NODE:int = 1;public static var TEXT_NODE:int = 3;public static var DOCUMENT_NODE:int = 9;static var __LZescapechars:Object = {"&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&apos;"};static function __LZXMLescape ($0:*):* {
if (typeof $0 != "string") return $0;
var $1:Object = LzDataElement.__LZescapechars;
var $2:int = $0.length;
var $3:String = "";
for (var $4:int = 0;$4 < $2;$4++) {
var $5:Number = $0.charCodeAt($4);
if ($5 < 32) {
$3 += "&#x" + $5.toString(16) + ";"
} else {
var $6:String = $0.charAt($4);
$3 += $1[$6] || $6
}};
return $3
}static function stringToLzData ($0:String, $1:Boolean = false, $2:Boolean = false):LzDataElement {
if ($0 != null && $0 != "") {
var $3:*;
try {
$3 = LzXMLParser.parseXML($0, $1, $2)
}
catch ($4) {};
if ($3 != null) {
var $5:LzDataElement = LzXMLTranslator.copyXML($3, $1, $2);
return $5
}};
return null
}static var whitespaceChars:Object = {" ": true, "\r": true, "\n": true, "\t": true};static function trim ($0:String):String {
var $1:Object = LzDataElement.whitespaceChars;
var $2:int = $0.length;
var $3:int = 0;
var $4:int = $2 - 1;
var $5:String;
while ($3 < $2) {
$5 = $0.charAt($3);
if ($1[$5] != true) break;
$3++
};
while ($4 > $3) {
$5 = $0.charAt($4);
if ($1[$5] != true) break;
$4--
};
return $0.slice($3, $4 + 1)
}}
}
