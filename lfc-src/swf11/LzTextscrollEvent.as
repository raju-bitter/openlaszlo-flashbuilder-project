package {
class LzTextscrollEvent extends LzNotifyingEvent {
private var __senderscope:LzText;static var LzDeclaredTextscrollEvent:LzDeclaredEventClass;function LzTextscrollEvent ($0:LzEventable, $1:String, $2:* = null) {
this.__senderscope = $0 as LzText;
super($0, $1, $2)
}protected override function notify ($0:Boolean):void {
if (this.__senderscope) {
var $1:LzText = this.__senderscope;
if ($0) {
$1.__scrollEventListeners++
} else {
$1.__scrollEventListeners--
};
var $2:Boolean = $1.__scrollEventListeners > 0 || $1.__userscrollevents;
if ($2 != $1.scrollevents) {
$1.__set_scrollevents($2)
}}}}
}
