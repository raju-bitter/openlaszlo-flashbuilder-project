package {
public dynamic class LzAnimator extends LzAnimatorGroup {
public function LzAnimator ($0:LzNode? = null, $1:Object? = null, $2:Array? = null, $3:Boolean = false) {
super($0, $1, $2, $3)
}static var tagname:String = "animator";static var __LZCSSTagSelectors:Array = ["animator", "animatorgroup", "node"];static var attributes:Object = new LzInheritedHash(LzAnimatorGroup.attributes);var calcMethod:Function;var currentValue:Number;var doBegin:Boolean;var beginPoleDelta:Number = 0.25;var endPoleDelta:Number = 0.25;var primary_K:Number = 1;var origto:Number;var beginPole:Number;var endPole:Number;var counterkey:String;override function construct ($0, $1) {
super.construct($0, $1);
this.calcMethod = this.calcNextValue
}function $lzc$set_motion ($0) {
this.motion = $0;
if ($0 == "linear") {
this.calcMethod = this.calcNextValueLinear
} else {
this.calcMethod = this.calcNextValue;
this.beginPoleDelta = 0.25;
this.endPoleDelta = 0.25;
if ($0 == "easeout") {
this.beginPoleDelta = 100
} else if ($0 == "easein") {
this.endPoleDelta = 15
}}}function $lzc$set_to ($0) {
this.origto = Number($0)
}var onattribute:LzDeclaredEventClass = LzDeclaredEvent;function $lzc$set_attribute ($0) {
this.attribute = $0;
this.counterkey = $0 + "_lzcounter";
if (this.onattribute.ready) this.onattribute.sendEvent($0)
}function calcControlValues ():void {
var $0 = 0;
this.currentValue = $0;
var $1 = this.to;
var $2:int = this.indirect ? -1 : 1;
if ($0 < $1) {
this.beginPole = $0 - $2 * this.beginPoleDelta;
this.endPole = $1 + $2 * this.endPoleDelta
} else {
this.beginPole = $0 + $2 * this.beginPoleDelta;
this.endPole = $1 - $2 * this.endPoleDelta
};
this.primary_K = 1;
var $3:Number = 1 * (this.beginPole - $1) * ($0 - this.endPole);
var $4:Number = 1 * (this.beginPole - $0) * ($1 - this.endPole);
if ($4 != 0) this.primary_K = Math.abs($3 / $4)
}override function doStart () {
if (this.isactive) return;
this.isactive = true;
this.prepareStart();
this.updateDel.register(lz.Idle, "onidle")
}function updateCounter ($0:Number):Number {
var $1:Object = this.target.__animatedAttributes;
var $2 = $1[this.counterkey];
if ($2 == null) {
$2 = $0
} else {
$2 += $0
};
if ($2 == 0) {
delete $1[this.counterkey]
} else {
$1[this.counterkey] = $2
};
return $2
}override function prepareStart ():void {
this.crepeat = this.repeat;
var $0:LzNode = this.target;
var $1:String = this.attribute;
var $2:Object = $0.__animatedAttributes;
if ($2 == null) {
$2 = $0.__animatedAttributes = {}};
if (this.from != null) {
$0.__setAttr($1, Number(this.from))
};
if ($2[$1] == null) {
$2[$1] = Number($0[$1])
};
if (this.relative) {
this.to = this.origto
} else {
this.to = this.origto - $2[$1]
};
$2[$1] += this.to;
this.updateCounter(1);
this.currentValue = 0;
this.calcControlValues();
this.doBegin = true
}override function resetAnimator ():void {
var $0:LzNode = this.target;
var $1:String = this.attribute;
var $2:Object = $0.__animatedAttributes;
if ($2[$1] == null) {
$2[$1] = Number($0[$1])
};
var $3:* = this.from;
if ($3 != null) {
$2[$1] += Number($3 - $2[$1]);
$0.__setAttr($1, Number($3))
};
if (!this.relative) {
var $4 = this.origto - $2[$1];
if (this.to != $4) {
this.to = $4;
this.calcControlValues()
}};
$2[$1] += this.to;
this.updateCounter(1);
this.currentValue = 0;
this.doBegin = true
}function beginAnimator ($0:Number):void {
this.startTime = $0;
if (this.onstart.ready) this.onstart.sendEvent($0);
this.doBegin = false
}override function stop () {
if (!this.isactive) return;
this.isactive = false;
var $0:String = this.attribute;
var $1:Object = this.target.__animatedAttributes;
if (this.updateCounter(-1) == 0) {
delete $1[$0]
} else {
$1[$0] -= this.to - this.currentValue
};
this.__LZhalt()
}override function __LZfinalizeAnim ():void {
var $0:LzNode = this.target;
var $1:String = this.attribute;
var $2:Object = $0.__animatedAttributes;
if (this.updateCounter(-this.repeat) == 0) {
var $3 = $2[$1];
delete $2[$1];
$0.__setAttr($1, $3)
};
this.__LZhalt()
}function calcNextValue ($0:Number):Number {
var $1:Number = this.currentValue;
var $2:Number = this.endPole;
var $3:Number = this.beginPole;
var $4:Number = Math.exp($0 * 1 / this.duration * Math.log(this.primary_K));
if ($4 != 1) {
var $5:Number = $3 * $2 * (1 - $4);
var $6:Number = $2 - $4 * $3;
if ($6 != 0) $1 = $5 / $6
};
return $1
}function calcNextValueLinear ($0:Number):Number {
var $1:Number = $0 / this.duration;
return $1 * this.to
}override function update ($0:Number):Boolean {
if (this.doBegin) {
this.beginAnimator($0)
} else {
if (!this.paused) {
var $1:Number = $0 - this.startTime;
var $2 = false;
if ($1 < this.duration) {
var $3 = this.calcMethod($1)
} else {
var $3 = this.to;
$2 = true
};
var $4:LzNode = this.target;
var $5:String = this.attribute;
$4.__setAttr($5, $4[$5] + ($3 - this.currentValue));
this.currentValue = $3;
if ($2) {
return this.checkRepeat()
}}};
return false
}override function toString () {
return "Animator for " + this.target + " attribute:" + this.attribute + " to:" + this.to
}}
}
