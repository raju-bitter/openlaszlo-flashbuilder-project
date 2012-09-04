package {
class $lz$class_BooleanPresentationType extends $lz$class_PresentationType {
static var nullValue = false;static var lzxtype = "boolean";override function accept ($0, $1:LzNode, $2:String) {
switch ($0.toLowerCase()) {
case "":
case "0":
case "false":
return false;;default:
return true
}}}
}
