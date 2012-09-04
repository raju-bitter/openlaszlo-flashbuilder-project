package {
dynamic class LzState extends LzNode {
static var tagname:String = "state";static var __LZCSSTagSelectors:Array = ["state", "node"];static var attributes = new LzInheritedHash(LzNode.attributes);var heldArgs;var releasedconstraints;var appliedChildren;var applyOnInit:Boolean = false;var __LZpool:Array = null;var __LZstateconstraintdelegates;public function LzState ($0:*, $1:*, $2:* = null, $3:* = null) {
this.heldArgs = {};
this.appliedChildren = [];
super($0, $1, $2, $3)
}var onapply:LzDeclaredEventClass = LzDeclaredEvent;var onremove:LzDeclaredEventClass = LzDeclaredEvent;var applied = false;function $lzc$set_applied ($0) {
if ($0) {
if (this.isinited) {
this.apply()
} else {
this.applyOnInit = true
}} else {
if (this.isinited) {
this.remove()
}}}var onapplied:LzDeclaredEventClass = LzDeclaredEvent;static var events = {onremove: true, onapply: true, onapplied: true};prototype.$isstate = true;var asyncnew = false;var subh = null;var pooling = false;function $lzc$set_asyncnew ($0) {
this.__LZsetProperty($0, "asyncnew")
}function $lzc$set_pooling ($0) {
this.__LZsetProperty($0, "pooling")
}function $lzc$set___LZsourceLocation ($0) {
this.__LZsetProperty($0, "__LZsourceLocation")
}override function init () {
super.init();
if (this.applyOnInit) {
this.apply()
}}override function createChildren ($0) {
this.subh = $0;
this.__LZinstantiationDone()
}function apply () {
if (this.applied) {
return
};
var $0 = this.parent;
this.applied = true;
var $1 = $0._instanceAttrs;
if ($1) {
for (var $2 in this.heldArgs) {
if ($1[$2] is LzConstraintExpr) {
if (this.releasedconstraints == null) {
this.releasedconstraints = []
};
var $3 = $1[$2].methodName;
if ($0.releaseConstraintMethod($3)) {
this.releasedconstraints.push($3)
}}}};
var $4 = $0.__LZconstraintdelegates;
$0.__LZconstraintdelegates = null;
$0.__LZapplyArgs(this.heldArgs, null);
if (this.subh) var $5 = this.subh.length;
$0.__LZsetPreventInit();
for (var $6 = 0;$6 < $5;$6++) {
if (this.__LZpool && this.__LZpool[$6]) {
this.appliedChildren.push(this.__LZretach(this.__LZpool[$6]))
} else {
this.appliedChildren.push($0.makeChild(this.subh[$6], this.asyncnew))
}};
$0.__LZclearPreventInit();
$0.__LZresolveReferences();
this.__LZstateconstraintdelegates = $0.__LZconstraintdelegates;
$0.__LZconstraintdelegates = $4;
if (this.onapply.ready) this.onapply.sendEvent(this);
if (this.onapplied.ready) this.onapplied.sendEvent(true)
}function remove () {
if (!this.applied) {
return
};
this.applied = false;
if (this.onremove.ready) this.onremove.sendEvent(this);
if (this.onapplied.ready) this.onapplied.sendEvent(false);
var $0 = this.__LZstateconstraintdelegates;
if ($0) {
for (var $1 = 0, $2 = $0.length;$1 < $2;$1++) {
var $3 = $0[$1];
if ($3.__LZdeleted == false) {
$3.destroy()
}};
this.__LZstateconstraintdelegates = null
};
if (this.pooling && this.appliedChildren.length) {
this.__LZpool = []
};
for (var $1 = 0;$1 < this.appliedChildren.length;$1++) {
var $4 = this.appliedChildren[$1];
if (this.pooling) {
if ($4 is LzView) {
this.__LZpool.push(this.__LZdetach($4))
} else {
$4.destroy();
this.__LZpool.push(null)
}} else {
$4.destroy()
}};
this.appliedChildren = [];
if (this.releasedconstraints != null) {
this.releasedconstraints = null
}}override function destroy () {
if (this.__LZdeleted) return;
this.pooling = false;
this.remove();
super.destroy()
}override function __LZapplyArgs ($0:Object, $1) {
var $2 = {};
var $3 = this.heldArgs;
var $4:Array = null;
for (var $5 in $0) {
var $6 = $0[$5];
var $7 = "$lzc$set_" + $5;
if ($5 == "$delegates") {
$4 = $6
} else if (this[$7]) {
$2[$5] = $6
} else {
$3[$5] = $6
}};
if ($4 != null) {
var $8:Array = null;
var $9:Array = null;
var $a = LzNode._ignoreAttribute;
for (var $b = 0, $c = $4.length;$b < $4.length;$b += 3) {
if (LzState.events[$4[$b]] && !$4[$b + 2]) {
if ($9 == null) {
$9 = []
};
var $d = $9;
var $e = $4[$b + 1];
if ($e in $3) {
$2[$e] = $3[$e];
delete $3[$e]
}} else {
if ($8 == null) {
$8 = []
};
var $d = $8
};
$d.push($4[$b], $4[$b + 1], $4[$b + 2])
};
if ($9 != null) {
$2.$delegates = $9
};
if ($8 != null) {
$3.$delegates = $8
}};
for (var $5 in $2) {
var $6 = $2[$5];
if ($6 is LzOnceExpr) {
var $f = ($6 as LzOnceExpr).methodName;
if ($f in $3) {
$2[$f] = $3[$f];
delete $3[$f]
};
if ($6 is LzAlwaysExpr) {
var $g = ($6 as LzAlwaysExpr).dependenciesName;
if ($g in $3) {
$2[$g] = $3[$g];
delete $3[$g]
}}}};
var $h = null;
for (var $5 in $3) {
var $6 = $3[$5];
if ($6 is LzOnceExpr) {
if ($h == null) {
$h = []
};
$h.push($5, $6)
}};
if ($h != null) {
for (var $b = 0, $c = $h.length;$b < $c;$b += 2) {
var $5 = $h[$b];
var $i = $h[$b + 1];
var $f = $i.methodName;
var $j = $f + this.__LZUID;
var $k = null;
if ($3[$f] is Function) {
$3[$j] = $3[$f];
delete $3[$f]
} else if (this[$f] is Function) {
$3[$j] = this[$f]
};
if ($i is LzAlwaysExpr) {
var $g = ($i as LzAlwaysExpr).dependenciesName;
var $l = $g + this.__LZUID;
if ($3[$g] is Function) {
$3[$l] = $3[$g];
delete $3[$g]
} else if (this[$g] is Function) {
$3[$l] = this[$g]
};
$3[$5] = new ($i.constructor)($j, $l, $k)
} else {
$3[$5] = new ($i.constructor)($j, $k)
}}};
super.__LZapplyArgs($2, $1)
}function __LZsetProperty ($0, $1) {
this[$1] = $0
}function __LZdetach ($0) {
$0.$lzc$set_visible(false);
return $0
}function __LZretach ($0) {
$0.$lzc$set_visible(true);
return $0
}}
}
