package {
class $lz$class_CSSDeclarationPresentationType extends $lz$class_PresentationType {
static var nullValue = {};static var lzxtype = "css";var PropRE = new RegExp("^\\s*(\\S*)\\s*:\\s*(\\S*)\\s*$");var HyphenRE = new RegExp("-(\\w)", "g");var CapitalRE = new RegExp("[A-Z]", "g");override function accept ($0, $1:LzNode, $2:String) {
var $3 = $0.split(";");
var $4 = {};
for (var $5 = 0, $6 = $3.length;$5 < $6;$5++) {
var $7 = $3[$5];
var $8 = $7.match(this.PropRE);
if ($8.length = 3) {
var $9 = $8[1].replace(this.HyphenRE, function ($0, $1) {
return $1.toUpperCase()
});
$4[$9] = $8[2]
}};
return $4
}override function present ($0, $1:LzNode, $2:String) {
var $3 = [];
for (var $4 in $0) {
var $5 = $4.replace(this.CapitalRE, function ($0) {
return "-" + $0.toLowerCase()
});
$3.push($5 + ": " + $0[$4])
};
return $3.join(", ")
}}
}
