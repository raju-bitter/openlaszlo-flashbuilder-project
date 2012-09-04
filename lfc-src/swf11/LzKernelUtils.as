package {
class LzKernelUtils {
public static function CSSDimension ($0, $1:String = "px") {
if ($0 == 0) return $0;
var $2 = $0;
if (isNaN($0)) {
if (typeof $0 == "string" && $0.indexOf("%") == $0.length - 1 && !isNaN($0.substring(0, $0.length - 1))) {
return $0
} else {
$2 = 0
}} else if ($0 === Infinity) {
$2 = ~0 >>> 1
} else if ($0 === -Infinity) {
$2 = ~(~0 >>> 1)
};
return $2 + $1
}public static function range ($0, $1, $2 = null) {
$0 = $0 > $1 ? $1 : $0;
if ($2 != null) {
$0 = $0 < $2 ? $2 : $0
};
return $0
}public static function rect ($0, $1, $2, $3, $4, $5 = 0, $6 = null, $7 = null, $8 = null) {
if (isNaN($5)) $5 = 0;
if ($6 == null || isNaN($6)) $6 = $5;
if ($8 == null || isNaN($8)) $8 = $6;
if ($7 == null || isNaN($7)) $7 = $5;
LzKernelUtils.roundrect($0, $1, $2, $3, $4, $5, $6, $7, $8, $5, $6, $7, $8)
}public static function roundrect ($0, $1, $2, $3, $4, $5, $6, $7, $8, $9, $a, $b, $c) {
var $d = Math.max, $e = Math.min;
var $f = $e($3 / $d($5 + $6, $8 + $7), $4 / $d($9 + $a, $c + $b));
if ($f > 1) {
$f = 1
};
if ($f < -1) {
$f = -1
};
var $g = $0["curveTo"] ? "curveTo" : "quadraticCurveTo";
$0.moveTo($1, $2 + $9 * $f);
$0.lineTo($1, $2 + $4 - $c * $f);
if ($c || $8) {
$0[$g]($1, $2 + $4, $1 + $8 * $f, $2 + $4)
};
$0.lineTo($1 + $3 - $7 * $f, $2 + $4);
if ($7 || $b) {
$0[$g]($1 + $3, $2 + $4, $1 + $3, $2 + $4 - $b * $f)
};
$0.lineTo($1 + $3, $2 + $a * $f);
if ($a || $6) {
$0[$g]($1 + $3, $2, $1 + $3 - $6 * $f, $2)
};
$0.lineTo($1 + $5 * $f, $2);
if ($5 || $9) {
$0[$g]($1, $2, $1, $2 + $9 * $f)
}}static function parselzoptions ($0:String) {
var $1 = $0.split(new RegExp("([,()])"));
var $2 = 1;
var $3 = 2;
var $4 = {};
var $5 = $2;
var $6 = [];
var $7 = null;
var $8 = 0;
while ($1.length > 0) {
var $9 = $1[0];
var $1 = $1.slice(1);
if ($9 == "") continue;
switch ($5) {
case $2:
if ($9 == ",") {
if ($7 != null && $8 == 0) {
$4[$7] = [true]
}} else if ($9 == "(") {
$5 = $3;
$6 = [];
$4[$7] = $6
} else {
$7 = $9
}break;;case $3:
if ($9 == ")") {
$7 = null;
$5 = $2;
$8 = 0
} else if ($9 == ",") {

} else {
$6.push($9);
$8++
}break
}};
if ($7 != null && $8 == 0) {
$4[$7] = [true]
};
return $4
}}
}
