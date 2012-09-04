package {
public final class LzIdleService extends LzEventable {
var coi:Array;var regNext:Boolean = false;var removeCOI:LzDelegate = null;var onidle:LzDeclaredEventClass = new LzDeclaredEventClass(LzIdleEvent);public static var LzIdle:LzIdleService;function LzIdleService () {
super();
this.coi = new Array();
this.removeCOI = new LzDelegate(this, "removeCallIdleDelegates")
}LzIdleService.LzIdle = new LzIdleService();function callOnIdle ($0:LzDelegate):void {
this.coi.push($0);
if (!this.regNext) {
this.regNext = true;
this.removeCOI.register(this, "onidle")
}}function removeCallIdleDelegates ($0:*):void {
var $1:Array = this.coi.slice(0);
this.coi.length = 0;
for (var $2:int = 0;$2 < $1.length;$2++) {
$1[$2].execute($0)
};
if (this.coi.length == 0) {
this.removeCOI.unregisterFrom(this.onidle);
this.regNext = false
}}function setFrameRate ($0:Number = 30):void {
LzIdleKernel.setFrameRate($0)
}}
}
