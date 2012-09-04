package {
public dynamic class LzInputText extends LzText {
function LzInputText ($0:LzNode? = null, $1:Object? = null, $2:Array? = null, $3:Boolean = false) {
super($0, $1, $2, $3)
}var password;static var tagname:String = "inputtext";static var __LZCSSTagSelectors:Array = ["inputtext", "text", "formatter", "view", "node"];static var attributes = new LzInheritedHash(LzText.attributes);LzNode.mergeAttributes({selectable: true, enabled: true, clip: true}, LzInputText.attributes);var onenabled = LzDeclaredEvent;override function getDefaultWidth () {
return 100
}var _onfocusDel = null;var _onblurDel = null;var _modemanagerDel = null;override function construct ($0, $1) {
this.password = ("password" in $1) ? !(!$1.password) : false;
this.focusable = true;
this.hasdirectionallayout = ("hasdirectionallayout" in $1) ? $1.hasdirectionallayout : false;
super.construct($0, $1);
this.$lzc$set_resize(("resize" in $1) ? !(!$1.resize) : false);
this._onfocusDel = new LzDelegate(this, "_gotFocusEvent", this, "onfocus");
this._onblurDel = new LzDelegate(this, "_gotBlurEvent", this, "onblur");
this._modemanagerDel = new LzDelegate(this, "_modechanged", lz.ModeManager, "onmode")
}var isprite:LzInputTextSprite;override function __makeSprite ($0) {
var $1 = this.searchParents("hasdirectionallayout");
if ($1 != null) {
this.hasdirectionallayout = $1.hasdirectionallayout
};
this.sprite = this.tsprite = this.isprite = new LzInputTextSprite(this, $0, this.hasdirectionallayout)
}var _focused = false;function _gotFocusEvent ($0 = null) {
this._focused = true;
this.isprite.gotFocus()
}function _gotBlurEvent ($0 = null) {
this._focused = false;
this.isprite.gotBlur()
}function inputtextevent ($0:String, $1:* = null):void {
if ($0 == "onfocus" && this._focused) return;
if ($0 == "onblur" && !this._focused) return;
if ($0 == "onfocus") {
this._focused = true;
if (lz.Focus.getFocus() !== this) {
var $2:Boolean = lz.Keys.isKeyDown("tab");
lz.Focus.setFocus(this, $2 ? lz.Focus.MOUSE_KEYBOARD : lz.Focus.MOUSE_MANUAL);
if (lz.Focus.getFocus() !== this && this._focused) {
this._gotBlurEvent()
}}} else if ($0 == "onchange") {
this.text = this.isprite.getText();
if (this.multiline && !this.hassetheight) {
var $3 = this.isprite.getTextfieldHeight();
if (this.height != $3) {
this.updateHeight($3)
}};
if (this.ontext.ready) this.ontext.sendEvent(this.text)
} else if ($0 == "onblur") {
this._focused = false;
if (lz.Focus.getFocus() === this) {
lz.Focus.clearFocus()
}}}override function updateData () {
return this.isprite.getText()
}public var enabled = true;function $lzc$set_enabled ($0) {
this.focusable = true;
this.enabled = $0;
this.isprite.setEnabled($0);
if (this.onenabled.ready) this.onenabled.sendEvent($0)
}function setHTML ($0) {
if (this.capabilities["htmlinputtext"]) {
this.isprite.setHTML($0)
}}function getText () {
if (this.isprite != null) {
return this.isprite.getText()
} else {
return ""
}}var _allowselectable = true;var _selectable;function _modechanged ($0:LzView):void {
this._setallowselectable(!$0 || lz.ModeManager.__LZallowInput($0, this))
}function _mousewheelChanged ($0:Number):void {
var $1 = this.fontsize;
if (this.multiline && this.isMouseOver()) {
var $2 = this.yscroll + $0 * $1;
if ($2 > 0) {
if (this.yscroll < 0) {
$2 = 0
} else {
return
}};
var $3 = this.tsprite["__LzInputDiv"];
var $4 = -($3.scrollHeight - this.height + 4);
if ($2 < $4) {
if (this.yscroll > $4) {
$2 = $4
} else {
return
}};
this.setAttribute("yscroll", $2)
}}function _setallowselectable ($0) {
this._allowselectable = $0;
this.$lzc$set_selectable(this._selectable)
}override function $lzc$set_selectable ($0:Boolean) {
this._selectable = $0;
super.$lzc$set_selectable(this._allowselectable ? $0 : false)
}var readonly = false;function $lzc$set_readonly ($0) {
if (this.readonly == $0) return;
this.readonly = $0;
this.isprite.setReadOnly(this.readonly)
}}
}
