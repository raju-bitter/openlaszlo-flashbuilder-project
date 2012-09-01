package {

    import flash.utils.getDefinitionByName;
  dynamic class LzDebugService extends $lzsc$mixin$LzFormatter$ {
public static function _trace ($0):void {
trace($0)
}public function write (...$0):void {
var $1 = this.formatToString.apply(this, $0);
LzDebugService._trace($1)
}public function inspect (...$0):void {
this.write("INSPECT: " + this.formatToString.apply(this, $0))
}public function deprecated (...$0):void {
this.write("DEPRECATED: " + this.formatToString.apply(this, $0))
}public function info (...$0):void {
this.write("INFO: " + this.formatToString.apply(this, $0))
}public function warn (...$0):void {
this.write("WARN: " + this.formatToString.apply(this, $0))
}public function error (...$0):void {
this.write("ERROR: " + this.formatToString.apply(this, $0))
}public function debug (...$0):void {
this.write("DEBUG: " + this.formatToString.apply(this, $0))
}public function monitor (...$0):void {
this.write("MONITOR: " + this.formatToString.apply(this, $0))
}public function trace (...$0):void {
this.write("TRACE: " + this.formatToString.apply(this, $0))
}public function __typeof ($0) {
return typeof $0
}public function functionName ($0, $1 = false) {
return String($0)
}public function __String ($0, $1 = null, $2 = null, $3 = null) {
return String($0)
}}
}
