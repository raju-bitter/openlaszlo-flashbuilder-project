package {
class AnonDatasetGenerator extends LzEventable {
var pp:LzParsedPath = null;var __LZdepChildren:Array = null;var onDocumentChange:LzDeclaredEventClass = LzDeclaredEvent;var onerror:LzDeclaredEventClass = LzDeclaredEvent;var ontimeout:LzDeclaredEventClass = LzDeclaredEvent;var noncontext:Boolean = true;function AnonDatasetGenerator ($0:LzParsedPath) {
super();
this.pp = $0
}function getContext () {
var $0:LzDataset = new LzDataset(null, {name: null});
var $1:Array = this.pp.selectors;
if ($1 != null) {
var $2:LzDatapointer = $0.getPointer();
for (var $3:int = 0;$3 < $1.length;$3++) {
if ($1[$3] == "/") continue;
$2.addNode($1[$3]);
$2.selectChild()
}};
return $0
}function getDataset () {
return null
}}
}
