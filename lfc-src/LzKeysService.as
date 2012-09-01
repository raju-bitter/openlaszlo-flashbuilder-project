package {
public final class LzKeysService extends LzEventable {
public static var LzKeys:LzKeysService;function LzKeysService () {
super()
}LzKeysService.LzKeys = new LzKeysService();var downKeysHash:Object = {};var downKeysArray:Array = [];var keycombos:Object = {};var onkeydown:LzDeclaredEventClass = LzDeclaredEvent;var onkeyup:LzDeclaredEventClass = LzDeclaredEvent;var onmousewheeldelta:LzDeclaredEventClass = LzDeclaredEvent;var onkeyevent:LzDeclaredEventClass = LzDeclaredEvent;var codemap:Object = {shift: 16, control: 17, alt: 18};var ctrlKey:Boolean = false;function __keyEvent ($0:Object, $1:Number, $2:String, $3:Boolean = false, $4:* = null):void {
this.ctrlKey = $3;
if ($4 !== null) {
var $5:Object = this.downKeysHash;
if ($4) {
$5[16] = true
} else {
delete $5[16]
}};
var $6:Object = this.codemap;
for (var $7:String in $0) {
var $8:Boolean = $0[$7];
if ($6[$7] != null) $1 = $6[$7];
if ($8) {
this.gotKeyDown($1)
} else {
this.gotKeyUp($1)
}}}function __allKeysUp ():void {
this.downKeysHash = {};
this.downKeysArray = [];
LzKeyboardKernel.__allKeysUp()
}function __browserTabEvent ($0):void {
LzKeyboardKernel.__browserTabEvent($0)
}function gotKeyDown ($0:Number, $1:String = null):void {
var $2:Object = this.downKeysHash;
var $3:Array = this.downKeysArray;
if (LzKeyboardKernel.__shiftState && !$2[16]) {
$2[16] = true;
$3.push(16);
$3.sort()
};
var $4:Boolean = !$2[$0];
if ($4) {
$2[$0] = true;
$3.push($0);
$3.sort()
};
if ($4 || $1 != "extra") {
if ($2[229] != true) {
if (this.onkeydown.ready) this.onkeydown.sendEvent($0);
if (this.onkeyevent.ready) {
this.onkeyevent.sendEvent({type: "onkeydown", key: $0})
}}};
if ($4) {
var $5:Object = this.keycombos;
for (var $6:int = 0;$6 < $3.length && $5 != null;$6++) {
$5 = $5[$3[$6]]
};
if ($5 != null && ("delegates" in $5)) {
var $7:Array = $5.delegates;
for (var $6:int = 0;$6 < $7.length;$6++) {
$7[$6].execute($3)
}}}}function gotKeyUp ($0:Number):void {
var $1:Object = this.downKeysHash;
var $2:Boolean = $1[$0];
delete $1[$0];
var $3:Array = this.downKeysArray;
$3.length = 0;
if ($0 == this.keyCodes.control) {
this.downKeysHash = {};
if ($2) {
if (this.onkeyup.ready) this.onkeyup.sendEvent($0);
if (this.onkeyevent.ready) {
this.onkeyevent.sendEvent({type: "onkeyup", key: $0})
}};
for (var $4:String in $1) {
if (this.onkeyup.ready) {
this.onkeyup.sendEvent($4)
};
if (this.onkeyevent.ready) {
this.onkeyevent.sendEvent({type: "onkeyup", key: $4})
}};
return
};
for (var $4:String in $1) {
$3.push($4)
};
if ($2) {
if (this.onkeyup.ready) this.onkeyup.sendEvent($0);
if (this.onkeyevent.ready) {
this.onkeyevent.sendEvent({type: "onkeyup", key: $0})
}}}function isKeyDown ($0:*):Boolean {
if (typeof $0 == "string") {
return this.downKeysHash[this.keyCodes[$0.toLowerCase()]] == true
} else {
var $1:Boolean = true;
var $2:Object = this.downKeysHash;
var $3:Object = this.keyCodes;
for (var $4:int = 0;$4 < $0.length;$4++) {
$1 = $1 && $2[$3[$0[$4].toLowerCase()]] == true
};
return $1
}}function callOnKeyCombo ($0:*, $1:Array):void {
var $2:Object = this.keyCodes;
var $3:Array = [];
for (var $4:int = 0;$4 < $1.length;$4++) {
$3.push($2[$1[$4].toLowerCase()])
};
$3.sort();
var $5:Object = this.keycombos;
for (var $4:int = 0;$4 < $3.length;$4++) {
var $6:Object = $5[$3[$4]];
if ($6 == null) {
$5[$3[$4]] = $6 = {delegates: []}};
$5 = $6
};
$5.delegates.push($0)
}function removeKeyComboCall ($0:*, $1:Array):* {
var $2:Object = this.keyCodes;
var $3:Array = [];
for (var $4:int = 0;$4 < $1.length;$4++) {
$3.push($2[$1[$4].toLowerCase()])
};
$3.sort();
var $5:Object = this.keycombos;
for (var $4:int = 0;$4 < $3.length;$4++) {
$5 = $5[$3[$4]];
if ($5 == null) {
return false
}};
for (var $4:int = $5.delegates.length - 1;$4 >= 0;$4--) {
if ($5.delegates[$4] == $0) {
$5.delegates.splice($4, 1)
}}}function enableEnter ($0:Boolean):void {}var mousewheeldelta:Number = 0;function __mousewheelEvent ($0:Number):void {
if (lz.GlobalMouse.__mouseactive) {
this.mousewheeldelta = $0;
if (this.onmousewheeldelta.ready) this.onmousewheeldelta.sendEvent($0);
if (this.onkeyevent.ready) {
this.onkeyevent.sendEvent({type: "onmousewheeldelta", key: $0})
}}}function gotLastFocus ($0:*):void {
LzKeyboardKernel.gotLastFocus()
}function setGlobalFocusTrap ($0:Boolean):void {
if (canvas.capabilities.globalfocustrap) {
LzKeyboardKernel.setGlobalFocusTrap($0)
}}var keyCodes:Object = {"0": 48, ")": 48, ";": 186, ":": 186, "1": 49, "!": 49, "=": 187, "+": 187, "2": 50, "@": 50, "<": 188, ",": 188, "3": 51, "#": 51, "-": 189, "_": 189, "4": 52, "$": 52, ">": 190, ".": 190, "5": 53, "%": 53, "/": 191, "?": 191, "6": 54, "^": 54, "`": 192, "~": 192, "7": 55, "&": 55, "[": 219, "{": 219, "8": 56, "*": 56, "\\": 220, "|": 220, "9": 57, "(": 57, "]": 221, "}": 221, '"': 222, "'": 222, a: 65, b: 66, c: 67, d: 68, e: 69, f: 70, g: 71, h: 72, i: 73, j: 74, k: 75, l: 76, m: 77, n: 78, o: 79, p: 80, q: 81, r: 82, s: 83, t: 84, u: 85, v: 86, w: 87, x: 88, y: 89, z: 90, numbpad0: 96, numbpad1: 97, numbpad2: 98, numbpad3: 99, numbpad4: 100, numbpad5: 101, numbpad6: 102, numbpad7: 103, numbpad8: 104, numbpad9: 105, multiply: 106, "add": 107, subtract: 109, decimal: 110, divide: 111, f1: 112, f2: 113, f3: 114, f4: 115, f5: 116, f6: 117, f7: 118, f8: 119, f9: 120, f10: 121, f11: 122, f12: 123, backspace: 8, tab: 9, clear: 12, enter: 13, shift: 16, control: 17, alt: 18, "pause": 19, "break": 19, capslock: 20, esc: 27, spacebar: 32, pageup: 33, pagedown: 34, end: 35, home: 36, leftarrow: 37, uparrow: 38, rightarrow: 39, downarrow: 40, insert: 45, "delete": 46, help: 47, numlock: 144, screenlock: 145, "IME": 229};}
}
