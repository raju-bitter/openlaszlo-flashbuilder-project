package {
  
        import flash.text.Font;
    public class LzFontManager {
static var fonts:Object = {};public static function addFont ($0:String, $1:Object, $2:Object, $3:Object, $4:Object):void {
var $5:Object = new Object();
$5.name = $0;
if ($1) {
new LzFont($5, $1, "plain")
};
if ($2) {
new LzFont($5, $2, "bold")
};
if ($3) {
new LzFont($5, $3, "italic")
};
if ($4) {
new LzFont($5, $4, "bolditalic")
};
LzFontManager.fonts[$0] = $5
}public static function getFont ($0:String, $1:String):LzFont {
if ($1 == null) {
$1 = "plain"
};
var $2:Array = $0.split(",");
if ($2.length > 0) {
for (var $3:int = 0;$3 < $2.length;$3++) {
$0 = $2[$3];
var $4:Object = LzFontManager.fonts[$0];
if ($4) {
return $4[$1]
}};
return null
} else {
var $4:Object = LzFontManager.fonts[$0];
if ($4) {
return $4[$1]
} else {
return null
}}}public static function addStyle ($0:LzFont, $1:String):LzFont {
if ($0.style == "bolditalic") {
return $0
} else if ($1 == "bold") {
if ($0.style == "italic") {
return $0.fontobject.bolditalic
} else {
return $0.fontobject.bold
}} else if ($1 == "italic") {
if ($0.style == "bold") {
return $0.fontobject.bolditalic
} else {
return $0.fontobject.italic
}} else if ($1 == "bolditalic") {
return $0.fontobject.bolditalic
};
return $0
}static var __clientFontNames:Object;static var __fontFamilyMap:Object = {"monospace": "_typewriter", "serif": "_serif", "sans-serif": "_sans"};static var __genericClientFontFamilyNames:Object = {"_typewriter": true, "_serif": true, "_sans": true};public static var __fontnameCacheMap:Object = {};static var __debugWarnedFonts:Object = {};public static function __convertFontName ($0:String):String {
while ($0.charAt(0) == " ") $0 = $0.slice(1);
while ($0.charAt($0.length - 1) == " ") $0 = $0.slice(0, $0.length - 1);
var $1:Object = LzFontManager.__fontFamilyMap;
if (typeof $1[$0] == "string") $0 = $1[$0];
return $0
}public static function __findMatchingFont ($0:String):String {
if (LzFontManager.__clientFontNames == null) {
LzFontManager.__clientFontNames = {};
var $1:Array = Font.enumerateFonts(true);
for (var $2:int = 0;$2 < $1.length;++$2) {
LzFontManager.__clientFontNames[$1[$2].fontName] = true
}};
var $3:String = null;
if ($0.indexOf(",") >= 0) {
var $4:Array = $0.split(",");
for (var $2:int = 0;$2 < $4.length;$2++) {
$3 = $4[$2] = LzFontManager.__convertFontName($4[$2]);
if (LzFontManager.__clientFontNames[$3] || LzFontManager.__genericClientFontFamilyNames[$3]) {
return $3
}}} else {
$3 = LzFontManager.__convertFontName($0)
};
return $3
}public static function __fontExists ($0:String):Boolean {
return LzFontManager.fonts[$0] != null || LzFontManager.__clientFontNames[$0] != null || LzFontManager.__genericClientFontFamilyNames[$0] != null || LzFontManager.__fontFamilyMap[$0] != null
}}
}
