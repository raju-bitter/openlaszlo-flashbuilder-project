package {

        import flash.utils.getQualifiedSuperclassName;
    final class LzAsset {
private static var BAD_ASSET:String = "bad asset";private static var BITMAP_ASSET:String = "mx.core::BitmapAsset";private static var BUTTON_ASSET:String = "mx.core::ButtonAsset";private static var BYTEARRAY_ASSET:String = "mx.core::ByteArrayAsset";private static var FONT_ASSET:String = "mx.core::FontAsset";private static var MOVIECLIP_ASSET:String = "mx.core::MovieClipAsset";private static var MOVIECLIPLOADER_ASSET:String = "mx.core::MovieClipLoaderAsset";private static var SPRITE_ASSET:String = "mx.core::SpriteAsset";private static var TEXTFIELD_ASSET:String = "mx.core::TextFieldAsset";private static var SOUND_ASSET:String = "mx.core::SoundAsset";public static function getAssetType ($0:String):String {
var $1:Object = LzResourceLibrary[$0];
if ($1 != null) {
var $2:String = $1["assettype"];
if ($2 == null) {
var $3:* = $1["assetclass"];
if ($3 is Class) {
$2 = getQualifiedSuperclassName($3)
} else {
$3 = $1["frames"] && $1["frames"][0];
if ($3 is Class) {
$2 = getQualifiedSuperclassName($3)
} else {
$2 = BAD_ASSET
}};
$1["assettype"] = $2
};
return $2
};
return null
}public static function isBitmapAsset ($0:String):Boolean {
return getAssetType($0) == BITMAP_ASSET
}public static function isFontAsset ($0:String):Boolean {
return getAssetType($0) == FONT_ASSET
}public static function isMovieClipAsset ($0:String):Boolean {
return getAssetType($0) == MOVIECLIP_ASSET
}public static function isMovieClipLoaderAsset ($0:String):Boolean {
return getAssetType($0) == MOVIECLIPLOADER_ASSET
}public static function isSoundAsset ($0:String):Boolean {
return getAssetType($0) == SOUND_ASSET
}}
}
