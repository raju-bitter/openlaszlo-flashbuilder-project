package {
class $lz$class_ExpressionPresentationType extends $lz$class_PresentationType {
static var nullValue = null;static var lzxtype = "expression";override function accept ($0, $1:LzNode, $2:String) {
switch ($0) {
case "undefined":
return void 0;;case "null":
return null;;case "false":
return false;;case "true":
return true;;case "NaN":
return 0 / 0;;case "Infinity":
return Infinity;;case "-Infinity":
return -Infinity;;case "":
return ""
};
if (!isNaN($0)) {
return Number($0)
};
return String($0)
}}
}
