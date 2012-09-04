package {
final class LzCSSStyleClass {
var _idRules:Object;var _nameRules:Object;var _attrs:Array;var _attrRules:Object;var _tags:Array;var _tagRules:Object;var _rules:Array;function LzCSSStyleClass () {
this._idRules = {};
this._nameRules = {};
this._attrs = [];
this._attrRules = {};
this._tags = [];
this._tagRules = {};
this._rules = []
}function getComputedStyle ($0) {
var $1:LzCSSStyleDeclaration = new LzCSSStyleDeclaration();
$1.setNode($0);
return $1
}function getPropertyValueFor ($0:LzNode, $1:String) {
var $2 = $0["__LZPropertyCache"] || this.getPropertyCache($0);
if ($1 in $2) {
return $2[$1]
};
return $2[$1] = void 0
}static var CSSInheritableProperties = {"azimuth": true, "border-collapse": true, "border-spacing": true, "caption-side": true, "color": true, "cursor": true, "direction": true, "elevation": true, "empty-cells": true, "font-family": true, "font-size": true, "font-style": true, "font-variant": true, "font-weight": true, "font": true, "letter-spacing": true, "line-height": true, "list-style-image": true, "list-style-position": true, "list-style-type": true, "list-style": true, "orphans": true, "pitch-range": true, "pitch": true, "quotes": true, "richness": true, "speak-header": true, "speak-numeral": true, "speak-punctuation": true, "speak": true, "speech-rate": true, "stress": true, "text-indent": true, "text-transform": true, "visibility": true, "voice-family": true, "volume": true, "whitespace": true, "widows": true, "word-spacing": true};static var INHERIT = {toString: function () {
return "inherit"
}};static var EMTPY_CACHE = {};function getPropertyCache ($0:LzNode) {
if (!$0) return LzCSSStyleClass.EMTPY_CACHE;
var $1 = $0["__LZPropertyCache"];
if ($1) {
return $1
};
var $2:LzNode = $0.immediateparent;
if ($2 && $2 !== $0) {
var $3 = $2["__LZPropertyCache"] || this.getPropertyCache($2);
var $4 = $2["__LZInheritedPropertyCache"]
} else {
var $3 = LzCSSStyleClass.EMTPY_CACHE;
var $4 = LzCSSStyleClass.EMTPY_CACHE
};
var $5 = $0.$CSSDescriptor;
var $6 = $5 && $5.expanders;
var $7 = LzCSSStyleClass.CSSInheritableProperties;
var $8 = $5 && $5.inheritable;
var $9 = $0["__LZRuleCache"];
if (!$9) {
if ($6) {
var $a = null;
var $b = 0;
for (var $c in $6) {
if ($6.hasOwnProperty($c) && ($8 && ($c in $8) ? $8[$c] : ($c in $7))) {
if ($a == null) {
$a = {}};
$a[$c] = true;
$b++
}}};
$9 = this.getRulesCache($0, $a, $b)
};
var $1 = {};
var $d = {};
nextrule: for (var $e:Number = $9.length - 1;$e >= 0;$e--) {
var $f = $9[$e];
if ($f.dynamic) {
var $g = $f.parsed;
var $h:Boolean = !(!$g["length"]);
if ($h) {
$g = $g[$g.length - 1]
};
var $i = $g["a"] ? $g : $g["&"];
while ($i) {
var $j:String = $i.a;
if ("v" in $i) {
var $k = $0[$j];
$k += "";
var $l = $i.v;
if (!$i["m"]) {
if ($k != $l) {
continue nextrule
}} else {
var $m:String = $i.m;
if ($m == "~=") {
if ($k != $l && $k.search("(^| )" + $l + "( |$)") == -1) {
continue nextrule
}} else if ($m == "|=") {
if ($k.indexOf($l + "-") != 0) {
continue nextrule
}}}};
$i = $i["&"]
};
if ($h) {
if (!this._compoundSelectorApplies($f.parsed, $0, null, false)) {
continue nextrule
}}};
var $n = $f.properties;
for (var $o:String in $n) {
if ($6 && ($o in $6)) {
var $p = $0[$6[$o]]($o, $n[$o]);
for (var $q:String in $p) {
$1[$q] = $d[$q] = $p[$q]
}};
$1[$o] = $d[$o] = $n[$o]
}};
var $r:Boolean = true;
for (var $s:String in $4) {
var $t = $4[$s];
if (!($s in $1)) {
$d[$s] = $t;
if ($8 && ($s in $8) ? $8[$s] : ($s in $7)) {
$1[$s] = $t;
$r = true
}} else if ($1[$s] === LzCSSStyleClass.INHERIT) {
$d[$s] = $1[$s] = $t;
$r = true
}};
if ($9.length == 0 && !$r) {
$1 = LzCSSStyleClass.EMTPY_CACHE;
$d = $4
};
$0.__LZPropertyCache = $1;
var $u:Boolean = false;
var $v = $0["__LZInheritedPropertyCache"] || LzCSSStyleClass.EMTPY_CACHE;
$0.__LZInheritedPropertyCache = $d;
for (var $w:String in $v) {
if ($v[$w] !== $d[$w]) {
$u = true;
break
}};
if (!$u) {
for (var $x:String in $d) {
if ($v[$x] !== $d[$x]) {
$u = true;
break
}}};
if ($u) {
var $y = $0.on__LZInheritedPropertyCache;
if ($y.ready) {
$y.sendEvent($d)
}};
return $1
}function getRulesCache ($0:LzNode, $1 = null, $2 = 0):Array {
var $4;
$4 = function ($0:String, $1:LzNode) {
var $2:Array = deps[$0];
if (!$2) {
deps[$0] = [$1];
return
};
for (var $3:Number = 0, $4:Number = $2.length;$3 < $4;$3++) {
if ($1 === $2[$3]) {
return
}};
$2.push($1)
};
var $3:Array = $0["__LZRuleCache"];
if ($3) {
return $3
};
$3 = new Array();
if (this._rulenum != this._lastSort) {
this._sortRules()
};
var deps:Object = {};
var $5:Array;
var $6:String = "id";
var $7:Number = 0;
var $8 = this._attrs;
var $9 = $0.constructor.__LZCSSTagSelectors;
var $a:Boolean = false;
var $b:Number = Infinity;
while ($6) {
step: switch ($6) {
case "id":
$6 = "name";var $c:String = $0["id"];if ($c && ($5 = this._idRules[$c])) {
break step
};case "name":
$6 = "attr";var $d:String = $0["name"];if ($d && ($5 = this._nameRules[$d])) {
break step
};case "attr":
while ($7 < $8.length) {
var $e:String = $8[$7++];
if ($0[$e] !== void 0) {
$5 = this._attrRules[$e];
break step
}};$6 = "tag";$7 = 0;;case "tag":
while ($9 && $7 < $9.length) {
var $f:String = $9[$7++];
if ($5 = this._tagRules[$f]) {
break step
}};$6 = null;$7 = 0;;default:
$5 = this._rules
};
nextrule: for (var $g:Number = 0, $h:Number = $5.length;$g < $h;$g++) {
var $i:LzCSSStyleRule = $5[$g];
if (!$a) {
var $j:Number = $i.specificity;
if ($j >= $b) {
$a = true
} else {
$b = $j
}};
var $k = $i.parsed;
var $l:Boolean = !(!$k["length"]);
if ($l) {
$k = $k[$k.length - 1]
};
if (!($6 == "id" || $6 == "name")) {
var $m:String = $k["t"];
if ($m && (!lz[$m] || !($0 is lz[$m]))) {
continue nextrule
};
var $n = $k["a"] ? $k : $k["&"];
while ($n) {
var $o:String = $n.a;
if ($0[$o] === void 0) {
continue nextrule
};
if ("v" in $n) {
if ($o == "name") {
if (!$n["m"]) {
if ($0.name != $n.v) {
continue nextrule
}} else if (!this._complexAttrMatch($0.name, $n.v, $n.m)) {
continue nextrule
}} else {
if (!deps[$o]) {
deps[$o] = [$0]
} else {
$4($o, $0)
}}};
$n = $n["&"]
}};
if ($l) {
if (!this._compoundSelectorApplies($i.parsed, $0, $4, false)) {
continue nextrule
}};
$3.push($i)
}};
if ($a) {
$3.sort(this.__compareSpecificity)
};
if ($1 && $2 > 0) {
for (var $g:Number = $3.length - 1;$g >= 0 && $2 > 0;$g--) {
var $p = $3[$g].properties;
for (var $q:String in $p) {
if ($q in $1) {
delete $1[$q];
$2--;
if (!$2) {
break
}}}};
var $r:LzNode = $0.immediateparent;
while ($2 > 0 && $r) {
var $s = this.getRulesCache($r);
for (var $g:Number = 0, $h:Number = $s.length;$g < $h && $2 > 0;$g++) {
var $t:LzCSSStyleRule = $s[$g];
var $p = $t.properties;
for (var $q:String in $p) {
if ($q in $1) {
var $u = {};
$u[$q] = $p[$q];
$3.push(new LzCSSStyleRule($t.parsed, $u, "", 0));
delete $1[$q];
$2--
}}};
var $v:LzNode = $r.immediateparent;
if ($v && $v != $r) {
$r = $v
} else {
break
}}};
var $r = $0.immediateparent;
if ($r !== $0) {
deps["__LZInheritedPropertyCache"] = [$r]
};
$0.__applyCSSConstraints(deps);
$0.__LZRuleCache = $3;
return $3
}function __compareSpecificity ($0:LzCSSStyleRule, $1:LzCSSStyleRule):Number {
var $2:Number = $0.specificity;
var $3:Number = $1.specificity;
if ($2 != $3) {
return $2 < $3 ? 1 : -1
};
var $4 = $0.parsed;
var $5 = $1.parsed;
var $6:Number = $0._lexorder < $1._lexorder ? 1 : -1;
if (!$4["length"] && !$5["length"]) {
var $7:String = $4["t"];
var $8:String = $5["t"];
if (!$7 || !$8 || $7 == $8) {
return $6
};
var $9:Class = lz[$7];
var $a:Class = lz[$8];
if ($9 && $a) {
if ($lzsc$issubclassof($9, $a)) {
return -1
};
if ($lzsc$issubclassof($a, $9)) {
return 1
}};
return $6
};
for (var $b:Number = 0;$b < $4.length;$b++) {
var $c = $4[$b];
var $d = $5[$b];
if (!$c || !$d) {
break
};
var $7:String = $c["t"];
var $8:String = $d["t"];
if ($7 && $8 && $7 != $8) {
var $9:Class = lz[$7];
var $a:Class = lz[$8];
if ($9 && $a) {
if ($lzsc$issubclassof($9, $a)) {
return -1
};
if ($lzsc$issubclassof($a, $9)) {
return 1
}}}};
return $6
}function _complexAttrMatch ($0:String, $1:String, $2:String):Boolean {
if (!$2) {
return $0 == $1
} else if ($2 == "~=") {
return $0 == $1 || $0.search("(^| )" + $1 + "( |$)") >= 0
} else if ($2 == "|=") {
return $0.indexOf($1 + "-") == 0
};
return false
}function _compoundSelectorApplies ($0:Array, $1:LzNode, $2:Function, $3:Boolean):Boolean {
var $4 = $0.length - 1;
if (!$3) {
if ($1 === canvas) {
return false
};
$1 = $1.immediateparent;
$4--
};
nextselector: for (var $5:LzNode = $1, $6:Number = $4;$6 >= 0 && $5;$6--, $5 = $5 === canvas ? null : $5.immediateparent) {
var $7 = $0[$6];
var $8:String = $7["t"];
var $9:String = $7["i"];
nextnode: for (;$5;$5 = $5 === canvas || $3 && $5 === $1 ? null : $5.immediateparent) {
if ($9 && $5["id"] != $9) {
continue nextnode
};
if ($8 && (!lz[$8] || !($5 is lz[$8]))) {
continue nextnode
};
var $a = $7["a"] ? $7 : $7["&"];
while ($a) {
var $b:String = $a.a;
if ($5[$b] === void 0) {
continue nextnode
};
if ("v" in $a) {
if ($2 && $b != "name") {
$2($b, $5)
} else {
var $c = $5[$b];
$c += "";
var $d = $a.v;
if (!$a["m"]) {
if ($c != $d) {
continue nextnode
}} else if (!this._complexAttrMatch($c, $d, $a.m)) {
continue nextnode
}}};
$a = $a["&"]
};
if ($6 == 0) {
return true
};
continue nextselector
};
return false
};
return false
}var _rulenum:Number = 0;var _lastSort:Number = -1;function _sortRules ():void {
var $0;
$0 = function ($0:Array):void {
for (var $1:Number = $0.length - 2;$1 >= 0;$1--) {
if ($0[$1].equal($0[$1 + 1])) {
$0.splice($1 + 1, 1)
}}};
if (this._rulenum != this._lastSort) {
$0(this._rules);
for (var $1:String in this._idRules) {
var $2:Array = this._idRules[$1];
$2.sort(this.__compareSpecificity);
$0($2)
};
for (var $1:String in this._nameRules) {
var $2:Array = this._nameRules[$1];
$2.sort(this.__compareSpecificity);
$0($2)
};
for (var $1:String in this._attrRules) {
var $2:Array = this._attrRules[$1];
$2.sort(this.__compareSpecificity);
$0($2)
};
for (var $1:String in this._tagRules) {
var $2:Array = this._tagRules[$1];
$2.sort(this.__compareSpecificity);
$0($2)
};
this._rules.sort(this.__compareSpecificity);
this._lastSort = this._rulenum
}}function _addRule ($0:LzCSSStyleRule):void {
$0._lexorder = this._rulenum++;
var $1 = $0.parsed;
if ($1["length"]) {
$1 = $1[$1.length - 1]
};
var $2:String = $1.i;
var $3:String = $1.a;
var $4:String = $1.t;
var $5:String = $1.m;
var $6:Object = $1["&"];
if ($2 && !($3 || $4 || $6)) {
var $7:Array = this._idRules[$2];
if (!$7) {
$7 = this._idRules[$2] = []
};
$7.push($0)
} else if ($3 && !($2 || $5 || $6)) {
var $8:String = $1.v;
if ($8 && $3 == "name") {
var $9:Array = this._nameRules[$8];
if (!$9) {
$9 = this._nameRules[$8] = []
};
$9.push($0)
} else {
var $a:Array = this._attrRules[$3];
if (!$a) {
this._attrs.push($3);
$a = this._attrRules[$3] = []
};
$a.push($0)
}} else if ($4) {
var $b:Array = this._tagRules[$4];
if (!$b) {
this._tags.push($4);
$b = this._tagRules[$4] = []
};
$b.push($0)
} else {
this._rules.push($0)
}}}
}
