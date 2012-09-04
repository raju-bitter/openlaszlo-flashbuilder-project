package {
final class LzCSSStyleRule {
var parsed = null;var specificity:Number = 0;var dynamic:Boolean = false;var properties;var _lexorder;function LzCSSStyleRule ($0, $1, $2:String, $3:Number) {
this.parsed = $0;
if ($0["length"]) {
var $4:Number = 0;
for (var $5 = 0, $6 = $0.length;$5 < $6;$5++) {
var $7 = $0[$5];
$4 += $7.s;
if (("v" in $7) && $7.a != "name") {
this.dynamic = true
};
while ($7["&"]) {
$7 = $7["&"];
if (("v" in $7) && $7.a != "name") {
this.dynamic = true
}}};
this.specificity = $4
} else {
var $7 = $0;
this.specificity = $7.s;
if (("v" in $7) && $7.a != "name") {
this.dynamic = true
};
while ($7["&"]) {
$7 = $7["&"];
if (("v" in $7) && $7.a != "name") {
this.dynamic = true
}}};
this.properties = $1
}function clone ():LzCSSStyleRule {
var $0:LzCSSStyleRule = new LzCSSStyleRule(this.parsed, this.properties, "", 0);
$0._lexorder = this._lexorder;
return $0
}static function selectorToString ($0:Object):String {
var $1:String = $0["k"];
if ($1) {
return $1
};
var $2:String = $0["t"];
var $3:String = $0["i"];
var $4:String = $0["a"];
if (!($2 || $3 || $4)) {
return "*"
};
var $5 = $0["v"];
var $6 = $0["m"] || "=";
$1 = $0.k = ($2 ? $2 : "") + ($3 ? "#" + $3 : "") + ($4 ? ($4 == "styleclass" ? "." + $5 : "[" + $4 + ($5 ? $6 + $5 : "") + "]") : "") + (("&" in $0) ? LzCSSStyleRule.selectorToString($0["&"]) : "");
return $1
}function equal ($0):Boolean {
var equal;
equal = function ($0, $1):Boolean {
return $0["t"] == $1["t"] && $0["i"] == $1["i"] && $0["a"] == $1["a"] && $0["v"] == $1["v"] && $0["m"] == $1["m"] && (!$0["&"] && !$1["&"] || $0["&"] && $1["&"] && equal($0["&"], $1["&"]))
};
var $1 = this.parsed;
var $2 = $0.parsed;
if ($1["length"] != $2["length"]) {
return false
};
if ($1["length"]) {
for (var $3:Number = $1.length - 1;$3 >= 0;$3--) {
if (!equal($1[$3], $2[$3])) {
return false
}}};
if (!equal($1, $2)) {
return false
};
var $4 = this.properties;
var $5 = $0.properties;
for (var $6:String in $4) {
if ($4[$6] !== $5[$6]) {
return false
}};
for (var $7:String in $5) {
if ($4[$7] !== $5[$7]) {
return false
}};
return true
}}
}
