package {
public var $lzsc$issubclassof = function ($0:Class, $1:Class) {

      import avmplus.JSONReflection;
      import flash.utils.getQualifiedClassName;
    ;
if ($0 === $1) return true;
if ($1 is Class && $0["prototype"] instanceof $1) return true;
if ($0 is Class && $1["prototype"] instanceof $0) return false;
var $2:String = getQualifiedClassName($1);
var $3:Array = JSONReflection.getClassInterfaces($0);
for (var $4 = 0, $5 = $3.length;$4 < $5;$4++) {
var $6:String = $3[$4];
if ($6 == $2) return true
};
return false
};}
