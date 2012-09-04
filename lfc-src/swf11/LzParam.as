package {
class LzParam extends LzEventable {
var d:Object = null;var delimiter:String = "&";function $lzc$set_delimiter ($0:String):void {
this.setDelimiter($0)
}var separator:String = "=";function $lzc$set_separator ($0:String):void {
this.setSeparator($0)
}function LzParam () {
super();
this.d = {}}static function parseQueryString ($0:String):Object {
var $1:Object = {};
if (!$0) return $1;
var $2:Array = $0.split("&");
for (var $3:int = 0;$3 < $2.length;++$3) {
var $4:String = $2[$3];
var $5:String = "";
var $6:int = $4.indexOf("=");
if ($6 > 0) {
$5 = decodeURIComponent($4.substring($6 + 1));
$4 = $4.substring(0, $6)
};
$1[$4] = $5
};
return $1
}function addObject ($0:Object):void {
for (var $1:String in $0) {
this.setValue($1, $0[$1])
}}function clone ($0 = null):LzParam {
var $1:LzParam = new (lz.Param)();
for (var $2:String in this.d) {
$1.d[$2] = this.d[$2].concat()
};
return $1
}function remove ($0:String? = null):void {
if ($0 == null) {
this.d = {}} else {
var $1:Array = this.d[$0];
if ($1 != null) {
$1.shift();
if (!$1.length) {
delete this.d[$0]
}}}}function setValue ($0:String, $1:String, $2:Boolean = false):void {
if ($2) $1 = encodeURIComponent($1);
this.d[$0] = [$1]
}function addValue ($0:String, $1:String, $2:Boolean = false):void {
if ($2) $1 = encodeURIComponent($1);
var $3:Array = this.d[$0];
if ($3 == null) {
this.d[$0] = [$1]
} else {
$3.push($1)
}}function getValue ($0:String):String? {
var $1:Array = this.d[$0];
if ($1 != null) {
return $1[0]
};
return null
}function getValues ($0:String):Array? {
var $1:Array = this.d[$0];
if ($1 != null) {
return $1.concat()
};
return null
}function getNames ():Array {
var $0:Array = [];
for (var $1:String in this.d) {
$0.push($1)
};
return $0
}function setDelimiter ($0:String):String {
var $1:String = this.delimiter;
this.delimiter = $0;
return $1
}function setSeparator ($0:String):String {
var $1:String = this.separator;
this.separator = $0;
return $1
}function toString ():String {
return this.serialize()
}function serialize ($0:String? = null, $1:String? = null, $2:Boolean = false):String {
var $0:String = $0 == null ? this.separator : $0;
var $3:String = $1 == null ? this.delimiter : $1;
var $4:String = "";
var $5:Boolean = false;
for (var $6:String in this.d) {
var $7:Array = this.d[$6];
if ($7 != null) {
for (var $8:int = 0;$8 < $7.length;++$8) {
if ($5) $4 += $3;
$4 += $6 + $0 + ($2 ? encodeURIComponent($7[$8]) : $7[$8]);
$5 = true
}}};
return $4
}}
}
