package {
class LzBootstrapMessage {
var message = "";public var length = 0;function LzBootstrapMessage ($0 = null) {
if ($0 != null) {
this.appendInternal("" + $0, $0)
}}function appendInternal ($0:String, $1 = null, $2:Object = null) {
this.message += $0;
this.length = this.message.length
}function append (...$0) {
var $1 = $0.length;
for (var $2 = 0;$2 < $1;$2++) {
this.appendInternal(String($0[$2]))
}}public function charAt ($0) {
return this.message.charAt($0)
}public function charCodeAt ($0) {
return this.message.charCodeAt($0)
}public function indexOf ($0) {
return this.message.indexOf($0)
}public function lastIndexOf ($0) {
return this.message.lastIndexOf($0)
}public function toLowerCase ():LzMessage {
return new LzMessage(this.message.toLowerCase())
}public function toUpperCase ():LzMessage {
return new LzMessage(this.message.toUpperCase())
}public function toString () {
return this.message || ""
}public function valueOf () {
return this.message || ""
}public function concat (...$0):LzMessage {
return new LzMessage(this.message.concat.apply(this.message, $0))
}public function slice (...$0):String {
return this.message.slice.apply(this.message, $0)
}public function split (...$0):String {
return this.message.split.apply(this.message, $0)
}public function substr (...$0):String {
return this.message.substr.apply(this.message, $0)
}public function substring (...$0):String {
return this.message.substring.apply(this.message, $0)
}function toHTML () {
return this["toString"]().toHTML()
}static function xmlEscape ($0:*):* {
if ($0 && (typeof $0 == "string" || $0 is String)) {
var $1:int = $0.length;
var $2:String = "";
for (var $3:int = 0;$3 < $1;$3++) {
var $4:String = $0.charAt($3);
switch ($4) {
case "<":
$2 += "&lt;";break;;case "&":
$2 += "&amp;";break;;default:
$2 += $4
}};
return $2
} else {
return $0
}}}
}
