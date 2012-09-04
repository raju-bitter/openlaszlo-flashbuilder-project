package {
public final class $lz$class_TypeService {
var PresentationTypes:Object;public static var Type:$lz$class_TypeService;function $lz$class_TypeService () {
super();
this.PresentationTypes = {}}$lz$class_TypeService.Type = new $lz$class_TypeService();function acceptTypeValue ($0:String, $1, $2:LzNode, $3:String):* {
var $4 = $0 ? this.PresentationTypes[$0] : null;
if ($1 != null) {
if ($4 != null) {
return $4.accept($1, $2, $3)
}};
return $1
}function presentTypeValue ($0:String, $1, $2:LzNode, $3:String):String {
var $4 = this.PresentationTypes[$0];
if ($4 != null) {
return $4.present($1, $2, $3)
};
return $1
}function addType ($0:String, $1:$lz$class_PresentationType):void {
this.PresentationTypes[$0] = $1
}function addTypeAlias ($0:String, $1:String):void {
var $2 = this.PresentationTypes[$1];
if (!$2) {
return
};
this.PresentationTypes[$0] = $2
}}
}
