package {

      import flash.display.Sprite;
      import flash.media.Sound;
      import flash.media.SoundChannel;
      import flash.media.SoundMixer;
      import flash.media.SoundTransform;
    class LzAudioKernel {
static function playSound ($0:String, $1:LzSprite = null):void {
if ($1 == null) {
if (LzAsset.isSoundAsset($0)) {
var $2:Sound = new (LzResourceLibrary[$0]["assetclass"])() as Sound;
$2.play()
}} else {
$1.setResource($0)
}}static function stopSound ($0:LzSprite = null):void {
if ($0 == null) {
SoundMixer.stopAll()
} else {
$0.stop()
}}static function startSound ($0:Sprite = null):void {}static function getSoundObject ($0:LzSprite):* {
return $0 ? ($0.soundChannel ? $0.soundChannel : $0) : SoundMixer
}static function getVolume ($0:LzSprite = null):Number {
return getSoundObject($0).soundTransform.volume * 100
}static function setVolume ($0:Number, $1:LzSprite = null):void {
var $2:* = getSoundObject($1);
var $3:SoundTransform = $2.soundTransform;
$3.volume = ($0 < 0 ? 0 : ($0 > 100 ? 100 : $0)) / 100;
$2.soundTransform = $3
}static function getPan ($0:LzSprite = null):Number {
return getSoundObject($0).soundTransform.pan * 100
}static function setPan ($0:Number, $1:LzSprite = null):void {
var $2:* = getSoundObject($1);
var $3:SoundTransform = $2.soundTransform;
$3.pan = ($0 < -100 ? -100 : ($0 > 100 ? 100 : $0)) / 100;
$2.soundTransform = $3
}}
}
