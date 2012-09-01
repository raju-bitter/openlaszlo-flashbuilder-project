package {
public dynamic class LzContextMenuItem extends LzNode {
static var tagname:String = "contextmenuitem";static var __LZCSSTagSelectors:Array = ["contextmenuitem", "node"];static var attributes:Object = new LzInheritedHash(LzNode.attributes);var onselect:LzDeclaredEventClass = LzDeclaredEvent;var kernel:LzContextMenuItemKernel = null;function LzContextMenuItem ($0:*, $1:Object? = null, $2:Array? = null, $3:Boolean = false) {
super($0 is LzNode ? $0 as LzNode : null, $0 is LzNode ? $1 : {title: $0, delegate: $1}, $2, $3)
}override function construct ($0, $1) {
super.construct($0, $1);
var $2:String = $1 && $1["title"] || "";
delete $1["title"];
var $3:* = $1 && $1["delegate"] || null;
delete $1["delegate"];
this.kernel = new LzContextMenuItemKernel(this, $2, $3);
var $4:LzNode = this.immediateparent;
if ($4 && $4 is LzContextMenu) {
($4 as LzContextMenu).addItem(this)
}}var delegate;function $lzc$set_delegate ($0:*):void {
this.delegate = $0;
this.kernel.setDelegate($0)
}var caption:String;function $lzc$set_caption ($0:String):void {
this.caption = $0;
this.kernel.setCaption($0)
}var enabled:Boolean;function $lzc$set_enabled ($0:Boolean):void {
this.enabled = $0;
this.kernel.setEnabled($0)
}var separatorbefore:Boolean;function $lzc$set_separatorbefore ($0:Boolean):void {
this.separatorbefore = $0;
this.kernel.setSeparatorBefore($0)
}var visible:Boolean;function $lzc$set_visible ($0:Boolean):void {
this.visible = $0;
this.kernel.setVisible($0)
}function getCaption ():String {
return this.kernel.getCaption()
}}
}
