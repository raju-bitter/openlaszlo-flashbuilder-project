package {

    import flash.events.Event;
    import flash.events.FullScreenEvent;
    import flash.display.Stage;
    import flash.display.StageDisplayState;
    public class LzScreenKernel {
public static var width:* = null;public static var height:* = null;public static function handleResizeEvent ($0:Event = null):void {
width = LFCApplication.stage.stageWidth;
height = LFCApplication.stage.stageHeight;
if (__callback) {
__scope[__callback]({width: width, height: height})
}}static var __callback:String = null;static var __scope:* = null;static var __listeneradded:Boolean = false;public static function setCallback ($0:*, $1:String):void {
if (__listeneradded == false) {
__scope = $0;
__callback = $1;
LFCApplication.stage.addEventListener(Event.RESIZE, handleResizeEvent);
handleResizeEvent();
__listeneradded = true
}}static var __fscallback:String = null;static var __fserrorcallback:String = null;static var __fsscope:* = null;static var __fslisteneradded:Boolean = false;public static function setFullscreenCallback ($0:*, $1:String, $2:String):void {
if (__fslisteneradded == false) {
__fsscope = $0;
__fscallback = $1;
__fserrorcallback = $2;
__fslisteneradded = true
}}public static function showFullScreen ($0:Boolean = true):void {
var $1:Stage = LFCApplication.stage;
if ($0 && $1.displayState == StageDisplayState.NORMAL) {
try {
$1.displayState = StageDisplayState.FULL_SCREEN;
$1.addEventListener(FullScreenEvent.FULL_SCREEN, fullScreenEventHandler);
var $2:Boolean = LFCApplication.stage.displayState != StageDisplayState.NORMAL;
if (__fscallback) {
__fsscope[__fscallback]($0 == $2, $2)
}}
catch ($3:SecurityError) {
if (__fserrorcallback) {
__fsscope[__fserrorcallback]($3.message)
}}} else if (!$0) {
$1.displayState = StageDisplayState.NORMAL
}}private static function fullScreenEventHandler ($0:FullScreenEvent):void {
var $1:Stage = LFCApplication.stage;
$1.removeEventListener(FullScreenEvent.FULL_SCREEN, fullScreenEventHandler);
if (__fscallback) {
__fsscope[__fscallback](true, $0.fullScreen)
}}}
}
