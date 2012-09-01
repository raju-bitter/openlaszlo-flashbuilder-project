package {
public class LzXMLParser {
public static function parseXML ($0:String, $1:Boolean, $2:Boolean):XML {
try {
XML.ignoreWhitespace = $1;
var $3:XML = XML($0);
$3.normalize();
if ($3.nodeKind() == "element") {
return $3
} else {
return null
}}
catch ($lzsc$e) {
if ($lzsc$e is Error) {
lz.$lzsc$thrownError = $lzsc$e
};
throw $lzsc$e
};
return null
}}
}
