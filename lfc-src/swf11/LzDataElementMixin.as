package {
interface LzDataElementMixin {
function insertBefore ($0, $1) ;function replaceChild ($0, $1) ;function removeChild ($0) ;function appendChild ($0) ;function hasChildNodes ():Boolean ;function cloneNode ($0:Boolean = false) ;function getAttr ($0:String):String ;function setAttr ($0:String, $1:String):String ;function removeAttr ($0:String):String ;function hasAttr ($0:String):Boolean ;function getFirstChild () ;function getLastChild () ;function getElementsByTagName ($0:String):Array ;function serialize ():String ;function handleDocumentChange ($0:String, $1, $2:int, $3:Object? = null):void ;function __LZdoLock ($0:LzDatapath):void ;function __LZdoUnlock ($0:LzDatapath):void ;}
}
