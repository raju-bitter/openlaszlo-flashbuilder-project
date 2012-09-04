package {
class LzHTTPDataProvider extends LzDataProvider {
private var __loaders:Array = null;function LzHTTPDataProvider () {
super()
}function makeLoader ($0:LzHTTPDataRequest):LzHTTPLoader {
var $1:Boolean = $0.proxied;
if (this.__loaders == null) this.__loaders = [];
var $2:LzHTTPLoader = new LzHTTPLoader(this, $1);
this.__loaders.push($2);
$0.loader = $2;
$2.loadSuccess = this.loadSuccess;
$2.loadError = this.loadError;
$2.loadTimeout = this.loadTimeout;
$2.setProxied($1);
$2.setCredentialled($0.credentialled);
var $3:Boolean = $0.secure;
if ($0.src.substring(0, 5) == "https") {
$3 = true
};
$2.secure = $3;
if ($3) {
$2.baserequest = lz.Browser.getBaseURL($3, $0.secureport);
$2.secureport = $0.secureport
};
return $2
}override function abortLoadForRequest ($0:LzDataRequest):void {
($0 as LzHTTPDataRequest).loader.abort()
}override function doRequest ($0:LzDataRequest):void {
var $1 = $0 as LzHTTPDataRequest;
if (!$1.src) return;
var $2:Boolean = $1.proxied;
var $3:LzHTTPLoader = $1.loader;
if ($3 == null || $1.multirequest == true || $1.queuerequests == true) {
$3 = this.makeLoader($1)
};
$3.dataRequest = $1;
$3.setQueueing($1.queuerequests);
$3.setTimeout($1.timeout);
$3.setOption("serverproxyargs", $1.serverproxyargs);
$3.setOption("cacheable", $1.cacheable == true);
$3.setOption("timeout", $1.timeout);
$3.setOption("trimwhitespace", $1.trimwhitespace == true);
$3.setOption("nsprefix", $1.nsprefix == true);
$3.setOption("sendheaders", $1.getresponseheaders == true);
$3.setOption("parsexml", $1.parsexml);
if ($1.clientcacheable != null) {
$3.setOption("ccache", $1.clientcacheable)
};
var $4:Object = {};
var $5:LzParam = $1.requestheaders;
if ($5 != null) {
var $6:Array = $5.getNames();
for (var $7:int = 0;$7 < $6.length;$7++) {
var $8:String = $6[$7];
var $9:String = $5.getValue($8);
if ($2) {
$4[$8] = $9
} else {
$3.setRequestHeader($8, $9)
}}};
var $a:LzParam = $1.queryparams;
var $b:Boolean = true;
var $c:String = $1.postbody;
if ($c == null && $a != null) {
$c = $a.serialize("=", "&", true)
} else {
$b = false
};
$3.setOption("hasquerydata", $b);
var $d:LzURL = new LzURL($1.src);
if ($1.method == "GET") {
if ($d.query == null) {
$d.query = $c
} else {
if ($c != null) {
$d.query += "&" + $c
}};
$c = null
};
var $e:String = "__lzbc__=" + Math.floor(Math.random() * (-1 >>> 1)).toString(36);
if (!$2 && $1.method == "POST" && ($c == null || $c == "")) {
$c = $e
};
var $f:String;
if ($2) {
$f = $3.makeProxiedURL($1.proxyurl, $d.toString(), $1.method, "xmldata", $4, $c);
var $g:int = $f.indexOf("?");
var $h:String = $f.substring($g + 1, $f.length);
var $i:String = $f.substring(0, $g);
$f = $i + "?" + $e;
$c = $h
} else {
if (!$1.clientcacheable) {
if ($1.method == "GET") {
if ($d.query == null) {
$d.query = $e
} else {
$d.query += "&" + $e
}}};
$f = $d.toString()
};
$1.loadstarttime = new Date().getTime();
$1.status = LzDataRequest.LOADING;
$3.open($2 ? "POST" : $1.method, $f, null, null);
$3.send($c)
}function loadSuccess ($0:LzHTTPLoader, $1:*):void {
var $2:LzHTTPDataRequest = $0.dataRequest;
$2.status = LzDataRequest.SUCCESS;
$0.owner.loadResponse($2, $1)
}function loadError ($0:LzHTTPLoader, $1:*):void {
var $2:LzHTTPDataRequest = $0.dataRequest;
$2.status = LzDataRequest.ERROR;
$0.owner.loadResponse($2, $1)
}function loadTimeout ($0:LzHTTPLoader, $1:*):void {
var $2:LzHTTPDataRequest = $0.dataRequest;
$2.loadtime = new Date().getTime() - $2.loadstarttime;
$2.status = LzDataRequest.TIMEOUT;
if ($2.onstatus.ready) $2.onstatus.sendEvent($2)
}function setRequestError ($0:LzHTTPDataRequest, $1:String):void {
$0.error = $1;
$0.status = LzDataRequest.ERROR
}function loadResponse ($0:LzHTTPDataRequest, $1:*):void {
$0.loadtime = new Date().getTime() - $0.loadstarttime;
$0.rawdata = $0.loader.getResponse();
if ($1 == null) {
this.setRequestError($0, "client could not parse XML from server");
if ($0.onstatus.ready) $0.onstatus.sendEvent($0);
return
};
var $2:Boolean = $0.proxied;
if (!$0.parsexml) {
if ($0.onstatus.ready) $0.onstatus.sendEvent($0);
return
} else if ($2 && $1.childNodes[0].nodeName == "error") {
this.setRequestError($0, $1.childNodes[0].attributes["msg"]);
if ($0.onstatus.ready) $0.onstatus.sendEvent($0);
return
};
var $3:LzParam = new (lz.Param)();
var $4:LzDataElement = null;
if ($2) {
var $5:Array = $1.childNodes.length > 1 && $1.childNodes[1].childNodes ? $1.childNodes[1].childNodes : null;
if ($5 != null) {
for (var $6:int = 0;$6 < $5.length;$6++) {
var $7:LzDataElement = $5[$6];
if ($7.attributes) $3.addValue($7.attributes.name, $7.attributes.value)
}};
if ($1.childNodes[0].childNodes) $4 = $1.childNodes[0].childNodes[0]
} else {
var $5:* = $0.loader.getResponseHeaders();
if ($5) {
$3.addObject($5)
};
$4 = $1
};
$0.xmldata = $4;
$0.responseheaders = $3;
if ($0.onstatus.ready) $0.onstatus.sendEvent($0)
}override function destroy () {
for (var $0 = this.__loaders.length - 1;$0 > -1;$0--) {
this.__loaders[$0].destroy()
};
this.__loaders = null;
super.destroy()
}}
}
