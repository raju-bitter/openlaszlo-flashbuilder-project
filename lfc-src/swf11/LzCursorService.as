package {
public final class LzCursorService extends LzEventable {
public static var LzCursor:LzCursorService;public function LzCursorService () {
super()
}LzCursorService.LzCursor = new LzCursorService();function showHandCursor ($0:Boolean):void {
LzMouseKernel.showHandCursor($0)
}function setCursorGlobal ($0:String):void {
LzMouseKernel.setCursorGlobal($0)
}function lock ():void {
LzMouseKernel.lock()
}function unlock ():void {
LzMouseKernel.unlock()
}function restoreCursor ():void {
LzMouseKernel.restoreCursor()
}}
}
