package {
class LzFont {
var style;var name;var height;var ascent;var descent;var advancetable;var lsbtable;var rsbtable;var fontobject;function LzFont ($0, $1, $2) {
super();
this.name = $0.name;
this.style = $2;
this.fontobject = $0;
$0[$2] = this;
for (var $3 in $1) {
if ($3 == "leading") continue;
this[$3] = $1[$3]
};
this.height = this.ascent + this.descent;
this.advancetable[13] = this.advancetable[32];
this.advancetable[160] = 0
}var leading = 2;public function toString () {
return "Font style " + this.style + " of name " + this.name
}}
}
