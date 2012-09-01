package {
public class LzURL {
var protocol:String = null;var host:String = null;var port:String = null;var path:String = null;var file:String = null;var query:String = null;var fragment:String = null;var _parsed:String = null;public function LzURL ($0:String? = null) {
if ($0 != null) {
this.parseURL($0)
}}public function parseURL ($0:String):void {
if (this._parsed == $0) return;
this._parsed = $0;
var $1:int = 0;
var $2:int = $0.indexOf(":");
var $3:int = $0.indexOf("?", $1);
var $4:int = $0.indexOf("#", $1);
var $5:int = $0.length;
if ($4 != -1) {
$5 = $4
};
if ($3 != -1) {
$5 = $3
};
if ($2 != -1) {
this.protocol = $0.substring($1, $2);
if ($0.substring($2 + 1, $2 + 3) == "//") {
$1 = $2 + 3;
$2 = $0.indexOf("/", $1);
if ($2 == -1) {
$2 = $5
};
var $6:String = $0.substring($1, $2);
var $7:int = $6.indexOf(":");
if ($7 == -1) {
this.host = $6;
this.port = null
} else {
this.host = $6.substring(0, $7);
this.port = $6.substring($7 + 1)
}} else {
$2++
};
$1 = $2
};
$2 = $5;
this._splitPath($0.substring($1, $2));
if ($4 != -1) {
this.fragment = $0.substring($4 + 1, $0.length)
} else {
$4 = $0.length
};
if ($3 != -1) {
this.query = $0.substring($3 + 1, $4)
}}private function _splitPath ($0:String):void {
if ($0 == "") {
return
};
var $1:int = $0.lastIndexOf("/");
if ($1 != -1) {
this.path = $0.substring(0, $1 + 1);
this.file = $0.substring($1 + 1, $0.length);
if (this.file == "") {
this.file = null
};
return
};
this.path = null;
this.file = $0
}function dupe ():LzURL {
var $0:LzURL = new LzURL();
$0.protocol = this.protocol;
$0.host = this.host;
$0.port = this.port;
$0.path = this.path;
$0.file = this.file;
$0.query = this.query;
$0.fragment = this.fragment;
return $0
}public function toString ():String {
var $0:String = "";
if (this.protocol != null) {
$0 += this.protocol + ":";
if (this.host != null) {
$0 += "//" + this.host;
if (null != this.port && lz.Browser.defaultPortNums[this.protocol] != this.port) {
$0 += ":" + this.port
}}};
if (this.path != null) {
$0 += this.path
};
if (null != this.file) {
$0 += this.file
};
if (null != this.query) {
$0 += "?" + this.query
};
if (null != this.fragment) {
$0 += "#" + this.fragment
};
return $0
}static function merge ($0:LzURL, $1:LzURL):LzURL {
var $2:LzURL = new LzURL();
var $3:Object = {protocol: true, host: true, port: true, path: true, file: true, query: true, fragment: true};
for (var $4:String in $3) {
$2[$4] = $0[$4] != null ? $0[$4] : $1[$4]
};
return $2
}}
}
