package {
class LzViewLinkage {
var xscale:Number = 1;var yscale:Number = 1;var xoffset:Number = 0;var yoffset:Number = 0;var uplinkArray:Array = null;var downlinkArray:Array = null;function LzViewLinkage ($0:LzView, $1:LzView) {
if ($0 === $1) {
return
};
var $2:Array = this.uplinkArray = [];
var $3:LzView = $0;
do {
$3 = $3.immediateparent;
$2.push($3)
} while ($3 !== canvas);
var $4:Array = this.downlinkArray = [];
var $3:LzView = $1;
do {
$3 = $3.immediateparent;
$4.push($3)
} while ($3 !== canvas);
while ($2.length > 1 && $4[$4.length - 1] === $2[$2.length - 1] && $4[$4.length - 2] === $2[$2.length - 2]) {
$4.pop();
$2.pop()
}}function update ($0:String) {
var $1:String = $0 + "scale";
var $2:String = $0 + "offset";
var $3:String = "__" + $2;
var $4:Array = this.uplinkArray;
var $5:Array = this.downlinkArray;
var $6 = 1;
var $7 = 0;
if ($4) {
var $8 = $4.length - 1;
var $9 = $4[$8--];
$6 *= $9[$1];
for (;$8 >= 0;$8--) {
$9 = $4[$8];
$7 += ($9[$0] + $9[$3]) * $6;
$6 *= $9[$1]
}};
var $a = 1;
var $b = 0;
if ($5) {
var $8 = $5.length - 1;
var $9 = $5[$8--];
$a *= $9[$1];
for (;$8 >= 0;$8--) {
$9 = $5[$8];
$b += ($9[$0] + $9[$3]) * $a;
$a *= $9[$1]
}};
this[$1] = $6 / $a;
this[$2] = ($7 - $b) / $a
}}
}
