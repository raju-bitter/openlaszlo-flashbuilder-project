package {

    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.display.Stage;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.FocusEvent;
    import flash.system.Capabilities;
    import flash.text.TextField;
    public class LFCApplication {
$modules.runtime = global;
;
;
;
String.prototype.toHTML = function () {
return LzMessage.xmlEscape(this)
};
String.prototype.setPropertyIsEnumerable("toHTML", false);
;
;
;
;
;
;
;
;
;
;
(function () {
if (lz is Object) {

} else if (!lz) {
lz = new LzInheritedHash();
lz["ClassAttributeTypes"] = new LzInheritedHash();
lz.ClassAttributeTypes["Object"] = {}}})();
;
lz.DeclaredEventClass = LzDeclaredEventClass;
lz.colors = {aliceblue: 15792383, antiquewhite: 16444375, aqua: 65535, aquamarine: 8388564, azure: 15794175, beige: 16119260, bisque: 16770244, black: 0, blanchedalmond: 16772045, blue: 255, blueviolet: 9055202, brown: 10824234, burlywood: 14596231, cadetblue: 6266528, chartreuse: 8388352, chocolate: 13789470, coral: 16744272, cornflowerblue: 6591981, cornsilk: 16775388, crimson: 14423100, cyan: 65535, darkblue: 139, darkcyan: 35723, darkgoldenrod: 12092939, darkgray: 11119017, darkgreen: 25600, darkgrey: 11119017, darkkhaki: 12433259, darkmagenta: 9109643, darkolivegreen: 5597999, darkorange: 16747520, darkorchid: 10040012, darkred: 9109504, darksalmon: 15308410, darkseagreen: 9419919, darkslateblue: 4734347, darkslategray: 3100495, darkslategrey: 3100495, darkturquoise: 52945, darkviolet: 9699539, deeppink: 16716947, deepskyblue: 49151, dimgray: 6908265, dimgrey: 6908265, dodgerblue: 2003199, firebrick: 11674146, floralwhite: 16775920, forestgreen: 2263842, fuchsia: 16711935, gainsboro: 14474460, ghostwhite: 16316671, gold: 16766720, goldenrod: 14329120, gray: 8421504, green: 32768, greenyellow: 11403055, grey: 8421504, honeydew: 15794160, hotpink: 16738740, indianred: 13458524, indigo: 4915330, ivory: 16777200, khaki: 15787660, lavender: 15132410, lavenderblush: 16773365, lawngreen: 8190976, lemonchiffon: 16775885, lightblue: 11393254, lightcoral: 15761536, lightcyan: 14745599, lightgoldenrodyellow: 16448210, lightgray: 13882323, lightgreen: 9498256, lightgrey: 13882323, lightpink: 16758465, lightsalmon: 16752762, lightseagreen: 2142890, lightskyblue: 8900346, lightslategray: 7833753, lightslategrey: 7833753, lightsteelblue: 11584734, lightyellow: 16777184, lime: 65280, limegreen: 3329330, linen: 16445670, magenta: 16711935, maroon: 8388608, mediumaquamarine: 6737322, mediumblue: 205, mediumorchid: 12211667, mediumpurple: 9662683, mediumseagreen: 3978097, mediumslateblue: 8087790, mediumspringgreen: 64154, mediumturquoise: 4772300, mediumvioletred: 13047173, midnightblue: 1644912, mintcream: 16121850, mistyrose: 16770273, moccasin: 16770229, navajowhite: 16768685, navy: 128, oldlace: 16643558, olive: 8421376, olivedrab: 7048739, orange: 16753920, orangered: 16729344, orchid: 14315734, palegoldenrod: 15657130, palegreen: 10025880, paleturquoise: 11529966, palevioletred: 14381203, papayawhip: 16773077, peachpuff: 16767673, peru: 13468991, pink: 16761035, plum: 14524637, powderblue: 11591910, purple: 8388736, red: 16711680, rosybrown: 12357519, royalblue: 4286945, saddlebrown: 9127187, salmon: 16416882, sandybrown: 16032864, seagreen: 3050327, seashell: 16774638, sienna: 10506797, silver: 12632256, skyblue: 8900331, slateblue: 6970061, slategray: 7372944, slategrey: 7372944, snow: 16775930, springgreen: 65407, steelblue: 4620980, tan: 13808780, teal: 32896, thistle: 14204888, tomato: 16737095, turquoise: 4251856, violet: 15631086, wheat: 16113331, white: 16777215, whitesmoke: 16119285, yellow: 16776960, yellowgreen: 10145074, transparent: null};
;
lz.Eventable = LzEventable;
;
;
lz.TypeService = $lz$class_TypeService;
lz.Type = lz.TypeService.Type;
;
;
lz.Type.addType("string", new $lz$class_StringPresentationType());
lz.Type.addTypeAlias("ID", "string");
lz.Type.addTypeAlias("token", "string");
lz.Type.addTypeAlias("html", "string");
lz.Type.addTypeAlias("text", "string");
;
lz.Type.addType("cdata", new $lz$class_CDATAPresentationType());
;
lz.Type.addType("boolean", new $lz$class_BooleanPresentationType());
lz.Type.addTypeAlias("inheritableBoolean", "boolean");
;
lz.Type.addType("number", new $lz$class_NumberPresentationType());
lz.Type.addTypeAlias("numberExpression", "number");
;
lz.Type.addType("color", new $lz$class_ColorPresentationType());
;
lz.Type.addType("expression", new $lz$class_ExpressionPresentationType());
;
lz.Type.addType("size", new $lz$class_SizePresentationType());
;
lz.Type.addType("css", new $lz$class_CSSDeclarationPresentationType());
;
lz[LzNode.tagname] = LzNode;
;
lz.Delegate = LzDelegate;
;
lz.Event = LzEvent;
;
lz.NotifyingEvent = LzNotifyingEvent;;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
lz[LzLibrary.tagname] = LzLibrary;
;
;
;
;
;
;
;
;
;
;
;
;
lz[LzView.tagname] = LzView;
;
LzTextscrollEvent.LzDeclaredTextscrollEvent = new LzDeclaredEventClass(LzTextscrollEvent);
;
LzTextlinkEvent.LzDeclaredTextlinkEvent = new LzDeclaredEventClass(LzTextlinkEvent);
;
lz[LzText.tagname] = LzText;
;
lz[LzInputText.tagname] = LzInputText;
;
;
lz[LzCanvas.tagname] = LzCanvas;
;
lz[LzScript.tagname] = LzScript;;
lz[LzAnimatorGroup.tagname] = LzAnimatorGroup;
;
lz[LzAnimator.tagname] = LzAnimator;;
lz[LzContextMenu.tagname] = LzContextMenu;
;
lz[LzContextMenuItem.tagname] = LzContextMenuItem;
;
lz.Font = LzFont;
;
lz[LzState.tagname] = LzState;
;
lz.URL = LzURL;;
lz.DataNodeMixin = LzDataNodeMixin;
;
lz.DataNode = LzDataNode;
;
lz.DataElementMixin = LzDataElementMixin;
;
lz.DataElement = LzDataElement;
;
lz.DataText = LzDataText;
;
lz.DataRequest = LzDataRequest;
;
lz.DataProvider = LzDataProvider;
;
lz.HTTPDataRequest = LzHTTPDataRequest;
;
lz.HTTPDataProvider = LzHTTPDataProvider;
;
lz[LzDataset.tagname] = LzDataset;
;
;
lz[LzDatapointer.tagname] = LzDatapointer;
;
lz.Param = LzParam;
;
;
;
lz[LzDatapath.tagname] = LzDatapath;
;
lz.ReplicationManager = LzReplicationManager;
;
;
;
lz.LazyReplicationManager = LzLazyReplicationManager;
;
lz.ResizeReplicationManager = LzResizeReplicationManager;;
lz.ColorUtils = LzColorUtils;
;
lz.Utils = new LzUtilsClass();
;
lz.Instantiator = LzInstantiatorService.LzInstantiator;
;
lz.GlobalMouseService = LzGlobalMouseService;
lz.GlobalMouse = LzGlobalMouseService.LzGlobalMouse;
;
lz.BrowserService = LzBrowserService;
lz.Browser = LzBrowserService.LzBrowser;
lz.embed = new LzInheritedHash();
lz.embed.setCanvasAttribute = function ($0, $1, $2) {
lz.Browser.callJS("lz.embed.setCanvasAttribute", false, $0, $1, $2)
};
lz.embed.callMethod = function ($0) {
lz.Browser.callJS("lz.embed.callMethod", false, $0)
};
lz.embed.__updatebrowserprops = function ($0) {
lz.embed.browser = $0;
LzSprite.__updateQuirks($0)
};
LzBrowserKernel.callJS("eval", lz.embed.__updatebrowserprops, "lz.embed.browser");
;
lz.ModeManagerService = LzModeManagerService;
lz.ModeManager = LzModeManagerService.LzModeManager;
;
lz.CursorService = LzCursorService;
lz.Cursor = LzCursorService.LzCursor;
;
lz.KeysService = LzKeysService;
lz.Keys = LzKeysService.LzKeys;
;
lz.AudioService = LzAudioService;
lz.Audio = LzAudioService.LzAudio;
;
lz.HistoryService = LzHistoryService;
lz.History = LzHistoryService.LzHistory;
;
lz.TrackService = LzTrackService;
lz.Track = LzTrackService.LzTrack;
;
;
lz.IdleService = LzIdleService;
lz.Idle = LzIdleService.LzIdle;
;
lz.CSSStyleRule = LzCSSStyleRule;
;
lz.CSSStyle = LzCSSStyleClass;
;
lz.CSSStyleDeclaration = LzCSSStyleDeclaration;
;
;
lz.CSSStyleSheet = LzCSSStyleSheet;
;
lz.FocusService = LzFocusService;
lz.Focus = LzFocusService.LzFocus;
;
lz.TimerService = LzTimerService;
lz.Timer = LzTimerService.LzTimer;null;public static var _sprite:Sprite;public static function addChild ($0:DisplayObject):DisplayObject {
return _sprite.addChild($0)
}public static function removeChild ($0:DisplayObject):DisplayObject {
return _sprite.removeChild($0)
}public static function setChildIndex ($0:DisplayObject, $1:int):void {
_sprite.setChildIndex($0, $1)
}public static var stage:Stage = null;public static var textfieldTabEnabled:Boolean = false;public function LFCApplication ($0:Sprite) {
LFCApplication._sprite = $0;
LFCApplication._sprite.addEventListener(Event.ADDED_TO_STAGE, initLFC)
}private function initLFC ($0:Event = null):void {
LFCApplication._sprite.removeEventListener(Event.ADDED_TO_STAGE, initLFC);
LFCApplication.stage = LFCApplication._sprite.stage;
Debug.log_all_writes = !(!LzBrowserKernel.getInitArg("logdebug"));
runToplevelDefinitions();
if (Capabilities.playerType == "ActiveX") {
stage.addEventListener(Event.ACTIVATE, allKeysUp);
LFCApplication.textfieldTabEnabled = true;
stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE, preventFocusChange)
};
stage.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, handleMouseFocusChange);
stage.align = StageAlign.TOP_LEFT;
stage.scaleMode = StageScaleMode.NO_SCALE;
LzMouseKernel.setCallback(lz.ModeManager, "rawMouseEvent");
LzMouseKernel.initCursor();
LzKeyboardKernel.setCallback(lz.Keys, "__keyEvent")
}private function allKeysUp ($0:Event):void {
lz.Keys.__allKeysUp()
}private function preventFocusChange ($0:FocusEvent):void {
if ($0.keyCode == 9) {
$0.preventDefault()
}}private function handleMouseFocusChange ($0:FocusEvent):void {
if ($0.relatedObject is TextField) {
if (!($0.relatedObject as TextField).selectable) {
$0.preventDefault();
LFCApplication.stage.focus = LFCApplication.stage
}}}public function runToplevelDefinitions () {}}
}
