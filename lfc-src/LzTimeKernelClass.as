package {

    import flash.utils.getTimer;
    import flash.events.TimerEvent;
    final class LzTimeKernelClass {
private var timers:Object = {};private function createTimer ($0:Number, $1:int, $2:Function, $3:Array):uint {
var $4:LzKernelTimer = LzKernelTimer.create();
this.timers[$4.timerID] = $4;
$4.delay = $0;
$4.repeatCount = $1;
$4.closure = $2;
$4.arguments = $3;
$4.addEventListener(TimerEvent.TIMER, this.timerHandler);
$4.addEventListener(TimerEvent.TIMER_COMPLETE, this.timerCompleteHandler);
$4.start();
return $4.timerID
}private function removeTimer ($0:uint):void {
var $1:LzKernelTimer = this.timers[$0];
if ($1) {
$1.closure = null;
$1.arguments = null;
$1.removeEventListener(TimerEvent.TIMER, this.timerHandler);
$1.removeEventListener(TimerEvent.TIMER_COMPLETE, this.timerCompleteHandler);
$1.reset();
delete this.timers[$0];
LzKernelTimer.remove($1)
}}private function timerHandler ($0:TimerEvent):void {
var $1:LzKernelTimer = LzKernelTimer($0.target);
if ($1.closure) {
$1.closure.apply(null, $1.arguments)
}}private function timerCompleteHandler ($0:TimerEvent):void {
var $1:LzKernelTimer = LzKernelTimer($0.target);
this.removeTimer($1.timerID)
}public var getTimer:Function = flash.utils.getTimer;public function setTimeout ($0:Function, $1:Number, ...$2):uint {
return this.createTimer($1, 1, $0, $2)
}public function setInterval ($0:Function, $1:Number, ...$2):uint {
return this.createTimer($1, 0, $0, $2)
}public function clearTimeout ($0:uint):void {
this.removeTimer($0)
}public function clearInterval ($0:uint):void {
this.removeTimer($0)
}function LzTimeKernelClass () {}}
}
