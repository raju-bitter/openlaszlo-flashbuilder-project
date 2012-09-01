package {
public class LzXMLTranslator {
static function copyXML ($0:XML, $1:Boolean, $2:Boolean):LzDataElement {
var $3:LzDataNodeMixin = copyFlashXML($0, $1, $2);
return $3 as LzDataElement
}private static function nextSibling ($0:XML):XML {
var $1:XML = $0.parent();
return $1 ? $1.children()[$0.childIndex() + 1] : null
}private static function firstChild ($0:XML):XML {
return $0.children()[0]
}static function copyFlashNode ($0:XML, $1:Boolean, $2:Boolean):LzDataNodeMixin {
var $3:String = $0.nodeKind();
if ($3 == "text") {
var $4:String = $0.toString();
if ($1) {
$4 = LzDataElement.trim($4)
};
return new LzDataText($4)
} else if ($3 == "element") {
var $5:String;
var $6:QName = $0.name();
if ($2) {
var $7:Namespace = $0.namespace();
if ($7 != null && $7.prefix != "") {
$5 = $7.prefix + ":" + $6.localName
} else {
$5 = $6.localName
}} else {
$5 = $6.localName
};
var $8:XMLList = $0.attributes();
var $9:Object = {};
for (var $a:int = 0, $b:int = $8.length();$a < $b;$a++) {
var $c:XML = $8[$a];
var $d:QName = $c.name();
if ($2) {
var $7:Namespace = $c.namespace();
var $e:String;
if ($7 != null && $7.prefix != "") {
$e = $7.prefix + ":" + $d.localName
} else {
$e = $d.localName
};
$9[$e] = $c.toString()
} else {
$9[$d.localName] = $c.toString()
}};
var $f:Array = $0.namespaceDeclarations();
for (var $a:int = 0, $b:int = $f.length;$a < $b;++$a) {
var $7:Namespace = $f[$a];
var $g:String = $7.prefix;
var $e:String = $g == "" ? "xmlns" : ($2 ? "xmlns:" + $g : $g);
$9[$e] = $7.uri
};
var $h:LzDataElement = new LzDataElement($5);
$h.attributes = $9;
return $h
} else {
return null
}}static function copyFlashXML ($0:XML, $1:Boolean, $2:Boolean):LzDataNodeMixin {
var $3:LzDataElement = new LzDataElement(null);
if (!firstChild($0)) {
return $3.appendChild(copyFlashNode($0, $1, $2))
};
var $4:Array = [];
var $5:int = -1;
var $6:LzDataElement = $3;
var $7:XML, $8:XML = $0;
var $9:XMLList = $8.children();
var $a:int = 0;
for (;;) {
var $b:String = $8.nodeKind();
if ($b == "text") {
var $c:LzDataText = LzDataText(copyFlashNode($8, $1, $2));
$c.parentNode = $6;
$c.ownerDocument = $3;
$c.__LZo = $6.childNodes.push($c) - 1
} else if ($b == "element") {
var $d:LzDataElement = LzDataElement(copyFlashNode($8, $1, $2));
$d.parentNode = $6;
$d.ownerDocument = $3;
$d.__LZo = $6.childNodes.push($d) - 1;
if ($7 = $9[0]) {
$4[int(++$5)] = $8;
$4[int(++$5)] = $a;
$4[int(++$5)] = $9;
$6 = $d;
$8 = $7;
$9 = $7.children();
$a = 0;
continue
}};
while (!($7 = $4[$5][++$a])) {
$9 = $4[$5--];
$a = $4[$5--];
$8 = $4[$5--];
$6 = $6.parentNode;
if ($8 === $0) {
return $3.childNodes[0]
}};
$8 = $7;
$9 = $7.children()
};
return null
}}
}
