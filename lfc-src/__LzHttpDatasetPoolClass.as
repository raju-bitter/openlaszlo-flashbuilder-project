package {
class __LzHttpDatasetPoolClass {
var _uid:uint = 0;var _p:Array = [];function get ($0:LzDelegate = null, $1:LzDelegate = null, $2:LzDelegate = null, $3:Boolean = false):LzDataset {
var $4:LzDataset;
if (this._p.length > 0) {
$4 = this._p.pop()
} else {
$4 = new LzDataset(null, {name: "LzHttpDatasetPool" + this._uid, type: "http", acceptencodings: $3});
this._uid++
};
if ($0 != null) {
$0.register($4, "ondata")
};
if ($1 != null) {
$1.register($4, "onerror")
};
if ($2 != null) {
$2.register($4, "ontimeout")
};
return $4
}function recycle ($0:LzDataset):void {
$0.setQueryParams(null);
$0.$lzc$set_postbody(null);
$0.clearRequestHeaderParams();
$0.ondata.clearDelegates();
$0.ontimeout.clearDelegates();
$0.onerror.clearDelegates();
$0.$lzc$set_data([]);
this._p.push($0)
}}
}
