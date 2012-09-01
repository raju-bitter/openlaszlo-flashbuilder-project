package {

    import flash.events.ContextMenuEvent;
    import flash.ui.ContextMenuItem;
    class LzContextMenuItemKernel {
function LzContextMenuItemKernel ($0:LzContextMenuItem, $1:String, $2:*) {
this.owner = $0;
this.cmenuitem = new ContextMenuItem($1);
this.cmenuitem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, this.handleMenuItemSelect);
this.setDelegate($2)
}var owner:LzContextMenuItem = null;var cmenuitem:ContextMenuItem = null;var delegate:* = null;private function handleMenuItemSelect ($0:ContextMenuEvent):void {
var $1:LzContextMenuItem = this.owner;
var $2:* = this.delegate;
if ($2 != null) {
if ($2 is Function) {
$2()
} else if ($2 is LzDelegate) {
$2.execute($1)
}};
if ($1.onselect.ready) $1.onselect.sendEvent($1)
}function setDelegate ($0:*):void {
this.delegate = $0
}function setCaption ($0:String):void {
this.cmenuitem.caption = $0
}function getCaption ():String {
return this.cmenuitem.caption
}function setEnabled ($0:Boolean):void {
this.cmenuitem.enabled = $0
}function setSeparatorBefore ($0:Boolean):void {
this.cmenuitem.separatorBefore = $0
}function setVisible ($0:Boolean):void {
this.cmenuitem.visible = $0
}}
}
