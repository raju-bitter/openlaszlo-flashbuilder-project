package {

  import flash.display.AVM1Movie;
  import flash.display.Bitmap;
  import flash.display.BitmapData;
  import flash.display.DisplayObject;
  import flash.display.DisplayObjectContainer;
  import flash.display.Graphics;
  import flash.display.InteractiveObject;
  import flash.display.Loader;
  import flash.display.LoaderInfo;
  import flash.display.MovieClip;
  import flash.display.SimpleButton;
  import flash.display.Shape;
  import flash.display.Sprite;
  import flash.display.SWFVersion;
  import flash.errors.IOError;
  import flash.events.Event;
  import flash.events.ErrorEvent;
  import flash.events.IOErrorEvent;
  import flash.events.MouseEvent;
  import flash.events.ProgressEvent;
  import flash.events.SecurityErrorEvent;
  import flash.geom.ColorTransform;
  import flash.geom.Rectangle;
  import flash.geom.Matrix;
  import flash.geom.Point;
  import flash.media.Sound;
  import flash.media.SoundChannel;
  import flash.media.SoundMixer;
  import flash.media.SoundTransform;
  import flash.media.SoundLoaderContext;
  import flash.media.ID3Info;
  import flash.net.URLRequest;
  import flash.system.LoaderContext;
  import flash.system.Capabilities;
  import flash.text.TextField;
  import flash.ui.ContextMenu;
  import flash.filters.DropShadowFilter;
public class LzSprite extends Sprite {
public var owner:* = null;public var bgcolor:* = null;public var lzwidth:Number = 0;public var lzheight:Number = 0;public var opacity:Number = 1;public var playing:Boolean = false;public var clickable:Boolean = false;public var clickbutton:SimpleButton = null;public var clickregion:Sprite = null;public var clickregionwidth:Number;public var clickregionheight:Number;public var masksprite:Shape = null;public var resource:String = null;public var clip:Boolean = false;public var resourcewidth:Number = 0;public var resourceheight:Number = 0;public var isroot:Boolean = false;public static var rootSprite:LzSprite = null;public static var emptySprite:Sprite = new Sprite();public var showhandcursor:* = null;public var fontsize:Number = 11;public var fontstyle:String = "plain";public var fontname:String = "Verdana";var resourceContainer:DisplayObject = null;var resourceCache:Array = null;static var loaderContext:LoaderContext = new LoaderContext(true);static var soundLoaderContext:SoundLoaderContext = new SoundLoaderContext(1000, true);static var MP3_FPS:Number = 30;var sound:Sound = null;var soundChannel:SoundChannel = null;var soundLoading:Boolean = false;public var _setrescwidth:Boolean = false;public var _setrescheight:Boolean = false;private var __mousedown:Boolean = false;private var __isinternalresource:* = null;private var __mouseoverInFront:LzSprite = null;static var capabilities:* = {rotation: true, scalecanvastopercentage: false, readcanvassizefromsprite: false, opacity: true, advancedfonts: true, colortransform: true, audio: true, accessibility: false, htmlinputtext: true, bitmapcaching: true, persistence: true, clickmasking: false, history: true, runtimemenus: true, setclipboard: true, proxypolicy: true, linescrolling: true, allowfullscreen: true, setid: false, globalfocustrap: false, "2dcanvas": true, dropshadows: true, cornerradius: true, css2boxmodel: true, medialoading: true, backgroundrepeat: true, clickregion: true, directional_layout: true, scaling: true, customcontextmenu: true};var capabilities = LzSprite.capabilities;static var id:String;static var medialoadtimeout:Number = 30000;static var mediaerrortimeout:Number = 4500;public function LzSprite ($0:LzView = null, $1:Object = null) {
this.owner = $0;
if (owner == null) return;
if ($1) {
this.isroot = true;
LzSprite.rootSprite = this;
this.mouseEnabled = true;
id = LFCApplication.stage.loaderInfo.parameters["id"];
LzSprite.__updateCapabilities()
} else {
this.mouseEnabled = true;
this.mouseChildren = false;
this.hitArea = LzSprite.emptySprite
};
addEventListener(Event.ADDED_TO_STAGE, addedToStage);
addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage)
}private var _dirty:Boolean = true;protected function set dirty ($0:Boolean):void {
if (_dirty != $0) {
_dirty = $0;
if (_dirty) {
if (stage != null) {
stage.addEventListener(Event.RENDER, stageRender);
stage.invalidate()
}} else {
if (stage != null) {
stage.removeEventListener(Event.RENDER, stageRender)
}}}}protected function get dirty ():Boolean {
return _dirty
}protected function addedToStage ($0:Event):void {
if (dirty) {
stage.addEventListener(Event.RENDER, stageRender);
stage.invalidate()
}}protected function removedFromStage ($0:Event):void {
if (dirty) {
stage.removeEventListener(Event.RENDER, stageRender)
}}protected function stageRender ($0:Event):void {
if (dirty) {
redraw();
dirty = false
}}public function forceRedraw ():void {
this.stageRender(null);
for (var $0:int = 0;$0 < numChildren;$0++) {
var $1:DisplayObject = getChildAt($0);
if ($1 is LzSprite) {
($1 as LzSprite).forceRedraw()
}}}public function dispose ():void {
removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
if (stage != null) {
stage.removeEventListener(Event.RENDER, stageRender)
}}public static function setRootX ($0) {
LzBrowserKernel.callJSInternal("lz.embed.__swfSetAppAppendDivStyle", null, id, "position", "absolute");
LzBrowserKernel.callJSInternal("lz.embed.__swfSetAppAppendDivStyle", null, id, "left", LzKernelUtils.CSSDimension($0))
}public static function setRootWidth ($0) {
LzBrowserKernel.callJSInternal("lz.embed.__swfSetAppAppendDivStyle", null, id, "width", LzKernelUtils.CSSDimension($0))
}public static function setRootY ($0) {
LzBrowserKernel.callJSInternal("lz.embed.__swfSetAppAppendDivStyle", null, id, "position", "absolute");
LzBrowserKernel.callJSInternal("lz.embed.__swfSetAppAppendDivStyle", null, id, "top", LzKernelUtils.CSSDimension($0))
}public static function setRootHeight ($0) {
LzBrowserKernel.callJSInternal("lz.embed.__swfSetAppAppendDivStyle", null, id, "height", LzKernelUtils.CSSDimension($0))
}public var initted = false;public function init ($0:Boolean = true):void {
updateBorderShape();
this.setVisible($0);
this.redraw();
if (this.isroot) {
this.setWidth(LFCApplication.stage.stageWidth);
this.setHeight(LFCApplication.stage.stageHeight);
if (DojoExternalInterface.available) {
DojoExternalInterface.addCallback("getCanvasAttribute", lz.History, lz.History.getCanvasAttribute);
DojoExternalInterface.addCallback("setCanvasAttribute", lz.History, lz.History.setCanvasAttribute);
DojoExternalInterface.addCallback("callMethod", lz.History, lz.History.callMethod);
DojoExternalInterface.addCallback("receiveHistory", lz.History, lz.History.receiveHistory);
DojoExternalInterface.loaded()
}};
this.initted = true
}public function addChildSprite ($0:LzSprite):void {
addChild($0);
this.mouseChildren = true
}public function predestroy ():void {}private var __repeatbitmap:BitmapData = null;private function redraw ():void {
var $0:Graphics = graphics;
$0.clear();
if (__bgcolorhidden && clickable != true && __isinternalresource) {
if (__bgshape == null) {
__bgshape = new Shape();
addChildAt(__bgshape, 0)
};
$0 = __bgshape.graphics;
$0.clear()
} else if (__bgshape != null) {
removeChild(__bgshape);
__bgshape = null
};
var $1:Number = __bgcolorhidden ? 0 : 1;
if (__repeatbitmap) __repeatbitmap.dispose();
if (backgroundrepeat && resourcewidth && resourceheight) {
var $2 = copyBitmap(this, resourcewidth, resourceheight);
if ($2) {
$0.beginBitmapFill($2);
var $3 = borderheight - (borderTopWidth + borderBottomWidth);
if (!repeaty && resourceheight < $3) {
$3 = resourceheight
};
var $4 = borderwidth - (borderLeftWidth + borderRightWidth);
if (!repeatx && resourcewidth < $4) {
$4 = resourcewidth
};
this.drawRoundRect($0, borderx + borderLeftWidth, bordery + borderTopWidth, $4, $3);
$0.endFill();
__repeatbitmap = $2
}};
if (bgcolor != null) {
$0.beginFill(bgcolor, $1);
drawBackgroundRect($0);
$0.endFill()
};
if (bordershape || shadowshape) {
drawBorder()
};
if (masksprite) {
drawMask()
}}public function drawMask ():void {
if (masksprite) {
var $0:Graphics = masksprite.graphics;
$0.clear();
$0.beginFill(16777215, 0);
drawBackgroundRect($0);
$0.endFill()
}}private function drawBackgroundRect ($0:Graphics):void {
this.drawRoundRect($0, borderx + borderLeftWidth, bordery + borderTopWidth, borderwidth - (borderLeftWidth + borderRightWidth), borderheight - (borderTopWidth + borderBottomWidth))
}var shadowfilter:DropShadowFilter = null;private function drawBorder ():void {
if (bordershape) {
bordershape.transform.matrix = transform.matrix;
var $0:Graphics = bordershape.graphics;
$0.clear();
if (borderColor != null && (borderTopWidth || borderRightWidth || borderBottomWidth || borderLeftWidth)) {
var $1 = LzColorUtils;
var $2 = $1.coloralphafrominternal($1.internalfromcss(borderColor));
$0.beginFill($2[0], $2[1]);
this.drawRoundRect($0, borderx, bordery, borderwidth, borderheight);
drawBackgroundRect($0);
$0.endFill()
}};
if (shadowshape && shadowcolor !== null && shadowblurradius) {
if (shadowfilter == null) {
shadowfilter = new DropShadowFilter();
shadowfilter.knockout = true;
shadowfilter.quality = flash.filters.BitmapFilterQuality.HIGH
};
if (shadowblurradius < 0) {
shadowfilter.blurX = shadowfilter.blurY = -shadowblurradius;
shadowfilter.inner = true
} else {
shadowfilter.blurX = shadowfilter.blurY = shadowblurradius;
shadowfilter.inner = false
};
var $3 = shadowangle * Math.PI / 180;
var $4:Point = localToGlobal(Point.polar(shadowdistance, $3));
$4 = $4.subtract(localToGlobal(new Point(0, 0)));
shadowfilter.angle = Math.atan2($4.y, $4.x) / Math.PI * 180;
shadowfilter.distance = $4.length;
var $2 = LzColorUtils.coloralphafrominternal(shadowcolor);
shadowfilter.color = $2[0];
shadowfilter.alpha = $2[1];
shadowshape.filters = [shadowfilter];
var $0:Graphics = shadowshape.graphics;
$0.clear();
$0.beginFill(16711680, 1);
if (shadowblurradius < 0) {
drawBackgroundRect($0)
} else {
shadowshape.transform.matrix = transform.matrix;
this.drawRoundRect($0, borderx, bordery, borderwidth, borderheight)
};
$0.endFill()
}}private var _frame:int = 1;

    public function set frame (fr:int) :void {
        this._frame = fr;
        if (this.owner) {
            this.owner.resourceevent('frame', fr);
        }
    }

    public function get frame () :int {
        return this._frame;
    }

    private var _totalframes:int = 1;

    public function set totalframes (tfr:int) :void {
        this._totalframes = tfr;
        if (this.owner) {
            this.owner.resourceevent('totalframes', tfr);
        }
    }

    public function get totalframes () :int {
        return this._totalframes;
    }

;public function setResource ($0:String):void {
if (this.resource == $0) return;
if ($0.indexOf("http:") == 0 || $0.indexOf("https:") == 0) {
this.setSource($0);
return
};
var $1:Object = LzResourceLibrary[$0];
if (!$1) {
return
};
if (LzAsset.isBitmapAsset($0) || LzAsset.isMovieClipAsset($0) || LzAsset.isMovieClipLoaderAsset($0)) {
if (imgLoader) {
this.unload()
} else if (this.isaudio) {
this.unloadSound()
} else {
this.resourceCache = null
};
this.resourcewidth = Math.round($1.width);
this.resourceheight = Math.round($1.height);
this.totalframes = $1.frames.length;
this.__isinternalresource = true;
this.resource = $0;
this.stop(1);
sendResourceLoad(true)
} else if (LzAsset.isSoundAsset($0)) {
this.unload();
this.__isinternalresource = true;
this.resource = $0;
this.sound = new ($1["assetclass"])() as Sound;
this.totalframes = Math.floor(this.getTotalTime() * MP3_FPS);
this.startSoundPlay();
this.sendResourceLoad(true)
}}public var imgLoader:Loader;public var loaderMC:MovieClip;private var IMGDEPTH:int = 0;private static var MIME_SWF:String = "application/x-shockwave-flash";public function setSource ($0:String, $1:String = null, $2:String = null, $3:String = null):void {
if ($0 == null || $0 == "null") {
return
};
var $4:String = getLoadURL($0, $1, $2);
if (getFileType($0, $3) == "mp3") {
this.unload();
this.__isinternalresource = false;
this.resource = $0;
this.loadSound($4)
} else {
if (this.isaudio) {
this.unloadSound()
};
if (!imgLoader) {
if (this.resourceContainer) {
this.unload()
};
imgLoader = new Loader();
imgLoader.mouseEnabled = false;
imgLoader.mouseChildren = false;
this.resourceContainer = imgLoader;
this.addChildAt(imgLoader, IMGDEPTH);
this.attachLoaderEvents(imgLoader.contentLoaderInfo)
};
this.__isinternalresource = false;
this.resource = $0;
var $5:Loader = this.imgLoader;
if ($5) {
$5.scaleX = $5.scaleY = 1
};
imgLoader.load(new URLRequest($4), LzSprite.loaderContext)
}}private function getLoadURL ($0:String, $1:String, $2:String):String {
var $3:String = $0;
var $4:* = this.owner.__LZcheckProxyPolicy($0);
if ($4) {
var $5:String = this.owner.getProxyURL($0);
var $6:Object = {serverproxyargs: {}, timeout: LzSprite.medialoadtimeout, proxyurl: $5, url: $0, httpmethod: "GET", service: "media"};
if ($2 != null) {
$6.headers = $2
};
if ($1 == "none") {
$6.cache = false;
$6.ccache = false
} else if ($1 == "clientonly") {
$6.cache = false;
$6.ccache = true
} else if ($1 == "serveronly") {
$6.cache = true;
$6.ccache = false
} else {
$6.cache = true;
$6.ccache = true
};
$3 = lz.Browser.makeProxiedURL($6)
} else {
if ($3.indexOf("http:") == 0 && $3.indexOf("http://") != 0) $3 = $3.substring(5)
};
return $3
}private function getFileType ($0:String, $1:String):String {
if ($1 != null) {
return $1.toLowerCase()
} else {
var $2 = new (lz.URL)($0);
var $3 = $2.file;
var $4:int = $3.lastIndexOf(".");
return $4 != -1 ? $3.substring($4 + 1).toLowerCase() : null
}}private function attachLoaderEvents ($0:LoaderInfo):void {
$0.addEventListener(ProgressEvent.PROGRESS, loaderEventHandler);
$0.addEventListener(Event.OPEN, loaderEventHandler);
$0.addEventListener(Event.COMPLETE, loaderEventHandler);
$0.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loaderEventHandler);
$0.addEventListener(IOErrorEvent.IO_ERROR, loaderEventHandler)
}public function loaderEventHandler ($0:Event):void {
try {
this.resourcewidth = 0;
this.resourceheight = 0;
if ($0.type == Event.COMPLETE) {
if (this.loaderMC) {
this.loaderMC.removeEventListener(Event.ENTER_FRAME, updateFrames);
this.loaderMC = null
};
var $1:LoaderInfo = $0.target as LoaderInfo;
try {
var $2:DisplayObject = $1.content;
if ($2 is AVM1Movie) {

} else if ($2 is MovieClip) {
this.loaderMC = MovieClip($2);
this.totalframes = this.loaderMC.totalFrames;
this.loaderMC.addEventListener(Event.ENTER_FRAME, updateFrames);
this.owner.resourceevent("play", null, true);
this.playing = true;
this.owner.resourceevent("playing", true)
} else if ($2 is Bitmap) {
($2 as Bitmap).smoothing = true
}}
catch ($3:SecurityError) {};
try {
var $4:DisplayObject = this.resourceContainer;
var $5:Number = $4.scaleX;
var $6:Number = $4.scaleY;
$4.scaleX = 1;
$4.scaleY = 1;
this.resourcewidth = this.resourceContainer.width;
this.resourceheight = this.resourceContainer.height;
$4.scaleX = $5;
$4.scaleY = $6
}
catch ($3:Error) {};
this.applyStretchResource();
sendResourceLoad();
this.owner.resourceevent("loadratio", 1)
} else if ($0.type == IOErrorEvent.IO_ERROR || $0.type == SecurityErrorEvent.SECURITY_ERROR) {
if (this.owner != null) {
this.owner.resourceloaderror(($0 as ErrorEvent).text)
}} else if ($0.type == ProgressEvent.PROGRESS) {
var $7:ProgressEvent = $0 as ProgressEvent;
var $8:Number = $7.bytesLoaded / $7.bytesTotal;
if (!isNaN($8)) {
this.owner.resourceevent("loadratio", $8)
};
if (LzSprite.quirks.loaderinfoavailable) {
try {
var $1:LoaderInfo = $0.target as LoaderInfo;
var $2:DisplayObject = $1.content;
if ($2 is MovieClip) {
var $9 = MovieClip($2);
if ($9) {
var $a = $9.totalFrames;
if (this.totalframes != $a) {
this.totalframes = $a
};
this.owner.resourceevent("framesloadratio", $9.framesLoaded / $a)
}}}
catch ($3:SecurityError) {}}} else if ($0.type == Event.OPEN) {
this.owner.resourceevent("loadratio", 0)
} else if ($0.type == Event.UNLOAD) {}}
catch ($3:Error) {};
dirty = true
}private function updateFrames ($0:Event):void {
this.frame = this.loaderMC.currentFrame;
if (this.frame == this.totalframes) {
this.owner.resourceevent("lastframe", null, true)
}}
    /**
      * <code>true</code> if a sound is attached to this sprite.
      */
    public function get isaudio () :Boolean {
        return this.sound != null;
    }
