package {

    import flash.events.ContextMenuEvent;
    import flash.ui.ContextMenu;
    import flash.ui.ContextMenuBuiltInItems;
    import flash.display.InteractiveObject;
    class LzContextMenuKernel {
function LzContextMenuKernel ($0:LzContextMenu) {
this.owner = $0;
this.cm = new ContextMenu();
this.cm.hideBuiltInItems();
this.cm.addEventListener(ContextMenuEvent.MENU_SELECT, handleMenuSelect);
LzMouseKernel.createdContextMenu(this.cm)
}var owner:LzContextMenu = null;var cm:ContextMenu = null;var delegate:LzDelegate = null;private function handleMenuSelect ($0:ContextMenuEvent):void {
if (LzMouseKernel.__lastMouseDown) {
LzMouseKernel.__mouseUpOutsideHandler()
};
var $1:LzContextMenu = this.owner;
var $2:LzDelegate = this.delegate;
if ($2 != null) {
$2.execute($1)
};
if ($1.onmenuopen.ready) $1.onmenuopen.sendEvent($1);
var $3:InteractiveObject = $0.mouseTarget;
while ($3 != null && !($3 is LzSprite)) {
$3 = $3.parent
};
var $4:LzView = $3 ? ($3 as LzSprite).owner : null;
var $5 = $1._filteredItems($4);
var $6 = [];
for (var $7 = 0;$7 < $5.length;$7++) {
$6.push($5[$7].kernel.cmenuitem)
};
this.cm.customItems = $6
}function setDelegate ($0:LzDelegate):void {
this.delegate = $0
}function hideBuiltInItems ():void {
this.cm.hideBuiltInItems()
}function showBuiltInItems ():void {
var $0:ContextMenuBuiltInItems = this.cm.builtInItems;
$0.print = true;
$0.quality = true;
$0.zoom = true
}function __LZcontextMenu ():ContextMenu {
return this.cm
}}
}
