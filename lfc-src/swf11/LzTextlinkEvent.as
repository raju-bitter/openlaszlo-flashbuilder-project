package {
class LzTextlinkEvent extends LzNotifyingEvent {
private var __senderscope:LzEventable;static var LzDeclaredTextlinkEvent:LzDeclaredEventClass;function LzTextlinkEvent ($0:LzEventable, $1:String, $2:* = null) {
this.__senderscope = $0;
super($0, $1, $2)
}protected override function notify ($0:Boolean):void {
var $1:LzText = this.__senderscope as LzText;
if ($1 && $1.tsprite) {
$1.tsprite.activateLinks($0)
}}}
}