;private function loadSound ($0:String):void {
this.sound = new Sound();
this.sound.addEventListener(Event.OPEN, soundLoadHandler);
this.sound.addEventListener(Event.COMPLETE, soundLoadHandler);
this.sound.addEventListener(ProgressEvent.PROGRESS, soundLoadHandler);
this.sound.addEventListener(IOErrorEvent.IO_ERROR, soundLoadHandler);
this.soundLoading = true;
this.sound.load(new URLRequest($0), LzSprite.soundLoaderContext);
this.startSoundPlay()
}private function unloadSound ():void {
if (this.playing) {
this.stopSoundPlay()
};
if (this.sound) {
if (this.soundLoading) {
try {
this.sound.close()
}
catch ($0:IOError) {};
this.soundLoading = false
};
this.sound = null
}}private function startSoundPlay ($0:Number = 0, $1:Boolean = true):void {
var $2:Number = ($1 ? $0 / MP3_FPS : $0) * 1000;
this.playing = true;
this.owner.resourceevent("playing", true);
this.soundChannel = this.sound.play($2, 0, this.soundTransform);
this.addEventListener(Event.ENTER_FRAME, soundFrameHandler);
this.soundChannel.addEventListener(Event.SOUND_COMPLETE, soundCompleteHandler)
}private function stopSoundPlay ():Number {
var $0:Number = Math.floor(this.soundChannel.position * 0.0010 * MP3_FPS);
this.playing = false;
this.owner.resourceevent("playing", false);
this.removeEventListener(Event.ENTER_FRAME, soundFrameHandler);
this.soundChannel.stop();
this.soundChannel = null;
return $0
}private function updateSoundPlay ($0:Boolean, $1:*, $2:Boolean):void {
var $3:Number;
if (this.playing) {
$3 = this.stopSoundPlay()
} else {
$3 = this.frame
};
if ($1 != null) {
$1 += $2 ? $3 : 0
} else if ($0) {
$1 = $3 >= this.totalframes ? 0 : $3
} else {
$1 = $3
};
if ($0) {
this.startSoundPlay($1)
} else {
this.frame = $1
}}private function soundLoadHandler ($0:Event):void {
try {
if ($0.type == Event.OPEN) {
this.soundLoading = true;
this.owner.resourceevent("loadratio", 0);
this.owner.resourceevent("framesloadratio", 0)
} else if ($0.type == Event.COMPLETE) {
this.soundLoading = false;
this.owner.resourceevent("loadratio", 1);
this.owner.resourceevent("framesloadratio", 1);
this.totalframes = Math.floor(this.getTotalTime() * MP3_FPS);
this.sendResourceLoad()
} else if ($0.type == ProgressEvent.PROGRESS) {
var $1:ProgressEvent = $0 as ProgressEvent;
var $2:Number = $1.bytesLoaded / $1.bytesTotal;
if (!isNaN($2)) {
this.owner.resourceevent("loadratio", $2);
this.owner.resourceevent("framesloadratio", $2)
}} else if ($0.type == IOErrorEvent.IO_ERROR) {
this.soundLoading = false;
this.owner.resourceevent("loadratio", 0);
this.owner.resourceevent("framesloadratio", 0);
this.owner.resourceloaderror(($0 as IOErrorEvent).text)
}}
catch ($3:Error) {}}private function soundFrameHandler ($0:Event):void {
this.frame = Math.floor(this.soundChannel.position * 0.0010 * MP3_FPS);
this.totalframes = Math.floor(this.getTotalTime() * MP3_FPS)
}private function soundCompleteHandler ($0:Event):void {
if (this.playing) {
this.stopSoundPlay();
this.frame = this.totalframes;
this.owner.resourceevent("lastframe", null, true)
}}public function attachMouseEvents ($0:DisplayObject):void {
$0.addEventListener(MouseEvent.CLICK, __mouseEvent, false);
$0.addEventListener(MouseEvent.DOUBLE_CLICK, handleMouse_DOUBLE_CLICK, false);
$0.addEventListener(MouseEvent.MOUSE_DOWN, __mouseEvent, false);
$0.addEventListener(MouseEvent.MOUSE_UP, __mouseEvent, false);
$0.addEventListener(MouseEvent.MOUSE_OVER, __mouseEvent, false);
$0.addEventListener(MouseEvent.MOUSE_OUT, __mouseEvent, false)
}public function removeMouseEvents ($0:DisplayObject):void {
$0.removeEventListener(MouseEvent.CLICK, __mouseEvent, false);
$0.removeEventListener(MouseEvent.DOUBLE_CLICK, handleMouse_DOUBLE_CLICK, false);
$0.removeEventListener(MouseEvent.MOUSE_DOWN, __mouseEvent, false);
$0.removeEventListener(MouseEvent.MOUSE_UP, __mouseEvent, false);
$0.removeEventListener(MouseEvent.MOUSE_OVER, __mouseEvent, false);
$0.removeEventListener(MouseEvent.MOUSE_OUT, __mouseEvent, false)
}public function handleMouse_DOUBLE_CLICK ($0:MouseEvent):void {
LzMouseKernel.handleMouseEvent(owner, "ondblclick");
$0.stopPropagation()
}public function setGlobalHandCursor ($0:Boolean):void {
this.useHandCursor = $0;
for (var $1:int = 0;$1 < numChildren;$1++) {
var $2:DisplayObject = getChildAt($1);
if ($2 is SimpleButton) {
var $3:SimpleButton = $2 as SimpleButton;
if ($0 == true) {
var $4:LzSprite = $3.parent as LzSprite;
$3.useHandCursor = $4.showhandcursor == null ? LzMouseKernel.showhandcursor : $4.showhandcursor
} else {
$3.useHandCursor = false
}};
if ($2 is LzSprite) {
($2 as LzSprite).setGlobalHandCursor($0)
}}}public function __globalmouseup ($0:MouseEvent):void {
if (this.__mousedown) {
var $1:LzSprite = null;
if (this.__mouseoverInFront != null) {
$1 = this.__mouseoverInFront;
this.__mouseoverInFront = null
};
this.__mouseEvent($0);
this.__mouseEvent(new MouseEvent("mouseupoutside"));
if ($1 != null) {
LzMouseKernel.handleMouseEvent($1.owner, "onmouseover")
}};
LzMouseKernel.__lastMouseDown = null
}public function __mouseEvent ($0:MouseEvent):void {
var $1:Boolean = false;
var $2:Boolean = true;
var $3:String = "on" + $0.type.toLowerCase();
if (LzMouseKernel.__inContextMenu > 0 || LzSprite.quirks.ignoreextramenuevents && LzMouseKernel.ignoreMouseEvent($3, $0)) {
$2 = true;
$1 = true
} else if ($3 == "onmousedown") {
LzMouseKernel.__lastMouseDown = this;
this.__mousedown = true
} else if ($3 == "onmouseup") {
if (LzMouseKernel.__lastMouseDown === this) {
LzMouseKernel.__lastMouseDown = null;
this.__mousedown = false
} else {
$1 = true;
$2 = false
}} else if ($3 == "onmouseupoutside") {
this.__mousedown = false
} else if ($3 == "onmouseout" && LzSprite.quirks.ignoreextramenuevents && LzMouseKernel.__inContextMenu > 0) {
$2 = true;
$1 = true
} else if ($3 == "onmouseout" || $3 == "onmouseover") {
if (cursorResource != null) {
if ($3 == "onmouseover") {
cursorGotMouseover($0)
} else {
cursorGotMouseout($0)
}};
var $4:InteractiveObject = $0.relatedObject;
if ($4 is TextField && $4.parent is LzTextSprite) {
var $5:LzTextSprite = LzTextSprite($4.parent);
if ($5.forwardsMouse) {
var $6:DisplayObject = $5.getNextMouseObject($0);
if ($6 === this) {
$1 = true
}}}};
if ($2) $0.stopPropagation();
if ($1 == true || !this.owner.mouseevent) return;
if (LzMouseKernel.__lastMouseDown && ($3 == "onmouseover" || $3 == "onmouseout")) {
if (LzMouseKernel.__lastMouseDown === this) {
LzMouseKernel.handleMouseEvent(this.owner, $3);
var $7:String = $3 == "onmouseover" ? "onmousedragin" : "onmousedragout";
LzMouseKernel.handleMouseEvent(this.owner, $7)
} else {
if ($3 == "onmouseover") {
LzMouseKernel.__lastMouseDown.__mouseoverInFront = this
} else {
LzMouseKernel.__lastMouseDown.__mouseoverInFront = null
}}} else {
LzMouseKernel.handleMouseEvent(this.owner, $3)
};
if (this.clickable && this.clickbutton) {
this.clickbutton.useHandCursor = showhandcursor == null ? LzMouseKernel.showhandcursor : showhandcursor
}}public function setClickable ($0:Boolean):void {
if (this.clickable == $0) return;
this.clickable = $0;
this.buttonMode = $0;
this.tabEnabled = false;
this.updateBackground();
var $1:SimpleButton = this.clickbutton;
if (this.clickable) {
this.hitArea = null;
attachMouseEvents(this);
if ($1 == null) {
this.clickbutton = $1 = new SimpleButton();
addChildAt($1, 0)
};
$1.useHandCursor = showhandcursor == null ? LzMouseKernel.showhandcursor : showhandcursor;
$1.tabEnabled = false;
if (!this.clickregion) {
this.setClickRegion(this.clickresource)
};
attachMouseEvents($1)
} else {
removeMouseEvents(this);
if ($1) {
removeChild($1);
removeMouseEvents($1);
this.clickbutton = null
};
this.hitArea = LzSprite.emptySprite
}}public function debugClick ($0:Event):void {
trace("debugClick " + $0 + " " + $0.target)
}var _x:Number = 0;public function setX ($0:Number):void {
_x = $0;
x = $0 + (marginLeft + borderLeftWidth + paddingLeft) * scaleX;
if (bordershape) {
bordershape.x = x;
if (pixelAligned) {
updateBorderShape()
}};
if (shadowshape && shadowblurradius >= 0) {
shadowshape.x = x
}}var _y:Number = 0;public function setY ($0:Number):void {
_y = $0;
y = $0 + (marginTop + borderTopWidth + paddingTop) * scaleY;
if (bordershape) {
bordershape.y = y;
if (pixelAligned) {
updateBorderShape()
}};
if (shadowshape && shadowblurradius >= 0) {
shadowshape.y = y
}}public function setWidth ($0:Number):void {
this.lzwidth = $0;
this.applyStretchResource();
if (this.clickregion != null) {
this.clickregion.scaleX = $0 / this.clickregionwidth
};
updateBorderShape()
}public function setHeight ($0:Number):void {
this.lzheight = $0;
this.applyStretchResource();
if (this.clickregion != null) {
this.clickregion.scaleY = $0 / this.clickregionheight
};
updateBorderShape()
}public function setRotation ($0:Number):void {
this.rotation = $0;
if (bordershape) {
bordershape.rotation = $0;
if (pixelAligned) {
updateBorderShape()
}};
if (shadowshape && shadowblurradius >= 0) {
shadowshape.rotation = $0
}}public function setRotationX ($0:Number):void {
this["rotationX"] = $0;
if (bordershape) {
bordershape["rotationX"] = $0;
if (pixelAligned) {
updateBorderShape()
}};
if (shadowshape && shadowblurradius >= 0) {
shadowshape["rotationX"] = $0
}}public function setRotationY ($0:Number):void {
this["rotationY"] = $0;
if (bordershape) {
bordershape["rotationY"] = $0;
if (pixelAligned) {
updateBorderShape()
}};
if (shadowshape && shadowblurradius >= 0) {
shadowshape["rotationY"] = $0
}}public function setRotationZ ($0:Number):void {
this["rotationZ"] = $0;
if (bordershape) {
bordershape["rotationZ"] = $0;
if (pixelAligned) {
updateBorderShape()
}};
if (shadowshape && shadowblurradius >= 0) {
shadowshape["rotationZ"] = $0
}}public function setVisible ($0:Boolean):void {
this.visible = $0;
if (bordershape) {
bordershape.visible = $0
};
if (shadowshape && shadowblurradius >= 0) {
shadowshape.visible = $0
}}public function getColorTransform ():Object {
var $0:ColorTransform = this.transform.colorTransform;
return {ra: $0.redMultiplier * 100, rb: $0.redOffset, ga: $0.greenMultiplier * 100, gb: $0.greenOffset, ba: $0.blueMultiplier * 100, bb: $0.blueOffset, aa: $0.alphaMultiplier * 100, ab: $0.alphaOffset}}function setColorTransform ($0:*):void {
this.transform.colorTransform = new ColorTransform($0.redMultiplier, $0.greenMultiplier, $0.blueMultiplier, $0.alphaMultiplier, $0.redOffset, $0.greenOffset, $0.blueOffset, $0.alphaOffset);
if (bordershape) {
bordershape.transform.colorTransform = transform.colorTransform
};
if (shadowshape && shadowblurradius >= 0) {
shadowshape.transform.colorTransform = transform.colorTransform
}}public function setBGColor ($0:*):void {
if (this.bgcolor == $0 && !this.__bgcolorhidden) return;
if (!($0 == null && this.isBkgndRequired)) {
this.__bgcolorhidden = false;
this.bgcolor = $0
} else {
this.__bgcolorhidden = true;
this.bgcolor = 16777215
};
dirty = true
}public function setOpacity ($0:Number):void {
this.opacity = this.alpha = $0;
if (bordershape) {
bordershape.alpha = $0
};
if (shadowshape && shadowblurradius >= 0) {
shadowshape.alpha = $0
}}public function play ($0:* = null, $1:Boolean = false):void {
if (this.isaudio) {
this.updateSoundPlay(true, $0, $1);
this.owner.resourceevent("play", null, true)
} else if (this.__isinternalresource) {
if ($0 != null) {
this.__setFrame($0)
};
if (this.playing == false && this.totalframes > 1) {
this.playing = true;
this.owner.resourceevent("playing", true);
LzIdleKernel.addCallback(this, "__incrementFrame")
};
this.owner.resourceevent("play", null, true)
} else if (this.loaderMC) {
this.owner.resourceevent("play", null, true);
this.updateResourcePlay(true, $0, $1)
} else if (this.imgLoader) {}}public function __incrementFrame ($0 = null):void {
var $1 = this.frame + 1;
if ($1 > this.totalframes) {
$1 = 1
};
this.__setFrame($1)
}public function stop ($0:* = null, $1:Boolean = false):void {
if (this.isaudio) {
var $2:Boolean = this.playing;
this.updateSoundPlay(false, $0, $1);
if ($2) this.owner.resourceevent("stop", null, true)
} else if (this.__isinternalresource) {
if (this.playing == true) {
this.playing = false;
this.owner.resourceevent("playing", false);
this.owner.resourceevent("stop", null, true);
LzIdleKernel.removeCallback(this, "__incrementFrame")
};
if ($0 != null) {
this.__setFrame($0)
}} else if (this.loaderMC) {
if (this.playing) this.owner.resourceevent("stop", null, true);
this.updateResourcePlay(false, $0, $1)
} else if (this.imgLoader) {};
if (this.backgroundrepeat) this.dirty = true
}private function __setFrame ($0:Number):void {
var $1:Object = LzResourceLibrary[this.resource];
var $2:Array = $1.frames;
var $3:* = $0;
if ($0 < 1) {
$3 = $0 = 1
} else if ($0 > $2.length) {
$0 = $2.length
};
var $4:int = $0 - 1;
var $5:DisplayObject = this.getAsset(this.resource, $4);
if ($5) {
var $6:Rectangle = $5.getBounds($5);
if ($6.width == 0 || $6.height == 0) {
this.frame = $3;
LzIdleKernel.addCallback(this, "__resetframe");
return
};
if (this.resourceContainer != null) {
this.removeChild(this.resourceContainer)
};
if ($5 is InteractiveObject) InteractiveObject($5).mouseEnabled = false;
if ($5 is DisplayObjectContainer) DisplayObjectContainer($5).mouseChildren = false;
this.resourceContainer = $5;
this.addChildAt($5, IMGDEPTH);
this.applyStretchResource();
if ($5 is MovieClip && this.totalframes == 1) {
var $7:Loader = MovieClip($5).getChildAt(0) as Loader;
if ($7.content is AVM1Movie) {

} else {
this.__isinternalresource = false;
this.loaderMC = MovieClip($7.content);
this.totalframes = this.loaderMC.totalFrames;
this.loaderMC.gotoAndStop($3)
}} else {
this.frame = $0
}};
if (this.frame == this.totalframes) {
this.owner.resourceevent("lastframe", null, true)
}}private function getAsset ($0:String, $1:Number = 0):DisplayObject {
var $2:Object = LzResourceLibrary[$0];
var $3:Array = $2.frames;
var $4:Class;
if ($2.assetclass is Class) {
$4 = $2.assetclass
} else {
$4 = $3[$1]
};
if ($4) {
if (this.resourceCache == null) {
this.resourceCache = []
};
var $5:DisplayObject = this.resourceCache[$1];
if ($5 == null) {
$5 = new $4();
if ($5 is Bitmap) {
($5 as Bitmap).smoothing = true
};
$5.scaleX = 1;
$5.scaleY = 1;
this.resourceCache[$1] = $5
};
if ($5 is InteractiveObject) InteractiveObject($5).mouseEnabled = false;
if ($5 is DisplayObjectContainer) DisplayObjectContainer($5).mouseChildren = false
};
return $5
}private function updateResourcePlay ($0:Boolean, $1:*, $2:Boolean):void {
this.playing = $0;
this.owner.resourceevent("playing", $0);
if ($1 == null) {
if ($0) {
this.loaderMC.play()
} else {
this.loaderMC.stop()
}} else {
if ($2) $1 += this.frame;
if ($1 > this.totalframes) {
$1 = this.totalframes
} else if ($1 < 1) {
$1 = 1
};
if ($0) {
this.loaderMC.gotoAndPlay($1)
} else {
this.loaderMC.gotoAndStop($1)
}}}public function __resetframe ($0:* = null):void {
LzIdleKernel.removeCallback(this, "__resetframe");
this.stop(this.frame)
}public function setClip ($0:Boolean):void {
if ($0) {
applyMask()
} else {
removeMask()
}}public function applyMask ():void {
if (masksprite == null) {
masksprite = new Shape();
addChildAt(masksprite, 0)
};
mask = masksprite;
dirty = true
}public function removeMask ():void {
if (masksprite != null) {
this.removeChild(masksprite);
masksprite = null
};
mask = null
}public function stretchResource ($0:String):void {
if ($0 == "width" || $0 == "both") {
this._setrescwidth = true
};
if ($0 == "height" || $0 == "both") {
this._setrescheight = true
};
this.applyStretchResource()
}public function applyStretchResource ():void {
var $0:DisplayObject = this.resourceContainer;
if ($0 == null) return;
var $1:Number = 1;
if (this._setrescwidth && this.resourcewidth) {
$1 = this.lzwidth / this.resourcewidth
};
var $2:Number = 1;
if (this._setrescheight && this.resourceheight) {
$2 = this.lzheight / this.resourceheight
};
$0.scaleX = $1;
$0.scaleY = $2
}public function destroy ($0 = true):void {
this.unload();
if ($0 && parent) {
parent.removeChild(this);
if (bordershape) {
parent.removeChild(bordershape)
};
if (shadowshape && shadowblurradius >= 0) {
parent.removeChild(shadowshape)
}};
if (this.__repeatbitmap) this.__repeatbitmap.dispose();
if (this.masksprite != null) {
this.removeMask()
}}public function getMouse ():Object {
return {x: Math.round(this.mouseX), y: Math.round(this.mouseY)}}public function getWidth ():Number {
return this.width
}public function getHeight ():Number {
return this.height
}private function setIndex ($0:int) {
if (bordershape) {
parent.setChildIndex(bordershape, $0)
};
if (shadowshape && shadowblurradius >= 0) {
parent.setChildIndex(shadowshape, $0)
};
parent.setChildIndex(this, $0)
}public function bringToFront ():void {
if (!this.isroot && parent) {
setIndex(parent.numChildren - 1)
}}public function sendToBack ():void {
if (!this.isroot) {
var $0:int = 0;
for (;!(parent.getChildAt($0) is LzSprite);++$0) {};
setIndex($0)
}}public function sendInFrontOf ($0:LzSprite):void {
if (!this.isroot) {
try {
var $1:int = parent.getChildIndex(this);
var $2:int = parent.getChildIndex($0);
setIndex($1 < $2 ? $2 : $2 + 1)
}
catch ($3:Error) {}}}public function sendBehind ($0:LzSprite):void {
if (!this.isroot) {
try {
var $1:int = parent.getChildIndex(this);
var $2:int = parent.getChildIndex($0);
setIndex($1 > $2 ? $2 : $2 - 1)
}
catch ($3:Error) {}}}public function setStyleObject ($0:Object):void {
trace("LzSprite.setStyleObject not yet implemented")
}public function getStyleObject ():Object {
trace("LzSprite.getStyleObject not yet implemented");
return null
}public function removeAllChildren ($0:DisplayObjectContainer):void {
$0.removeChildren()
}public function unload ():void {
if (this.owner != null) {
this.owner.resourceevent("loadratio", 0);
this.owner.resourceevent("framesloadratio", 0)
};
if (this.imgLoader) {
try {
this.imgLoader.close()
}
catch ($0:Error) {};
this.imgLoader["unloadAndStop"]()
};
if (this.resourceContainer != null) {
this.removeChild(this.resourceContainer);
this.resourceContainer = null
};
if (this.isaudio) this.unloadSound();
this.resourcewidth = this.resourceheight = 0;
this.resource = null;
this.__isinternalresource = null;
if (this.loaderMC) {
this.loaderMC.removeEventListener(Event.ENTER_FRAME, updateFrames);
this.loaderMC = null
};
this.imgLoader = null;
this.resourceCache = null;
this.dirty = true
}public function setAccessible ($0:*):void {
trace("LzSprite.setAccessible not yet implemented")
}public function getDisplayObject ():LzSprite {
return this
}public function getContext ():Graphics {
return this.graphics
}public function setContextCallback ($0, $1):void {}public function setBitmapCache ($0):void {
this.cacheAsBitmap = $0;
this.updateBackground()
}public function getZ ():int {
return parent.getChildIndex(this)
}var __contextmenu:LzContextMenu;var __bgcolorhidden:Boolean = false;var __bgshape:Shape = null;
    function get isBkgndRequired () :Boolean {
        // background is required for:
        // - LPP-7842 (SWF9: context-menu not shown for view without bgcolor/content)
        // - LPP-7864 (SWF: cachebitmap interferes with mouse-events)
        // - LPP-7551 (several text-link issues)
        return this.__contextmenu != null || this.clickable;
    }
