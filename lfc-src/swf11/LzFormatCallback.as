package {
class LzFormatCallback {
var callback:Function;var argument:*;function LzFormatCallback ($0:Function, $1:*) {
this.callback = $0;
this.argument = $1
}function call () {
return this.callback.call(this.argument)
}}
}
