package {
dynamic class LzText extends $lzsc$mixin$LzFormatter$LzView {
function LzText ($0:LzNode? = null, $1:Object? = null, $2:Array? = null, $3:Boolean = false) {
super($0, $1, $2, $3)
}static var tagname:String = "text";static var __LZCSSTagSelectors:Array = ["text", "formatter", "view", "node"];static var attributes = new LzInheritedHash(LzView.attributes);LzText.attributes.pixellock = true;LzText.attributes.selectable = false;var selectable:Boolean = false;var onselectable:LzDeclaredEventClass = LzDeclaredEvent;function $lzc$set_selectable ($0:Boolean) {
$0 = !(!$0);
this.selectable = $0;
this.tsprite.setSelectable($0);
if (this.onselectable.ready) this.onselectable.sendEvent($0)
}var direction:String = "ltr";var ondirection:LzDeclaredEventClass = LzDeclaredEvent;function $lzc$set_direction ($0:String) {
this.direction = $0;
if (this.capabilities.directional_layout) {
if (this.hasdirectionallayout) this.tsprite.setDirection($0)
};
if (this.ondirection.ready) this.ondirection.sendEvent($0)
}var antiAliasType = "advanced";function $lzc$set_antiAliasType ($0) {
if (this.capabilities.advancedfonts) {
if ($0 == "normal" || $0 == "advanced") {
this.antiAliasType = $0;
this.tsprite.setAntiAliasType($0)
}}}var gridFit = "pixel";function $lzc$set_gridFit ($0) {
if (this.capabilities.advancedfonts) {
if ($0 == "none" || $0 == "pixel" || $0 == "subpixel") {
this.gridFit = $0;
this.tsprite.setGridFit($0)
}}}var sharpness = 0;function $lzc$set_sharpness ($0) {
if (this.capabilities.advancedfonts) {
if ($0 >= -400 && $0 <= 400) {
this.sharpness = $0;
this.tsprite.setSharpness($0)
}}}var thickness = 0;function $lzc$set_thickness ($0) {
if (this.capabilities.advancedfonts) {
if ($0 >= -200 && $0 <= 200) {
this.thickness = $0;
this.tsprite.setThickness($0)
}}}override function $lzc$set_clip ($0:Boolean) {
super.$lzc$set_clip($0);
if (this.isinited && this.scrollevents && !this.clip) {
this.$lzc$set_scrollevents(false)
}}override function $lzc$set_width ($0) {
this.tsprite.setWidth($0);
super.$lzc$set_width($0);
if (this.scrollwidth < this.width) {
this.scrollwidth = this.width
};
this.updateAttribute("maxhscroll", this.scrollwidth - this.width);
if (!this.hassetheight) {
var $1 = this.tsprite.getTextfieldHeight();
if ($1 > 0 && $1 != this.height) {
this.updateHeight($1)
}}}function getDefaultWidth () {
return 0
}function updateAttribute ($0:String, $1):void {
this[$0] = $1;
var $2:LzDeclaredEventClass = this["on" + $0];
if ($2.ready) {
$2.sendEvent($1)
}}function updateLineAttribute ($0:String, $1):void {
var $2:Number;
if (this.capabilities.linescrolling) {
$2 = this.tsprite.pixelToLineNo($1)
} else {
$2 = Math.ceil($1 / this.lineheight) + 1
};
this.updateAttribute($0, $2)
}var lineheight:Number = 0;function $lzc$set_lineheight ($0:Number):void {}var onlineheight:LzDeclaredEventClass = LzDeclaredEvent;var __scrollEventListeners:Number = 0;var scrollevents:Boolean = false;var __userscrollevents:Boolean = false;function $lzc$set_scrollevents ($0:Boolean):void {
this.__userscrollevents = $0;
if (this.scrollevents !== $0) {
this.__set_scrollevents($0)
}}function __set_scrollevents ($0:Boolean):void {
if (this.scrollevents == $0) return;
this.scrollevents = $0;
this.tsprite.setScrollEvents($0);
if (this.onscrollevents.ready) this.onscrollevents.sendEvent($0)
}var onscrollevents:LzDeclaredEventClass = LzDeclaredEvent;var yscroll:Number = 0;function $lzc$set_yscroll ($0:Number):void {
if ($0 > 0) {
$0 = 0
};
this.tsprite.setYScroll($0);
this.updateAttribute("yscroll", $0);
this.updateLineAttribute("scroll", -$0)
}var onyscroll:LzDeclaredEventClass = LzTextscrollEvent.LzDeclaredTextscrollEvent;var scrollheight:Number = 0;function $lzc$set_scrollheight ($0:Number):void {}var onscrollheight:LzDeclaredEventClass = LzTextscrollEvent.LzDeclaredTextscrollEvent;var xscroll:Number = 0;function $lzc$set_xscroll ($0:Number):void {
if ($0 > 0) {
$0 = 0
};
this.tsprite.setXScroll($0);
this.updateAttribute("xscroll", $0);
this.updateAttribute("hscroll", -$0)
}var onxscroll:LzDeclaredEventClass = LzTextscrollEvent.LzDeclaredTextscrollEvent;var scrollwidth:Number = 0;function $lzc$set_scrollwidth ($0:Number):void {}var onscrollwidth:LzDeclaredEventClass = LzTextscrollEvent.LzDeclaredTextscrollEvent;var scroll:Number = 1;function $lzc$set_scroll ($0:Number):void {
if ($0 < 1 || $0 > this.maxscroll) {
$0 = $0 < 1 ? 1 : this.maxscroll
};
var $1:Number;
if (this.capabilities.linescrolling) {
$1 = this.tsprite.lineNoToPixel($0)
} else {
$1 = ($0 - 1) * this.lineheight
};
this.$lzc$set_yscroll(-$1)
}var onscroll:LzDeclaredEventClass = LzTextscrollEvent.LzDeclaredTextscrollEvent;var maxscroll:Number = 1;function $lzc$set_maxscroll ($0:Number):void {}var onmaxscroll:LzDeclaredEventClass = LzTextscrollEvent.LzDeclaredTextscrollEvent;var hscroll:Number = 0;function $lzc$set_hscroll ($0:Number):void {
if ($0 < 0 || $0 > this.maxhscroll) {
$0 = $0 < 1 ? 1 : this.maxhscroll
};
this.$lzc$set_xscroll(-$0)
}var onhscroll:LzDeclaredEventClass = LzTextscrollEvent.LzDeclaredTextscrollEvent;var maxhscroll:Number = 0;function $lzc$set_maxhscroll ($0:Number):void {}var onmaxhscroll:LzDeclaredEventClass = LzTextscrollEvent.LzDeclaredTextscrollEvent;function scrollevent ($0:String, $1):void {
switch ($0) {
case "scrollTop":
this.updateAttribute("yscroll", -$1);this.updateLineAttribute("scroll", $1);break;;case "scrollLeft":
this.updateAttribute("xscroll", -$1);this.updateAttribute("hscroll", $1);break;;case "scrollHeight":
this.updateAttribute("scrollheight", $1);this.updateLineAttribute("maxscroll", Math.max(0, $1 - this.height));break;;case "scrollWidth":
this.updateAttribute("scrollwidth", $1);this.updateAttribute("maxhscroll", Math.max(0, $1 - this.width));break;;case "lineHeight":
this.updateAttribute("lineheight", $1);if (this.inited) {
this.updateLineAttribute("scroll", -this.yscroll)
}break;;default:

}}var multiline:Boolean = false;function $lzc$set_multiline ($0):void {
$0 = !(!$0);
if ($0 !== this.multiline) {
this.multiline = $0;
this.tsprite.setMultiline($0)
}}var resize:Boolean = true;function $lzc$set_resize ($0:Boolean) {
$0 = !(!$0);
if ($0 !== this.resize) {
this.resize = $0;
this.tsprite.setResize($0)
}}var text:String = "";var ontext:LzDeclaredEventClass = LzDeclaredEvent;function $lzc$set_text ($0:*) {
$0 = String($0);
if ($0 != this.text) {
if (this.visible) this.tsprite.setVisible(this.visible);
if ($0.length > this.maxlength) {
$0 = $0.substring(0, this.maxlength)
};
this.tsprite.setText($0);
this.text = $0;
this.cdata = $0
};
if (this.ontext.ready) this.ontext.sendEvent($0);
if (this.oncdata.ready) this.oncdata.sendEvent($0)
}var cdata:String = "";var oncdata:LzDeclaredEventClass = LzDeclaredEvent;function $lzc$set_cdata ($0:*) {
this.$lzc$set_text($0)
}function _updateSize () {
if (!this.isinited) {
return
};
if (this.width == 0 || this.resize && this.multiline == false) {
var $0 = this.tsprite.getTextWidth();
if ($0 != this.width) {
this.$lzc$set_width($0)
}};
if (!this.hassetheight) {
var $1 = this.tsprite.getTextfieldHeight();
if ($1 > 0 && $1 != this.height) {
this.updateHeight($1)
}}}var ontextlink:LzDeclaredEventClass = LzDeclaredEvent;var maxlength:Number = Infinity;function $lzc$set_maxlength ($0) {
if ($0 == null) {
$0 = Infinity
};
if (this.maxlength === $0) return;
if (isNaN($0)) {
return
};
this.maxlength = $0;
this.tsprite.setMaxLength($0);
if (this.onmaxlength.ready) this.onmaxlength.sendEvent($0)
}var onmaxlength:LzDeclaredEventClass = LzDeclaredEvent;var pattern;function $lzc$set_pattern ($0) {
if ($0 == null || $0 == "") return;
this.pattern = $0;
this.tsprite.setPattern($0);
if (this.onpattern.ready) this.onpattern.sendEvent($0)
}var onpattern:LzDeclaredEventClass = LzDeclaredEvent;override function $lzc$set_fontstyle ($0) {
if ($0 == "plain" || $0 == "bold" || $0 == "italic" || $0 == "bolditalic" || $0 == "bold italic") {
var $1 = this.fontstyle;
super.$lzc$set_fontstyle($0);
if (this.__keepconstraint != true && this["__cascadeDelfontstyle"]) {
this.__cascadeDelfontstyle.unregisterAll();
this.__cascadeDelfontstyle = null
};
if ($1 !== this.fontstyle) {
this.tsprite.setFontStyle($0)
}}}override function $lzc$set_font ($0) {
var $1 = this.font;
super.$lzc$set_font($0);
if (this.__keepconstraint != true && this["__cascadeDelfont"]) {
this.__cascadeDelfont.unregisterAll();
this.__cascadeDelfont = null
};
if ($1 !== this.font) {
this.tsprite.setFontName($0)
}}override function $lzc$set_fontsize ($0) {
if ($0 <= 0 || isNaN($0)) {

} else {
var $1 = this.fontsize;
super.$lzc$set_fontsize($0);
if (this.__keepconstraint != true && this["__cascadeDelfontsize"]) {
this.__cascadeDelfontsize.unregisterAll();
this.__cascadeDelfontsize = null
};
if ($1 !== this.fontsize) {
this.tsprite.setFontSize($0)
}}}override function $lzc$set_fgcolor ($0) {
var $1 = this.fgcolor;
super.$lzc$set_fgcolor($0);
if (this.__keepconstraint != true && this["__cascadeDelfgcolor"]) {
this.__cascadeDelfgcolor.unregisterAll();
this.__cascadeDelfgcolor = null
};
if ($1 !== this.fgcolor) {
this.tsprite.setTextColor(this.fgcolor)
}}var __keepconstraint = false;function $lzc$set_cascadedfontsize ($0) {
this.__keepconstraint = true;
this.$lzc$set_fontsize($0);
this.__keepconstraint = false
}function $lzc$set_cascadedfont ($0) {
this.__keepconstraint = true;
this.$lzc$set_font($0);
this.__keepconstraint = false
}function $lzc$set_cascadedfontstyle ($0) {
this.__keepconstraint = true;
this.$lzc$set_fontstyle($0);
this.__keepconstraint = false
}function $lzc$set_cascadedfgcolor ($0) {
this.__keepconstraint = true;
this.$lzc$set_fgcolor($0);
this.__keepconstraint = false
}function $lzc$set_cascadedhasdirectionallayout ($0) {
this.__keepconstraint = true;
this.$lzc$set_hasdirectionallayout($0);
this.__keepconstraint = false
}var textalign:String = "left";function $lzc$set_textalign ($0:String):void {
$0 = $0 ? $0.toLowerCase() : "left";
if (!($0 == "left" || $0 == "right" || $0 == "center" || $0 == "justify")) {
$0 = "left"
};
this.textalign = $0;
this.tsprite.setTextAlign($0)
}var textindent:Number = 0;function $lzc$set_textindent ($0:Number):void {
if (isNaN($0)) {

} else {
this.textindent = $0;
this.tsprite.setTextIndent($0)
}}var letterspacing:Number = 0;function $lzc$set_letterspacing ($0:Number):void {
if (isNaN($0)) {

} else {
this.letterspacing = $0;
this.tsprite.setLetterSpacing($0)
}}var textdecoration:String = "none";function $lzc$set_textdecoration ($0:String):void {
$0 = $0 ? $0.toLowerCase() : "none";
if (!($0 == "none" || $0 == "underline")) {
$0 = "none"
};
this.textdecoration = $0;
this.tsprite.setTextDecoration($0)
}override function $lzc$set_hasdirectionallayout ($0) {
var $1 = this.hasdirectionallayout;
super.$lzc$set_hasdirectionallayout($0)
}var __cascadeattrs:Object = {font: true, fontsize: true, fontstyle: true, fgcolor: true, hasdirectionallayout: true};override function construct ($0, $1) {
this.hasdirectionallayout = ("hasdirectionallayout" in $1) ? $1.hasdirectionallayout : false;
super.construct($0, $1);
var $2 = {hassetheight: this.hassetheight, height: this.height};
var $3:Array = [];
var $4 = this.__cascadeattrs;
for (var $5:String in $4) {
if ($5 in $1) {
this[$5] = $2[$5] = $1[$5]
} else {
$3.push($5)
}};
if ($3.length > 0) {
var $6:Object = this.searchParentAttrs($3);
for (var $5:String in $6) {
var $7 = $6[$5];
this[$5] = $2[$5] = $7[$5];
this["__cascadeDel" + $5] = new LzDelegate(this, "$lzc$set_cascaded" + $5, $7, "on" + $5)
}};
this.tsprite.__initTextProperties($2);
this.yscroll = 0;
this.xscroll = 0;
this.$lzc$set_resize(("resize" in $1) ? !(!$1.resize) : this.resize);
if ($1["maxlength"] != null) {
this.$lzc$set_maxlength($1.maxlength)
};
this.text = $1["text"] != null ? String($1.text) : "";
if (this.text.length > this.maxlength) {
this.text = this.text.substring(0, this.maxlength)
};
this.$lzc$set_multiline(("multiline" in $1) ? $1.multiline : this.multiline);
this.tsprite.setText(this.text);
if (!this.hassetwidth) {
if (this.multiline) {
$1.width = this.parent.width
} else {
if (this.text != null && this.text != "" && this.text.length > 0) {
$1.width = this.tsprite.getTextWidth()
} else {
$1.width = this.getDefaultWidth()
}}} else {
this.$lzc$set_resize(false)
};
if (this.hassetheight && ("height" in $1)) {
this.$lzc$set_height($1.height)
};
if ($1["pattern"] != null) {
this.$lzc$set_pattern($1.pattern)
};
if (this.capabilities.advancedfonts) {
if (!("antiAliasType" in $1)) {
this.$lzc$set_antiAliasType("advanced")
};
if (!("gridFit" in $1)) {
this.$lzc$set_gridFit("subpixel")
}};
if (LzSprite.quirks && LzSprite.quirks.textlinksneedmouseevents) {
this.ontextlink = LzTextlinkEvent.LzDeclaredTextlinkEvent
}}override function init () {
super.init();
if (this.scrollevents && !this.clip) {};
this._updateSize()
}var tsprite:LzTextSprite;override function __makeSprite ($0) {
var $1 = this.searchParents("hasdirectionallayout");
if ($1 != null) {
this.hasdirectionallayout = $1.hasdirectionallayout
};
this.sprite = this.tsprite = new LzTextSprite(this, $0, this.hasdirectionallayout)
}function addText ($0) {
this.$lzc$set_text(this.text + $0)
}function clearText () {
this.$lzc$set_text("")
}function getTextWidth () {
return this.tsprite.getTextWidth(true)
}function $lzc$getTextWidth_dependencies ($0, $1) {
return [$1, "text"]
}function getTextHeight () {
return this.tsprite.getTextfieldHeight(true)
}function $lzc$getTextHeight_dependencies ($0, $1) {
return [$1, "text"]
}override function applyData ($0) {
if (null == $0) {
this.clearText()
} else {
this.$lzc$set_text($0)
}}function getScroll () {
return this.scroll
}function getMaxScroll () {
return this.maxscroll
}function $lzc$getMaxScroll_dependencies ($0, $1) {
return [$1, "maxscroll"]
}function getBottomScroll () {
return this.scroll + this.height / this.lineheight
}function annotateAAimg ($0) {
if (typeof $0 == "undefined") {
return
};
if ($0.length == 0) {
return
};
var $1 = "";
var $2 = 0;
var $3 = 0;
var $4;
var $5 = "<img ";
while (true) {
$4 = $0.indexOf($5, $2);
if ($4 < 0) {
$1 += $0.substring($2);
break
};
$1 += $0.substring($2, $4 + $5.length);
$2 = $4 + $5.length;
var $6 = {};
$3 = $2 + this.parseImgAttributes($6, $0.substring($2));
$1 += $0.substring($2, $3 + 1);
if ($6["alt"] != null) {
var $7 = $6["alt"];
$1 += "[image " + $7 + "]"
};
$2 = $3 + 1
};
return $1
}function parseImgAttributes ($0, $1) {
var $2;
var $3 = 0;
var $4 = "attrname";
var $5 = "attrval";
var $6 = "whitespace";
var $7 = "whitespace2";
var $8 = $6;
var $9 = $1.length;
var $a;
var $b;
var $c;
for ($2 = 0;$2 < $9;$2++) {
$3 = $2;
var $d = $1.charAt($2);
if ($d == ">") {
break
};
if ($8 == $6) {
if ($d != " ") {
$8 = $4;
$a = $d
}} else if ($8 == $4) {
if ($d == " " || $d == "=") {
$8 = $7
} else {
$a += $d
}} else if ($8 == $7) {
if ($d == " " || $d == "=") {
continue
} else {
$8 = $5;
$c = $d;
$b = ""
}} else if ($8 == $5) {
if ($d != $c) {
$b += $d
} else {
$8 = $6;
$0[$a] = $b
}}};
return $3
}function format ($0:String, ...$1) {
this.$lzc$set_text(this.formatToString.apply(this, ([$0]).concat($1)).toString().toHTML())
}function addFormat ($0:String, ...$1) {
this.$lzc$set_text(this.text + this.formatToString.apply(this, ([$0]).concat($1)).toString().toHTML())
}static var escapeChars = {">": "&gt;", "<": "&lt;"};function escapeText ($0) {
var $1 = $0 == null ? this.text : $0;
var $2;
for (var $3 in LzText.escapeChars) {
while ($1.indexOf($3) > -1) {
$2 = $1.indexOf($3);
$1 = $1.substring(0, $2) + LzText.escapeChars[$3] + $1.substring($2 + 1)
}};
return $1
}function setBorder ($0) {
this.tsprite.setBorder($0)
}function setWordWrap ($0) {
this.tsprite.setWordWrap($0)
}function setEmbedFonts ($0) {
this.tsprite.setEmbedFonts($0)
}function getAntiAliasType () {
if (this.capabilities.advancedfonts) {
return this.antiAliasType
}}function getGridFit () {
if (this.capabilities.advancedfonts) {
return this.gridFit
}}function getSharpness () {
if (this.capabilities.advancedfonts) {
return this.sharpness
}}function getThickness () {
if (this.capabilities.advancedfonts) {
return this.thickness
}}function setSelection ($0, $1 = null) {
if ($1 == null) {
$1 = $0
};
this.tsprite.setSelection($0, $1)
}function getSelectionPosition () {
return this.tsprite.getSelectionPosition()
}function getSelectionSize () {
return this.tsprite.getSelectionSize()
}public function makeTextLink ($0, $1) {
return this.tsprite.makeTextLink($0, $1)
}override function toString () {
return "LzText: " + this.text
}}
}
