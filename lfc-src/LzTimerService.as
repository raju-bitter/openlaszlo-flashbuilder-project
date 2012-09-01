package {
public final class LzTimerService {
var timerList:Object = new Object();public static var LzTimer:LzTimerService;function LzTimerService () {
super()
}LzTimerService.LzTimer = new LzTimerService();var execDelegate:Function = function ($0:Object):void {
var $1:LzDelegate = $0.delegate;
lz.Timer.removeTimerWithID($1, $0.id);
if ($1.enabled && $1.c) {
$1.execute(new Date().getTime())
}};function removeTimerWithID ($0:LzDelegate, $1:uint):void {
var $2:int = $0.__delegateID;
var $3:* = this.timerList[$2];
if ($3 != null) {
if ($3 instanceof Array) {
for (var $4:int = 0;$4 < $3.length;$4++) {
if ($3[$4] == $1) {
$3.splice($4, 1);
if ($3.length == 0) delete this.timerList[$2];
break
}}} else if ($3 == $1) {
delete this.timerList[$2]
}}}function addTimer ($0:LzDelegate, $1:Number):uint {
if (!$1 || $1 < 1) $1 = 1;
var $2:Object = {delegate: $0};
var $3:uint = LzTimeKernel.setTimeout(this.execDelegate, $1, $2);
$2.id = $3;
var $4:int = $0.__delegateID;
var $5:* = this.timerList[$4];
if ($5 == null) {
this.timerList[$4] = $3
} else if (!($5 instanceof Array)) {
this.timerList[$4] = [$5, $3]
} else {
$5.push($3)
};
return $3
}function removeTimer ($0:LzDelegate):* {
var $1:int = $0.__delegateID;
var $2:* = this.timerList[$1];
var $3:* = null;
if ($2 != null) {
if ($2 instanceof Array) {
$3 = $2.shift();
LzTimeKernel.clearTimeout($3);
if ($2.length == 0) delete this.timerList[$1]
} else {
$3 = $2;
LzTimeKernel.clearTimeout($3);
delete this.timerList[$1]
}};
return $3
}function resetTimer ($0:LzDelegate, $1:Number):uint {
this.removeTimer($0);
return this.addTimer($0, $1)
}}
}
