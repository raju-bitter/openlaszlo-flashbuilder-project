package {
public final class LzGlobalMouseService extends LzEventable {
public static var LzGlobalMouse:LzGlobalMouseService;function LzGlobalMouseService () {
super()
}LzGlobalMouseService.LzGlobalMouse = new LzGlobalMouseService();var onmousemove:LzDeclaredEventClass = LzDeclaredEvent;var onmouseup:LzDeclaredEventClass = LzDeclaredEvent;var onmouseupoutside:LzDeclaredEventClass = LzDeclaredEvent;var onmouseover:LzDeclaredEventClass = LzDeclaredEvent;var onmouseout:LzDeclaredEventClass = LzDeclaredEvent;var onmousedown:LzDeclaredEventClass = LzDeclaredEvent;var onmousedragin:LzDeclaredEventClass = LzDeclaredEvent;var onmousedragout:LzDeclaredEventClass = LzDeclaredEvent;var onmouseleave:LzDeclaredEventClass = LzDeclaredEvent;var onmouseenter:LzDeclaredEventClass = LzDeclaredEvent;var onmouseevent:LzDeclaredEventClass = LzDeclaredEvent;var onclick:LzDeclaredEventClass = LzDeclaredEvent;var ondblclick:LzDeclaredEventClass = LzDeclaredEvent;var __movecounter:int = 0;var __mouseactive:Boolean = true;function __mouseEvent ($0:String, $1:*):void {
if ($0.indexOf("on") != 0) $0 = "on" + $0;
if ($0 == "onmouseleave") {
this.__mouseactive = false;
if (canvas.onmouseleave.ready) {
canvas.onmouseleave.sendEvent(null)
}} else if ($0 == "onmouseenter") {
this.__mouseactive = true;
if (canvas.onmouseenter.ready) {
canvas.onmouseenter.sendEvent(null)
}} else if ($0 == "onmousemove") {
this.__movecounter++
};
var $2:LzDeclaredEventClass = this[$0];
if ($2) {
if ($2.ready) {
$2.sendEvent($1)
};
if (this.onmouseevent.ready) {
this.onmouseevent.sendEvent({type: $0, target: $1})
}}}function __mouseUpOutsideHandler ():void {
LzMouseKernel.__mouseUpOutsideHandler()
}}
}
