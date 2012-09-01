package {

    import flash.events.KeyboardEvent;
    class LzKeyboardKernel {
static var __isIE:Boolean = false;static var __lastdown:Number = 0;static function __keyboardEvent ($0):void {
var $1:String = "on" + $0.type.toLowerCase();
var $2:Object = {};
var $3:uint = $0.keyCode;
var $4:Boolean = $1 == "onkeydown";
if (($3 == 0 || $3 == 65) && $0.charCode == 0) {
if ($4) {
$3 = $0.shiftKey && __keyState[16] == null ? 16 : ($0.ctrlKey && __keyState[17] == null ? 17 : $3)
} else {
$3 = !$0.shiftKey && __keyState[16] != null ? 16 : (!$0.ctrlKey && __keyState[17] != null ? 17 : $3)
}};
var $5:String = String.fromCharCode($3).toLowerCase();
__shiftState = $0.shiftKey;
if (__keyState[$3] != null == $4) {
if (!__isIE || $3 != 9) {
return
} else {
var $6:Number = new Date().getTime();
var $7 = $6 - __lastdown;
__lastdown = $6;
if ($7 < 200) {
return
}}};
__keyState[$3] = $4 ? $3 : null;
__lastdown = new Date().getTime();
$2[$5] = $4;
var $8:Boolean = $0.ctrlKey;
var $9:Boolean = $0.shiftKey;
if (__callback) __scope[__callback]($2, $3, $1, $8, $9)
}static var __callback:String = null;static var __scope:* = null;static var __keyState:Object = {};static var __shiftState:Boolean = false;static var __listeneradded:Boolean = false;static function setCallback ($0:*, $1:String):void {
if (__listeneradded == false) {
__scope = $0;
__callback = $1;
LFCApplication.stage.addEventListener(KeyboardEvent.KEY_DOWN, __keyboardEvent);
LFCApplication.stage.addEventListener(KeyboardEvent.KEY_UP, __keyboardEvent);
__listeneradded = true
}}static function __allKeysUp () {
var $0 = null;
var $1 = false;
var $2 = null;
for (var $3 in __keyState) {
if (__keyState[$3] != null) {
$1 = true;
if (!$0) {
$0 = {}};
$0[$3] = false;
if (!$2) {
$2 = []
};
$2.push(__keyState[$3]);
__keyState[$3] = null
}};
if ($1 && __scope && __scope[__callback]) {
if (!$2) {
__scope[__callback]($0, 0, "onkeyup")
} else for (var $4 = 0, $5 = $2.length;$4 < $5;$4++) {
__scope[__callback]($0, $2[$4], "onkeyup")
}}}static function gotLastFocus ():void {}static function setGlobalFocusTrap ($0):void {}static function __browserTabEvent ($0):void {
if ($0) {
LzKeyboardKernel.__keyboardEvent({type: "keyDown", keyCode: 16, altKey: false, ctrlKey: false})
};
LzKeyboardKernel.__keyboardEvent({type: "keyDown", keyCode: 9, altKey: false, ctrlKey: false});
if (!__isIE) {
LzKeyboardKernel.__keyboardEvent({type: "keyUp", keyCode: 9, altKey: false, ctrlKey: false})
};
if ($0) {}}}
}
