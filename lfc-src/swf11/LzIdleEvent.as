package {
class LzIdleEvent extends LzNotifyingEvent {
function LzIdleEvent ($0:LzEventable, $1:String, $2:* = null) {
super($0, $1, $2)
}protected override function notify ($0:Boolean):void {
if ($0) {
LzIdleKernel.addCallback(this, "sendEvent")
} else if (!$0) {
LzIdleKernel.removeCallback(this, "sendEvent")
}}}
}
