package {
dynamic class LzScript extends LzNode {
static var tagname = "script";static var attributes = new LzInheritedHash(LzNode.attributes);var src:String;public function LzScript ($0:LzNode? = null, $1:Object? = null, $2:Array? = null, $3:Boolean = false) {
super($0, $1, $2, $3);
$1.script()
}}
}
