package {
  
    import flash.external.ExternalInterface;
    class DojoExternalInterfaceClass {
var available:Boolean = false;var flashMethods:Object = {};var numArgs:* = null;var argData:Array = null;var resultData:String = null;var _id:*;function DojoExternalInterfaceClass ($0:*) {
if ($0 == null) return;
this._id = $0;
this.available = ExternalInterface.available;
if (!this.available) return;
ExternalInterface.addCallback("startExec", this.startExec);
ExternalInterface.addCallback("setNumberArguments", this.setNumberArguments);
ExternalInterface.addCallback("chunkArgumentData", this.chunkArgumentData);
ExternalInterface.addCallback("exec", this.exec);
ExternalInterface.addCallback("getReturnLength", this.getReturnLength);
ExternalInterface.addCallback("chunkReturnData", this.chunkReturnData);
ExternalInterface.addCallback("endExec", this.endExec);
this.call("loaded")
}function addCallback ($0:String, $1:*, $2:*):Boolean {
this.flashMethods[$0] = $1;
ExternalInterface.call("lz.embed.dojo.comm." + this._id + "._addExternalInterfaceCallback", $0, this._id);
return true
}function call (...$0) {
var $1:String = $0[0];
var $2:Function = $0[1];
var $3:Array = [];
for (var $4:int = 0;$4 < $0.length;$4++) {
if ($4 != 1) {
var $5 = $0[$4];
if (typeof $5 === "string") {
if ($5.indexOf("\\") > -1) {
$5 = $5.split("\\").join("\\\\")
}} else if (typeof $5 === "object") {
for (var $6 in $5) {
var $7 = $5[$6];
if (typeof $7 === "string" && $7.indexOf("\\") > -1) {
$5[$6] = $7.split("\\").join("\\\\")
}}};
$3.push($5)
}};
var $8:* = ExternalInterface.call.apply(null, $3);
if ($2 != null && typeof $2 != "undefined") {
$2.call(null, $8)
};
return $8
}function loaded ():void {
this.call("lz.embed.dojo.loaded", null, this._id);
LzBrowserKernel.__jsready()
}function startExec ():void {
this.numArgs = null;
this.argData = null;
this.resultData = null
}function setNumberArguments ($0:Number):void {
this.numArgs = $0;
this.argData = []
}function chunkArgumentData ($0:*, $1:int):void {
var $2:* = this.argData[$1];
if ($2 == null || typeof $2 == "undefined") {
this.argData[$1] = $0
} else {
this.argData[$1] += $0
}}function exec ($0:String):void {
for (var $1:int = 0;$1 < this.argData.length;$1++) {
this.argData[$1] = this.decodeData(this.argData[$1])
};
var $2:* = this.flashMethods[$0];
this.resultData = String($2[$0].apply($2, this.argData));
this.resultData = this.encodeData(this.resultData)
}function getReturnLength ():Number {
if (this.resultData == null || typeof this.resultData == "undefined") {
return 0
};
var $0:Number = Math.ceil(this.resultData.length / 1024);
return $0
}function chunkReturnData ($0:Number):String {
var $1:Number = this.getReturnLength();
var $2:Number = $0 * 1024;
var $3:Number = $0 * 1024 + 1024;
if ($0 == $1 - 1) {
$3 = $0 * 1024 + this.resultData.length
};
var $4:String = this.resultData.substring($2, $3);
return $4
}function endExec ():void {}function decodeData ($0:String):String {
$0 = this.replaceStr($0, "&custom_backslash;", "\\");
$0 = this.replaceStr($0, "\\'", "'");
$0 = this.replaceStr($0, '\\"', '"');
return $0
}function encodeData ($0:String):String {
$0 = this.replaceStr($0, "&", "&amp;");
$0 = this.replaceStr($0, "<", "&custom_lt;");
$0 = this.replaceStr($0, ">", "&custom_gt;");
$0 = this.replaceStr($0, "\n", "\\n");
$0 = this.replaceStr($0, "\r", "\\r");
$0 = this.replaceStr($0, "\f", "\\f");
$0 = this.replaceStr($0, "'", "\\'");
$0 = this.replaceStr($0, '"', '"');
return $0
}function replaceStr ($0:String, $1:String, $2:String):String {
var $3:Array = $0.split($1);
$0 = $3.join($2);
return $0
}}
}
