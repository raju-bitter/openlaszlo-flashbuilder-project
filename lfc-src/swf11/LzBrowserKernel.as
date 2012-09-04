package {

  import flash.net.navigateToURL;
  import flash.net.SharedObject;
  import flash.net.URLRequest;
  import flash.system.Capabilities;
  import flash.system.Security;
  import flash.system.System;
  import flash.accessibility.Accessibility;
class LzBrowserKernel {
static function loadURL ($0:String, $1:String = null, $2:String = null):void {
if ($1 == null) $1 = "_self";
navigateToURL(new URLRequest($0), $1)
}static function loadJS ($0:String, $1:String = "_self"):void {
navigateToURL(new URLRequest("javascript:" + $0 + ";void(0);"), $1)
}static function callJS (...$0):* {
var $1:String = $0[0];
var $2:* = $0.length > 1 ? $0[1] : null;
if (LzBrowserKernel.__jslocked == true) {
if ($2 != false) {
var $3:Array = [];
for (var $4:int = 0;$4 < $0.length;$4++) {
$3[$4] = $0[$4]
};
LzBrowserKernel.__jscallq.push($3)
}} else {
$0[1] = null;
var $5 = DojoExternalInterface.call.apply(null, $0);
if ($2 && $2 instanceof Function) {
$2.call(null, $5)
};
return $5
}}static function callJSInternal (...$0):* {
var $1;
try {
$1 = DojoExternalInterface.call.apply(null, $0)
}
catch ($2) {};
return $1
}static var __jslocked:Boolean = true;static var __jscallq:Array = [];static function __jsready ():void {
LzBrowserKernel._dequeueJS()
}static function _dequeueJS ():void {
LzBrowserKernel.__jslocked = false;
while (LzBrowserKernel.__jscallq.length > 0) {
LzBrowserKernel.callJS.apply(LzBrowserKernel, LzBrowserKernel.__jscallq.shift())
}}static function setHistory ($0:*):void {
LzBrowserKernel.callJSInternal("lz.embed.history.set", null, $0)
}static function getPersistedObject ($0:String):SharedObject {
try {
return SharedObject.getLocal($0)
}
catch ($1:Error) {};
return null
}static function callMethod ($0:*):* {
return lz.Utils.safeEval($0)
}static var _os:String = null;static var _ver:String = null;static function getVersion ():String {
if (!LzBrowserKernel._ver) {
var $0:Array = Capabilities.version.split(" ");
LzBrowserKernel._os = $0[0];
LzBrowserKernel._ver = $0[1].split(",").join(".")
};
return LzBrowserKernel._ver
}static function getOS ():String {
return Capabilities.os
}static function getLoadURL ():String {
return LFCApplication.stage.loaderInfo.loaderURL
}static var __initargs:Object = null;static var __options:Object = null;static function getInitArg ($0:String = null):* {
if (!LzBrowserKernel.__initargs && LzBrowserKernel.__jslocked == false) {
var $1 = LzBrowserKernel.callJSInternal("eval", null, 'lz.embed.applications["' + LzBrowserKernel.getAppID() + '"].initargs');
if ($1) {
LzBrowserKernel.__initargs = $1
}};
var $2 = LzBrowserKernel.__initargs || LFCApplication.stage.loaderInfo.parameters;
if ($2 == null) {
return
} else if ($0 == null) {
return $2
};
return $2[$0]
}static function getLzOption ($0:String = null):* {
if (!LzBrowserKernel.__options && LzBrowserKernel.__jslocked == false) {
var $1 = LzBrowserKernel.callJSInternal("eval", null, 'lz.embed.applications["' + LzBrowserKernel.getAppID() + '"].options');
if ($1) {
LzBrowserKernel.__options = $1
}};
var $2 = LzBrowserKernel.__options || LFCApplication.stage.loaderInfo.parameters;
if ($2 == null) {
return
} else if ($0 == null) {
return $2
};
return $2[$0]
}static function getAppID ():String {
return LFCApplication.stage.loaderInfo.parameters.id
}static function showMenu ($0:Boolean):void {
LFCApplication.stage.showDefaultContextMenu = $0
}static function setClipboard ($0:String):void {
System.setClipboard($0)
}static function isAAActive ():Boolean {
return Capabilities.hasAccessibility && Accessibility.active
}static function updateAccessibility ():void {
Accessibility.updateProperties()
}static function loadProxyPolicy ($0:String):void {
Security.loadPolicyFile($0)
}}
}