;function updateBackground ():void {
if (this.__bgcolorhidden && !this.isBkgndRequired) {
this.__bgcolorhidden = false;
this.bgcolor = null;
this.dirty = true
} else if (this.bgcolor == null && this.isBkgndRequired) {
this.__bgcolorhidden = true;
this.bgcolor = 16777215;
this.dirty = true
}}function setContextMenu ($0:LzContextMenu):void {
this.__contextmenu = $0;
this.updateBackground();
this.contextMenu = $0 != null ? $0.kernel.__LZcontextMenu() : null
}function setDefaultContextMenu ($0:LzContextMenu):void {
var $1:ContextMenu = $0 != null ? $0.kernel.__LZcontextMenu() : null;
LzSprite.prototype.contextMenu = $1;
LFCApplication._sprite.contextMenu = $1
}function getContextMenu ():LzContextMenu {
return this.__contextmenu
}function sendResourceLoad ($0:Boolean = false):void {
if (this.owner != null) {
this.owner.resourceload({width: this.resourcewidth, height: this.resourceheight, resource: this.resource, skiponload: $0})
}}var cursorResource:String = null;function setCursor ($0:String = null):void {
if ($0 == null) return;
if ($0 != "") {
this.cursorResource = $0;
if (!this.clickable) {
this.setClickable(true)
}} else {
LzMouseKernel.restoreCursorLocal();
this.cursorResource = null
}}function cursorGotMouseover ($0:MouseEvent):void {
LzMouseKernel.setCursorLocal(this.cursorResource)
}function cursorGotMouseout ($0:MouseEvent):void {
LzMouseKernel.restoreCursorLocal()
}function setVolume ($0:Number):void {
LzAudioKernel.setVolume($0, this)
}function getVolume ():Number {
return LzAudioKernel.getVolume(this)
}function setPan ($0:Number):void {
LzAudioKernel.setPan($0, this)
}function getPan ():Number {
return LzAudioKernel.getPan(this)
}function seek ($0:Number, $1:Boolean):void {
if (this.isaudio) {
var $2:Number = this.getCurrentTime() + $0;
if ($2 < 0) $2 = 0;
var $3:Number = this.getTotalTime();
if ($2 > $3) $2 = $3;
if (this.playing) {
this.stopSoundPlay()
};
if ($1) {
this.startSoundPlay($2, false)
} else {
this.frame = Math.floor($2 * MP3_FPS)
}}}function getCurrentTime ():Number {
if (this.isaudio) {
if (this.playing) {
return this.soundChannel.position * 0.0010
} else {
return this.frame / MP3_FPS
}} else {
return 0
}}function getTotalTime ():Number {
return this.isaudio ? this.sound.length * 0.0010 : 0
}function getID3 ():ID3Info {
return this.isaudio ? this.sound.id3 : null
}function setShowHandCursor ($0:*):void {
this.useHandCursor = $0;
this.showhandcursor = $0
}function setAAActive ($0:*):void {
trace("LzSprite.setAAActive not yet implemented")
}function setAAName ($0:*):void {
trace("LzSprite.setAAName not yet implemented")
}function setAADescription ($0:*):void {
trace("LzSprite.setAADescription not yet implemented")
}function setAATabIndex ($0:*):void {
trace("LzSprite.setAATabIndex not yet implemented")
}function setAASilent ($0:*):void {
trace("LzSprite.setAASilent not yet implemented")
}function updateResourceSize ($0:* = null):void {
this.setWidth(this._setrescwidth ? this.width : this.resourcewidth);
this.setHeight(this._setrescheight ? this.height : this.resourceheight);
if (!$0) this.owner.resourceload({width: this.resourcewidth, height: this.resourceheight, resource: this.resource, skiponload: true})
}private var clickresource;function setClickRegion ($0):void {
if (this.clickresource === $0) return;
clickresource = $0;
if ($0 == null) {
clickregion = new Sprite();
clickregion.graphics.beginFill(16777215);
clickregion.graphics.drawRect(0, 0, 1, 1);
clickregion.graphics.endFill();
clickregion.scaleX = this.lzwidth;
clickregion.scaleY = this.lzheight;
clickregionwidth = 1;
clickregionheight = 1;
this.hitArea = null
} else {
var $1:Object = LzResourceLibrary[$0];
if (!$1) {
return
};
var $2 = this.getAsset($0);
clickregion = $2;
clickregionwidth = $1.width;
clickregionheight = $1.height;
clickregion.scaleX = this.lzwidth / clickregionwidth;
clickregion.scaleY = this.lzheight / clickregionheight;
this.hitArea = clickregion
};
clickbutton.hitTestState = clickregion
}function sendAAEvent ($0:Number, $1:Number, $2:Boolean = false) {
trace("LzSprite.sendAAEvent not yet implemented")
}function aafocus () {
trace("LzSprite.aafocus not yet implemented")
}function setID ($0) {
trace("LzSprite.setID not yet implemented")
}var bordershape:Shape = null;var shadowshape:Shape = null;var _borderx:Number;function set borderx ($0:Number):void {
if (_borderx != $0) {
_borderx = $0;
dirty = true
}}function get borderx ():Number {
return _borderx
}var _bordery:Number;function set bordery ($0:Number):void {
if (_bordery != $0) {
_bordery = $0;
dirty = true
}}function get bordery ():Number {
return _bordery
}var _borderwidth:Number;function set borderwidth ($0:Number):void {
if (_borderwidth != $0) {
_borderwidth = $0;
dirty = true
}}function get borderwidth ():Number {
return _borderwidth
}var _borderheight:Number;function set borderheight ($0:Number):void {
if (_borderheight != $0) {
_borderheight = $0;
dirty = true
}}function get borderheight ():Number {
return _borderheight
}var pixelAligned:Boolean = false;function updateBorderShape () {
var $0 = 0 - (borderLeftWidth + paddingLeft);
var $1 = 0 - (borderTopWidth + paddingTop);
var $2 = lzwidth + (borderLeftWidth + paddingLeft + paddingRight + borderRightWidth);
var $3 = lzheight + (borderTopWidth + paddingTop + paddingBottom + borderBottomWidth);
if (parent != null) {
var $4:int = parent.getChildIndex(this)
};
if (borderColor != null && (borderTopWidth || borderRightWidth || borderBottomWidth || borderLeftWidth)) {
if (pixelAligned = borderTopWidth == (borderTopWidth | 0) && borderRightWidth == (borderRightWidth | 0) && borderBottomWidth == (borderBottomWidth | 0) && borderLeftWidth == (borderLeftWidth | 0)) {
var $5 = Math.round;
var $6:Point = localToGlobal(new Point($0, $1));
var $7:Point = globalToLocal(new Point($5($6.x), $5($6.y)));
var $8:Point = localToGlobal(new Point($0 + $2, $1 + $3));
var $9:Point = globalToLocal(new Point($5($8.x), $5($8.y)));
$0 = $7.x;
$1 = $7.y;
$2 = $9.x - $0;
$3 = $9.y - $1
};
if (bordershape == null) {
bordershape = new Shape();
if (parent != null) {
parent.addChildAt(bordershape, $4)
};
dirty = true
}} else {
pixelAligned = false;
if (parent != null && bordershape != null) {
parent.removeChild(bordershape);
bordershape = null
};
dirty = true
};
this.borderx = $0;
this.bordery = $1;
this.borderwidth = $2;
this.borderheight = $3;
if (shadowcolor !== null && shadowblurradius) {
if (shadowshape == null) {
shadowshape = new Shape();
if (shadowblurradius >= 0) {
if (parent != null) {
parent.addChildAt(shadowshape, $4)
}} else {
addChildAt(shadowshape, __bgshape != null ? 1 : 0)
};
dirty = true
}} else {
if (shadowshape != null) {
shadowshape.parent.removeChild(shadowshape);
shadowshape = null;
dirty = true
}}}var shadowcolor:*;var shadowangle:Number;var shadowdistance:Number;var shadowblurradius:Number;function updateShadow ($0, $1:Number, $2:Number, $3:Number) {
this.shadowcolor = $0;
this.shadowangle = $2;
this.shadowdistance = $1;
this.shadowblurradius = $3;
dirty = true
}var cornerradius:Array = [0, 0, 0, 0, 0, 0, 0, 0];var cornerradius_single:Number = -1;function setCornerRadius ($0:Array) {
cornerradius = $0;
cornerradius_single = -1;
var $1:Number = cornerradius[0];
var $2:Number = cornerradius[0];
if (cornerradius.length > 1) {
var $3:Number;
for (var $4:int = 1;$4 < cornerradius.length;$4++) {
$3 = cornerradius[$4];
if ($3 < $1) $1 = $3;
if ($3 > $2) $2 = $3
}};
$1 = Math.round($1 * 10) / 10;
$2 = Math.round($2 * 10) / 10;
if ($1 == $2) cornerradius_single = $1;
this.dirty = true
}function isCircle ($0:Number, $1:Number):Boolean {
$0 = Math.round($0 * 10) / 10;
$1 = Math.round($1 * 10) / 10;
if ($0 != $1) return false;
var $2:Number = $0 / 2;
if (cornerradius_single >= 0 && $2 == cornerradius_single) return true;
return false
}function drawRoundRect ($0:Graphics, $1:Number, $2:Number, $3:Number, $4:Number):void {
if (isCircle($3, $4)) {
var $5:Number = $3 / 2;
$0.drawCircle($1 + $5, $2 + $5, $5);
return
};
LzKernelUtils.roundrect($0, $1, $2, $3, $4, cornerradius[0], cornerradius[1], cornerradius[2], cornerradius[3], cornerradius[4], cornerradius[5], cornerradius[6], cornerradius[7])
}var marginTop:Number = 0;var marginRight:Number = 0;var marginBottom:Number = 0;var marginLeft:Number = 0;var borderTopWidth:Number = 0;var borderRightWidth:Number = 0;var borderBottomWidth:Number = 0;var borderLeftWidth:Number = 0;var paddingTop:Number = 0;var paddingRight:Number = 0;var paddingBottom:Number = 0;var paddingLeft:Number = 0;var borderColor:* = null;var __csscache = null;function setCSS ($0, $1, $2) {
if (this.__csscache == null) {
this.__csscache = {}} else {
if (this.__csscache[$0] === $1) return
};
this.__csscache[$0] = $1;
this[$0] = $2 ? parseFloat($1) : $1;
var $3 = marginLeft + borderLeftWidth + paddingLeft;
this.x = this._x + $3 * scaleX;
var $4 = marginTop + borderTopWidth + paddingTop;
this.y = this._y + $4 * scaleY;
var $5 = this.owner;
$5.__widthoffset = $3 + (marginRight + borderRightWidth + paddingRight);
$5.__heightoffset = $4 + (marginBottom + borderBottomWidth + paddingBottom);
updateBorderShape();
this.dirty = true
}static function setMediaLoadTimeout ($0) {
LzSprite.medialoadtimeout = $0
}static function setMediaErrorTimeout ($0) {
LzSprite.mediaerrortimeout = $0
}var backgroundrepeat:String = null;var repeatx:Boolean = false;var repeaty:Boolean = false;function setBackgroundRepeat ($0:String) {
if (this.backgroundrepeat == $0) return;
var $1 = false;
var $2 = false;
if ($0 == "repeat") {
$1 = $2 = true
} else if ($0 == "repeat-x") {
$1 = true
} else if ($0 == "repeat-y") {
$2 = true
};
this.repeatx = $1;
this.repeaty = $2;
this.backgroundrepeat = $0;
this.dirty = true
}private function copyBitmap ($0:*, $1:Number, $2:Number, $3:BitmapData = null, $4:Matrix = null) {
var $5:BitmapData = new (flash.display.BitmapData)($1, $2, true, 255);
$5.draw($0);
if (!$3) {
return $5
};
$3.draw($5, $4, null, null, null, true);
$5.dispose()
}static var quirks = {ignorespuriousmouseevents: false, ignoreextramenuevents: false, fixtextselection: false, loaderinfoavailable: false, textlinksneedmouseevents: true};static function __updateQuirks ($0) {
if ($0.isFirefox && $0.OS == "Mac") {
LzSprite.quirks.ignorespuriousff36events = $0.version == 3.6 && $0.subversion < 2;
LzSprite.quirks.fixtextselection = $0.version < 3.5
};
if ($0.isFirefox && $0.OS == "Windows") {
LzSprite.quirks.ignoreextramenuevents = $0.version == 3.6
};
LzSprite.quirks.loaderinfoavailable = true;
if ($0.isIE) {
LzKeyboardKernel.__isIE = true
}}static function __updateCapabilities () {
if (Capabilities.playerType === "Desktop") {
LzSprite.capabilities.customcontextmenu = false
}}function setXScale ($0:Number) {
this.scaleX = $0;
if (bordershape) {
bordershape.scaleX = $0;
if (pixelAligned) {
updateBorderShape()
}};
if (shadowshape && shadowblurradius >= 0) {
shadowshape.scaleX = $0
}}function setYScale ($0:Number) {
this.scaleY = $0;
if (bordershape) {
bordershape.scaleY = $0;
if (pixelAligned) {
updateBorderShape()
}};
if (shadowshape && shadowblurradius >= 0) {
shadowshape.scaleY = $0
}}}
}
