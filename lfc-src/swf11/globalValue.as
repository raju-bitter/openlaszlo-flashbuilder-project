package {
public var globalValue = function ($0:String) {

      import flash.utils.getDefinitionByName;
    ;
if ($0.charAt(0) == "<" && $0.charAt($0.length - 1) == ">") {
return lz[$0.substring(1, $0.length - 1)]
} else if ($0 in this) {
return this[$0]
} else if ($0 in global) {
return global[$0]
} else if ($0 in __ES3Globals) {
return __ES3Globals[$0]
} else {
try {
return getDefinitionByName($0)
}
catch ($1:ReferenceError) {}};
return void 0
};}
