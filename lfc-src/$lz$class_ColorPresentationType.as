package {
class $lz$class_ColorPresentationType extends $lz$class_PresentationType {
static var nullValue = 0;static var lzxtype = "color";override function accept ($0, $1:LzNode, $2:String) {
if ($0 == -1) {
return null
};
return LzColorUtils.hextoint($0)
}override function present ($0, $1:LzNode, $2:String) {
var $3 = lz.colors;
for (var $4 in $3) {
if ($3[$4] === $0) {
return $4
}};
return LzColorUtils.inttohex($0)
}}
}
