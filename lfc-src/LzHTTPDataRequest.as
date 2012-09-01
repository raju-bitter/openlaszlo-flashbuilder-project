package {
class LzHTTPDataRequest extends LzDataRequest {
var method:String = "GET";var postbody:String;var proxied:Boolean;var proxyurl:String;var multirequest:Boolean = false;var queuerequests:Boolean = false;var queryparams:LzParam = null;var requestheaders:LzParam = null;var getresponseheaders:Boolean = false;var responseheaders:LzParam;var credentialled:Boolean;var cacheable:Boolean = false;var clientcacheable:Boolean = false;var trimwhitespace:Boolean = false;var nsprefix:Boolean = false;var serverproxyargs:* = null;var xmldata:LzDataElement = null;var loadtime:Number = 0;var loadstarttime:Number;var secure:Boolean = false;var secureport:uint;var parsexml:Boolean = true;var loader:LzHTTPLoader = null;function LzHTTPDataRequest ($0:* = null) {
super($0)
}}
}
