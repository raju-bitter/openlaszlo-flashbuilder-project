package {
class LzDataText extends $lzsc$mixin$LzDataNodeMixin$LzDataNode {
function LzDataText ($0:String) {
super();
this.nodeType = LzDataElement.TEXT_NODE;
this.data = $0
}var ondata:LzDeclaredEventClass = LzDeclaredEvent;var nodeName:String = "#text";var data:String = "";function $lzc$set_data ($0:String):void {
this.data = $0;
if (this.ondata.ready) {
this.ondata.sendEvent($0)
};
if (this.ownerDocument) {
this.ownerDocument.handleDocumentChange("data", this, 1)
}}public override function cloneNode ($0:Boolean = false) {
var $1:LzDataText = new LzDataText(this.data);
return $1
}public override function serialize ():String {
return LzDataElement.__LZXMLescape(this.data)
}override function toString () {
return this.data
}}
}
