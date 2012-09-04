package {
public final class LzAudioService {
var capabilities:* = LzSprite.capabilities;public static var LzAudio:LzAudioService;function LzAudioService () {
super()
}LzAudioService.LzAudio = new LzAudioService();function playSound ($0:String):void {
if (this.capabilities.audio) {
LzAudioKernel.playSound($0)
}}function stopSound ():void {
if (this.capabilities.audio) {
LzAudioKernel.stopSound()
}}function startSound ():void {
if (this.capabilities.audio) {
LzAudioKernel.startSound()
}}function getVolume ():Number {
if (this.capabilities.audio) {
return LzAudioKernel.getVolume()
};
return NaN
}function setVolume ($0:Number):void {
if (this.capabilities.audio) {
LzAudioKernel.setVolume($0)
}}function getPan ():Number {
if (this.capabilities.audio) {
return LzAudioKernel.getPan()
};
return NaN
}function setPan ($0:Number):void {
if (this.capabilities.audio) {
LzAudioKernel.setPan($0)
}}}
}
