package {
dynamic class LzCanvas extends LzView {
static var tagname:String = "canvas";static var __LZCSSTagSelectors:Array = ["canvas", "view", "node"];static var attributes = new LzInheritedHash(LzView.attributes);(function ($0, $1) {
LzNode.mergeAttributes({$attributeDescriptor: {fallbacks: {bgcolor: 16777215, fgcolor: 0, fontsize: 11, font: "Verdana,Vera,sans-serif", fontstyle: "plain", height: "100%", width: "100%"}, properties: {bgcolor: "background-color", fgcolor: "color", fontsize: "font-size", font: "font-family", fontstyle: "font-style", height: "height", width: "width"}, types: {bgcolor: "color", fgcolor: "color", fontsize: "number", font: "string", fontstyle: "string", height: "string", width: "string"}}, bgcolor: $0, fgcolor: $0, fontsize: $0, font: $0, fontstyle: $0, height: $0, width: $0}, $1)
})(LzStyleConstraintExpr.StyleConstraintExpr, LzCanvas.attributes);var updatePercentCreatedEnabled:Boolean = true;var _lzinitialsubviews:Array = [];var totalnodes:*;var framerate:Number = 30;var onframerate = LzDeclaredEvent;var creatednodes:*;var __LZproxied;var embedfonts;public var lpsbuild;public var lpsbuilddate;public var appbuilddate;public var runtime;var allowfullscreen;public var fullscreen;var onfullscreen = LzDeclaredEvent;var __LZmouseupDel:LzDelegate;var __LZmousedownDel:LzDelegate;var __LZmousemoveDel:LzDelegate;var __LZDefaultCanvasMenu:LzContextMenu;public var screenorientation = "landscape";var onscreenorientation = LzDeclaredEvent;var httpdataprovider = null;var defaultdataprovider = null;function LzCanvas ($0 = null, $1 = null, $2 = null, $3 = null) {
if (!$1["medialoadtimeout"]) $1.medialoadtimeout = this.medialoadtimeout;
if (!$1["mediaerrortimeout"]) $1.mediaerrortimeout = this.mediaerrortimeout;
var $4 = LzCanvas.attributes.$attributeDescriptor.fallbacks;
if ($1.hasOwnProperty("fontsize")) {
this.fontsize = $4.fontsize = $1.fontsize;
delete $1.fontsize
};
if ($1.hasOwnProperty("fontstyle")) {
this.fontstyle = $4.fontstyle = $1.fontstyle;
delete $1.fontstyle
};
if ($1.hasOwnProperty("font")) {
this.font = $4.font = $1.font;
delete $1.font
};
if ($1.hasOwnProperty("bgcolor")) {
$4.bgcolor = $1.bgcolor;
delete $1.bgcolor
};
if ($1.hasOwnProperty("width")) {
$4.width = $1.width;
delete $1.width
};
if ($1.hasOwnProperty("height")) {
$4.height = $1.height;
delete $1.height
};
super($0, $1, $2, $3);
if (this.fgcolor == null) this.fgcolor = 0;
if (this.fontsize == null) this.fontsize = 11;
this.datasets = {};
this.__LZcheckwidth = null;
this.__LZcheckheight = null;
this.hassetwidth = true;
this.hassetheight = true
}override function construct ($0, args) {
var $2;
$2 = function ($0:String, $1:String):* {
var $2:* = args[$0];
delete args[$0];
if ($2 != null) {
return !(!$2)
} else if ($1 != null) {
var $3:* = lz.Browser.getInitArg($1);
if ($3 != null) {
return $3 == "true"
}};
return void 0
};
this.__makeSprite(null);
var $1 = this.sprite.capabilities;
this.capabilities = $1;
this.immediateparent = this;
this.datapath = new LzDatapath(this);
this.mask = null;
this.accessible = $2("accessible", null);
if ($1.accessibility == true) {
this.sprite.setAccessible(this.accessible);
if (this.accessible) {
this.sprite.setAAActive(true);
this.sprite.setAASilent(false)
}} else if (this.accessible) {
this.accessible = false
};
this.history = $2("history", "history");
if (this.history && $1.history != true) {
this.history = false
};
this.allowfullscreen = $2("allowfullscreen", "allowfullscreen");
if (this.allowfullscreen && $1.allowfullscreen != true) {
this.allowfullscreen = false
};
this.fullscreen = false;
this.viewLevel = 0;
this.totalnodes = 0;
this.creatednodes = 0;
this.percentcreated = 0;
if (!args.framerate) {
args.framerate = 30
};
this.proxied = $2("proxied", "lzproxied");
if (this.proxied == null) {
this.proxied = args.__LZproxied == "true"
};
if (typeof args.proxyurl == "undefined") {
this.proxyurl = lz.Browser.getBaseURL().toString()
};
if (args.focustrap != null) {
if ($1.globalfocustrap != true) {
delete args.focustrap
}};
LzScreenKernel.setCallback(this, "__windowResize");
delete args.width;
delete args.height;
if ($1.allowfullscreen == true) {
LzScreenKernel.setFullscreenCallback(this, "__fullscreenEventCallback", "__fullscreenErrorCallback")
};
this.lpsversion = args.lpsversion + "." + this.__LZlfcversion;
delete args.lpsversion;
this.isinited = false;
this._lzinitialsubviews = [];
this.datasets = {};
global.canvas = this;
this.parent = this;
this.makeMasked();
this.__LZmouseupDel = new LzDelegate(this, "__LZmouseup", lz.GlobalMouse, "onmouseup");
this.__LZmousedownDel = new LzDelegate(this, "__LZmousedown", lz.GlobalMouse, "onmousedown");
this.__LZmousemoveDel = new LzDelegate(this, "__LZmousemove", lz.GlobalMouse, "onmousemove");
this.defaultdataprovider = this.httpdataprovider = new LzHTTPDataProvider();
this.id = lz.Browser.getAppID()
}function __LZmouseup ($0) {
if (this.onmouseup.ready) this.onmouseup.sendEvent()
}function __LZmousemove ($0) {
if (this.onmousemove.ready) this.onmousemove.sendEvent()
}function __LZmousedown ($0) {
if (this.onmousedown.ready) this.onmousedown.sendEvent()
}override function __makeSprite ($0) {
this.sprite = new LzSprite(this, true)
}var onmouseleave = LzDeclaredEvent;var onmouseenter = LzDeclaredEvent;var onpercentcreated = LzDeclaredEvent;var onmousemove = LzDeclaredEvent;var onafterinit = LzDeclaredEvent;var lpsversion;var lpsrelease;var scriptlimits;var __LZlfcversion = "0";var proxied = true;var dataloadtimeout = 30000;var medialoadtimeout = 30000;function $lzc$set_medialoadtimeout ($0) {
if (this.capabilities["medialoading"]) {
LzSprite.setMediaLoadTimeout($0)
}}var mediaerrortimeout = 4500;function $lzc$set_mediaerrortimeout ($0) {
if (this.capabilities["medialoading"]) {
LzSprite.setMediaErrorTimeout($0)
}}var percentcreated;var datasets = null;function compareVersion ($0, $1 = null) {
if ($1 == null) {
$1 = this.lpsversion
};
if ($0 == $1) return 0;
var $2 = $0.split(".");
var $3 = $1.split(".");
var $4 = 0;
while ($4 < $2.length || $4 < $3.length) {
var $5 = Number($2[$4]) || 0;
var $6 = Number($3[$4++]) || 0;
if ($5 < $6) {
return -1
} else if ($5 > $6) {
return 1
}};
return 0
}override function $lzc$set_resource ($0) {}function $lzc$set_focustrap ($0:Boolean) {
lz.Keys.setGlobalFocusTrap($0)
}override function toString () {
return "This is the canvas"
}function $lzc$set_framerate ($0:Number) {
$0 *= 1;
if ($0 < 1) {
$0 = 1
} else if ($0 > 1000) {
$0 = 1000
};
this.framerate = $0;
lz.Idle.setFrameRate($0);
if (this.onframerate.ready) this.onframerate.sendEvent($0)
}function $lzc$set_fullscreen ($0 = true) {
if (this.capabilities.allowfullscreen == true) {
LzScreenKernel.showFullScreen($0)
}}function __fullscreenEventCallback ($0:Boolean, $1):void {
this.fullscreen = $1;
if (this.onfullscreen.ready) this.onfullscreen.sendEvent($0)
}function __fullscreenErrorCallback ($0):void {}function $lzc$set_allowfullscreen ($0:Boolean) {
this.allowfullscreen = $0
}function initDone () {
var $0:Array = [];
var $1:Array = [];
var $2:Array = this._lzinitialsubviews;
for (var $3:int = 0, $4:int = $2.length;$3 < $4;++$3) {
var $5 = $2[$3];
if ($5["attrs"] && $5.attrs["initimmediate"]) {
$0.push($5)
} else {
$1.push($5)
}};
$0.push.apply($0, $1);
this._lzinitialsubviews = [];
lz.Instantiator.requestInstantiation(this, $0)
}override function init () {
this.sprite.init(true);
if (this.history == true) {
lz.History.__start(this.id)
};
if (this.contextmenu == null) {
this.buildDefaultMenu()
}}var deferInit = true;override function __LZinstantiationDone ():void {
this.__LZinstantiated = true;
if (this.deferInit) {
this.deferInit = false;
return
};
this.percentcreated = 1;
this.updatePercentCreatedEnabled = false;
if (this.onpercentcreated.ready) this.onpercentcreated.sendEvent(this.percentcreated);
lz.Instantiator.resume();
this.__LZcallInit()
}function updatePercentCreated () {
this.percentcreated = Math.max(this.percentcreated, this.creatednodes / this.totalnodes);
this.percentcreated = Math.min(0.99, this.percentcreated);
if (this.onpercentcreated.ready) this.onpercentcreated.sendEvent(this.percentcreated)
}function initiatorAddNode ($0, $1) {
this.totalnodes += $1;
this._lzinitialsubviews.push($0)
}override function __LZcallInit ($0 = null) {
if (this.isinited) return;
this.isinited = true;
if (this.__LZresolveDict != null) this.__LZresolveReferences();
var $1 = this.subnodes;
if ($1) {
for (var $2 = 0;$2 < $1.length;) {
var $3 = $1[$2++];
var $4 = $1[$2];
if ($3.isinited || !$3.__LZinstantiated) continue;
$3.__LZcallInit();
if ($4 != $1[$2]) {
while ($2 > 0) {
if ($4 == $1[--$2]) break
}}}};
this.init();
if (this.oninit.ready) this.oninit.sendEvent(this);
if (this.onafterinit.ready) this.onafterinit.sendEvent(this);
if (this.datapath && this.datapath.__LZApplyDataOnInit) {
this.datapath.__LZApplyDataOnInit()
};
this.inited = true;
if (this.oninited.ready) {
this.oninited.sendEvent(true)
}}function isProxied () {
return this.proxied
}override function $lzc$set_width ($0) {
LzSprite.setRootWidth($0)
}override function $lzc$set_x ($0) {
LzSprite.setRootX($0)
}override function $lzc$set_height ($0) {
LzSprite.setRootHeight($0)
}override function $lzc$set_y ($0) {
LzSprite.setRootY($0)
}function setDefaultContextMenu ($0) {
this.$lzc$set_contextmenu($0);
this.sprite.setDefaultContextMenu($0)
}function buildDefaultMenu () {
if (!this.capabilities.customcontextmenu) return;
this.__LZDefaultCanvasMenu = new LzContextMenu();
this.__LZDefaultCanvasMenu.hideBuiltInItems();
var $0:LzContextMenuItem = new LzContextMenuItem("About OpenLaszlo...", new LzDelegate(this, "__LZdefaultMenuItemHandler"));
this.__LZDefaultCanvasMenu.addItem($0);
if (this.proxied) {
var $1:LzContextMenuItem = new LzContextMenuItem("View Source", new LzDelegate(this, "__LZviewSourceMenuItemHandler"));
this.__LZDefaultCanvasMenu.addItem($1)
};
this.setDefaultContextMenu(this.__LZDefaultCanvasMenu)
}function __LZdefaultMenuItemHandler ($0:LzContextMenuItem) {
lz.Browser.loadURL("http://www.openlaszlo.org", "lz_about")
}function __LZviewSourceMenuItemHandler ($0:LzContextMenuItem) {
var $1 = lz.Browser.getBaseURL() + "?lzt=source";
lz.Browser.loadURL($1, "lz_source")
}static function versionInfoString ():String {
return "URL: " + lz.Browser.getLoadURL() + "\n" + "LPS\n" + "  Version: " + canvas.lpsversion + "\n" + "  Release: " + canvas.lpsrelease + "\n" + "  Build: " + canvas.lpsbuild + "\n" + "  Date: " + canvas.lpsbuilddate + "\n" + "Application\n" + "  Date: " + canvas.appbuilddate + "\n" + "Runtime: " + canvas.runtime + "\n" + "Browser/Player\n" + "  Version: " + lz.Browser.getVersion() + "\n" + "OS: " + lz.Browser.getOS()
}function __windowResize ($0) {
if ($0.width !== this.width) {
this.width = $0.width;
if (this.onwidth.ready) this.onwidth.sendEvent(this.width);
this.sprite.setWidth(this.width)
};
if ($0.height !== this.height) {
this.height = $0.height;
if (this.onheight.ready) this.onheight.sendEvent(this.height);
this.sprite.setHeight(this.height)
};
if (this.capabilities.screenorientation) {
if ($0.orientation !== this.screenorientation) {
this.screenorientation = $0.orientation;
if (this.onscreenorientation.ready) this.onscreenorientation.sendEvent(this.orientation)
}}}public function LzInstantiateView ($0, $1 = 1) {
canvas.initiatorAddNode($0, $1)
}public function lzAddLocalData ($0, $1, $2, $3 = false) {
return new LzDataset(canvas, {name: $0, initialdata: $1, trimwhitespace: $2, nsprefix: $3})
}public function __LzLibraryLoaded ($0) {
canvas.initiatorAddNode({attrs: {libname: $0}, "class": LzLibraryCleanup}, 1);
canvas.initDone()
}}
}
