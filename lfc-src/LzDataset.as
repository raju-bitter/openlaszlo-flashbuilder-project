package {
public dynamic class LzDataset extends $lzsc$mixin$LzDataElementMixin$LzDataNodeMixin$LzNode {
static var tagname = "dataset";static var __LZCSSTagSelectors:Array = ["dataset", "DataElementMixin", "DataNodeMixin", "node"];static var attributes = new LzInheritedHash(LzNode.attributes);LzDataset.attributes.name = "localdata";static var slashPat:String = "/";var rawdata:String = null;var dataprovider:LzDataProvider;var multirequest:Boolean = false;var dataRequest:LzHTTPDataRequest = null;var dataRequestClass:Class = LzHTTPDataRequest;var dsloadDel:LzDelegate = null;var errorstring:String;var reqOnInitDel:LzDelegate;var secureport:uint;var proxyurl:String = null;var onerror:LzDeclaredEventClass = LzDeclaredEvent;var ontimeout:LzDeclaredEventClass = LzDeclaredEvent;var timeout:Number = 60000;function $lzc$set_timeout ($0:Number):void {
this.timeout = $0
}var postbody:String = null;function $lzc$set_postbody ($0:String):void {
this.postbody = $0
}var acceptencodings:Boolean = false;var type:String = null;var params:LzParam = null;var nsprefix:Boolean = false;var getresponseheaders:Boolean = false;var querytype:String = "GET";function $lzc$set_querytype ($0:String):void {
this.querytype = $0.toUpperCase()
}var trimwhitespace:Boolean = false;var cacheable:Boolean = false;var clientcacheable:Boolean = false;var querystring:String = null;var src:String = null;function $lzc$set_src ($0:String):void {
this.src = $0;
if (this.autorequest) {
this.doRequest()
}}var autorequest:Boolean = false;function $lzc$set_autorequest ($0:Boolean):void {
this.autorequest = $0
}var request:Boolean = false;function $lzc$set_request ($0:Boolean) {
this.request = $0;
if ($0 && !this.isinited) {
this.reqOnInitDel = new LzDelegate(this, "doRequest", this, "oninit")
}}var headers:LzParam = null;var proxied:* = null;function $lzc$set_proxied ($0:*):void {
var $1:* = {"true": true, "false": false, "null": null, inherit: null}[$0];
if ($1 !== void 0) {
this.proxied = $1
}}function isProxied ():Boolean {
return this.proxied != null ? this.proxied : canvas.proxied
}var credentialled:Boolean = false;function $lzc$set_credentialled ($0:Boolean) {
this.credentialled = $0
}var responseheaders:LzParam = null;var queuerequests:Boolean = false;var oncanvas:Boolean;function $lzc$set_initialdata ($0:String):void {
if ($0 != null) {
var $1:LzDataElement = LzDataElement.stringToLzData($0, this.trimwhitespace, this.nsprefix);
if ($1 != null) {
this.$lzc$set_data($1.childNodes)
}}}function LzDataset ($0:* = null, $1:* = null, $2:* = null, $3:* = null) {
super($0, $1, $2, $3)
}override function construct ($0, $1) {
this.nodeType = LzDataElement.DOCUMENT_NODE;
this.ownerDocument = this;
this.attributes = {};
this.childNodes = [];
this.queuerequests = false;
this.oncanvas = $0 == canvas || $0 == null;
if (!("proxyurl" in $1)) {
this.proxyurl = canvas.getProxyURL()
};
if (("timeout" in $1) && $1.timeout) {
this.timeout = $1.timeout
} else {
this.timeout = canvas.dataloadtimeout
};
if (("dataprovider" in $1) && $1.dataprovider) {
this.dataprovider = $1.dataprovider
} else {
this.dataprovider = canvas.defaultdataprovider
};
if ("autorequest" in $1) {
this.autorequest = $1.autorequest
};
super.construct($0, $1)
}override function $lzc$set_name ($0:String) {
super.$lzc$set_name($0);
if ($0 != null) {
this.nodeName = $0;
if (this.oncanvas) {
canvas[$0] = this
} else {
$0 = this.parent.getUID() + "." + $0
};
canvas.datasets[$0] = this
}}override function destroy () {
this.$lzc$set_childNodes([]);
this.dataRequest = null;
var $0:String = this.name;
if (this.oncanvas) {
if (canvas[$0] === this) {
delete canvas[$0]
}} else {
$0 = this.parent.getUID() + "." + $0
};
if (canvas.datasets[$0] === this) {
delete canvas.datasets[$0]
};
super.destroy()
}function getErrorString ():String {
return this.errorstring
}function getLoadTime ():Number {
var $0:LzHTTPDataRequest = this.dataRequest;
return $0 ? $0.loadtime : 0
}function getSrc ():String {
return this.src
}function getQueryString ():String {
if (typeof this.querystring == "undefined") {
return ""
} else {
return this.querystring
}}function getParams ():LzParam {
if (this.params == null) {
this.params = new (lz.Param)()
};
return this.params
}override function $lzc$set_data ($0:*) {
if ($0 == null) {
return
} else if ($0 instanceof Array) {
this.$lzc$set_childNodes($0)
} else {
this.$lzc$set_childNodes([$0])
};
this.data = $0;
if (this.ondata.ready) this.ondata.sendEvent(this)
}function gotError ($0:String):void {
this.errorstring = $0;
if (this.onerror.ready) this.onerror.sendEvent(this)
}function gotTimeout ():void {
if (this.ontimeout.ready) this.ontimeout.sendEvent(this)
}function getContext ($0 = null):* {
return this
}function getDataset ():LzDataset {
return this
}function getPointer ():LzDatapointer {
var $0 = new LzDatapointer(null);
$0.p = this.getContext();
return $0
}function setQueryString ($0:*):void {
this.params = null;
if (typeof $0 == "object") {
if ($0 instanceof lz.Param) {
this.querystring = $0.toString()
} else {
var $1:LzParam = new (lz.Param)();
for (var $2:String in $0) {
$1.setValue($2, $0[$2], true)
};
this.querystring = $1.toString();
$1.destroy()
}} else {
this.querystring = $0
};
if (this.autorequest) {
this.doRequest()
}}function setQueryParam ($0:String, $1:String):void {
this.querystring = null;
if (!this.params) {
this.params = new (lz.Param)()
};
this.params.setValue($0, $1);
if (this.autorequest) {
this.doRequest()
}}function setQueryParams ($0:Object):void {
this.querystring = null;
if (!this.params) {
this.params = new (lz.Param)()
};
if ($0) {
this.params.addObject($0)
} else if ($0 == null) {
this.params.remove()
};
if ($0 && this.autorequest) {
this.doRequest()
}}static function queryStringToTable ($0:String):Object {
var $1:Object = {};
var $2:Array = $0.split("&");
for (var $3:int = 0;$3 < $2.length;++$3) {
var $4:String = $2[$3];
var $5:String = "";
var $6:int = $4.indexOf("=");
if ($6 > 0) {
$5 = decodeURIComponent($4.substring($6 + 1));
$4 = $4.substring(0, $6)
};
if ($4 in $1) {
var $7:* = $1[$4];
if ($7 instanceof Array) {
$7.push($5)
} else {
$1[$4] = [$7, $5]
}} else {
$1[$4] = $5
}};
return $1
}function abort ():void {
var $0:LzHTTPDataRequest = this.dataRequest;
if ($0) {
this.dataprovider.abortLoadForRequest($0)
}}function doRequest ($0:* = null):void {
if (!this.src) return;
if (this.multirequest || this.dataRequest == null || this.queuerequests) {
this.dataRequest = new (this.dataRequestClass)(this)
};
var $1:LzHTTPDataRequest = this.dataRequest;
$1.src = this.src;
$1.timeout = this.timeout;
$1.status = LzDataRequest.READY;
$1.method = this.querytype;
$1.postbody = null;
if (this.querystring) {
$1.queryparams = new (lz.Param)();
$1.queryparams.addObject(lz.Param.parseQueryString(this.querystring))
} else {
$1.queryparams = this.params
};
if (this.querytype.toUpperCase() == "POST") {
$1.postbody = this.postbody;
if ($1.queryparams) {
var $2 = $1.queryparams.getValue("lzpostbody");
if ($2 != null) {
$1.queryparams.remove("lzpostbody");
$1.postbody = $2
}}};
$1.proxied = this.isProxied();
$1.proxyurl = this.proxyurl;
$1.queuerequests = this.queuerequests;
$1.requestheaders = this.headers;
$1.getresponseheaders = this.getresponseheaders;
$1.secureport = this.secureport;
$1.cacheable = this.cacheable;
$1.clientcacheable = this.clientcacheable;
$1.trimwhitespace = this.trimwhitespace;
$1.nsprefix = this.nsprefix;
$1.credentialled = this.credentialled;
if (this.dsloadDel == null) {
this.dsloadDel = new LzDelegate(this, "handleDataResponse", $1, "onstatus")
} else {
this.dsloadDel.register($1, "onstatus")
};
this.dataprovider.doRequest($1)
}function handleDataResponse ($0:LzHTTPDataRequest):void {
if (this.dsloadDel != null) {
this.dsloadDel.unregisterFrom($0.onstatus)
};
this.rawdata = $0.rawdata;
this.errorstring = null;
if ($0.status == LzDataRequest.SUCCESS) {
if (this.responseheaders != null) {
this.responseheaders.destroy()
};
this.responseheaders = $0.responseheaders;
this.$lzc$set_data($0.xmldata)
} else if ($0.status == LzDataRequest.ERROR) {
this.gotError($0.error)
} else if ($0.status == LzDataRequest.TIMEOUT) {
this.gotTimeout()
}}function setHeader ($0:String, $1:String):void {
if (!this.headers) {
this.headers = new (lz.Param)()
};
this.headers.setValue($0, $1)
}function getRequestHeaderParams ():LzParam {
return this.headers
}function clearRequestHeaderParams ():void {
if (this.headers) {
this.headers.remove()
}}function getResponseHeader ($0:String):* {
var $1:LzParam = this.responseheaders;
if ($1) {
var $2:Array = $1.getValues($0);
if ($2 && $2.length == 1) {
return $2[0]
} else {
return $2
}};
return void 0
}function getAllResponseHeaders ():LzParam {
return this.responseheaders
}override function toString () {
return "LzDataset " + ":" + this.name
}}
}
