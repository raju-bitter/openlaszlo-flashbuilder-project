package {
public var $lzc$getFunctionDependencies = function ($0:String, $1, $2, $3:Array, $4:String = null):Array {
var $5 = [], $6 = null;
try {
$6 = $2["$lzc$" + $0 + "_dependencies"]
}
catch ($7) {};
if (!($6 is Function)) {

} else {
try {
$5 = $6.apply($2, ([$1, $2]).concat($3))
}
catch ($7) {}};
return $5
};}
