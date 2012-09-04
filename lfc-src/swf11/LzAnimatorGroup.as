package {
public dynamic class LzAnimatorGroup extends LzNode {
public function LzAnimatorGroup ($0:LzNode? = null, $1:Object? = null, $2:Array? = null, $3:Boolean = false) {
if ($1 && ("start" in $1)) {
$1.started = $1.start;
$1.start = LzNode._ignoreAttribute
};
super($0, $1, $2, $3)
}static var tagname:String = "animatorgroup";static var __LZCSSTagSelectors:Array = ["animatorgroup", "node"];static var attributes:Object = new LzInheritedHash(LzNode.attributes);var updateDel:LzDelegate;var crepeat:Number;var startTime:Number;var __LZpauseTime:Number;var actAnim:Array;var notstarted:Boolean;var needsrestart:Boolean;var attribute;var start = true;function $lzc$set_start ($0) {
this.start = $0;
this.$lzc$set_started($0)
}var started;LzAnimatorGroup.attributes.started = true;var onstarted:LzDeclaredEventClass = LzDeclaredEvent;function $lzc$set_started ($0) {
this.started = $0;
if (this.onstarted.ready) this.onstarted.sendEvent($0);
if (!this.isinited) {
return
};
if ($0) {
this.doStart()
} else {
this.stop()
}}var onstart:LzDeclaredEventClass = LzDeclaredEvent;var onstop:LzDeclaredEventClass = LzDeclaredEvent;var from:*;var to:*;var duration;var onduration:LzDeclaredEventClass = LzDeclaredEvent;function $lzc$set_duration ($0) {
if (isNaN($0)) {
$0 = 0
} else {
$0 = Number($0)
};
this.duration = $0;
var $1:Array = this.subnodes;
if ($1) {
for (var $2:int = 0;$2 < $1.length;++$2) {
if ($1[$2] is LzAnimatorGroup) {
$1[$2].$lzc$set_duration($0)
}}};
if (this.onduration.ready) this.onduration.sendEvent($0)
}var indirect = false;var relative = false;var motion = "easeboth";var repeat = 1;var onrepeat:LzDeclaredEventClass = LzDeclaredEvent;function $lzc$set_repeat ($0) {
if ($0 <= 0) {
$0 = Infinity
};
this.repeat = $0
}var paused = false;var onpaused:LzDeclaredEventClass = LzDeclaredEvent;function $lzc$set_paused ($0) {
if (this.paused && !$0) {
this.__LZaddToStartTime(new Date().getTime() - this.__LZpauseTime)
} else if (!this.paused && $0) {
this.__LZpauseTime = new Date().getTime()
};
this.paused = $0;
if (this.onpaused.ready) this.onpaused.sendEvent($0)
}var target:LzNode;var ontarget:LzDeclaredEventClass = LzDeclaredEvent;function $lzc$set_target ($0) {
this.target = $0;
var $1:Array = this.subnodes;
if ($1) {
for (var $2:int = 0;$2 < $1.length;$2++) {
if ($1[$2] is LzAnimatorGroup) {
$1[$2].$lzc$set_target($0)
}}};
if (this.ontarget.ready) this.ontarget.sendEvent($0)
}var process = "sequential";var isactive:Boolean = false;var animatorProps:Object = {attribute: true, from: true, duration: true, to: true, relative: true, target: true, process: true, indirect: true, motion: true};LzAnimatorGroup.attributes.ignoreplacement = true;override function construct ($0, $1) {
super.construct($0, $1);
var $2:LzNode = this.immediateparent;
if ($2 is LzAnimatorGroup) {
for (var $3:String in this.animatorProps) {
if ($1[$3] == null) {
$1[$3] = $2[$3]
}};
if ($2.animators == null) {
$2.animators = [this]
} else {
$2.animators.push(this)
};
$1.started = LzNode._ignoreAttribute
} else {
this.target = $2
};
if (!this.updateDel) this.updateDel = new LzDelegate(this, "update")
}override function init () {
if (!this.target) this.target = this.immediateparent;
if (this.started) this.doStart();
super.init()
}function doStart () {
if (this.isactive) return false;
this.isactive = true;
if (this.onstart.ready) this.onstart.sendEvent(new Date().getTime());
this.prepareStart();
this.updateDel.register(lz.Idle, "onidle");
return true
}function prepareStart ():void {
this.crepeat = this.repeat;
for (var $0:int = this.animators.length - 1;$0 >= 0;$0--) {
this.animators[$0].notstarted = true
};
this.actAnim = this.animators.concat()
}function resetAnimator ():void {
this.actAnim = this.animators.concat();
for (var $0:int = this.animators.length - 1;$0 >= 0;$0--) {
this.animators[$0].needsrestart = true
}}function update ($0:Number):Boolean {
if (this.paused) {
return false
};
var $1:int = this.actAnim.length - 1;
if ($1 > 0 && this.process == "sequential") $1 = 0;
for (var $2:int = $1;$2 >= 0;$2--) {
var $3:LzAnimatorGroup = this.actAnim[$2];
if ($3.notstarted) {
$3.isactive = true;
$3.prepareStart();
$3.notstarted = false
} else if ($3.needsrestart) {
$3.resetAnimator();
$3.needsrestart = false
};
if ($3.update($0)) {
this.actAnim.splice($2, 1)
}};
if (!this.actAnim.length) {
return this.checkRepeat()
};
return false
}function pause ($0 = null) {
if ($0 == null) {
$0 = !this.paused
};
this.$lzc$set_paused($0)
}function __LZaddToStartTime ($0:Number):void {
this.startTime += $0;
if (this.actAnim) {
for (var $1:int = 0;$1 < this.actAnim.length;$1++) {
this.actAnim[$1].__LZaddToStartTime($0)
}}}function stop () {
if (!this.isactive) return;
this.isactive = false;
if (this.actAnim) {
var $0:int = this.actAnim.length - 1;
if ($0 > 0 && this.process == "sequential") $0 = 0;
for (var $1:int = $0;$1 >= 0;$1--) {
this.actAnim[$1].stop()
}};
this.__LZhalt()
}function __LZfinalizeAnim ():void {
this.__LZhalt()
}function __LZhalt ():void {
this.isactive = false;
this.updateDel.unregisterAll();
if (this.onstop.ready) this.onstop.sendEvent(new Date().getTime())
}function checkRepeat ():Boolean {
if (this.crepeat == 1) {
this.__LZfinalizeAnim();
return true
} else {
this.crepeat--;
if (this.onrepeat.ready) this.onrepeat.sendEvent(new Date().getTime());
this.resetAnimator();
return false
}}override function destroy () {
this.stop();
this.animators = null;
this.actAnim = null;
var $0:LzNode = this.immediateparent;
var $1:Array = $0.animators;
if ($1 && $1.length) {
for (var $2:int = 0;$2 < $1.length;$2++) {
if ($1[$2] == this) {
$1.splice($2, 1);
break
}};
if ($0 is LzAnimatorGroup) {
var $3:Array = ($0 as LzAnimatorGroup).actAnim;
if ($3 && $3.length) {
for (var $2:int = 0;$2 < $3.length;$2++) {
if ($3[$2] == this) {
$3.splice($2, 1);
break
}}}}};
super.destroy()
}override function toString () {
if (this.animators) {
return "Group of " + this.animators.length
};
return "Empty group"
}}
}
