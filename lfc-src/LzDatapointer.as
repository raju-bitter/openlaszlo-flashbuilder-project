package {
public dynamic class LzDatapointer extends LzNode {
static var tagname:String = "datapointer";static var __LZCSSTagSelectors:Array = ["datapointer", "node"];static var attributes:Object = {ignoreplacement: true};function $lzc$set_xpath ($0):void {
this.setXPath($0)
}function $lzc$set_context ($0):void {
this.setDataContext($0)
}function $lzc$set_pointer ($0):void {
this.setPointer($0)
}function $lzc$set_p ($0):void {
this.setPointer($0)
}var p = null;var context:* = null;var __LZtracking:Array = null;var __LZtrackDel:LzDelegate = null;var xpath:String = null;var parsedPath:LzParsedPath = null;var __LZlastdotdot:LzDataElementMixin = null;var __LZspecialDotDot:Boolean = false;var __LZdotdotCheckDel:LzDelegate = null;var errorDel:LzDelegate = null;var timeoutDel:LzDelegate = null;var rerunxpath:Boolean = false;var onp:LzDeclaredEventClass = LzDeclaredEvent;var onDocumentChange:LzDeclaredEventClass = LzDeclaredEvent;var onerror:LzDeclaredEventClass = LzDeclaredEvent;var ontimeout:LzDeclaredEventClass = LzDeclaredEvent;var onrerunxpath:LzDeclaredEventClass = LzDeclaredEvent;function LzDatapointer ($0:* = null, $1:* = null, $2:* = null, $3:* = null) {
super($0, $1, $2, $3)
}function gotError ($0:LzDataset):void {
if (this.onerror.ready) this.onerror.sendEvent($0)
}function gotTimeout ($0:LzDataset):void {
if (this.ontimeout.ready) this.ontimeout.sendEvent($0)
}function xpathQuery ($0:Object):* {
var $1:LzParsedPath = this.parsePath($0);
var $2:* = $1.getContext(this);
var $3:* = this.__LZgetNodes($1, $2 ? $2 : this.p);
if ($3 == null) return null;
if ($1.aggOperator != null) {
if ($1.aggOperator == "last") {
if ($3 is Array) {
return $3.length
} else {
if (!$2 && $3 === this.p) {
if ($1.selectors && $1.selectors.length > 0) {
var $4:Array = $1.selectors;
var $5:int = 0;
while ($4[$5] == "." && $5 < $4.length) {
++$5
};
return $5 != $4.length ? 1 : this.__LZgetLast()
} else {
return this.__LZgetLast()
}} else {
return 1
}}} else if ($1.aggOperator == "position") {
if ($3 is Array) {
var $6:Array = [];
for (var $5:int = 0;$5 < $3.length;$5++) {
$6.push($5 + 1)
};
return $6
} else {
if (!$2 && $3 === this.p) {
if ($1.selectors && $1.selectors.length > 0) {
var $4:Array = $1.selectors;
var $5:int = 0;
while ($4[$5] == "." && $5 < $4.length) {
++$5
};
return $5 != $4.length ? 1 : this.__LZgetPosition()
} else {
return this.__LZgetPosition()
}} else {
return 1
}}}} else if ($1.operator != null) {
if ($3 is Array) {
var $7:Array = [];
for (var $5:int = 0;$5 < $3.length;$5++) {
$7.push(this.__LZprocessOperator($3[$5], $1))
};
return $7
} else {
return this.__LZprocessOperator($3, $1)
}} else {
return $3
}}function $lzc$xpathQuery_dependencies ($0, $1, $2):Array {
if (this["parsePath"]) {
var $3:LzParsedPath = this.parsePath($2);
return [$3.hasDotDot ? $1.context.getContext().ownerDocument : $1, "DocumentChange"]
} else {
return [$1, "DocumentChange"]
}}function setPointer ($0):Boolean {
this.setXPath(null);
if ($0 != null) {
this.setDataContext($0.ownerDocument)
} else {
this.__LZsetTracking(null)
};
var $1:Boolean = this.data != $0;
var $2:Boolean = this.p != $0;
this.p = $0;
this.data = $0;
this.__LZsendUpdate($1, $2);
return $0 != null
}function getDataset ():LzDataset {
if (this.p == null) {
if (this.context === this) {
return null
} else {
return this.context.getDataset()
}} else {
return this.p.ownerDocument
}}function setXPath ($0:String):Boolean? {
if (!$0) {
this.xpath = null;
this.parsedPath = null;
if (this.p) this.__LZsetTracking(this.p.ownerDocument);
return false
};
this.xpath = $0;
this.parsedPath = this.parsePath($0);
var $1:* = this.parsedPath.getContext(this);
if (this.rerunxpath && this.parsedPath.hasDotDot && !$1) {
this.__LZspecialDotDot = true
} else {
if (this.__LZdotdotCheckDel) {
this.__LZdotdotCheckDel.unregisterAll()
}};
this.setDataContext($1);
return this.runXPath()
}function runXPath ():Boolean {
if (!this.parsedPath) {
return false
};
var $0 = null;
if (this.context && (this.context is LzDatapointer || this.context is LzDataset || this.context is AnonDatasetGenerator)) {
$0 = this.context.getContext()
};
if ($0) {
var $1:* = this.__LZgetNodes(this.parsedPath, $0, 0)
} else {
var $1:* = null
};
if ($1 == null) {
this.__LZHandleNoNodes();
return false
} else if ($1 is Array) {
this.__LZHandleMultiNodes($1);
return false
} else {
this.__LZHandleSingleNode($1);
return true
}}function __LZsetupDotDot ($0):void {
if (this.__LZlastdotdot != $0.ownerDocument) {
if (this.__LZdotdotCheckDel == null) {
this.__LZdotdotCheckDel = new LzDelegate(this, "__LZcheckDotDot")
} else {
this.__LZdotdotCheckDel.unregisterAll()
};
this.__LZlastdotdot = $0.ownerDocument;
this.__LZdotdotCheckDel.register(this.__LZlastdotdot as LzEventable, "onDocumentChange")
}}function __LZHandleSingleNode ($0):void {
if (this.__LZspecialDotDot) this.__LZsetupDotDot($0);
this.__LZupdateLocked = true;
this.__LZpchanged = $0 != this.p;
this.p = $0;
this.__LZsetData();
this.__LZupdateLocked = false;
this.__LZsendUpdate()
}function __LZHandleNoNodes ():void {
var $0:Boolean = this.p != null;
var $1:Boolean = this.data != null;
this.p = null;
this.data = null;
this.__LZsendUpdate($1, $0)
}function __LZHandleMultiNodes ($0:Array):LzReplicationManager {
this.__LZHandleNoNodes();
return null
}function __LZsetData ():void {
if (this.parsedPath && this.parsedPath.aggOperator != null) {
if (this.parsedPath.aggOperator == "last") {
this.data = this.__LZgetLast();
this.__LZsendUpdate(true)
} else if (this.parsedPath.aggOperator == "position") {
this.data = this.__LZgetPosition();
this.__LZsendUpdate(true)
}} else if (this.parsedPath && this.parsedPath.operator != null) {
this.__LZsimpleOperatorUpdate()
} else {
if (this.data != this.p) {
this.data = this.p;
this.__LZsendUpdate(true)
}}}function __LZgetLast ():int {
var $0:* = this.context;
if ($0 == null || $0 === this || !($0 is LzDatapointer)) {
return 1
} else {
return $0.__LZgetLast() || 1
}}function __LZgetPosition ():int {
var $0:* = this.context;
if ($0 == null || $0 === this || !($0 is LzDatapointer)) {
return 1
} else {
return $0.__LZgetPosition() || 1
}}var __LZupdateLocked:Boolean = false;var __LZpchanged:Boolean = false;var __LZdchanged:Boolean = false;function __LZsendUpdate ($0:Boolean = false, $1:Boolean = false):Boolean {
this.__LZdchanged = $0 || this.__LZdchanged;
this.__LZpchanged = $1 || this.__LZpchanged;
if (this.__LZupdateLocked) {
return false
};
if (this.__LZdchanged) {
if (this.ondata.ready) this.ondata.sendEvent(this.data);
this.__LZdchanged = false
};
if (this.__LZpchanged) {
if (this.onp.ready) this.onp.sendEvent(this.p);
this.__LZpchanged = false;
if (this.onDocumentChange.ready) this.onDocumentChange.sendEvent({who: this.p, type: 2, what: "context"})
};
return true
}function isValid ():Boolean {
return this.p != null
}function __LZsimpleOperatorUpdate ():void {
var $0:* = this.p != null ? this.__LZprocessOperator(this.p, this.parsedPath) : void 0;
var $1:Boolean = false;
if (this.data != $0 || this.parsedPath.operator == "attributes") {
this.data = $0;
$1 = true
};
this.__LZsendUpdate($1)
}static var ppcache:Object = {};function parsePath ($0:*):LzParsedPath {
if ($0 is LzDatapath) {
var $1:String = ($0 as LzDatapath).xpath
} else {
var $1:String = $0 as String
};
var $2:Object = LzDatapointer.ppcache;
var $3:LzParsedPath = $2[$1];
if ($3 == null) {
$3 = new LzParsedPath($1, this);
$2[$1] = $3
};
return $3
}function getLocalDataContext ($0:Array):LzDataset {
var $1:LzNode = this.parent;
if ($0) {
var $2:Array = $0;
for (var $3:int = 0;$3 < $2.length && $1 != null;$3++) {
$1 = $1[$2[$3]]
};
if ($1 != null && !($1 is LzDataset) && $1["localdata"] is LzDataset) {
$1 = $1["localdata"];
return $1 as LzDataset
}};
if ($1 != null && $1 is LzDataset) {
return $1 as LzDataset
} else {
return null
}}static var pathSymbols:Object = {"/": 1, "..": 2, "*": 3, ".": 4};function __LZgetNodes ($0:LzParsedPath, $1:*, $2:int = 0):* {
if ($1 == null) {
return null
};
if ($0.selectors != null) {
var $3:int = $0.selectors.length;
for (var $4:int = $2;$4 < $3;$4++) {
var $5:* = $0.selectors[$4];
var $6:int = LzDatapointer.pathSymbols[$5] || 0;
var $7:* = $0.selectors[$4 + 1];
if ($7 && !($7 is String) && $7["pred"] == "range") {
var $8:Array = $0.selectors[++$4] as Array
} else {
var $8:Array = null
};
var $9:Array = null;
if ($5 is Object && ("pred" in $5) && null != $5.pred) {
if ($5.pred == "hasattr") {
$1 = $1.hasAttr($5.attr) ? $1 : null
} else if ($5.pred == "attrval") {
if ($1.attributes != null) {
$1 = $1.attributes[$5.attr] == $5.val ? $1 : null
} else {
$1 = null
}}} else if ($6 == 0) {
$9 = this.nodeByName($5, $8, $1)
} else if ($6 == 1) {
$1 = $1.ownerDocument
} else if ($6 == 2) {
$1 = $1.parentNode
} else if ($6 == 3) {
$9 = [];
if ($1.childNodes) {
var $a:Array = $1.childNodes;
var $b:int = $a.length;
var $c:int = $8 != null ? $8[0] : 0;
var $d:int = $8 != null ? $8[1] : $b;
var $e:int = 0;
for (var $f:int = 0;$f < $b;$f++) {
var $g = $a[$f];
if ($g.nodeType == LzDataElement.ELEMENT_NODE) {
$e++;
if ($e >= $c) {
$9.push($g)
};
if ($e == $d) {
break
}}}}};
if ($9 != null) {
if ($9.length > 1) {
if ($4 == $3 - 1) {
return $9
};
var $h:Array = [];
for (var $f:int = 0;$f < $9.length;$f++) {
var $i:* = this.__LZgetNodes($0, $9[$f], $4 + 1);
if ($i != null) {
if ($i is Array) {
for (var $j:int = 0;$j < $i.length;$j++) {
$h.push($i[$j])
}} else {
$h.push($i)
}}};
if ($h.length == 0) {
return null
} else if ($h.length == 1) {
return $h[0]
} else {
return $h
}} else {
$1 = $9[0]
}};
if ($1 == null) {
return null
}}};
return $1
}function getContext ($0 = null):* {
return this.p
}function nodeByName ($0:String, $1:Array, $2):Array {
if (!$2) {
$2 = this.p;
if (!this.p) return null
};
var $3:Array = [];
if ($2.childNodes != null) {
var $4:Array = $2.childNodes;
var $5:int = $4.length;
var $6:int = $1 != null ? $1[0] : 0;
var $7:int = $1 != null ? $1[1] : $5;
var $8:int = 0;
for (var $9:int = 0;$9 < $5;$9++) {
var $a = $4[$9];
if ($a.nodeName == $0) {
$8++;
if ($8 >= $6) {
$3.push($a)
};
if ($8 == $7) {
break
}}}};
return $3
}function $lzc$set_rerunxpath ($0:Boolean):void {
this.rerunxpath = $0;
if (this.onrerunxpath.ready) this.onrerunxpath.sendEvent($0)
}function dupePointer ():LzDatapointer {
var $0:LzDatapointer = new LzDatapointer();
$0.setFromPointer(this);
return $0
}function __LZdoSelect ($0:String, $1:int):Boolean {
var $2 = this.p;
for (;$2 != null && $1 > 0;$1--) {
if ($2.nodeType == LzDataElement.TEXT_NODE) {
if ($0 == "getFirstChild") break
};
$2 = $2[$0]()
};
if ($2 != null && $1 == 0) {
this.setPointer($2);
return true
};
return false
}function selectNext ($0 = null):Boolean {
return this.__LZdoSelect("getNextSibling", $0 ? $0 : 1)
}function selectPrev ($0 = null):Boolean {
return this.__LZdoSelect("getPreviousSibling", $0 ? $0 : 1)
}function selectChild ($0 = null):Boolean {
return this.__LZdoSelect("getFirstChild", $0 ? $0 : 1)
}function selectParent ($0 = null):Boolean {
return this.__LZdoSelect("getParent", $0 ? $0 : 1)
}function selectNextParent ():Boolean {
var $0 = this.p;
if (this.selectParent() && this.selectNext()) {
return true
} else {
this.setPointer($0);
return false
}}function getXPathIndex ():Number {
if (!this.p) {
return 0
};
return this.p.getOffset() + 1
}function getNodeType ():* {
if (!this.p) {
return
};
return this.p.nodeType
}function getNodeName ():String {
if (!this.p) {
return null
};
return this.p.nodeName
}function setNodeName ($0:String):void {
if (!this.p) {
return
};
if (this.p.nodeType != LzDataElement.TEXT_NODE) {
this.p.$lzc$set_nodeName($0)
}}function getNodeAttributes ():Object {
if (!this.p) {
return null
};
if (this.p.nodeType != LzDataElement.TEXT_NODE) {
return this.p.attributes
};
return null
}function getNodeAttribute ($0:String):String {
if (!this.p) {
return null
};
if (this.p.nodeType != LzDataElement.TEXT_NODE) {
return this.p.attributes[$0]
};
return null
}function setNodeAttribute ($0:String, $1:String):void {
if (!this.p) {
return
};
if (this.p.nodeType != LzDataElement.TEXT_NODE) {
this.p.setAttr($0, $1)
}}function deleteNodeAttribute ($0:String):void {
if (!this.p) {
return
};
if (this.p.nodeType != LzDataElement.TEXT_NODE) {
this.p.removeAttr($0)
}}function getNodeText ():String {
if (!this.p) {
return null
};
if (this.p.nodeType != LzDataElement.TEXT_NODE) {
return this.p.__LZgetText()
};
return null
}function setNodeText ($0:String):void {
if (!this.p) {
return
};
if (this.p.nodeType != LzDataElement.TEXT_NODE) {
var $1:Boolean = false;
var $2:Array = this.p.childNodes;
for (var $3:int = 0;$3 < $2.length;$3++) {
var $4 = $2[$3];
if ($4.nodeType == LzDataElement.TEXT_NODE) {
$4.$lzc$set_data($0);
$1 = true;
break
}};
if (!$1) {
this.p.appendChild(new LzDataText($0))
}}}function getNodeCount ():int {
if (!this.p || this.p.nodeType == LzDataElement.TEXT_NODE) return 0;
return this.p.childNodes.length || 0
}function addNode ($0:String, $1:String = null, $2:Object = null):LzDataElement {
if (!this.p) {
return null
};
var $3:LzDataElement = new LzDataElement($0, $2);
if ($1 != null) {
$3.appendChild(new LzDataText($1))
};
if (this.p.nodeType != LzDataElement.TEXT_NODE) {
this.p.appendChild($3)
};
return $3
}function deleteNode () {
if (!this.p) {
return
};
var $0 = this.p;
if (!this.rerunxpath) {
if (!(this.selectNext() || this.selectPrev())) {
this.__LZHandleNoNodes()
}};
$0.parentNode.removeChild($0);
return $0
}function sendDataChange ($0):void {
this.getDataset().sendDataChange($0)
}function comparePointer ($0:LzDatapointer):Boolean {
return this.p == $0.p
}function addNodeFromPointer ($0:LzDatapointer):LzDatapointer {
if (!$0.p) return null;
if (!this.p) {
return null
};
var $1 = $0.p.cloneNode(true);
if (this.p.nodeType != LzDataElement.TEXT_NODE) {
this.p.appendChild($1)
};
return new LzDatapointer(null, {pointer: $1})
}function setFromPointer ($0:LzDatapointer):void {
this.setPointer($0.p)
}function __LZprocessOperator ($0, $1:LzParsedPath):* {
if ($0 == null) {
return
};
var $2:String = $1.operator;
switch ($2) {
case "serialize":
return $0.serialize();;case "text":
return $0.nodeType != LzDataElement.TEXT_NODE ? $0.__LZgetText() : void 0;;case "name":
return $0.nodeName;;default:
if ($1.hasAttrOper) {
if ($0.nodeType != LzDataElement.TEXT_NODE && $0["attributes"]) {
if ($2 == "attributes") {
return $0.attributes
} else {
return $0.attributes[$2.substr(11)]
}} else {
return
}}}}function makeRootNode ():LzDataElement {
return new LzDataElement("root")
}function finishRootNode ($0) {
return $0.childNodes[0]
}function makeElementNode ($0, $1, $2):LzDataElement {
var $3:LzDataElement = new LzDataElement($1, $0);
$2.appendChild($3);
return $3
}function makeTextNode ($0, $1):LzDataText {
var $2:LzDataText = new LzDataText($0);
$1.appendChild($2);
return $2
}function serialize ():String {
if (this.p == null) {
return null
};
return this.p.serialize()
}function setDataContext ($0, $1:Boolean = false):void {
if ($0 == null) {
this.context = this;
if (this.p) {
this.__LZsetTracking(this.p.ownerDocument)
}} else if (this.context != $0) {
this.context = $0;
if (this.errorDel != null) {
this.errorDel.unregisterAll();
this.timeoutDel.unregisterAll()
};
this.__LZsetTracking($0);
var $2:Boolean = this.xpath != null;
if ($2) {
if (this.errorDel == null) {
this.errorDel = new LzDelegate(this, "gotError");
this.timeoutDel = new LzDelegate(this, "gotTimeout")
};
this.errorDel.register($0, "onerror");
this.timeoutDel.register($0, "ontimeout")
}}}function __LZcheckChange ($0:Object):Boolean {
if (!this.rerunxpath) {
if (!this.p || $0.who == this.context) {
this.runXPath()
} else if (this.__LZneedsOpUpdate($0)) {
this.__LZsimpleOperatorUpdate()
};
return false
} else {
if ($0.type == 2 || ($0.type == 0 || $0.type == 1 && this.parsedPath && this.parsedPath.hasOpSelector) && (this.parsedPath && this.parsedPath.hasDotDot || this.p == null || this.p.childOfNode($0.who))) {
this.runXPath();
return true
} else if (this.__LZneedsOpUpdate($0)) {
this.__LZsimpleOperatorUpdate()
};
return false
}}function __LZneedsOpUpdate ($0:Object? = null):Boolean {
var $1:LzParsedPath = this.parsedPath;
if ($1 != null && $1.operator != null) {
var $2 = $0.who;
var $3:int = $0.type;
if ($1.operator != "text") {
return $3 == 1 && $2 == this.p
} else {
return $3 == 0 && $2 == this.p || $2.parentNode == this.p && $2.nodeType == LzDataElement.TEXT_NODE
}} else {
return false
}}function __LZcheckDotDot ($0:Object):void {
var $1 = $0.who;
var $2:int = $0.type;
if (($2 == 0 || $2 == 1 && this.parsedPath.hasOpSelector) && this.context.getContext().childOfNode($1)) {
this.runXPath()
}}override function destroy () {
if (this.__LZdeleted) return;
this.__LZsetTracking(null);
this.p = null;
this.data = null;
this.__LZlastdotdot = null;
this.context = null;
this.__LZtracking = null;
super.destroy()
}function __LZsetTracking ($0, $1:Boolean = false, $2:Boolean = false):void {
var $3:Array = this.__LZtracking;
var $4:LzDelegate = this.__LZtrackDel;
if ($0) {
if ($3 != null && $3.length == 1 && $3[0] === $0) {
return
};
if ($4) {
$4.unregisterAll()
};
var $5:Boolean = $1 || this.xpath;
if ($5) {
if (!$4) {
this.__LZtrackDel = $4 = new LzDelegate(this, "__LZcheckChange")
};
this.__LZtracking = $3 = [$0];
$4.register($0, "onDocumentChange")
}} else {
this.__LZtracking = [];
if ($4) {
this.__LZtrackDel.unregisterAll()
}}}}
}
