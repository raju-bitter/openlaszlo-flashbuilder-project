package {
class LzColorUtils {
static var __cache = {counter: 0};static function colorfrominternal ($0:Number):Number {
return $0 & 16777215
}static function alphafrominternal ($0:Number):Number {
return (255 - ($0 >>> 24 & 255)) / 255
}static function coloralphafrominternal ($0:Number):Array {
return [$0 & 16777215, (255 - ($0 >>> 24 & 255)) / 255]
}static function internalfromcoloralpha ($0:Number, $1:Number):Number {
return 255 - (Math.round($1 * 255) & 255) << 24 | $0 & 16777215
}static function rgbafrominternal ($0:Number):Array {
return [$0 >> 16 & 255, $0 >> 8 & 255, $0 & 255, (255 - ($0 >>> 24 & 255)) / 255]
}static function internalfromrgba ($0:Number, $1:Number, $2:Number, $3:Number):Number {
var $4 = Math.round;
return 255 - ($4($3 * 255) & 255) << 24 | ($4($0) & 255) << 16 | ($4($1) & 255) << 8 | $4($2) & 255
}static function hslafrominternal ($0:Number):Array {
var $1 = ($0 >> 16 & 255) / 255, $2 = ($0 >> 8 & 255) / 255, $3 = ($0 & 255) / 255;
var $4 = (255 - ($0 >>> 24 & 255)) / 255;
var $5 = Math.min($1, Math.min($2, $3)), $6 = Math.max($1, Math.max($2, $3));
var $7, $8, $9 = ($6 + $5) / 2;
if ($6 == $5) {
$7 = $8 = 0
} else {
var $a = $6 - $5;
$8 = $9 > 0.5 ? $a / (2 - $6 - $5) : $a / ($6 + $5);
switch ($6) {
case $1:
$7 = ($2 - $3) / $a + ($2 < $3 ? 6 : 0);break;;case $2:
$7 = ($3 - $1) / $a + 2;break;;case $3:
$7 = ($1 - $2) / $a + 4;break
};
$7 *= 60;
if ($7 < 0) {
$7 += 360
}};
return [$7, $8, $9, $4]
}static function internalfromhsla ($0:Number, $1:Number, $2:Number, $3:Number):Number {
var $4;
$4 = function ($0, $1, $2) {
if ($2 < 0) {
$2++
};
if ($2 > 1) {
$2--
};
if ($2 * 6 < 1) {
return $0 + ($1 - $0) * $2 * 6
};
if ($2 * 2 < 1) {
return $1
};
if ($2 * 3 < 2) {
return $0 + ($1 - $0) * (2 / 3 - $2) * 6
};
return $0
};
$0 = ($0 % 360 + 360) % 360 / 360;
var $5 = $2 <= 0.5 ? $2 * ($1 + 1) : $2 + $1 - $2 * $1;
var $6 = $2 * 2 - $5;
var $7 = $4($6, $5, $0 + 1 / 3);
var $8 = $4($6, $5, $0);
var $9 = $4($6, $5, $0 - 1 / 3);
return LzColorUtils.internalfromrgba($7 * 255, $8 * 255, $9 * 255, $3)
}static function hsvafrominternal ($0:Number):Array {
var $1 = ($0 >> 16 & 255) / 255, $2 = ($0 >> 8 & 255) / 255, $3 = ($0 & 255) / 255;
var $4 = (255 - ($0 >>> 24 & 255)) / 255;
var $5 = Math.min($1, Math.min($2, $3)), $6 = Math.max($1, Math.max($2, $3));
var $7, $8, $9 = $6;
if ($6 == $5) {
$7 = $8 = 0
} else {
var $a = $6 - $5;
$8 = $a / $6;
if ($1 == $6) {
$7 = ($2 - $3) / $a
} else if ($2 == $6) {
$7 = 2 + ($3 - $1) / $a
} else {
$7 = 4 + ($1 - $2) / $a
};
$7 *= 60;
if ($7 < 0) {
$7 += 360
}};
return [$7, $8, $9, $4]
}static function internalfromhsva ($0:Number, $1:Number, $2:Number, $3:Number):Number {
var $4 = $0 / 60;
var $5 = $4 | 0;
var $6 = $5 % 6;
var $7 = $4 - $5;
var $8 = $2 * (1 - $1);
var $9 = $2 * (1 - $7 * $1);
var $4 = $2 * (1 - (1 - $7) * $1);
var $a, $b, $c;
switch ($6) {
case 0:
$a = $2;$b = $4;$c = $8;break;;case 1:
$a = $9;$b = $2;$c = $8;break;;case 2:
$a = $8;$b = $2;$c = $4;break;;case 3:
$a = $8;$b = $9;$c = $2;break;;case 4:
$a = $4;$b = $8;$c = $2;break;;case 5:
$a = $2;$b = $8;$c = $9;break
};
return LzColorUtils.internalfromrgba($a * 255, $b * 255, $c * 255, $3)
}static var ColorPattern = new RegExp("^\\s*(rgb|hsl|hsv)a?\\s*\\(([^,]+),([^,]+),([^,\\)]+)(?:,([^\\)]+))?\\)\\s*$");static var PercentPattern = new RegExp("^\\s*(100(?:\\.0*)?|\\d{1,2}(?:\\.\\d*)?|\\.\\d+)\\s*%\\s*$");static var NumberPattern = new RegExp("^\\s*(\\d{1,3}(?:\\.\\d*)?|\\.\\d+)\\s*$");static var HexPattern = new RegExp("^\\s*#\\s*([a-fA-F\\d]{3,8})\\s*$");static function internalfromcss ($0:String) {
if ($0 in lz.colors) {
return lz.colors[$0]
};
var $1:Array;
if ($1 = $0.match(LzColorUtils.ColorPattern)) {
var $2 = [0, 0, 0, 1];
var $3, $4;
switch ($1[1]) {
case "rgb":
$3 = [255, 255, 255, 1];$4 = [1, 1, 1, 1];break;;case "hsv":
case "hsl":
$3 = [360, 1, 1, 1];$4 = [1, 100, 100, 1];break
};
var $5:Array, $6:Array;
for (var $7 = 0, $8 = $1.length - 2;$7 < $8;$7++) {
var $9 = $1[$7 + 2];
if ($9) {
if ($5 = $9.match(LzColorUtils.PercentPattern)) {
$2[$7] = parseFloat($5[1]) * $3[$7] / 100
} else if ($6 = $9.match(LzColorUtils.NumberPattern)) {
$2[$7] = parseFloat($6[1]) / $4[$7]
} else {
return 0
}}};
switch ($1[1]) {
case "rgb":
return LzColorUtils.internalfromrgba.apply(LzColorUtils, $2);;case "hsv":
return LzColorUtils.internalfromhsva.apply(LzColorUtils, $2);;case "hsl":
return LzColorUtils.internalfromhsla.apply(LzColorUtils, $2)
}} else if ($1 = $0.match(LzColorUtils.HexPattern)) {
var $a:String = $1[1];
var $b:Number = parseInt($a, 16);
var $c:Number = 1;
switch ($a.length) {
case 3:
$b = (($b & 3840) << 8 | ($b & 240) << 4 | $b & 15) * 17;break;;case 6:
break;;case 4:
$b = (($b & 61440) << 12 | ($b & 3840) << 8 | ($b & 240) << 4 | $b & 15) * 17;;case 8:
$c = ($b & 255) / 255;$b = $b >>> 8 & 16777215;break;;default:
return 0
};
return LzColorUtils.internalfromcoloralpha($b, $c)
};
return 0
}static function fractionToDecimal ($0:Number, $1:Number = 255):String {
var $2 = Math.round;
var $3 = ($0 / $1).toString();
var $4 = $3.indexOf(".");
if ($4 == -1) {
return $3
};
$4 += 2;
for (var $5 = $3.length;$4 < $5;$4++) {
var $6 = $3.substring(0, $4);
if ($0 === $2($1 * $6)) {
return $6
}};
return $3
}static function cssfrominternal ($0:Number, $1:String = null):String {
var $2 = LzColorUtils.fractionToDecimal;
var $3:Array;
if (!$1) {
$1 = LzColorUtils.alphafrominternal($0) !== 1 ? "rgb" : "#"
};
switch ($1) {
default:
;case "rgb":
$3 = LzColorUtils.rgbafrominternal($0);if ($3[3] == 1) {
return "rgb(" + $3[0] + "," + $3[1] + "," + $3[2] + ")"
} else {
return "rgba(" + $3[0] + "," + $3[1] + "," + $3[2] + "," + $2($3[3] * 255) + ")"
};case "hsl":
$3 = LzColorUtils.hslafrominternal($0);if ($3[3] == 1) {
return "hsl(" + $3[0] + "," + $3[1] * 100 + "%," + $3[2] * 100 + "%)"
} else {
return "hsl(" + $3[0] + "," + $3[1] * 100 + "%," + $3[2] * 100 + "%," + $3[3] + ")"
};case "hsv":
$3 = LzColorUtils.hsvafrominternal($0);if ($3[3] == 1) {
return "hsv(" + $3[0] + "," + $3[1] * 100 + "%," + $3[2] * 100 + "%)"
} else {
return "hsv(" + $3[0] + "," + $3[1] * 100 + "%," + $3[2] * 100 + "%," + $3[3] + ")"
};case "#":
$3 = LzColorUtils.rgbafrominternal($0);var $4:String = "#";for (var $5 = 0;$5 < 4;$5++) {
var $6 = $3[$5];
if ($5 == 3) {
if ($6 == 1) {
break
};
$6 = Math.round($6 * 255)
};
if ($6 < 16) {
$4 += "0"
};
$4 += $6.toString(16)
};return $4
}}static function stringToColor ($0:*) {
if (typeof $0 != "string") return $0;
if ($0 in lz.colors) return lz.colors[$0];
if ($0.indexOf("rgb") != -1) return LzColorUtils.internalfromcss($0);
var $1 = Number($0);
if (isNaN($1)) {
return $0
} else {
return $1
}}static function fromrgb ($0:String) {
if (typeof $0 != "string") return $0;
return LzColorUtils.internalfromcss($0)
}static function dectohex ($0:*, $1:int = 0) {
if (typeof $0 != "number") return $0;
$0 = $0 & 16777215;
var $2 = $0.toString(16);
var $3 = $1 - $2.length;
while ($3 > 0) {
$2 = "0" + $2;
$3--
};
return $2
}static function torgb ($0:*) {
if (typeof $0 == "string") {
$0 = LzColorUtils.hextoint($0)
};
var $1 = LzColorUtils.__cache;
var $2 = "torgb" + $0;
if ($1[$2]) return $1[$2];
if (++$1.counter > 1000) {
$1 = {counter: 0}};
return $1[$2] = LzColorUtils.cssfrominternal($0, "rgb")
}static function tohsv ($0) {
var $1 = LzColorUtils.__cache;
var $2 = "tohsv" + $0;
if ($1[$2]) return $1[$2];
if (++$1.counter > 1000) {
$1 = {counter: 0}};
$0 = LzColorUtils.hextoint($0);
var $3:Array = LzColorUtils.hsvafrominternal($0);
return $1[$2] = {h: $3[0], s: $3[1], v: $3[2], a: $3[3]}}static function fromhsv ($0, $1, $2, $3 = 1) {
var $4 = LzColorUtils.__cache;
var $5 = "fromhsv" + $0 + $1 + $2 + $3;
if ($4[$5]) return $4[$5];
if (++$4.counter > 1000) {
$4 = {counter: 0}};
return $4[$5] = LzColorUtils.internalfromhsva($0, $1, $2, $3)
}static function convertColor ($0:*) {
if ($0 == "null" || $0 == null) return null;
return LzColorUtils.hextoint($0)
}static function hextoint ($0:*) {
var $1 = LzColorUtils.stringToColor($0);
if (typeof $1 != "string") return $1;
var $2 = LzColorUtils.__cache;
var $3 = "hextoint" + $0;
if ($2[$3]) return $2[$3];
if (++$2.counter > 1000) {
$2 = {counter: 0}};
return $2[$3] = LzColorUtils.internalfromcss($0)
}static function inttohex ($0:*, $1:int = 6) {
var $2 = LzColorUtils.stringToColor($0);
if (typeof $2 != "number") return $2;
var $3 = LzColorUtils.__cache;
var $4 = "inttohex" + $2;
if ($3[$4]) return $3[$4];
if (++$3.counter > 1000) {
$3 = {counter: 0}};
return $3[$4] = LzColorUtils.cssfrominternal($2)
}static function inttocolorobj ($0) {
var $1:Number = LzColorUtils.hextoint($0);
var $2 = LzColorUtils.__cache;
var $3 = "inttocolorobj" + $1;
if ($2[$3]) return $2[$3];
if (++$2.counter > 1000) {
$2 = {counter: 0}};
var $4:uint = $1 | 0;
var $5 = LzColorUtils.findalpha($1);
if ($5 != null) {
$5 *= 100 / 255
};
$2[$3] = {color: $4, alpha: $5};
return $2[$3]
}static function rgbatoint ($0:int, $1:int, $2:int, $3 = null):Number {
return LzColorUtils.internalfromrgba($0, $1, $2, $3 == null ? 1 : $3)
}static function inttorgba ($0:Number):Array {
var $1 = LzColorUtils.rgbafrominternal($0);
if ($1[3] == 1) {
$1[3] = null
} else {
$1[3] = Math.round($1[3] * 255)
};
return $1
}static function findalpha ($0) {
if ($0 == null) return;
var $1 = LzColorUtils.alphafrominternal($0);
if ($1 == 1) {
return null
};
return Math.round($1 * 255)
}static function blendRGBA ($0, $1, $2) {
if ($0 === $1) return $0;
$0 = LzColorUtils.rgbafrominternal($0);
$1 = LzColorUtils.rgbafrominternal($1);
var $3 = 1 - $2;
var $4 = $3 * $0[0] + $2 * $1[0];
var $5 = $3 * $0[1] + $2 * $1[1];
var $6 = $3 * $0[2] + $2 * $1[2];
var $7 = $3 * $0[3] + $2 * $1[3];
return LzColorUtils.internalfromrgba($4, $5, $6, $7)
}static function blendHSVA ($0, $1, $2) {
if ($0 === $1) return $0;
$0 = LzColorUtils.hsvafrominternal($0);
$1 = LzColorUtils.hsvafrominternal($1);
var $3 = 1 - $2;
var $4 = $3 * $0[0] + $2 * $1[0];
var $5 = $3 * $0[1] + $2 * $1[1];
var $6 = $3 * $0[2] + $2 * $1[2];
var $7 = $3 * $0[3] + $2 * $1[3];
return LzColorUtils.internalfromhsva($4, $5, $6, $7)
}static function applyTransform ($0, $1) {
var $2 = LzColorUtils.inttorgba($0);
var $3 = $2[0];
var $4 = $2[1];
var $5 = $2[2];
var $6 = $2[3];
$3 = $3 * $1["redMultiplier"] + $1["redOffset"];
$3 = Math.min($3, 255);
$4 = $4 * $1["greenMultiplier"] + $1["greenOffset"];
$4 = Math.min($4, 255);
$5 = $5 * $1["blueMultiplier"] + $1["blueOffset"];
$5 = Math.min($5, 255);
if ($6 != null) {
$6 = $6 * $1["alphaMultiplier"] + $1["alphaOffset"];
$6 = Math.min($6, 255)
};
return LzColorUtils.rgbatoint($3, $4, $5, $6)
}}
}
