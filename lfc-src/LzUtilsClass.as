package {
class LzUtilsClass {
var __SimpleExprPattern;var __ElementPattern;function LzUtilsClass () {
this.__SimpleExprPattern = new RegExp("^\\s*([$_A-Za-z][$\\w]*)((\\s*\\.\\s*[$_A-Za-z][$\\w]*)|(\\s*\\[\\s*\\d+\\s*\\]))*\\s*$");
this.__ElementPattern = new RegExp("([$_A-Za-z][$\\w]*)|(\\d+)", "g")
}function __parseArgs ($0:String, $1 = null) {
if ($0 == "") return [];
if ($1 == null) $1 = canvas;
var $2 = [];
var $3 = null;
var $4 = "";
for (var $5 = 0, $6 = $0.length;$5 < $6;$5++) {
var $7 = $8;
var $8 = $0.charAt($5);
if ($7 !== "\\" && ($8 === '"' || $8 === "'")) {
if ($3 == null) {
$3 = $8
} else if ($3 === $8) {
$3 = null
}} else if ($8 === ",") {
if (!$3) {
$2.push($4);
$4 = "";
continue
}} else if ($8 === " " || $8 === "\t" || $8 === "\n" || $8 === "\r") {
if ($3 == null && ($7 === "," || $7 === " " || $7 === "\t" || $7 === "\n" || $7 === "\r")) {
continue
}};
$4 += $8
};
$2.push($4);
for (var $5 = 0;$5 < $2.length;$5++) {
var $9 = $2[$5];
if ($9 === "") continue;
var $a = $9.charAt($9);
var $b = parseFloat($9);
if (!isNaN($b)) {
$2[$5] = $b
} else if ($a === '"' || $a === "'") {
var $c = $9.lastIndexOf($a);
$2[$5] = $9.substring(1, $c)
} else if ($9 === "true" || $9 === "false") {
$2[$5] = $9 === "true"
} else if ($1[$9]) {
$2[$5] = $1[$9]
} else {
$2[$5] = null
}};
return $2
}function safeEval ($0:String) {
if ($0.indexOf("new ") == 0) return this.safeNew($0);
var $1 = $0.indexOf("(");
var $2 = null;
if ($1 != -1) {
var $3 = $0.lastIndexOf(")");
$2 = $0.substring($1 + 1, $3);
$0 = $0.substring(0, $1)
};
var $4 = null, $5;
if ($0.match(this.__SimpleExprPattern)) {
var $6 = $0.match(this.__ElementPattern);
$5 = globalValue($6[0]);
for (var $7 = 1, $8 = $6.length;$7 < $8;$7++) {
$4 = $5;
$5 = $5[$6[$7]]
}};
if ($2 == null) {
return $5
};
var $9 = lz.Utils.__parseArgs($2, $4);
if ($5) {
var $a = $5.apply($4, $9);
return $a
}}function safeNew ($0:String) {
var $1 = $0;
var $2 = $0.indexOf("new ");
if ($2 == -1) return $0;
$0 = $0.substring($2 + 4);
var $3 = $0.indexOf("(");
if ($3 != -1) {
var $4 = $0.indexOf(")");
var $5 = $0.substring($3 + 1, $4);
$0 = $0.substring(0, $3)
};
var $6 = globalValue($0);
if (!$6) return;
var $5 = lz.Utils.__parseArgs($5);
var $7 = $5.length;
if ($7 == 0) {
return new $6()
} else if ($7 == 1) {
return new $6($5[0])
} else if ($7 == 2) {
return new $6($5[0], $5[1])
} else if ($7 == 3) {
return new $6($5[0], $5[1], $5[2])
} else if ($7 == 4) {
return new $6($5[0], $5[1], $5[2], $5[3])
} else if ($7 == 5) {
return new $6($5[0], $5[1], $5[2], $5[3], $5[4])
} else if ($7 == 6) {
return new $6($5[0], $5[1], $5[2], $5[3], $5[4], $5[5])
} else if ($7 == 7) {
return new $6($5[0], $5[1], $5[2], $5[3], $5[4], $5[5], $5[6])
} else if ($7 == 8) {
return new $6($5[0], $5[1], $5[2], $5[3], $5[4], $5[5], $5[6], $5[7])
} else if ($7 == 9) {
return new $6($5[0], $5[1], $5[2], $5[3], $5[4], $5[5], $5[6], $5[7], $5[8])
} else if ($7 == 10) {
return new $6($5[0], $5[1], $5[2], $5[3], $5[4], $5[5], $5[6], $5[7], $5[8], $5[9])
} else if ($7 == 11) {
return new $6($5[0], $5[1], $5[2], $5[3], $5[4], $5[5], $5[6], $5[7], $5[8], $5[9], $5[10])
}}}
}
