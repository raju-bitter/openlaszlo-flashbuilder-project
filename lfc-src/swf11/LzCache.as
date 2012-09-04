package {
final class LzCache {
private var size:uint;private var slots:uint;private var destroyable:Boolean;private var capacity:int;private var curslot:int;private var data:Array = null;public function LzCache ($0:uint = 16, $1:uint = 2, $2:Boolean = true) {
this.size = $0;
this.slots = $1;
this.destroyable = $2;
this.clear()
}public function clear ():void {
this.curslot = 0;
this.capacity = 0;
var $0:int = this.slots;
if (!this.data) this.data = new Array($0);
var $1:Array = this.data;
for (var $2:int = 0;$2 < $0;++$2) {
if (this.destroyable) {
var $3:Object = $1[$2];
for (var $4:String in $3) {
$3[$4].destroy()
}};
$1[$2] = {}}}private function ensureSlot ():void {
if (++this.capacity > this.size) {
var $0:int = (this.curslot + 1) % this.slots;
var $1:Array = this.data;
if (this.destroyable) {
var $2:Object = $1[$0];
for (var $3:String in $2) {
$2[$3].destroy()
}};
$1[$0] = {};
this.curslot = $0;
this.capacity = 1
}}public function put ($0:String, $1:*):* {
var $2:* = this.get($0);
if ($2 === void 0) {
this.ensureSlot()
};
this.data[this.curslot][$0] = $1;
return $2
}public function get ($0:String):* {
var $1:int = this.slots;
var $2:int = this.curslot;
var $3:Array = this.data;
for (var $4:int = 0;$4 < $1;++$4) {
var $5:int = ($2 + $4) % $1;
var $6:* = $3[$5][$0];
if ($6 !== void 0) {
if ($5 != $2) {
delete $3[$5][$0];
this.ensureSlot();
$3[this.curslot][$0] = $6
};
return $6
}};
return void 0
}}
}
