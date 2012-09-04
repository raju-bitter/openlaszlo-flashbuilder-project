package {
public final class LzBrowserService {
var capabilities:* = LzSprite.capabilities;public static var LzBrowser:LzBrowserService;function LzBrowserService () {
super()
}LzBrowserService.LzBrowser = new LzBrowserService();function loadURL ($0:String, $1:String = null, $2:String = null):void {
LzBrowserKernel.loadURL($0, $1, $2)
}function loadJS ($0:String, $1:String = null):void {
LzBrowserKernel.loadJS.apply(null, arguments)
}function callJS ($0:String, $1:* = null, $2:* = null):* {
try {
return LzBrowserKernel.callJS.apply(null, arguments)
}
catch ($3) {
return null
}}function getVersion ():String {
return LzBrowserKernel.getVersion()
}function getOS ():String {
return LzBrowserKernel.getOS()
}function getLoadURL ():String {
return LzBrowserKernel.getLoadURL()
}function getURL ():String {
return LzBrowserKernel.callJS("eval", false, "window.location.href")
}function getInitArg ($0:String = null):* {
return LzBrowserKernel.getInitArg($0)
}static var sOptionNameMap = {runtime: "lzr", backtrace: "lzbacktrace", proxied: "lzproxied", usemastersprite: "lzusemastersprite"};function oldOptionName ($0:String) {
return LzBrowserService.sOptionNameMap[$0]
}function getLzOption ($0:String = null):* {
var $1 = LzBrowserKernel.getLzOption($0);
if ($1 == null) {
var $2 = LzBrowserService.sOptionNameMap[$0];
if ($2 != null) {
$0 = $2
};
return LzBrowserKernel.getInitArg($0)
}}function getAppID ():String {
return LzBrowserKernel.getAppID()
}function showMenu ($0:Boolean):void {
if (this.capabilities.runtimemenus) {
LzBrowserKernel.showMenu($0)
}}function setClipboard ($0:String):void {
if (this.capabilities.setclipboard) {
LzBrowserKernel.setClipboard($0)
}}function setWindowTitle ($0:String):void {
LzBrowserKernel.callJS("eval", null, 'top.document.title="' + $0 + '"')
}function isAAActive ():Boolean {
if (this.capabilities.accessibility) {
return LzBrowserKernel.isAAActive()
} else {
return false
}}function updateAccessibility ():void {
if (this.capabilities.accessibility) {
LzBrowserKernel.updateAccessibility()
}}function loadProxyPolicy ($0:String):void {
if (this.capabilities.proxypolicy) {
LzBrowserKernel.loadProxyPolicy($0)
}}var postToLps:Boolean = true;var parsedloadurl:LzURL = null;var defaultPortNums:Object = {http: 80, https: 443};function getBaseURL ($0:* = null, $1:* = null):LzURL {
var $2:LzURL = this.getLoadURLAsLzURL();
if ($0) {
$2.protocol = "https"
};
if ($1) {
$2.port = $1
} else if ($0 && $1 == null) {
$2.port = this.defaultPortNums[$2.protocol]
};
$2.query = null;
return $2
}function getLoadURLAsLzURL ():LzURL {
if (!this.parsedloadurl) {
this.parsedloadurl = new LzURL(this.getLoadURL())
};
return this.parsedloadurl.dupe()
}function toAbsoluteURL ($0:String, $1:Boolean):String {
if ($0.indexOf("://") > -1 || $0.indexOf("/@WEBAPP@/") == 0 || $0.indexOf("file:") == 0) {
return $0
};
var $2 = this.getLoadURLAsLzURL();
$2.query = null;
if ($0.indexOf(":") > -1) {
var $3:int = $0.indexOf(":");
var $4:Boolean = $2.protocol == "https";
$2.protocol = $0.substring(0, $3);
if ($1 || $4) {
if ($2.protocol == "http") {
$2.protocol = "https"
}};
var $5:String = $0.substring($3 + 1, $0.length);
if ($5.charAt(0) == "/") {
$2.path = $0.substring($3 + 1);
$2.file = null
} else {
$2.file = $0.substring($3 + 1)
}} else {
if ($0.charAt(0) == "/") {
$2.path = $0;
$2.file = null
} else {
$2.file = $0
}};
return $2.toString()
}function xmlEscape ($0):String {
if (typeof $0 != "string") {
return ""
};
return lz.Type.acceptTypeValue("cdata", $0, null, null)
}function xmlUnescape ($0:String):String {
return lz.Type.presentTypeValue("cdata", $0, null, null)
}function urlEscape ($0:String):String {
return encodeURIComponent($0)
}function urlUnescape ($0:String):String {
return decodeURIComponent($0)
}function usePost ():Boolean {
return this.postToLps && this.supportsPost()
}function supportsPost ():Boolean {
return true
}public function makeProxiedURL ($0:Object):String {
var $1:Object = $0.headers;
var $2:String = $0.postbody;
var $3:String = $0.proxyurl;
var $4:Object = $0.serverproxyargs;
var $5:Object;
if ($4) {
$5 = {url: this.toAbsoluteURL($0.url, $0.secure), lzt: $0.service, reqtype: $0.httpmethod.toUpperCase()};
for (var $6:String in $4) {
$5[$6] = $4[$6]
}} else {
$5 = {url: this.toAbsoluteURL($0.url, $0.secure), lzt: $0.service, reqtype: $0.httpmethod.toUpperCase(), sendheaders: $0.sendheaders, trimwhitespace: $0.trimwhitespace, nsprefix: $0.trimwhitespace, timeout: $0.timeout, cache: $0.cacheable, ccache: $0.ccache}};
if ($2 != null) {
$5.lzpostbody = $2
};
$5.lzr = $runtime;
if ($1 != null) {
var $7:String = "";
for (var $8:String in $1) {
$7 += $8 + ": " + $1[$8] + "\n"
};
if ($7 != "") {
$5["headers"] = $7
}};
if (!$0.ccache) {
$5.__lzbc__ = new Date().getTime()
};
var $9:String = "?";
for (var $a:String in $5) {
var $b:* = $5[$a];
if (typeof $b == "string") {
$b = encodeURIComponent($b)
};
$3 += $9 + $a + "=" + $b;
$9 = "&"
};
return $3
}}
}
