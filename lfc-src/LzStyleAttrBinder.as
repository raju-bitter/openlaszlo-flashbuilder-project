package {
class LzStyleAttrBinder extends LzEventable {
var target:LzNode;var dest:String;var source:String;function LzStyleAttrBinder ($0:LzNode, $1:String, $2:String) {
super();
this.target = $0;
this.dest = $1;
this.source = $2
}function bind ($0 = null) {
var $1:LzNode = this.target;
var $2:String = this.dest;
var $3 = $1[$2];
var $4 = $1[this.source];
if ($4 !== $3 || !$1.inited) {
$1.setAttribute($2, $4)
}}}
}
