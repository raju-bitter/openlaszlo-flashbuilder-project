package {
class $lz$class_CDATAPresentationType extends $lz$class_PresentationType {
static var lzxtype = "cdata";static var nullValue = "";static var xmlEscapes:Object = {"&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&apos;"};override function accept ($0, $1:LzNode, $2:String) {
var $3:Object = $lz$class_CDATAPresentationType.xmlEscapes;
var $4:String = "";
for (var $5:int = 0, $6:int = $0.length;$5 < $6;$5++) {
var $7:String = $0.charAt($5);
$4 += $3[$7] || $7
};
return $4
}override function present ($0, $1:LzNode, $2:String) {
var $3:String = "";
for (var $4:int = 0, $5:int = $0.length;$4 < $5;$4++) {
var $6:String = $0.charAt($4);
if ($6 == "&") {
var $7:int = $0.indexOf(";", $4);
if ($7 > $4) {
var $8:String = $0.substring($4 + 1, $7);
switch ($8) {
case "amp":
break;;case "lt":
$6 = "<";break;;case "gt":
$6 = ">";break;;case "quot":
$6 = '"';break;;case "apos":
$6 = "'";break;;default:
$6 = "&" + $8 + ";"
};
$4 = $7
}};
$3 += $6
};
return $3
}}
}
