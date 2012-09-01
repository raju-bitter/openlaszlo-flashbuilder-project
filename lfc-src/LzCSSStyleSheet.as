package {
class LzCSSStyleSheet extends LzStyleSheet {
function LzCSSStyleSheet ($0, $1, $2, $3, $4, $5) {
super($0, $1, $2, $3);
this.ownerRule = $4;
this.cssRules = $5
}var ownerRule = null;var cssRules = null;function insertRule ($0, $1) {
if (!this.cssRules) {
this.cssRules = []
};
if ($1 < 0) {
return null
};
if ($1 < this.cssRules.length) {
this.cssRules.splice($1, 0, $0);
return $1
};
if ($1 == this.cssRules.length) {
return this.cssRules.push($0) - 1
};
return null
}}
}
