package {
dynamic class LzLibraryCleanup extends LzNode {
static var attributes = new LzInheritedHash(LzNode.attributes);var lib:* = null;function LzLibraryCleanup ($0:LzNode? = null, $1:Object? = null, $2:Array? = null, $3:Boolean = false) {
super($0, $1, $2, $3)
}function $lzc$set_libname ($0) {
this.lib = LzLibrary.findLibrary($0);
this.lib.loadfinished()
}}
}
