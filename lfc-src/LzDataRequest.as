package {
class LzDataRequest extends LzEventable {
static var SUCCESS:String = "success";static var TIMEOUT:String = "timeout";static var ERROR:String = "error";static var READY:String = "ready";static var LOADING:String = "loading";var requestor:* = null;var src:String = null;var timeout:Number = Infinity;var status:String = null;var rawdata:String = null;var error:String = null;var onstatus:LzDeclaredEventClass = LzDeclaredEvent;function LzDataRequest ($0:* = null) {
this.requestor = $0
}}
}
