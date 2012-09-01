package {
class $lz$class_SizePresentationType extends $lz$class_PresentationType {
static var nullValue = null;static var lzxtype = "size";override function accept ($0, $1:LzNode, $2:String) {
if ($0 == "null") {
return null
};
return Number($0)
}}
}
