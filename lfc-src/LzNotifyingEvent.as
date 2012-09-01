package {
class LzNotifyingEvent extends LzEvent {
function LzNotifyingEvent ($0:LzEventable, $1:String, $2:* = null) {
var $3 = this.ready;
super($0, $1, $2);
if (this.ready != $3) {
this.notify(this.ready)
}}public override function addDelegate ($0:LzDelegate):void {
var $1 = this.ready;
super.addDelegate($0);
if (this.ready != $1) {
this.notify(this.ready)
}}public override function removeDelegate ($0:LzDelegate = null):void {
var $1 = this.ready;
super.removeDelegate($0);
if (this.ready != $1) {
this.notify(this.ready)
}}public override function clearDelegates ():void {
var $0 = this.ready;
super.clearDelegates();
if (this.ready != $0) {
this.notify(this.ready)
}}protected function notify ($0:Boolean):void {}}
}
