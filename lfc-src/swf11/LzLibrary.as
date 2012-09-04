package {

    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import flash.events.Event;
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
    class LzLibrary extends LzNode {
static var tagname:String = "import";static var attributes:Object = new LzInheritedHash(LzNode.attributes);var loaded:Boolean = false;var loading:Boolean = false;var href:String;var stage:String = "late";function $lzc$set_stage ($0:String):void {
this.stage = $0
}var onload:LzDeclaredEventClass = LzDeclaredEvent;function LzLibrary ($0:LzNode? = null, $1:Object? = null, $2:Array? = null, $3:Boolean = false) {
super($0, $1, $2, $3)
}function $lzc$set_href ($0:String):void {
this.href = $0
}override function construct ($0, $1) {
this.stage = $1.stage;
super.construct($0, $1);
LzLibrary.libraries[$1.name] = this
}override function init () {
super.init();
if (this.stage == "late") {
this.load()
}}override function destroy () {
super.destroy()
}static var libraries:Object = {};static function findLibrary ($0:String):LzLibrary {
return LzLibrary.libraries[$0]
}override function toString () {
return "Library " + this.href + " named " + this.name
}public var loader:Loader = null;function load ():void {
if (this.loading || this.loaded) {
return
};
this.loading = true;
var $0:LzURL = lz.Browser.getBaseURL();
$0.file = this.href;
var $1:URLRequest = new URLRequest($0.toString());
$1.method = URLRequestMethod.GET;
this.loader = new Loader();
var $2:LoaderInfo = loader.contentLoaderInfo;
$2.addEventListener(Event.COMPLETE, handleLoadComplete);
this.loader.load($1)
}public function handleLoadComplete ($0:Event):void {
var $1:Object = $0.target.content;
$1.exportClassDefs(null);
this.libapp = $1
}var libapp:Object;function loadfinished ():void {
this.loading = false;
if (this.onload.ready) this.onload.sendEvent(true)
}static function stripQueryString ($0:String):String {
if ($0.indexOf("?") > 0) {
$0 = $0.substring(0, $0.indexOf("?"))
};
return $0
}static function __LZsnippetLoaded ($0:String):void {
$0 = LzLibrary.stripQueryString($0);
var $1:LzLibrary = null;
var $2:Object = LzLibrary.libraries;
for (var $3:String in $2) {
var $4 = LzLibrary.stripQueryString($2[$3].href);
if ($4 == $0) {
$1 = $2[$3];
break
}};
if ($1 == null) {
Debug.error("could not find library with href", $0)
} else {
$1.loaded = true;
$1.parent.__LzLibraryLoaded($1.name)
}}}
}
