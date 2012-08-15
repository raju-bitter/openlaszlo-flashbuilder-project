package {
  
import flash.display.*;
import flash.events.*;
import flash.utils.*;
import flash.text.*;
import flash.system.*;
import flash.net.*;
import flash.ui.*;
import flash.external.*;
public class LzPreloader extends MovieClip {
public function LzPreloader () {
var $0 = stage.loaderInfo.parameters.id;
try {
ExternalInterface.call("lz.embed.applications." + $0 + "._sendPercLoad", 0)
}
catch ($1) {};
stop();
root.loaderInfo.addEventListener(ProgressEvent.PROGRESS, loadProgress);
addEventListener(Event.ENTER_FRAME, enterFrame)
}
public function enterFrame ($0:Event):void {
if (framesLoaded == totalFrames) {
root.loaderInfo.removeEventListener(ProgressEvent.PROGRESS, loadProgress);
nextFrame();
var $1:Class = Class(loaderInfo.applicationDomain.getDefinition("LzSpriteApplication"));
if ($1) {
var $2:DisplayObject = DisplayObject(new $1());
if ($2) {
removeEventListener(Event.ENTER_FRAME, enterFrame);
stage.addChild($2);
stage.removeChild(this)
}}}}
private function loadProgress ($0:Event):void {
var $1:Number = Math.floor(root.loaderInfo.bytesLoaded / root.loaderInfo.bytesTotal * 100);
var $2 = stage.loaderInfo.parameters.id;
if ($2) {
try {
ExternalInterface.call("lz.embed.applications." + $2 + "._sendPercLoad", $1)
}
catch ($3) {}}}
}
}
