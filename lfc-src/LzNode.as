package {
public dynamic class LzNode extends LzEventable {
static var tagname = "node";static var __LZCSSTagSelectors:Array = ["node"];static var attributes = new LzInheritedHash();var __LZisnew:Boolean = false;var __LZdeferredcarr:Array = null;var classChildren:Array = null;var animators:Array = null;var __animatedAttributes:Object;function addProperty ($0:*, $1:*):void {
if ($1 !== undefined) {
this[$0] = $1
}}static function mergeAttributes ($0, $1) {
var $2 = LzNode._ignoreAttribute;
for (var $3 in $0) {
var $4 = $0[$3];
if ($4 === $2) {
delete $1[$3]
} else if ($4 is LzInitExpr) {
$1[$3] = $4
} else {
if ($4 is Object) {
var $5 = $1[$3];
if ($5 is Object) {
if ($4 is Array && $5 is Array) {
$1[$3] = $4.concat($5);
continue
} else if (($4.constructor === Object || $4 is LzInheritedHash) && ($5.constructor === Object || $5 is LzInheritedHash)) {
var $6 = new LzInheritedHash($5);
for (var $7 in $4) {
$6[$7] = $4[$7]
};
$1[$3] = $6;
continue
}}};
$1[$3] = $4
}};
return $1
}static function mergeAttributeTypes ($0, $1) {
for (var $2 in $0) {
$1[$2] = $0[$2]
};
return $1
}static function mergeChildren ($0, $1) {
if ($1 is Array) {
$0 = $1.concat($0 is Array ? $0 : [])
};
return $0
}var _instanceAttrs:* = null;var _instanceChildren:Array = null;var __LzValueExprs = null;function __LZhasConstraint ($0:String) {
return ($0 in this.__LzValueExprs) && !(this.__LzValueExprs[$0] is LzStyleConstraintExpr)
}var $attributeDescriptor = {};var $CSSDescriptor = {};function LzNode ($0:LzNode? = null, $1:Object? = null, $2:Array? = null, $3:Boolean = false) {
super();
this.__LZUID = "__U" + ++LzNode.__UIDs;
this.__LZdeferDelegates = true;
var $4 = [];
if ($1) {
if ($1["$lzc$bind_id"]) {
$4.push("$lzc$bind_id");
this.$lzc$bind_id = $1.$lzc$bind_id
};
if ($1["$lzc$bind_name"]) {
$4.push("$lzc$bind_name");
this.$lzc$bind_name = $1.$lzc$bind_name
}};
var $5 = this.$lzc$bind_id;
if ($5) {
$5.call(null, this)
};
var $6 = this.$lzc$bind_name;
if ($6) {
$6.call(null, this)
};
this._instanceAttrs = $1;
this._instanceChildren = $2;
var $7 = new LzInheritedHash(this["constructor"].attributes);
if (!(this is LzState)) {
for (var $8 in $7) {
var $9 = $7[$8];
if (!($9 && $9 is LzInitExpr)) {
var $a:String = "$lzc$set_" + $8;
if (!this[$a]) {
if ($9 is Function) {
this.addProperty($8, $9)
} else if ($9 !== void 0) {
this[$8] = $9
};
delete $7[$8];
continue
}};
if (this[$8] === void 0) {
this[$8] = null
}}};
if ($1) {
LzNode.mergeAttributes($1, $7)
};
if ($7["$attributeDescriptor"]) {
$4.push("$attributeDescriptor");
this.$attributeDescriptor = $7.$attributeDescriptor
};
if ($7["$CSSDescriptor"]) {
$4.push("$CSSDescriptor");
this.$CSSDescriptor = $7.$CSSDescriptor
};
var $b = LzNode._ignoreAttribute;
for (var $c = 0, $d = $4.length;$c < $d;$c++) {
$7[$4[$c]] = $b
};
this.__LZisnew = !$3;
var $e = this["constructor"]["children"];
if ($e is Array) {
$2 = LzNode.mergeChildren($2, $e)
};
if ($7["datapath"] != null) {
delete $7["$datapath"]
};
var $f = this.__LzValueExprs = {};
for (var $8 in $7) {
var $g = $7[$8];
if ($g is LzValueExpr) {
$f[$8] = $g;
delete $7[$8]
}};
try {
this.construct($0, $7)
}
catch ($h) {
if ($h === LzNode.__LzEarlyAbort) {
return
} else {
throw $h
}};
for (var $8 in $f) {
$7[$8] = $f[$8]
};
this.__LzValueExprs = null;
this.__LZapplyArgs($7, true);
if (this.__LZdeleted) {
return
};
this.__LZdeferDelegates = false;
var $i = this.__LZdelegatesQueue;
if ($i) {
LzDelegate.__LZdrainDelegatesQueue($i);
this.__LZdelegatesQueue = null
};
if (this.onconstruct.ready) this.onconstruct.sendEvent(this);
if ($2 && $2.length) {
this.createChildren($2)
} else {
this.__LZinstantiationDone()
}}static var __LzEarlyAbort = {toString: function () {
return "Early Abort"
}};var oninit = LzDeclaredEvent;var onconstruct = LzDeclaredEvent;var ondata = LzDeclaredEvent;var clonenumber = null;var onclonenumber = LzDeclaredEvent;var __LZinstantiated = false;var __LZpreventSubInit = null;var __LZresolveDict = null;var __LZsourceLocation = null;var __LZUID:String;var __LZPropertyCache = null;var __LZInheritedPropertyCache = null;var on__LZInheritedPropertyCache = LzDeclaredEvent;var __LZRuleCache = null;var __LZconstraintdelegates = null;var isinited = false;var inited = false;var oninited = LzDeclaredEvent;var subnodes = null;var datapath = null;function $lzc$set_datapath ($0) {
if (null != this.datapath && $0 !== LzNode._ignoreAttribute) {
this.datapath.setXPath($0)
} else {
new LzDatapath(this, {xpath: $0})
}}var initstage = null;var $isstate = false;var parent;var cloneManager = null;var name = null;var $lzc$bind_name = null;var id = null;var $lzc$set_id = -1;var $lzc$bind_id = null;var defaultplacement = null;var placement = null;var $lzc$set_placement = -1;var $cfn = 0;var immediateparent = null;var dependencies = null;var classroot;var nodeLevel = 0;var styleclass:String = "";var onstyleclass:LzDeclaredEventClass = LzDeclaredEvent;var __LZCSSStyleclass:String = null;function $lzc$set_styleclass ($0:String) {
this.styleclass = $0;
if ($0.indexOf(" ") >= 0) {
this.__LZCSSStyleclass = " " + $0 + " "
} else {
this.__LZCSSStyleclass = null
};
if (this.onstyleclass.ready) {
this.onstyleclass.sendEvent($0)
}}function _hasStyleClass ($0:String) {
return this.__LZCSSStyleclass == null ? this.styleclass == $0 : this.__LZCSSStyleclass.indexOf(" " + $0 + " ") >= 0
}var __LZCSSDependencies = null;function __applyCSSConstraints ($0) {
if ($0) {
var $1 = this.__applyCSSConstraintDel;
if ($1) {
$1.unregisterAll()
} else {
if (!this.__LZconstraintdelegates) {
this.__LZconstraintdelegates = []
};
$1 = this.__applyCSSConstraintDel = new LzDelegate(this, "__reapplyCSS");
this.__LZconstraintdelegates.push($1)
};
for (var $2 in $0) {
var $3 = "on" + $2;
var $4 = $0[$2];
for (var $5 = 0, $6 = $4.length;$5 < $6;$5++) {
var $7 = $4[$5];
$1.register($7, $3)
}}}}function __reapplyCSS ($0 = null) {
var $1 = this.__LZPropertyCache;
this.__LZPropertyCache = null;
var $2 = LzCSSStyle.getPropertyCache(this);
var $3 = this.__LZCSSStyledAttrs;
if ($3) {
if ($1) {
var $4 = this.$attributeDescriptor.properties;
var $5 = null;
for (var $6 = 0, $7 = $3.length;$6 < $7;$6++) {
var $8 = $3[$6];
var $9:String = $4[$8];
if ($1[$9] != $2[$9]) {
if (!$5) {
$5 = []
};
$5.push($8)
}};
if ($5) {
this.applyStyleConstraints($5, true)
}} else {
this.applyStyleConstraints($3, true)
}}}var __LZCSSStyledAttrs = null;function applyStyleConstraints ($0:Array, $1:Boolean = false) {
if (!$1) {
this.__LZCSSStyledAttrs = $0
};
var $2 = this["__LZPropertyCache"] || LzCSSStyle.getPropertyCache(this);
var $3 = this.$attributeDescriptor;
var $4 = $3.properties;
var $5 = $3.types;
var $6 = $3.fallbacks;
for (var $7 = 0, $8 = $0.length;$7 < $8;$7++) {
var $9 = $0[$7];
var $a = $4[$9];
var $b = $5 && $5[$9] || "expression";
var $c = $6 && $6[$9];
var $d = !($6 && $6.hasOwnProperty($9));
var $e = $2[$a];
if ($e is LzStyleExpr) {
if ($e is LzStyleAttr) {
var $f:LzStyleAttr = $e as LzStyleAttr;
var $g = $f.sourceAttributeName;
var $h = new LzStyleAttrBinder(this, $9, $g);
if (!this.__LZconstraintdelegates) {
this.__LZconstraintdelegates = []
};
this.__LZconstraintdelegates.push(new LzDelegate($h, "bind", this, "on" + $g));
$h.bind()
}} else if ($e !== void 0) {
this.acceptAttribute($9, $b, $e)
} else if ($c is LzInitExpr) {
this.applyConstraintExpr($c)
} else {
if (this[$9] !== $c) {
this.setAttribute($9, $c)
}}}}function construct ($0, $1) {
var $2 = $0;
this.parent = $2;
if ($2) {
var $3 = $2;
if ($1["ignoreplacement"] || this.ignoreplacement) {
this.placement = null
} else {
var $4 = $1["placement"] || $2.defaultplacement;
while ($4 != null) {
if ($3.determinePlacement == LzNode.prototype.determinePlacement) {
var $5 = $3.searchSubnodes("name", $4);
if ($5 == null) $5 = $3
} else {
var $5 = $3.determinePlacement(this, $4, $1)
};
$4 = $5 != $3 ? $5.defaultplacement : null;
$3 = $5
};
this.placement = $4
};
if (this.__LZdeleted) {
throw LzNode.__LzEarlyAbort
};
var $6 = $3.subnodes;
if ($6 == null) {
$3.subnodes = [this]
} else {
$6[$6.length] = this
};
var $7 = $3.nodeLevel;
this.nodeLevel = $7 ? $7 + 1 : 1;
this.immediateparent = $3
} else {
this.nodeLevel = 1
}}function init () {
return
}function __LZinstantiationDone ():void {
this.__LZinstantiated = true;
if (!this.__LZdeleted && (!this.immediateparent || this.immediateparent.isinited || this.initstage == "early" || this.__LZisnew && lz.Instantiator.syncNew)) {
this.__LZcallInit()
}}function __LZsetPreventInit () {
this.__LZpreventSubInit = []
}function __LZclearPreventInit () {
var $0 = this.__LZpreventSubInit;
this.__LZpreventSubInit = null;
var $1 = $0.length;
for (var $2 = 0;$2 < $1;$2++) {
$0[$2].__LZcallInit()
}}function __LZcallInit ($0:* = null) {
if (this.parent && this.parent.__LZpreventSubInit) {
this.parent.__LZpreventSubInit.push(this);
return
};
this.isinited = true;
if (this.__LZresolveDict != null) this.__LZresolveReferences();
if (this.__LZdeleted) return;
var $1 = this.subnodes;
if ($1) {
for (var $2 = 0;$2 < $1.length;) {
var $3 = $1[$2++];
var $4 = $1[$2];
if ($3.isinited || !$3.__LZinstantiated) continue;
$3.__LZcallInit();
if (this.__LZdeleted) return;
if ($4 != $1[$2]) {
while ($2 > 0) {
if ($4 == $1[--$2]) break
}}}};
this.init();
if (this.oninit.ready) this.oninit.sendEvent(this);
if (this.datapath && this.datapath.__LZApplyDataOnInit) {
this.datapath.__LZApplyDataOnInit()
};
this.inited = true;
if (this.oninited.ready) {
this.oninited.sendEvent(true)
}}function completeInstantiation () {
if (!this.isinited) {
var $0 = this.initstage;
this.initstage = "early";
if ($0 == "defer") {
lz.Instantiator.createImmediate(this, this.__LZdeferredcarr)
} else {
lz.Instantiator.completeTrickle(this)
}}}static var _ignoreAttribute = {toString: function () {
return "_ignoreAttribute"
}};var ignoreplacement = false;var $lzc$set_$delegates = -1;var $lzc$set_$classrootdepth = -1;var $lzc$set_$datapath = -1;var $lzc$set_$CSSDescriptor = -1;var $lzc$set_$attributeDescriptor = -1;function __LZapplyArgs ($0:Object, $1) {
var $2 = LzNode._ignoreAttribute;
var $3 = LzStyleConstraintExpr.StyleConstraintExpr;
var $4:Object = {};
var $5:Array = null;
var $6:Array = null;
var $7:Array = null;
var $8:Array = null;
if ("name" in $0) {
this.$lzc$set_name($0.name);
delete $0.name
};
for (var $9 in $0) {
var $a = $0[$9];
if ($4[$9] || $a === $2) continue;
$4[$9] = true;
var $b:String = "$lzc$set_" + $9;
if ($a && $a is LzInitExpr) {
if ($a instanceof LzConstraintExpr) {
if ($a === $3) {
if ($8 == null) {
$8 = []
};
$8.push($9)
} else {
if ($7 == null) {
$7 = []
};
$7.push($a)
}} else if ($a instanceof LzOnceExpr) {
if ($6 == null) {
$6 = []
};
$6.push($a)
};
if (this[$9] === void 0) {
this[$9] = null
}} else if (!this[$b]) {
if ($a is Function) {
this.addProperty($9, $a)
} else if ($a !== void 0) {
this[$9] = $a
};
if (!$1) {
var $c = this["on" + $9];
if ($c) {
if ($c.ready) {
$c.sendEvent($0[$9])
}}}} else if (this[$b] != -1) {
if ($5 == null) {
$5 = []
};
$5.push($b, $a);
if (this[$9] === void 0) {
this[$9] = null
}}};
if ("$delegates" in $0) {
var $d = $0.$delegates;
var $e:Array = this.__LZconstraintdelegates;
var $f:Array;
for (var $g = 0, $h = $d.length;$g < $h;$g += 3) {
if ($d[$g + 2]) {
if ($f == null) {
$f = []
};
$f.push($d[$g], $d[$g + 1], $d[$g + 2])
} else {
var $i = $d[$g + 1];
if (!$e) {
$e = this.__LZconstraintdelegates = []
};
$e.push(new LzDelegate(this, $i, this, $d[$g]))
}};
if ($f != null) {
this.__LZstoreAttr($f, "$delegates")
}};
if ("$classrootdepth" in $0) {
var $j = $0.$classrootdepth;
if ($j) {
var $k = this.parent;
while (--$j > 0) {
$k = $k.parent
};
this.classroot = $k
}};
if (("$datapath" in $0) && $0.$datapath !== $2) {
var $l = $0.$datapath;
this.makeChild($l, true)
};
if ($5) {
for (var $g = 0, $h = $5.length;$g < $h;$g += 2) {
if (this.__LZdeleted) return;
this[$5[$g]]($5[$g + 1])
}};
if ($6 != null) {
this.__LZstoreAttr($6, "$inits")
};
if ($7 != null) {
this.__LZstoreAttr($7, "$constraints")
};
if ($8 != null) {
this.__LZstoreAttr($8, "$styles")
}}function createChildren ($0) {
if (this.__LZdeleted) return;
if ("defer" == this.initstage) {
this.__LZdeferredcarr = $0
} else if ("late" == this.initstage) {
lz.Instantiator.trickleInstantiate(this, $0)
} else if (this.__LZisnew && lz.Instantiator.syncNew || "immediate" == this.initstage) {
lz.Instantiator.createImmediate(this, $0)
} else {
lz.Instantiator.requestInstantiation(this, $0)
}}function makeChild ($0, $1 = null) {
if (this.__LZdeleted) {
return
};
var $2 = $0["class"];
if (!$2) {
if ($0["tag"]) {
$2 = lz[$0.tag]
}};
var $3;
if ($2) {
$3 = new $2(this, $0.attrs, ("children" in $0) ? $0.children : null, $1)
};
return $3
}function $lzc$set_$setters ($0) {}function dataBindAttribute ($0, $1, $2) {
if (!this.datapath) {
this.$lzc$set_datapath(".")
};
if (!this.__LZconstraintdelegates) {
this.__LZconstraintdelegates = []
};
this.__LZconstraintdelegates.push(new LzDataAttrBind(this.datapath, $0, $1, $2))
}function __LZstoreAttr ($0, $1) {
if (this.__LZresolveDict == null) {
this.__LZresolveDict = {}};
this.__LZresolveDict[$1] = $0
}function __LZresolveReferences () {
var $0 = this.__LZresolveDict;
if ($0 != null) {
this.__LZresolveDict = null;
var $1 = $0["$inits"];
if ($1 != null) {
for (var $2 = 0, $3 = $1.length;$2 < $3;$2++) {
this[$1[$2].methodName](null);
if (this.__LZdeleted) return
}};
var $4 = $0["$styles"];
if ($4 != null) {
this.applyStyleConstraints($4)
};
var $5 = $0["$constraints"];
if ($5 != null) {
for (var $2 = 0, $3 = $5.length;$2 < $3;$2++) {
this.applyConstraintExpr($5[$2]);
if (this.__LZdeleted) return
}};
if (this["__LZresolveOtherReferences"]) {
this.__LZresolveOtherReferences($0)
};
if ($0["$delegates"]) this.__LZsetDelegates($0.$delegates)
}}function __LZsetDelegates ($0) {
if ($0.length < 1) {
return
};
var $1:Array = this.__LZconstraintdelegates;
if (!$1) {
$1 = this.__LZconstraintdelegates = []
};
var $2 = $0.length;
for (var $3 = 0;$3 < $2;$3 += 3) {
var $4 = $0[$3 + 2];
var $5 = $4 != null ? this[$4]() : null;
var $6 = $0[$3];
var $7 = $0[$3 + 1];
if ($5 == null) {
continue
};
$1.push(new LzDelegate(this, $7, $5, $6))
}}function applyConstraintMethod ($0, $1) {
if ($1 && $1.length > 0) {
var $2:Array = this.__LZconstraintdelegates;
if (!$2) {
$2 = this.__LZconstraintdelegates = []
};
var $3;
for (var $4 = 0, $5 = $1.length;$4 < $5;$4 += 2) {
$3 = $1[$4];
if ($3) {
$2.push(new LzDelegate(this, $0, $3, "on" + $1[$4 + 1]))
}}};
this[$0](null)
}function applyConstraintExpr ($0:LzOnceExpr) {
var $1:String = $0.methodName;
if (!(this[$1] is Function)) {
return
};
var $2 = null;
if ($0 instanceof LzAlwaysExpr) {
var $3:LzAlwaysExpr = $0 as LzAlwaysExpr;
var $4:String = $3.dependenciesName;
if (!(this[$4] is Function)) {

} else {
try {
$2 = this[$4]();
for (var $5 = 0, $6 = $2.length;$5 < $6;$5 += 2) {
var $7 = $2[$5];
if ($7 != null && !($7 is LzEventable)) {
$2[$5] = null
}}}
catch ($8) {}}};
this.applyConstraintMethod($1, $2)
}function releaseConstraint ($0:String) {
if (this._instanceAttrs != null) {
var $1 = this._instanceAttrs[$0];
if ($1 instanceof LzConstraintExpr) {
var $2 = $1.methodName;
return this.releaseConstraintMethod($2)
}};
return false
}function releaseConstraintMethod ($0) {
var $1:Boolean = false;
var $2:Array = this.__LZconstraintdelegates;
if ($2) {
for (var $3:int = 0;$3 < $2.length;) {
var $4:* = $2[$3];
if ($4 is LzDelegate && $4.c === this && $4.m === this[$0]) {
if ($4.__LZdeleted != true) {
$4.destroy()
};
$2.splice($3, 1);
$1 = true
} else {
$3++
}}};
return $1
}function $lzc$set_name ($0:String) {
var $1 = this.name;
var $2 = this.parent;
var $3 = this.immediateparent;
if ($1 && $1 != $0) {
if (this.$lzc$bind_name) {
if (globalValue($1) === this) {
this.$lzc$bind_name.call(null, this, false)
}};
if ($2) {
if ($1 && $2[$1] === this) {
$2[$1] = null
}};
if ($3) {
if ($1 && $3[$1] === this) {
$3[$1] = null
}}};
if ($0 && $0.length) {
if ($2) {
$2[$0] = this
};
if ($3) {
$3[$0] = this
}};
this.name = $0
}var data:* = null;function $lzc$set_data ($0:*) {
this.data = $0;
if ($0 is LzDataNodeMixin) {
var $1:LzDatapath = this.datapath || new LzDatapath(this);
$1.setPointer($0 as LzDataNodeMixin)
};
if (this.ondata.ready) this.ondata.sendEvent($0)
}function applyData ($0) {}function updateData () {
return void 0
}function setSelected ($0) {}var options = {};function $lzc$set_options ($0) {
if (this.options === this["constructor"].prototype.options) {
this.options = new LzInheritedHash(this.options)
};
for (var $1 in $0) {
this.options[$1] = $0[$1]
}}public function getOption ($0) {
return this.options[$0]
}public function setOption ($0, $1) {
if (this.options === this["constructor"].prototype.options) {
this.options = new LzInheritedHash(this.options)
};
this.options[$0] = $1
}function determinePlacement ($0, $1, $2) {
if ($1 == null) {
var $3 = null
} else {
var $3 = this.searchSubnodes("name", $1)
};
return $3 == null ? this : $3
}function searchImmediateSubnodes ($0, $1) {
var $2 = this.subnodes;
if ($2 == null) return null;
for (var $3 = $2.length - 1;$3 >= 0;$3--) {
var $4 = $2[$3];
if ($4[$0] == $1) {
return $4
}};
return null
}function searchSubnodes ($0, $1) {
var $2 = this.subnodes ? this.subnodes.concat() : [];
while ($2.length > 0) {
var $3 = $2;
$2 = new Array();
for (var $4 = $3.length - 1;$4 >= 0;$4--) {
var $5 = $3[$4];
if ($5[$0] == $1) {
return $5
};
var $6 = $5.subnodes;
if ($6) {
for (var $7 = $6.length - 1;$7 >= 0;$7--) {
$2.push($6[$7])
}}}};
return null
}function searchParents ($0) {
return this.searchParentAttrs([$0])[$0]
}function searchParentAttrs ($0) {
var $1 = {};
if (!$0.length) return $1;
var $2 = $0.slice();
var $3 = this;
do {
$3 = $3.immediateparent;
if ($3 == null) {
return $1
};
var $4 = 0;
var $5 = $2.length;
while ($4 < $5) {
var $6 = $2[$4];
if ($3[$6] != null) {
$1[$6] = $3;
$2.splice($4, 1);
$5--
} else {
$4++
}}} while ($3 != canvas && $5 > 0);
return $1
}static var __UIDs:Number = 0;function getUID () {
return this.__LZUID
}override function childOf ($0, $1 = null) {
if ($0 == null) {
return false
};
var $2 = this;
while ($2.nodeLevel >= $0.nodeLevel) {
if ($2 == $0) {
return true
};
$2 = $2.immediateparent
};
return false
}override function destroy () {
if (this.__LZdeleted == true) {
return
};
super.destroy();
if (this.subnodes != null) {
for (var $0 = this.subnodes.length - 1;$0 >= 0;$0--) {
this.subnodes[$0].destroy()
}};
if (this.$lzc$bind_id) {
this.$lzc$bind_id.call(null, this, false)
};
if (this.$lzc$bind_name) {
this.$lzc$bind_name.call(null, this, false)
};
var $1 = this.parent;
var $2 = this.name;
if ($1 != null && $2 != null) {
if ($1[$2] === this) {
$1[$2] = null
};
if (this.immediateparent[$2] === this) {
this.immediateparent[$2] == null
}};
if (this.__LZconstraintdelegates != null) {
this.__LZconstraintdelegates = null
};
if (this.immediateparent && this.immediateparent.subnodes) {
for (var $0 = this.immediateparent.subnodes.length - 1;$0 >= 0;$0--) {
if (this.immediateparent.subnodes[$0] === this) {
this.immediateparent.subnodes.splice($0, 1);
break
}}};
this.data = null
}function animate ($0, $1, $2, $3 = null, $4 = null) {
if ($2 == 0) {
var $5 = $3 ? this[$0] + $1 : $1;
this.__setAttr($0, $5);
return null
};
var $6 = {attribute: $0, to: $1, duration: $2, relative: $3, target: this};
for (var $7 in $4) $6[$7] = $4[$7];
return new LzAnimator(null, $6)
}function toString () {
return this.getDebugIdentification()
}function getDebugIdentification () {
var $0 = this["constructor"];
var $1 = $0 && $0.hasOwnProperty("tagname") ? $0.tagname : "anonymous";
if (this["name"] != null) {
$1 += " name: " + this.name
};
if (this["id"] != null) {
$1 += " id: " + this.id
};
return $1
}function nodePath ($0:LzNode, $1 = Infinity) {
if ($0 === canvas) {
return "#canvas"
};
var $2 = $0.id;
if (typeof $2 == "string" && globalValue($2) === $0) {
return "#" + $2
};
var $3 = $0.name;
if (typeof $3 == "string" && globalValue($3) === $0) {
return "#" + $3
};
var $4 = $0.immediateparent || $0.parent;
var $5 = "";
if (typeof $3 == "string" && ($4 == null || $4[$3] === $0)) {
$5 = "@" + $3
} else {
var $6 = $0.constructor.tagname;
$5 = $6 || "anonymous";
var $7 = $0.styleclass;
if ($7) {
var $8 = $7.indexOf(" ");
if ($8 != -1) {
$7 = $7.substring(0, $8)
}};
var $9, $a = 0;
if ($4 != null) {
var $b = $4.subnodes;
for (var $c = 0, $d = $b.length;$c < $d;$c++) {
var $e = $b[$c];
if ($6 == $e.constructor.tagname) {
$a++;
if ($9) break;
if ($0 === $e) {
$9 = $a
}}}};
if ($7) {
$5 += "." + $7
};
if ($a > 1) {
$5 += "[" + $9 + "]"
}};
if ($5.length >= $1) {
return "\u2026"
};
try {
return ($4 == null ? "?" : ($4 === canvas ? "" : this.nodePath($4, $1 - $5.length - 1))) + "/" + $5
}
catch ($f) {};
return "\u2026/" + $5
}function acceptAttribute ($0, $1, $2) {
$2 = lz.Type.acceptTypeValue($1, $2, this, $0);
if (this[$0] !== $2) {
this.setAttribute($0, $2)
}}function presentAttribute ($0:String, $1:String = null):String {
if (!$1) {
var $2 = this.$attributeDescriptor.types;
$1 = $2 && $2[$0] || "expression"
};
return lz.Type.presentTypeValue($1, this[$0], this, $0)
}function $lzc$presentAttribute_dependencies ($0, $1, $2, $3):Array {
return [$1, $2]
}var ontransition = LzDeclaredEvent;var transition;function $lzc$set_transition ($0:String) {
if ($6 === $0) return;
this.transition = $0;
var $1 = {};
var $2:int = 0;
var $3 = $0.split(",");
for (var $4:int = 0, $5:int = $3.length;$4 < $5;$4++) {
var $6 = $3[$4].split(" ");
var $7 = $6.shift();
if ($7) {
var $8 = $6.shift();
$8 = parseFloat($8) * 1000;
if (!$8 || isNaN($8)) continue;
var $9 = $6.shift();
if ($9 == "ease-in") {
$9 = "easein"
} else if ($9 == "ease-out") {
$9 = "easeout"
} else if ($9 == "linear") {

} else {
$9 = "ease"
};
$1[$7] = {duration: $8, motion: $9};
$2++
}};
this.__transitionAttributes = $1;
this.customSetters = $1
}protected override function __invokeCustomSetter ($0:String, $1):Boolean {
if (this.inited != true) return false;
var $2 = this.__transitionAttributes && this.__transitionAttributes[$0];
if ($2 && this[$0] !== $1) {
this.animate($0, $1, $2.duration, false, {motion: $2.motion})
};
return true
}}
}
