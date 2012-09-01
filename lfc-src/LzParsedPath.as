package {
class LzParsedPath {
var path:String = null;var selectors:Array = null;var context:* = null;var dsetname:String = null;var dsrcname:String = null;var islocaldata:Array = null;var operator:String = null;var aggOperator:String = null;var hasAttrOper:Boolean = false;var hasOpSelector:Boolean = false;var hasDotDot:Boolean = false;function getContext ($0:LzDatapointer) {
if (this.context != null) {
return this.context
} else {
if (this.islocaldata != null) {
return $0.getLocalDataContext(this.islocaldata)
} else {
if (this.dsrcname != null) {
return canvas[this.dsrcname][this.dsetname]
} else {
if (this.dsetname != null) {
return canvas.datasets[this.dsetname]
}}}};
return null
}function LzParsedPath ($0:String, $1:*) {
this.path = $0;
this.selectors = [];
var $2 = $0.indexOf(":/");
if ($2 > -1) {
var $3 = $0.substring(0, $2).split(":");
if ($3.length > 1) {
var $4 = LzParsedPath.trim($3[0]);
var $5 = LzParsedPath.trim($3[1]);
if ($4 == "local") {
this.islocaldata = $5.split(".")
} else {
this.dsrcname = $4;
this.dsetname = $5
}} else {
var $6 = LzParsedPath.trim($3[0]);
if ($6 == "new") {
this.context = new AnonDatasetGenerator(this)
} else {
this.dsetname = $6
}};
var $7 = $0.substring($2 + 2)
} else {
var $7 = $0
};
var $8 = [];
var $9 = "";
var $a = false;
var $b = false;
for (var $c = 0;$c < $7.length;$c++) {
var $d = $7.charAt($c);
if ($d == "\\" && $b == false) {
$b = true;
continue
} else if ($b == true) {
$b = false;
$9 += $d;
continue
} else if ($a == false && $d == "/") {
$8.push($9);
$9 = "";
continue
} else if ($d == "'") {
$a = $a ? false : true
};
$9 += $d
};
$8.push($9);
if ($8 != null) {
for (var $c = 0;$c < $8.length;$c++) {
var $e = LzParsedPath.trim($8[$c]);
if ($c == $8.length - 1) {
if ($e.charAt(0) == "@") {
this.hasAttrOper = true;
if ($e.charAt(1) == "*") {
this.operator = "attributes"
} else {
this.operator = "attributes." + $e.substring(1, $e.length)
};
continue
} else if ($e.charAt($e.length - 1) == ")") {
if ($e.indexOf("last") > -1) {
this.aggOperator = "last"
} else if ($e.indexOf("position") > -1) {
this.aggOperator = "position"
} else if ($e.indexOf("name") > -1) {
this.operator = "name"
} else if ($e.indexOf("text") > -1) {
this.operator = "text"
} else if ($e.indexOf("serialize") > -1) {
this.operator = "serialize"
};
continue
} else if ($e == "") {
continue
}};
var $f = $e.split("[");
var $g = LzParsedPath.trim($f[0]);
this.selectors.push($g == "" ? "/" : $g);
if ($g == "" || $g == "..") {
this.hasDotDot = true
};
if ($f != null) {
for (var $h = 1;$h < $f.length;$h++) {
var $i = LzParsedPath.trim($f[$h]);
$i = $i.substring(0, $i.length - 1);
if (LzParsedPath.trim($i).charAt(0) == "@") {
var $j = $i.split("=");
var $k;
var $l = $j.shift().substring(1);
if ($j.length > 0) {
var $m = LzParsedPath.trim($j.join("="));
$m = $m.substring(1, $m.length - 1);
$k = {pred: "attrval", attr: LzParsedPath.trim($l), val: LzParsedPath.trim($m)}} else {
$k = {pred: "hasattr", attr: LzParsedPath.trim($l)}};
this.selectors.push($k);
this.hasOpSelector = true
} else {
var $k = $i.split("-");
$k[0] = LzParsedPath.trim($k[0]);
if ($k[0] == "") {
$k[0] = 1
};
if ($k[1] != null) {
$k[1] = LzParsedPath.trim($k[1])
};
if ($k[1] == "") {
$k[1] = Infinity
} else if ($k.length == 1) {
$k[1] = $k[0]
};
$k.pred = "range";
this.selectors.push($k)
}}}}}}static function trim ($0:String):String {
var $1:Number = 0;
var $2:Boolean = false;
while ($0.charAt($1) == " ") {
$1++;
$2 = true
};
var $3:Number = $0.length - $1;
while ($0.charAt($1 + $3 - 1) == " ") {
$3--;
$2 = true
};
return $2 ? $0.substr($1, $3) : $0
}public function toString () {
return "Parsed path for path: " + this.path
}function debugWrite () {}}
}
