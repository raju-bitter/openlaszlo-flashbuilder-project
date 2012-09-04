package {

        import flash.events.IEventDispatcher;
        import flash.events.Event;
        import flash.events.HTTPStatusEvent;
        import flash.events.IOErrorEvent;
        import flash.events.ProgressEvent;
        import flash.events.SecurityErrorEvent;
        import flash.net.URLLoader;
        import flash.net.URLLoaderDataFormat;
        import flash.net.URLRequest;
        import flash.net.URLRequestHeader;
        import flash.net.URLRequestMethod;
    public class LzHTTPLoader {
static var GET_METHOD:String = "GET";static var POST_METHOD:String = "POST";static var PUT_METHOD:String = "PUT";static var DELETE_METHOD:String = "DELETE";var owner:*;var __timeoutID:uint = 0;var __abort:Boolean = false;var __timeout:Boolean = false;var gstart:Number;var secure:Boolean;var options:Object;var timeout:Number = Infinity;var requestheaders:Object;var requestmethod:String;var requesturl:String;var responseStatus:int = 0;var responseText:String;var responseXML:XML = null;var loader:URLLoader = null;var dataRequest:LzHTTPDataRequest = null;var baserequest:LzURL;var secureport:uint;var credentialled:Boolean;public function LzHTTPLoader ($0:*, $1:Boolean) {
super();
this.owner = $0;
this.options = {parsexml: true, serverproxyargs: null};
this.requestheaders = {};
this.requestmethod = LzHTTPLoader.GET_METHOD
}public var loadSuccess:Function = function (...$0):void {
trace("loadSuccess callback not defined on", this)
};public var loadError:Function = function (...$0):void {
trace("loadError callback not defined on", this)
};public var loadTimeout:Function = function (...$0):void {
trace("loadTimeout callback not defined on", this)
};public function getResponse ():String {
return this.responseText
}public function getResponseStatus ():int {
return this.responseStatus
}public function getResponseHeaders ():Array {
return null
}public function getResponseHeader ($0:String):String {
return null
}public function setRequestHeaders ($0:Object):void {
this.requestheaders = $0
}public function setRequestHeader ($0:String, $1:String):void {
this.requestheaders[$0] = $1
}public function setOption ($0:String, $1:*):void {
this.options[$0] = $1
}public function getOption ($0:String):* {
return this.options[$0]
}public function setProxied ($0:Boolean):void {
this.setOption("proxied", $0)
}public function setQueryParams ($0:Object):void {}public function setQueryString ($0:String):void {}public function setQueueing ($0:Boolean):void {
this.setOption("queuing", $0)
}public function setCredentialled ($0:Boolean):void {
this.credentialled = $0
}public function abort ():void {
if (this.loader) {
this.__abort = true;
this.loader.close();
this.loader = null;
this.removeTimeout(this)
}}public function open ($0:String, $1:String, $2:String = null, $3:String = null):void {
if (this.loader) {
this.abort()
};
this.loader = new URLLoader();
this.loader.dataFormat = URLLoaderDataFormat.TEXT;
this.responseText = null;
this.responseXML = null;
this.__abort = false;
this.__timeout = false;
this.__timeoutID = 0;
this.requesturl = $1;
this.requestmethod = $0;
this.responseStatus = 0
}public function send ($0:String = null):void {
this.loadXMLDoc(this.requestmethod, this.requesturl, this.requestheaders, $0, true)
}public function makeProxiedURL ($0:String, $1:String, $2:String, $3:String, $4:Object, $5:String):String {
var $6:Object = {serverproxyargs: this.options.serverproxyargs, sendheaders: this.options.sendheaders, trimwhitespace: this.options.trimwhitespace, nsprefix: this.options.nsprefix, timeout: this.timeout, cache: this.options.cacheable, ccache: this.options.ccache, proxyurl: $0, url: $1, secure: this.secure, postbody: $5, headers: $4, httpmethod: $2, service: $3};
return lz.Browser.makeProxiedURL($6)
}public function setTimeout ($0:Number):void {
this.timeout = $0
}public function setupTimeout ($0:LzHTTPLoader, $1:Number):void {
$0.__timeoutID = LzTimeKernel.setTimeout($0.__LZhandleXMLHTTPTimeout, $1)
}public function removeTimeout ($0:LzHTTPLoader):void {
var $1:uint = $0.__timeoutID;
if ($1 != 0) {
LzTimeKernel.clearTimeout($1)
}}private function __LZhandleXMLHTTPTimeout ():void {
this.__timeout = true;
this.abort();
this.loadTimeout(this, null)
}public function getElapsedTime ():Number {
return new Date().getTime() - this.gstart
}private function configureListeners ($0:IEventDispatcher):void {
$0.addEventListener(Event.COMPLETE, completeHandler);
$0.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
$0.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
$0.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler)
}private function completeHandler ($0:Event):void {
if ($0 && $0.target is URLLoader) {
if (this.loader == null) {

} else if (this.__timeout) {

} else if (this.__abort) {

} else {
removeTimeout(this);
this.responseText = loader.data;
loader = null;
if (this.options["parsexml"]) {
var $1:LzDataElement = null;
try {
if (this.responseText != null) {
XML.ignoreWhitespace = options.trimwhitespace;
this.responseXML = XML(responseText);
this.responseXML.normalize();
$1 = LzXMLTranslator.copyXML(this.responseXML, options.trimwhitespace, options.nsprefix)
}}
catch ($2:Error) {
loadError(this, null);
return
};
loadSuccess(this, $1)
} else {
loadSuccess(this, this.responseText)
}}}}private function securityErrorHandler ($0:SecurityErrorEvent):void {
removeTimeout(this);
loader = null;
loadError(this, null)
}private function ioErrorHandler ($0:IOErrorEvent):void {
removeTimeout(this);
loader = null;
loadError(this, null)
}private function httpStatusHandler ($0:HTTPStatusEvent):void {
this.responseStatus = $0.status
}public function loadXMLDoc ($0:String, $1:String, $2:Object, $3:String, $4:Boolean):void {
if (this.loader == null) {
return
};
var $5:Boolean = $1.indexOf("https:") == 0;
$1 = lz.Browser.toAbsoluteURL($1, $5);
configureListeners(this.loader);
var $6:URLRequest = new URLRequest($1);
$6.data = $3;
$6.method = $0 == LzHTTPLoader.GET_METHOD ? URLRequestMethod.GET : URLRequestMethod.POST;
var $7:Boolean = false;
for (var $8:String in $2) {
$6.requestHeaders.push(new URLRequestHeader($8, $2[$8]));
if ($8.toLowerCase() == "content-type") {
$7 = true
}};
if ($0 == "POST" && !$7) {
$6.requestHeaders.push(new URLRequestHeader("Content-Type", "application/x-www-form-urlencoded"))
};
try {
this.gstart = new Date().getTime();
this.loader.load($6);
if (isFinite(this.timeout)) {
this.setupTimeout(this, this.timeout)
}}
catch ($9:Error) {
this.loader = null;
this.loadError(this, null)
}}public function destroy () {
return
}}
}
