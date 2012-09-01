package {
public dynamic class LzContextMenu extends LzNode {
static var tagname:String = "contextmenu";static var __LZCSSTagSelectors:Array = ["contextmenu", "node"];static var attributes:Object = new LzInheritedHash(LzNode.attributes);LzContextMenu.attributes.ignoreplacement = true;var onmenuopen:LzDeclaredEventClass = LzDeclaredEvent;var kernel:LzContextMenuKernel = null;var items:Array = null;function LzContextMenu ($0:* = null, $1:Object? = null, $2:Array? = null, $3:Boolean = false) {
super($0 is LzNode ? $0 as LzNode : null, $0 is LzNode ? $1 : {delegate: $0}, $2, $3)
}override function construct ($0, $1) {
super.construct($0, $1);
this.kernel = new LzContextMenuKernel(this);
this.items = [];
var $2:* = $1 && $1["delegate"] || null;
delete $1["delegate"];
this.$lzc$set_delegate($2)
}override function init () {
super.init();
var $0:LzNode = this.immediateparent;
if ($0 && $0 is LzView) {
($0 as LzView).$lzc$set_contextmenu(this)
}}var delegate;function $lzc$set_delegate ($0:*):void {
this.delegate = $0;
this.kernel.setDelegate($0)
}function addItem ($0:LzContextMenuItem):void {
if (canvas.capabilities.customcontextmenu) {
this.items.push($0)
}}function hideBuiltInItems ():void {
this.kernel.hideBuiltInItems()
}function showBuiltInItems ():void {
this.kernel.showBuiltInItems()
}function clearItems ():void {
if (canvas.capabilities.customcontextmenu) {
this.items = []
}}function getItems ():Array {
return this.items
}function filterItems ($0:LzView):Array {
return this.getItems()
}function _filteredItems ($0:LzView):Array {
var $1 = this.filterItems($0);
return $1
}function makeMenuItem ($0:String, $1:*):LzContextMenuItem {
var $2:LzContextMenuItem = new LzContextMenuItem($0, $1);
return $2
}}
}
