package {
class $lzsc$mixin$LzFormatter$LzView extends LzView implements LzFormatter {
function toNumber ($0) {
return Number($0)
}function pad ($0 = "", $1:Number = 0, $2 = null, $3:String = " ", $4:String = "-", $5:Number = 10, $6:Boolean = false) {
var $7 = typeof $0 == "number";
if ($7) {
if ($2 != null) {
var $8 = Math.pow(10, -$2);
$0 = Math.round($0 / $8) * $8
};
$0 = Number($0).toString($5);
if ($4 != "-") {
if ($0.indexOf("-") != 0) {
if ($0 != 0) {
$0 = $4 + $0
} else {
$0 = " " + $0
}}}} else {
$0 = "" + $0
};
var $9 = $0.length;
if ($2 != null) {
if ($7) {
var $a = $0.lastIndexOf(".");
if ($a == -1) {
var $b = 0;
if ($6 || $2 > 0) {
$0 += "."
}} else {
var $b = $9 - ($a + 1)
};
if ($b > $2) {
$0 = $0.substring(0, $9 - ($b - $2))
} else {
for (var $c = $b;$c < $2;$c++) $0 += "0"
}} else {
$0 = $0.substring(0, $2)
}};
$9 = $0.length;
var $d = false;
if ($1 < 0) {
$1 = -$1;
$d = true
};
if ($9 >= $1) {
return $0
};
if ($d) {
for (var $c = $9;$c < $1;$c++) $0 = $0 + " "
} else {
$4 = null;
if ($3 != " ") {
if (" +-".indexOf($0.substring(0, 1)) >= 0) {
$4 = $0.substring(0, 1);
$0 = $0.substring(1)
}};
for (var $c = $9;$c < $1;$c++) $0 = $3 + $0;
if ($4 != null) {
$0 = $4 + $0
}};
return $0
}function abbreviate ($0:String, $1 = Infinity):String {
if ($0) {
var $2 = "\u2026";
if ($0.length > $1 - $2.length) {
$0 = $0.substring(0, $1 - $2.length) + $2
}};
return $0
}static var singleEscapeCharacters = (function ($0) {
var $1 = [];
for (var $2 = 0, $3 = $0.length;$2 < $3;$2 += 2) {
var $4 = $0[$2];
var $5 = $0[$2 + 1];
$1[$5.charCodeAt(0)] = $4
};
return $1
})(["\\b", "\b", "\\t", "\t", "\\n", "\n", "\\v", String.fromCharCode(11), "\\f", "\f", "\\r", "\r", '\\"', '"', "\\'", "'", "\\\\", "\\"]);function stringEscape ($0:String, $1:Boolean = false) {
var $2 = singleEscapeCharacters;
var $3 = '"';
var $4 = "";
var $5 = "'";
if ($1) {
$5 = "";
var $6 = $0.split("'").length;
var $7 = $0.split('"').length;
if ($6 > $7) {
$3 = "'";
$4 = '"'
} else {
$3 = '"';
$4 = "'"
}};
var $8 = "";
for (var $9 = 0, $a = $0.length;$9 < $a;$9++) {
var $b = $0.charAt($9);
var $c = $0.charCodeAt($9);
if ($c in $2) {
if ($b != $3 && $b != $5) {
$8 += $2[$c]
} else {
$8 += $b
}} else if ($c >= 0 && $c <= 31 || $c >= 127 && $c <= 159) {
$8 += "\\x" + this.pad($c, 2, 0, "0", "", 16)
} else {
$8 += $b
}};
return $4 + $8 + $4
}function formatToString ($0 = "", ...$1) {
var $2 = new LzMessage();
if (!(typeof $0 == "string" || $0 is String) || $1.length > 0 != $0.indexOf("%") >= 0) {
$1 = ([$0]).concat($1);
for (var $3 = 0, $4 = $1.length;$3 < $4;$3++) {
var $5 = $1[$3];
var $6 = $3 == $4 - 1 ? "\n" : " ";
$2.append($5);
$2.appendInternal($6)
};
return $2
};
this.formatToMessage.apply(this, ([$2, $0]).concat($1));
return $2
}function formatToMessage ($0:LzMessage, $1:String = "", ...args) {
var $5;
var $6;
$5 = function ($0) {
if ($0 >= al) {
return null
};
return args[$0]
};
$6 = function ($0) {};
var al = args.length;
var $2 = "" + $1;
var $3 = 0;
var $4 = 0;
var $7 = 0, $8 = $2.length;
var $9 = 0, $a = 0;
while ($9 < $8) {
$a = $2.indexOf("%");
if ($a == -1) {
$0.append($2.substring($9, $8));
break
};
$0.append($2.substring($9, $a));
$7 = $a;
$9 = $a + 1;
$a = $a + 2;
var $b = "-";
var $c = " ";
var $d = false;
var $e = "";
var $f = null;
var $g = null;
var $h = null;
var $i = null;
var $j = null;
while ($9 < $8 && $g == null) {
var $k = $2.substring($9, $a);
$9 = $a++;
switch ($k) {
case "-":
$e = $k;break;;case "+":
case " ":
$b = $k;break;;case "#":
$d = true;break;;case "0":
if ($e === "" && $f === null) {
$c = $k;
break
};case "1":
case "2":
case "3":
case "4":
case "5":
case "6":
case "7":
case "8":
case "9":
if ($f !== null) {
$f += $k
} else {
$e += $k
}break;;case "$":
$3 = $e - 1;$e = "";break;;case "*":
if ($f !== null) {
$f = $5($3);
$6($3++)
} else {
$e = $5($3);
$6($3++)
}break;;case ".":
$f = "";break;;case "h":
case "l":
break;;case "=":
$h = $5($3);$6($3++);break;;case "^":
$i = $5($3);$6($3++);break;;case "{":
var $l = $2.indexOf("}", $9);if ($l > $9) {
if ($j == null) {
$j = {}};
$j.style = $2.substring($9, $l);
$9 = $l + 1;
$a = $9 + 1;
break
}$g = $k;break;;default:
$g = $k;break
}};
var $m = $5($3);
if ($h == null) {
$h = $m
};
if ($i != null) {
$h = new LzFormatCallback($i, $h)
};
var $n = null;
var $o = false;
if ($f !== null) {
$n = 1 * $f
} else {
switch ($g) {
case "F":
case "E":
case "G":
case "f":
case "e":
case "g":
$n = 6;$o = $d;break;;case "O":
case "o":
if ($d && $m != 0) {
$0.append("0")
}break;;case "X":
case "x":
if ($d && $m != 0) {
$0.append("0" + $g)
}break
}};
var $p = 10;
switch ($g) {
case "o":
case "O":
$p = 8;break;;case "x":
case "X":
$p = 16;break
};
switch ($g) {
case "U":
case "O":
case "X":
case "u":
case "o":
case "x":
if ($m < 0) {
$m = -$m;
var $q = Math.abs(parseInt($e, 10));
if (isNaN($q)) {
$q = this.toNumber($m).toString($p).length
};
var $r = Math.pow($p, $q);
$m = $r - $m
}break
};
switch ($g) {
case "D":
case "U":
case "I":
case "O":
case "X":
case "F":
case "E":
case "G":
$m = this.toNumber($m);$0.appendInternal(this.pad($m, $e, $n, $c, $b, $p, $o).toUpperCase(), $h, $j);$6($3++);break;;case "c":
$m = String.fromCharCode($m);;case "w":
;case "s":
var $s = null;if ($m is Function) {
if (!$s) {
$s = "function () {\u2026}"
}} else if (typeof $m == "number") {
$s = Number($m).toString($p)
} else if ($g == "w") {
if (typeof $m == "string") {
$s = this.stringEscape($m, true)
} else if ($m is LzNode) {
$s = $m.nodePath($m, $n)
}}if (!$s) {
$s = "" + $m
}if ($d) {
var $t = $n;
if ($t) {
$s = this.abbreviate($s, $t);
$n = null
}}$0.appendInternal(this.pad($s, $e, $n, $c, $b, $p, $o), $h, $j);$6($3++);break;;case "d":
case "u":
case "i":
case "o":
case "x":
case "f":
case "e":
case "g":
$m = this.toNumber($m);$0.appendInternal(this.pad($m, $e, $n, $c, $b, $p, $o), $h, $j);$6($3++);break;;case "%":
$0.append("%");break;;default:
$0.append($2.substring($7, $9));break
};
$2 = $2.substring($9, $8);
$7 = 0, $8 = $2.length;
$9 = 0, $a = 0;
if ($3 > $4) {
$4 = $3
}};
if ($4 < al) {
$0.appendInternal(" ");
for (;$4 < al;$4++) {
var $u = $5($4);
var $v = $4 == al - 1 ? "\n" : " ";
$0.append($u);
$0.appendInternal($v)
}};
return $0
}function $lzsc$mixin$LzFormatter$LzView ($0:LzNode? = null, $1:Object? = null, $2:Array? = null, $3:Boolean = false) {
super($0, $1, $2, $3)
}}
}
