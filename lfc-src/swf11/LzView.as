package {
dynamic class LzView extends LzNode {
function LzView ($0:LzNode? = null, $1:Object? = null, $2:Array? = null, $3:Boolean = false) {
super($0, $1, $2, $3)
}static var tagname:String = "view";static var __LZCSSTagSelectors:Array = ["view", "node"];static var attributes = new LzInheritedHash(LzNode.attributes);var __LZlayout;var __LZstoredbounds;var __movecounter = 0;var __mousecache = null;var playing = false;var _visible;function $lzc$set_visible ($0) {
if (this._visible == $0) return;
this._visible = $0;
if ($0) {
var $1 = "visible"
} else if ($0 == null) {
var $1 = "collapse"
} else {
var $1 = "hidden"
};
this.visibility = $1;
if (this.onvisibility.ready) this.onvisibility.sendEvent(this.visibility);
this.__LZupdateShown()
}var onaddsubview = LzDeclaredEvent;var onblur = LzDeclaredEvent;var onclick = LzDeclaredEvent;var onclickable = LzDeclaredEvent;var onfocus = LzDeclaredEvent;var onframe = LzDeclaredEvent;var onheight = LzDeclaredEvent;var onkeyup = LzDeclaredEvent;var onkeydown = LzDeclaredEvent;var onlastframe = LzDeclaredEvent;var onload = LzDeclaredEvent;var onframesloadratio = LzDeclaredEvent;var onloadratio = LzDeclaredEvent;var onerror = LzDeclaredEvent;var ontimeout = LzDeclaredEvent;var onmousedown = LzDeclaredEvent;var onmouseout = LzDeclaredEvent;var onmouseover = LzDeclaredEvent;var onmousetrackover = LzDeclaredEvent;var onmousetrackup = LzDeclaredEvent;var onmousetrackout = LzDeclaredEvent;var onmouseup = LzDeclaredEvent;var onmousedragin = LzDeclaredEvent;var onmousedragout = LzDeclaredEvent;var onmouseupoutside = LzDeclaredEvent;var ongesture = LzDeclaredEvent;var ontouch = LzDeclaredEvent;var onopacity = LzDeclaredEvent;var onplay = LzDeclaredEvent;var onplaying = LzDeclaredEvent;var onremovesubview = LzDeclaredEvent;var onresource = LzDeclaredEvent;var onresourceheight = LzDeclaredEvent;var onresourcewidth = LzDeclaredEvent;var onrotation = LzDeclaredEvent;var onstop = LzDeclaredEvent;var ontotalframes = LzDeclaredEvent;var onunstretchedheight = LzDeclaredEvent;var onunstretchedwidth = LzDeclaredEvent;var onvisible = LzDeclaredEvent;var onvisibility = LzDeclaredEvent;var onwidth = LzDeclaredEvent;var onx = LzDeclaredEvent;var onxoffset = LzDeclaredEvent;var ony = LzDeclaredEvent;var onyoffset = LzDeclaredEvent;var onfont = LzDeclaredEvent;var onfontsize = LzDeclaredEvent;var onfontstyle = LzDeclaredEvent;var ondblclick = LzDeclaredEvent;var DOUBLE_CLICK_TIME = 500;var onclip = LzDeclaredEvent;var capabilities;override function construct ($0, $1) {
super.construct($0 ? $0 : canvas, $1);
this.mask = this.immediateparent.mask;
this.__makeSprite($1);
this.capabilities = this.sprite.capabilities;
if ($1["width"] != null || this.__LZhasConstraint("width")) {
this.hassetwidth = true;
this.__LZcheckwidth = false
};
if ($1["height"] != null || this.__LZhasConstraint("height")) {
this.hassetheight = true;
this.__LZcheckheight = false
};
if ($1["clip"]) {
this.clip = $1.clip;
this.makeMasked()
};
var $2 = LzNode._ignoreAttribute;
if ($1["stretches"] != null) {
this.$lzc$set_stretches($1.stretches);
$1.stretches = $2
};
if ($1["resource"] != null) {
this.$lzc$set_resource($1.resource);
$1.resource = $2
}}function __spriteAttribute ($0:String, $1) {
if (this[$0]) this.setAttribute($0, $1)
}function __makeSprite ($0) {
this.sprite = new LzSprite(this, false)
}override function init () {
var $0 = this.shadowcolor != null && (this.shadowdistance != 0 || this.shadowblurradius != 0);
if ($0) {
this.sprite.updateShadow(this.shadowcolor, this.shadowdistance, this.shadowangle, this.shadowblurradius)
};
if (this.sprite) {
this.sprite.init(this.visible)
}}function addSubview ($0) {
if ($0.addedToParent) return;
if (this.sprite) {
this.sprite.addChildSprite($0.sprite)
};
if (this.subviews.length == 0) {
this.subviews = []
};
this.subviews.push($0);
$0.addedToParent = true;
if (this.__LZcheckwidth) this.__LZcheckwidthFunction($0);
if (this.__LZcheckheight) this.__LZcheckheightFunction($0);
if (this.onaddsubview.ready) this.onaddsubview.sendEvent($0)
}override function __LZinstantiationDone ():void {
var $0:LzView = this.immediateparent as LzView;
if ($0) {
$0.addSubview(this)
};
super.__LZinstantiationDone()
}var mask;var focusable = false;var focustrap;var clip = false;function $lzc$set_clip ($0:Boolean) {
this.clip = $0;
if ($0) {
this.makeMasked()
} else {
this.removeMask()
};
if (this.onclip.ready) this.onclip.sendEvent(this.clip)
}var align = "left";function $lzc$set_align ($0) {
var $1;
$1 = function ($0) {
switch ($0) {
case "center":
return "__LZalignCenter";;case "right":
return "__LZalignRight";;case "left":
return null
}};
if (this.align == $0) return;
var $2 = $1(this.align);
var $3 = $1($0);
if ($2 != null) {
this.releaseConstraintMethod($2)
};
if ($3 != null) {
this.applyConstraintMethod($3, [this.immediateparent, "width", this, "width"])
} else {
this.$lzc$set_x(0)
};
this.align = $0
}var valign = "top";function $lzc$set_valign ($0) {
var $1;
$1 = function ($0) {
switch ($0) {
case "middle":
return "__LZvalignMiddle";;case "bottom":
return "__LZvalignBottom";;case "top":
return null
}};
if (this.valign == $0) return;
var $2 = $1(this.valign);
var $3 = $1($0);
if ($2 != null) {
this.releaseConstraintMethod($2)
};
if ($3 != null) {
this.applyConstraintMethod($3, [this.immediateparent, "height", this, "height"])
} else {
this.$lzc$set_y(0)
};
this.valign = $0
}var source;function $lzc$set_source ($0) {
this.setSource($0)
}var clickregion;var onclickregion = LzDeclaredEvent;function $lzc$set_clickregion ($0:*) {
if (this.capabilities.clickregion) {
if (this.clickregion !== $0) {
if (!this.clickable) {
this.$lzc$set_clickable(true)
};
this.sprite.setClickRegion($0)
}};
this.clickregion = $0;
if (this.onclickregion.ready) this.onclickregion.sendEvent($0)
}var cursor;var fgcolor = null;var onfgcolor = LzDeclaredEvent;function $lzc$set_fgcolor ($0) {
if ($0 != null && isNaN($0)) {
$0 = lz.Type.acceptTypeValue("color", $0, this, "fgcolor")
};
this.fgcolor = $0;
if (this.onfgcolor.ready) this.onfgcolor.sendEvent($0)
}var font:String;function $lzc$set_font ($0) {
this.font = $0;
if (this.onfont.ready) {
this.onfont.sendEvent(this.font)
}}var fontstyle:String;function $lzc$set_fontstyle ($0) {
if ($0 == "plain" || $0 == "bold" || $0 == "italic" || $0 == "bolditalic" || $0 == "bold italic") {
this.fontstyle = $0;
if (this.onfontstyle.ready) {
this.onfontstyle.sendEvent(this.fontstyle)
}}}var hasdirectionallayout:*;var onhasdirectionallayout:LzDeclaredEventClass = LzDeclaredEvent;function $lzc$set_hasdirectionallayout ($0) {
this.hasdirectionallayout = $0
}var fontsize;function $lzc$set_fontsize ($0) {
if (!($0 <= 0 || isNaN($0))) {
this.fontsize = $0;
if (this.onfontsize.ready) {
this.onfontsize.sendEvent(this.fontsize)
}}}var stretches = "none";function $lzc$set_stretches ($0) {
if (!($0 == "none" || $0 == "both" || $0 == "width" || $0 == "height")) {
var $1 = $0 == null ? "both" : ($0 == "x" ? "width" : ($0 == "y" ? "height" : "none"));
$0 = $1
} else if (this.stretches == $0) {
return
};
if (this.backgroundrepeat != "norepeat") {
this.$lzc$set_backgroundrepeat("norepeat")
};
this.stretches = $0;
this.sprite.stretchResource($0);
if ($0 == "width" || $0 == "both") {
this._setrescwidth = true;
this.__LZcheckwidth = true;
this.reevaluateSize("width")
};
if ($0 == "height" || $0 == "both") {
this._setrescheight = true;
this.__LZcheckheight = true;
this.reevaluateSize("height")
}}var backgroundrepeat = "norepeat";var onbackgroundrepeat = LzDeclaredEvent;function $lzc$set_backgroundrepeat ($0) {
if (!this.capabilities.backgroundrepeat) {
return
} else if ($0 != "repeat" && $0 != "repeat-x" && $0 != "repeat-y" && $0 != "norepeat") {
return
};
if ($0 !== this.backgroundrepeat) {
if ($0 != "norepeat" && this.stretches != "none") {
this.$lzc$set_stretches("none")
};
this.backgroundrepeat = $0;
if ($0 == "norepeat") $0 = null;
this.sprite.setBackgroundRepeat($0)
};
if (this.onbackgroundrepeat.ready) this.onbackgroundrepeat.sendEvent(this.backgroundrepeat)
}var layout;function $lzc$set_layout ($0) {
this.layout = $0;
if (!this.isinited) {
this.__LZstoreAttr($0, "layout");
return
};
var $1 = $0["class"];
if ($1 == null) {
$1 = "simplelayout"
};
if (this.__LZlayout) {
this.__LZlayout.destroy()
};
if ($1 != "none") {
var $2 = {};
for (var $3 in $0) {
if ($3 != "class") {
$2[$3] = $0[$3]
}};
if ($1 == "null") {
this.__LZlayout = null;
return
};
this.__LZlayout = new (lz[$1])(this, $2)
}}var aaactive;function $lzc$set_aaactive ($0) {
if (this.capabilities.accessibility) {
this.aaactive = $0;
this.sprite.setAAActive($0)
}}var aaname;function $lzc$set_aaname ($0) {
if (this.capabilities.accessibility) {
this.aaname = $0;
this.sprite.setAAName($0)
}}var aadescription;function $lzc$set_aadescription ($0) {
if (this.capabilities.accessibility) {
this.aadescription = $0;
this.sprite.setAADescription($0)
}}var aatabindex;function $lzc$set_aatabindex ($0) {
if (this.capabilities.accessibility) {
this.aatabindex = $0;
this.sprite.setAATabIndex($0)
}}var aasilent;function $lzc$set_aasilent ($0) {
if (this.capabilities.accessibility) {
this.aasilent = $0;
this.sprite.setAASilent($0)
}}function sendAAEvent ($0:Number, $1:Number, $2:Boolean = false) {
if (this.capabilities.accessibility) {
this.sprite.sendAAEvent($0, $1, $2)
}}var sprite:LzSprite = null;var visible = true;var visibility = "collapse";function $lzc$set_visibility ($0) {
if (this.visibility == $0) return;
this.visibility = $0;
if (this.onvisibility.ready) this.onvisibility.sendEvent($0);
this.__LZupdateShown()
}var __LZvizO = true;var __LZvizLoad = true;var __LZvizDat:Boolean = true;var opacity = 1;function $lzc$set_opacity ($0) {
if (this.opacity !== $0) {
this.opacity = $0;
if (this.capabilities.opacity) {
this.sprite.setOpacity($0)
};
var $1 = $0 != 0;
if (this.__LZvizO != $1) {
this.__LZvizO = $1;
this.__LZupdateShown()
}};
if (this.onopacity.ready) this.onopacity.sendEvent($0)
}var bgcolor = null;var onbgcolor = LzDeclaredEvent;function $lzc$set_bgcolor ($0) {
if ($0 != null && isNaN($0)) {
$0 = lz.Type.acceptTypeValue("color", $0, this, "bgcolor")
} else if ($0 < 0) {
$0 = null
};
this.sprite.setBGColor($0);
this.bgcolor = $0;
if (this.onbgcolor.ready) this.onbgcolor.sendEvent($0)
}var x = 0;var __set_x_memo:*;function $lzc$set_x ($0) {
this.x = $0;
if (this.__set_x_memo === $0) {
if (this.onx.ready) {
this.onx.sendEvent(this.x)
};
return
};
this.__set_x_memo = $0;
this.__mousecache = null;
if (this.__LZhasoffset) {
if (this.capabilities.rotation) {
$0 -= this.xoffset * this.__LZrcos - this.yoffset * this.__LZrsin
} else {
$0 -= this.xoffset
}};
if (this.pixellock) {
$0 = $0 | 0
};
this.sprite.setX($0);
var $1:LzView = this.immediateparent as LzView;
if ($1.__LZcheckwidth) {
$1.__LZcheckwidthFunction(this)
};
if (this.onx.ready) {
this.onx.sendEvent(this.x)
}}var y = 0;var __set_y_memo:*;function $lzc$set_y ($0) {
this.y = $0;
if (this.__set_y_memo === $0) {
if (this.ony.ready) {
this.ony.sendEvent(this.y)
};
return
};
this.__set_y_memo = $0;
this.__mousecache = null;
if (this.__LZhasoffset) {
if (this.capabilities.rotation) {
$0 -= this.xoffset * this.__LZrsin + this.yoffset * this.__LZrcos
} else {
$0 -= this.yoffset
}};
if (this.pixellock) {
$0 = $0 | 0
};
this.sprite.setY($0);
var $1:LzView = this.immediateparent as LzView;
if ($1.__LZcheckheight) {
$1.__LZcheckheightFunction(this)
};
if (this.ony.ready) {
this.ony.sendEvent(this.y)
}}var rotation = 0;function $lzc$set_rotation ($0) {
if (this.capabilities.rotation) {
this.sprite.setRotation($0)
};
this.rotation = $0;
this.usegetbounds = this.__LZhasoffset || this.rotation != 0 || this.xscale != 1 || this.yscale != 1;
var $1 = Math.PI / 180 * this.rotation;
this.__LZrsin = Math.sin($1);
this.__LZrcos = Math.cos($1);
if (this.onrotation.ready) this.onrotation.sendEvent($0);
if (this.__LZhasoffset) {
this.__set_x_memo = void 0;
this.$lzc$set_x(this.x);
this.__set_y_memo = void 0;
this.$lzc$set_y(this.y)
};
var $2:LzView = this.immediateparent as LzView;
if ($2.__LZcheckwidth) $2.__LZcheckwidthFunction(this);
if ($2.__LZcheckheight) $2.__LZcheckheightFunction(this)
}var width:* = 0;var __set_width_memo:*;function $lzc$set_width ($0) {
if ($0 != null) {
this.hassetwidth = true;
this.width = $0
} else {
this.hassetwidth = false
};
if (this.__set_width_memo === $0) {
if (this.onwidth.ready) {
this.onwidth.sendEvent(this.width)
};
return
};
this.__set_width_memo = $0;
if ($0 == null) {
this.__LZcheckwidth = true;
if (this._setrescwidth) {
this.unstretchedwidth = null
};
this.reevaluateSize("width");
return
};
if (this.pixellock) {
$0 = $0 | 0
};
if (!this._setrescwidth) {
this.__LZcheckwidth = false
};
if (!(this is LzText)) {
this.sprite.setWidth($0)
};
var $1:LzView = this.immediateparent as LzView;
if ($1 && $1.__LZcheckwidth) {
$1.__LZcheckwidthFunction(this)
};
if (this.onwidth.ready) {
this.onwidth.sendEvent(this.width)
}}var height:* = 0;var __set_height_memo:*;function $lzc$set_height ($0) {
if ($0 != null) {
this.hassetheight = true;
this.height = $0
} else {
this.hassetheight = false
};
if (this.__set_height_memo === $0) {
if (this.onheight.ready) {
this.onheight.sendEvent(this.height)
};
return
};
this.__set_height_memo = $0;
if ($0 == null) {
this.__LZcheckheight = true;
if (this._setrescheight) {
this.unstretchedheight = null
};
this.reevaluateSize("height");
return
};
if (this.pixellock) {
$0 = $0 | 0
};
if (!this._setrescheight) {
this.__LZcheckheight = false
};
this.sprite.setHeight($0);
var $1:LzView = this.immediateparent as LzView;
if ($1 && $1.__LZcheckheight) {
$1.__LZcheckheightFunction(this)
};
if (this.onheight.ready) {
this.onheight.sendEvent(this.height)
}}var unstretchedwidth = 0;var unstretchedheight = 0;var subviews = [];var xoffset = 0;function $lzc$set_xoffset ($0) {
this.xoffset = $0;
this.__LZhasoffset = this.xoffset != 0 || this.yoffset != 0 || this.__widthoffset != 0 || this.__heightoffset != 0;
this.usegetbounds = this.__LZhasoffset || this.rotation != 0 || this.xscale != 1 || this.yscale != 1;
this.__set_x_memo = void 0;
this.$lzc$set_x(this.x);
this.__set_y_memo = void 0;
this.$lzc$set_y(this.y);
if (this.onxoffset.ready) this.onxoffset.sendEvent($0)
}var yoffset = 0;function $lzc$set_yoffset ($0) {
this.yoffset = $0;
this.__LZhasoffset = this.xoffset != 0 || this.yoffset != 0 || this.__widthoffset != 0 || this.__heightoffset != 0;
this.usegetbounds = this.__LZhasoffset || this.rotation != 0 || this.xscale != 1 || this.yscale != 1;
this.__set_x_memo = void 0;
this.$lzc$set_x(this.x);
this.__set_y_memo = void 0;
this.$lzc$set_y(this.y);
if (this.onyoffset.ready) this.onyoffset.sendEvent($0)
}var __LZrsin = 0;var __LZrcos = 1;var totalframes = 1;var frame = 1;function $lzc$set_frame ($0) {
this.frame = $0;
this.stop($0);
if (this.onframe.ready) this.onframe.sendEvent($0)
}var framesloadratio = 0;var loadratio = 0;var hassetheight = false;var hassetwidth = false;var addedToParent = null;var masked = false;var pixellock = null;var clickable = false;function $lzc$set_clickable ($0) {
this.sprite.setClickable($0);
this.clickable = $0;
if (this.onclickable.ready) this.onclickable.sendEvent($0)
}var showhandcursor = null;function $lzc$set_showhandcursor ($0) {
this.showhandcursor = $0;
this.sprite.setShowHandCursor($0)
}var resource:String = null;function $lzc$set_resource ($0) {
if ($0 == null || $0 == this._resource) return;
this.resource = this._resource = $0;
this.sprite.setResource($0)
}var resourcewidth:Number = 0;var resourceheight:Number = 0;var __LZcheckwidth = true;var __LZcheckheight = true;var __LZhasoffset = null;var __LZoutlieheight = null;var __LZoutliewidth = null;var _setrescwidth = false;var _setrescheight = false;function searchSubviews ($0, $1) {
var $2 = this.subviews.concat();
while ($2.length > 0) {
var $3 = $2;
$2 = new Array();
for (var $4 = $3.length - 1;$4 >= 0;$4--) {
var $5 = $3[$4];
if ($5[$0] == $1) {
return $5
};
var $6 = $5.subviews;
for (var $7 = $6.length - 1;$7 >= 0;$7--) {
$2.push($6[$7])
}}};
return null
}var layouts = null;var _resource = null;function resourceload ($0) {
if ("resource" in $0) {
this.resource = $0.resource;
if (this.onresource.ready) this.onresource.sendEvent($0.resource)
};
if (this.resourcewidth != $0.width) {
if ("width" in $0) {
this.resourcewidth = $0.width;
if (this.onresourcewidth.ready) this.onresourcewidth.sendEvent($0.width)
};
if (!this.hassetwidth && this.resourcewidth != this.width || this._setrescwidth && this.unstretchedwidth != this.resourcewidth) {
this.updateWidth(this.resourcewidth)
}};
if (this.resourceheight != $0.height) {
if ("height" in $0) {
this.resourceheight = $0.height;
if (this.onresourceheight.ready) this.onresourceheight.sendEvent($0.height)
};
if (!this.hassetheight && this.resourceheight != this.height || this._setrescheight && this.unstretchedheight != this.resourceheight) {
this.updateHeight(this.resourceheight)
}};
if ($0.skiponload != true) {
if (this.onload.ready) this.onload.sendEvent(this)
}}function resourceloaderror ($0 = null) {
this.resourcewidth = 0;
this.resourceheight = 0;
if (this.onresourcewidth.ready) this.onresourcewidth.sendEvent(0);
if (this.onresourceheight.ready) this.onresourceheight.sendEvent(0);
this.reevaluateSize();
if (this.onerror.ready) this.onerror.sendEvent($0)
}function resourceloadtimeout ($0 = null) {
this.resourcewidth = 0;
this.resourceheight = 0;
if (this.onresourcewidth.ready) this.onresourcewidth.sendEvent(0);
if (this.onresourceheight.ready) this.onresourceheight.sendEvent(0);
this.reevaluateSize();
if (this.ontimeout.ready) this.ontimeout.sendEvent($0)
}function resourceevent ($0, $1, $2 = false, $3 = false) {
var $4 = $3 == true || $2 == true || this[$0] != $1;
if ($2 != true) this[$0] = $1;
if ($4) {
var $5 = this["on" + $0];
if ($5.ready) $5.sendEvent($1)
}}override function destroy () {
if (this.__LZdeleted) return;
var $0:LzView = this.immediateparent as LzView;
var $1 = $0 && !$0.__LZdeleted;
if ($1) {
if (this.sprite) this.sprite.predestroy();
if (this.addedToParent) {
var $2 = $0.subviews;
if ($2 != null) {
for (var $3 = $2.length - 1;$3 >= 0;$3--) {
if ($2[$3] == this) {
$2.splice($3, 1);
break
}}}}};
super.destroy();
if (this.sprite) {
this.sprite.destroy($1)
};
if ($1) {
this.$lzc$set_visible(false);
if (this.addedToParent) {
if ($0["__LZoutliewidth"] == this) {
$0.__LZoutliewidth = null
};
if ($0["__LZoutlieheight"] == this) {
$0.__LZoutlieheight = null
};
if ($0.onremovesubview.ready) $0.onremovesubview.sendEvent(this)
}}}function __LZupdateShown () {
if (this.visibility == "collapse") {
var $0 = this.__LZvizO && this.__LZvizDat && this.__LZvizLoad
} else {
var $0 = this.visibility == "visible"
};
if ($0 != this.visible) {
this.visible = $0;
if (this.sprite) {
this.sprite.setVisible($0)
};
var $1:LzView = this.immediateparent as LzView;
if ($1 && $1.__LZcheckwidth) $1.__LZcheckwidthFunction(this);
if ($1 && $1.__LZcheckheight) $1.__LZcheckheightFunction(this);
if (this.onvisible.ready) this.onvisible.sendEvent($0)
}}function __LZalignCenter ($0 = null) {
var $1:LzView = this.immediateparent as LzView;
this.$lzc$set_x($1.width / 2 - this.width / 2)
}function __LZalignRight ($0 = null) {
var $1:LzView = this.immediateparent as LzView;
this.$lzc$set_x($1.width - this.width)
}static var __LZlastmtrix = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];function getBounds () {
var $0 = (this.width + this.__widthoffset) * this.xscale;
var $1 = (this.height + this.__heightoffset) * this.yscale;
var $2 = [-this.xoffset, -this.yoffset, $0 - this.xoffset, -this.yoffset, -this.xoffset, $1 - this.yoffset, $0 - this.xoffset, $1 - this.yoffset, this.rotation, this.x, this.y];
if (this.__LZstoredbounds) {
var $3 = $2.length - 1;
while ($2[$3] == LzView.__LZlastmtrix[$3]) {
if ($3-- == 0) {
return this.__LZstoredbounds
}}};
var $4 = {};
for (var $3 = 0;$3 < 8;$3 += 2) {
var $5 = $2[$3];
var $6 = $2[$3 + 1];
var $7 = $5 * this.__LZrcos - $6 * this.__LZrsin;
var $8 = $5 * this.__LZrsin + $6 * this.__LZrcos;
if ($4.xoffset == null || $4.xoffset > $7) {
$4.xoffset = $7
};
if ($4.yoffset == null || $4.yoffset > $8) {
$4.yoffset = $8
};
if ($4.width == null || $4.width < $7) {
$4.width = $7
};
if ($4.height == null || $4.height < $8) {
$4.height = $8
}};
$4.width -= $4.xoffset;
$4.height -= $4.yoffset;
$4.x = this.x + $4.xoffset;
$4.y = this.y + $4.yoffset;
this.__LZstoredbounds = $4;
LzView.__LZlastmtrix = $2;
return $4
}function $lzc$getBounds_dependencies ($0, $1) {
return [$1, "rotation", $1, "x", $1, "y", $1, "width", $1, "height"]
}function __LZvalignMiddle ($0 = null) {
var $1:LzView = this.immediateparent as LzView;
this.$lzc$set_y($1.height / 2 - this.height / 2)
}function __LZvalignBottom ($0 = null) {
var $1:LzView = this.immediateparent as LzView;
this.$lzc$set_y($1.height - this.height)
}final function setColor ($0) {
this.$lzc$set_fgcolor($0)
}function getColor () {
return this.fgcolor
}function setColorTransform ($0) {
if (this.capabilities.colortransform) {
this.$lzc$set_colortransform({redMultiplier: $0.ra != null ? $0.ra / 100 : 1, redOffset: $0.rb, greenMultiplier: $0.ga != null ? $0.ga / 100 : 1, greenOffset: $0.gb, blueMultiplier: $0.ba != null ? $0.ba / 100 : 1, blueOffset: $0.bb, alphaMultiplier: $0.aa != null ? $0.aa / 100 : 1, alphaOffset: $0.ab})
}}var oncolortransform = LzDeclaredEvent;var colortransform:Object;function $lzc$set_colortransform ($0) {
if (this.capabilities.colortransform) {
if (this.colortransform === $0) {
this.oncolortransform.sendEvent($0);
return
};
if ($0.redMultiplier == null) $0.redMultiplier = 1;
if ($0.redOffset == null) $0.redOffset = 0;
if ($0.greenMultiplier == null) $0.greenMultiplier = 1;
if ($0.greenOffset == null) $0.greenOffset = 0;
if ($0.blueMultiplier == null) $0.blueMultiplier = 1;
if ($0.blueOffset == null) $0.blueOffset = 0;
if ($0.alphaMultiplier == null) $0.alphaMultiplier = 1;
if ($0.alphaOffset == null) $0.alphaOffset = 0;
this.colortransform = $0;
this.sprite.setColorTransform($0);
if (this.oncolortransform.ready) this.oncolortransform.sendEvent($0);
if ($0.redOffset || $0.greenOffset || $0.blueOffset || $0.alphaOffset) {
this.tintcolor = LzColorUtils.rgbatoint($0.redOffset, $0.greenOffset, $0.blueOffset, $0.alphaOffset);
if (this.ontintcolor.ready) this.ontintcolor.sendEvent(this.tintcolor)
}}}function getColorTransform () {
if (this.capabilities.colortransform) {
return this.sprite.getColorTransform()
}}function __LZcheckSize ($0, $1, $2) {
if ($0.addedToParent) {
if ($0.usegetbounds) {
var $3 = $0.getBounds()
} else {
var $3 = $0
};
var $4 = $3[$2] + $3[$1];
var $5 = this["_setresc" + $1] ? this["unstretched" + $1] : this[$1];
if ($4 > $5 && $0.visible) {
this["__LZoutlie" + $1] = $0;
if ($1 == "width") {
this.updateWidth($4)
} else this.updateHeight($4)
} else if (this["__LZoutlie" + $1] == $0 && ($4 < $5 || !$0.visible)) {
this.reevaluateSize($1)
}}}function __LZcheckwidthFunction ($0) {
this.__LZcheckSize($0, "width", "x")
}function __LZcheckheightFunction ($0) {
this.__LZcheckSize($0, "height", "y")
}function measureSize ($0) {
var $1 = this["resource" + $0];
for (var $2 = this.subviews.length - 1;$2 >= 0;$2--) {
var $3 = this.subviews[$2];
if ($3.visible) {
if ($3.usegetbounds) {
var $4 = $3.getBounds()
} else {
var $4 = $3
};
var $5 = $4[$0 == "width" ? "x" : "y"] + $4[$0];
if ($5 > $1) {
$1 = $5
}}};
return $1
}function measureWidth () {
return this.measureSize("width")
}function measureHeight () {
return this.measureSize("height")
}function updateSize ($0, $1) {
if ($0 == "width") {
this.updateWidth($1)
} else this.updateHeight($1)
}function updateWidth ($0) {
if (this._setrescwidth) {
this.unstretchedwidth = $0;
if (this.onunstretchedwidth.ready) this.onunstretchedwidth.sendEvent($0)
};
if (!this.hassetwidth) {
this.width = $0;
this.sprite.setWidth($0);
if (this.onwidth.ready) this.onwidth.sendEvent($0);
var $1:LzView = this.immediateparent as LzView;
if ($1.__LZcheckwidth) $1.__LZcheckwidthFunction(this)
}}function updateHeight ($0) {
if (this._setrescheight) {
this.unstretchedheight = $0;
if (this.onunstretchedheight.ready) this.onunstretchedheight.sendEvent($0)
};
if (!this.hassetheight) {
this.height = $0;
this.sprite.setHeight($0);
if (this.onheight.ready) this.onheight.sendEvent($0);
var $1:LzView = this.immediateparent as LzView;
if ($1.__LZcheckheight) $1.__LZcheckheightFunction(this)
}}function reevaluateSize ($0 = null) {
if ($0 == null) {
var $1 = "height";
this.reevaluateSize("width")
} else {
var $1 = $0
};
if (this["hasset" + $1] && !this["_setresc" + $1]) return;
var $2 = this["_setresc" + $1] ? this["unstretched" + $1] : this[$1];
var $3 = this["resource" + $1] || 0;
this["__LZoutlie" + $1] = this;
for (var $4 = this.subviews.length - 1;$4 >= 0;$4--) {
var $5 = this.subviews[$4];
if ($5.usegetbounds) {
var $6 = $5.getBounds();
var $7 = $6[$1 == "width" ? "x" : "y"] + $6[$1]
} else {
var $7 = $5[$1 == "width" ? "x" : "y"] + $5[$1]
};
if ($5.visible && $7 > $3) {
$3 = $7;
this["__LZoutlie" + $1] = $5
}};
if ($2 != $3) {
if ($1 == "width") {
this.updateWidth($3)
} else this.updateHeight($3)
}}function updateResourceSize () {
this.sprite.updateResourceSize();
this.reevaluateSize()
}function setAttributeRelative ($0:String, $1:LzView):void {
var $2 = this.getLinkage($1);
var $3 = $1[$0];
if ($0 == "x" || $0 == "y") {
$2.update($0);
this.setAttribute($0, ($3 - $2[$0 + "offset"]) / $2[$0 + "scale"])
} else if ($0 == "width" || $0 == "height") {
var $4 = $0 == "width" ? "x" : "y";
$2.update($4);
var $5 = $4 + "scale";
this.setAttribute($0, $3 * $1[$5] / $2[$5] / this[$5])
}}function $lzc$setAttributeRelative_dependencies ($0, $1, $2, $3) {
var $4 = $0.getLinkage($3);
var $5 = 2;
var $6 = [];
if ($2 == "width") {
var $7 = "x"
} else if ($2 == "height") {
var $7 = "y"
} else {
var $7 = $2
};
var $8 = $7 == "x" ? "width" : "height";
while ($5) {
if ($5 == 2) {
var $9 = $4.uplinkArray
} else {
var $9 = $4.downlinkArray
};
$5--;
for (var $a = $9.length - 1;$a >= 0;$a--) {
$6.push($9[$a], $7);
if ($6["_setresc" + $8]) {
$6.push([$9[$a], $8])
}}};
return $6
}function getAttributeRelative ($0:String, $1:LzView) {
if ($1 === this) {
return this[$0]
};
var $2 = this.getLinkage($1);
if ($0 == "x" || $0 == "y") {
$2.update($0);
return this[$0] * $2[$0 + "scale"] + $2[$0 + "offset"]
} else if ($0 == "width" || $0 == "height") {
var $3 = $0 == "width" ? "x" : "y";
$2.update($3);
var $4 = $3 + "scale";
return this[$0] * this[$4] * $2[$4] / $1[$4]
}}function $lzc$getAttributeRelative_dependencies ($0, $1, $2, $3) {
var $4 = $1.getLinkage($3);
var $5 = 2;
var $6 = [$1, $2];
if ($2 == "width") {
var $7 = "x"
} else if ($2 == "height") {
var $7 = "y"
} else {
var $7 = $2
};
var $8 = $7 == "x" ? "width" : "height";
while ($5) {
if ($5 == 2) {
var $9 = $4.uplinkArray
} else {
var $9 = $4.downlinkArray
};
$5--;
for (var $a = $9.length - 1;$a >= 0;$a--) {
var $b = $9[$a];
$6.push($b, $7);
if ($b["_setresc" + $8]) {
$6.push($b, $8)
}}};
return $6
}var __LZviewLinks = null;function getLinkage ($0) {
if (this.__LZviewLinks == null) {
this.__LZviewLinks = new Object()
};
var $1 = $0.getUID();
if (this.__LZviewLinks[$1] == null) {
this.__LZviewLinks[$1] = new LzViewLinkage(this, $0)
};
return this.__LZviewLinks[$1]
}function mouseevent ($0, $1 = null) {
if (this[$0] && this[$0].ready) this[$0].sendEvent($1 || this)
}function getMouse ($0:String = null) {
if (this.__mousecache == null || this.__movecounter !== lz.GlobalMouse.__movecounter) {
this.__movecounter = lz.GlobalMouse.__movecounter;
this.__mousecache = this.sprite.getMouse()
};
if ($0 == null) return this.__mousecache;
return this.__mousecache[$0]
}function $lzc$getMouse_dependencies (...$0) {
return [lz.Idle, "idle"]
}function containsPt ($0, $1) {
var $2 = 0;
var $3 = 0;
var $4 = this;
do {
if (!$4.visible) return false;
if ($4.masked || $4 === this) {
var $5 = $0 - $2;
var $6 = $1 - $3;
if ($5 < 0 || $5 >= $4.width || $6 < 0 || $6 >= $4.height) {
return false
}};
$2 -= $4.x;
$3 -= $4.y;
$4 = $4.immediateparent
} while ($4 !== canvas);
return true
}function bringToFront () {
if (!this.sprite) {
return
};
this.sprite.bringToFront()
}function getDepthList () {
var $0 = this.subviews.concat();
$0.sort(this.__zCompare);
return $0
}function __zCompare ($0, $1) {
var $2 = $0.sprite.getZ();
var $3 = $1.sprite.getZ();
if ($2 < $3) return -1;
if ($2 > $3) return 1;
return 0
}function sendBehind ($0) {
if ($0 === this) return;
return $0 ? this.sprite.sendBehind($0.sprite) : false
}function sendInFrontOf ($0) {
if ($0 === this) return;
return $0 ? this.sprite.sendInFrontOf($0.sprite) : false
}function sendToBack () {
this.sprite.sendToBack()
}function setSource ($0, $1 = null, $2 = null, $3 = null) {
this.sprite.setSource($0, $1, $2, $3)
}function unload () {
this._resource = null;
this.sprite.unload()
}function makeMasked () {
this.sprite.setClip(true);
this.masked = true;
this.mask = this
}function removeMask () {
this.sprite.setClip(false);
this.masked = false;
this.mask = null
}function $lzc$set_cursor ($0) {
this.sprite.setCursor($0)
}function $lzc$set_play ($0:Boolean):void {
this.$lzc$set_playing($0)
}function $lzc$set_playing ($0:Boolean):void {
var $1 = $0 !== this.playing;
if ($1) {
if ($0) {
this.play()
} else {
this.stop()
}}}function getDisplayObject ():* {
return this.sprite.getDisplayObject()
}function play ($0 = null, $1:Boolean = false):void {
this.sprite.play($0, $1)
}function stop ($0 = null, $1:Boolean = false):void {
this.sprite.stop($0, $1)
}function setVolume ($0:Number):void {
if (this.capabilities.audio) {
this.sprite.setVolume($0)
}}function getVolume ():Number {
if (this.capabilities.audio) {
return this.sprite.getVolume()
};
return NaN
}function setPan ($0:Number):void {
if (this.capabilities.audio) {
this.sprite.setPan($0)
}}function getPan ():Number {
if (this.capabilities.audio) {
return this.sprite.getPan()
};
return NaN
}function getZ () {
return this.sprite.getZ()
}function seek ($0:Number):void {
if (this.capabilities.audio) {
if (this.sprite.isaudio) {
this.sprite.seek($0, this.playing);
return
}};
var $1:Number = $0 * canvas.framerate;
if (this.playing) {
this.play($1, true)
} else {
this.stop($1, true)
}}function getCurrentTime ():Number {
if (this.capabilities.audio) {
if (this.sprite.isaudio) {
return this.sprite.getCurrentTime()
}};
return this.frame / canvas.framerate
}function $lzc$getCurrentTime_dependencies ($0, $1):Array {
return [$1, "frame"]
}function getTotalTime ():Number {
if (this.capabilities.audio) {
if (this.sprite.isaudio) {
return this.sprite.getTotalTime()
}};
return this.totalframes / canvas.framerate
}function $lzc$getTotalTime_dependencies ($0, $1):Array {
return [$1, "load"]
}function getID3 ():Object {
if (this.capabilities.audio) {
if (this.sprite.isaudio) {
return this.sprite.getID3()
}};
return null
}function setAccessible ($0) {
if (this.capabilities.accessibility) {
this.sprite.setAccessible($0)
}}function shouldYieldFocus () {
return true
}var blurring = false;function getProxyURL ($0 = null) {
var $1 = this.proxyurl;
if ($1 == null) {
return null
} else if (typeof $1 == "string") {
return $1
} else if (typeof $1 == "function") {
return $1($0)
}}static var __LZproxypolicies = [];function __LZcheckProxyPolicy ($0) {
if (this.__proxypolicy != null) {
return this.__proxypolicy($0)
};
var $1 = LzView.__LZproxypolicies;
for (var $2 = $1.length - 1;$2 >= 0;$2--) {
var $3 = $1[$2]($0);
if ($3 != null) return $3
};
return canvas.proxied
}static function addProxyPolicy ($0) {
LzView.__LZproxypolicies.push($0)
}static function removeProxyPolicy ($0) {
var $1 = LzView.__LZproxypolicies;
for (var $2 = 0;$2 < $1.length;$2++) {
if ($1[$2] == $0) {
LzView.__LZproxypolicies = $1.splice($2, 1);
return true
}};
return false
}function setProxyPolicy ($0) {
this.__proxypolicy = $0
}var __proxypolicy = null;var proxyurl = function ($0:String) {
return canvas.getProxyURL($0)
};function $lzc$set_proxyurl ($0) {
this.proxyurl = $0
}var contextmenu:LzContextMenu = null;function $lzc$set_contextmenu ($0:LzContextMenu):void {
this.contextmenu = $0;
this.sprite.setContextMenu($0)
}static function __warnCapability ($0:String, $1:String = ""):void {}function getNextSelection () {}function getPrevSelection () {}var cachebitmap = false;function $lzc$set_cachebitmap ($0) {
if ($0 != this.cachebitmap) {
this.cachebitmap = $0;
if (this.capabilities.bitmapcaching) {
this.sprite.setBitmapCache($0)
}}}var oncontext = LzDeclaredEvent;var context = null;function $lzc$set_context ($0) {
this.context = $0;
if (this.oncontext.ready) {
this.oncontext.sendEvent($0)
}}function createContext () {
if (this.capabilities["2dcanvas"]) {
this.sprite.setContextCallback(this, "$lzc$set_context");
var $0 = this.sprite.getContext();
if ($0) {
this.setAttribute("context", $0)
}}}function drawshadow () {
if (this.inited && this.height != null) {
this.sprite.setHeight(this.height)
}}var onshadowangle = LzDeclaredEvent;var shadowangle = 0;function $lzc$set_shadowangle ($0) {
if (this.capabilities["dropshadows"]) {
this.shadowangle = $0;
if (this.inited) {
this.sprite.updateShadow(this.shadowcolor, this.shadowdistance, this.shadowangle, this.shadowblurradius)
};
if (this.onshadowangle.ready) {
this.onshadowangle.sendEvent($0)
}}}var onshadowdistance = LzDeclaredEvent;var shadowdistance = 10;function $lzc$set_shadowdistance ($0) {
if (this.capabilities["dropshadows"]) {
if ($0 < 0.01) $0 = 0;
this.shadowdistance = $0;
if (this.inited) {
this.sprite.updateShadow(this.shadowcolor, this.shadowdistance, this.shadowangle, this.shadowblurradius)
};
if (this.onshadowdistance.ready) {
this.onshadowdistance.sendEvent($0)
}}}var onshadowcolor = LzDeclaredEvent;var shadowcolor = null;function $lzc$set_shadowcolor ($0) {
if (this.capabilities["dropshadows"]) {
this.shadowcolor = $0;
if (this.inited) {
this.sprite.updateShadow(this.shadowcolor, this.shadowdistance, this.shadowangle, this.shadowblurradius)
};
if (this.onshadowcolor.ready) {
this.onshadowcolor.sendEvent($0)
}}}var onshadowblurradius = LzDeclaredEvent;var shadowblurradius = 4;function $lzc$set_shadowblurradius ($0) {
if (this.capabilities["dropshadows"]) {
if ($0 < 0.01 && $0 > 0 || $0 > -0.01 && $0 < 0) {
$0 = 0
};
this.shadowblurradius = $0;
if (this.inited) {
this.sprite.updateShadow(this.shadowcolor, this.shadowdistance, this.shadowangle, this.shadowblurradius)
};
if (this.onshadowblurradius.ready) {
this.onshadowblurradius.sendEvent($0)
}}}var ontintcolor = LzDeclaredEvent;var tintcolor = "";function $lzc$set_tintcolor ($0) {
if (this.capabilities.colortransform) {
var $1 = {redMultiplier: 0, greenMultiplier: 0, blueMultiplier: 0, alphaMultiplier: 1};
if ($0 != null && $0 != "") {
if (isNaN($0)) {
var $0 = lz.Type.acceptTypeValue("color", $0, this, "tintcolor")
};
var $2 = LzColorUtils.inttorgba($0);
$1.redOffset = $2[0];
$1.greenOffset = $2[1];
$1.blueOffset = $2[2];
if ($2[3] != null) {
$1.alphaOffset = $2[3]
}};
this.$lzc$set_colortransform($1);
return
};
this.tintcolor = $0;
if (this.ontintcolor.ready) this.ontintcolor.sendEvent($0)
}var oncornerradius = LzDeclaredEvent;var cornerradius = "0";function $lzc$set_cornerradius ($0) {
if (this.capabilities["cornerradius"]) {
if (this.cornerradius !== $0) {
var $1 = String($0).split("/");
if ($1.length == 1) {
$1[1] = $1[0]
};
var $2 = [];
for (var $3 = 0;$3 < 2;$3++) {
var $4 = LzParsedPath.trim(String($1[$3]));
var $5 = $4.split(" ");
var $6 = $5.length;
if ($6 > 4) $6 = 4;
if ($6 == 0) return;
if ($6 <= 1) $5[1] = $5[0];
if ($6 <= 3) $5[3] = $5[1];
if ($6 <= 2) $5[2] = $5[0];
for (var $7 = 0;$7 < 4;$7++) {
$2[$3 * 4 + $7] = parseFloat($5[$7])
}};
this.sprite.setCornerRadius($2)
}};
this.cornerradius = $0;
if (this.oncornerradius.ready) this.oncornerradius.sendEvent($0)
}function isMouseOver () {
var $0 = this.getMouse();
return this.containsPt($0.x, $0.y)
}function $lzc$isMouseOver_dependencies (...$0) {
return [lz.Idle, "idle"]
}function isInFrontOf ($0:LzView) {
if (!$0 || $0.parent !== this.parent) return null;
return this.sprite.getZ() > $0.sprite.getZ()
}function isBehind ($0:LzView) {
if (!$0 || $0.parent !== this.parent) return null;
return this.sprite.getZ() < $0.sprite.getZ()
}var __widthoffset = 0;var __heightoffset = 0;var __xoffset = 0;var __yoffset = 0;var __styleinfo = {};function setCSS ($0:String, $1) {
var $2 = this.__styleinfo[$0];
if (!$2) {
return
};
if (this.capabilities[$2.capability]) {
this.sprite.setCSS($0, $1, $2.isdimension)
};
if ($2.affectsoffset) {
this.__LZhasoffset = this.xoffset != 0 || this.yoffset != 0 || this.__widthoffset != 0 || this.__heightoffset != 0;
this.usegetbounds = this.__LZhasoffset || this.rotation != 0 || this.xscale != 1 || this.yscale != 1;
var $3:LzView = this.immediateparent as LzView;
if ($3.__LZcheckwidth) $3.__LZcheckwidthFunction(this);
if ($3.__LZcheckheight) $3.__LZcheckheightFunction(this)
}}function __LZresolveOtherReferences ($0:Object) {
var $1 = $0["layout"];
if ($1 != null) {
this.$lzc$set_layout($1)
}}var usegetbounds = false;var xscale = 1;var onxscale = LzDeclaredEvent;function $lzc$set_xscale ($0) {
if (this.capabilities.scaling) {
this.xscale = $0;
this.usegetbounds = this.__LZhasoffset || this.rotation != 0 || this.xscale != 1 || this.yscale != 1;
this.sprite.setXScale($0)
};
if (this.onxscale.ready) this.onxscale.sendEvent($0)
}var yscale = 1;var onyscale = LzDeclaredEvent;function $lzc$set_yscale ($0) {
if (this.capabilities.scaling) {
this.yscale = $0;
this.usegetbounds = this.__LZhasoffset || this.rotation != 0 || this.xscale != 1 || this.yscale != 1;
this.sprite.setYScale($0)
};
if (this.onyscale.ready) this.onyscale.sendEvent($0)
}}
}
