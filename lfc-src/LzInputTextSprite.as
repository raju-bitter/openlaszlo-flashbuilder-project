package {

        import flash.display.InteractiveObject;
        import flash.events.Event;
        import flash.events.FocusEvent;
        import flash.text.TextField;
        import flash.text.TextFormat;
        import flash.text.TextFieldType;
        import flash.events.FocusEvent;
        import flash.events.MouseEvent;
        import flashx.textLayout.events.CompositionCompleteEvent;

    public class LzInputTextSprite extends LzTextSprite {
function LzInputTextSprite ($0:LzView = null, $1:Object = null, $2:Boolean = false) {
super($0, null, $2);
this.password = $1 && $1.password ? true : false;
textfield.displayAsPassword = this.password
}var enabled:Boolean = true;var focusable:Boolean = true;var readReadonly:Boolean = false;public override function __initTextProperties ($0:Object):void {
super.__initTextProperties($0);
if (textfield is LzTLFTextField) {
this.html = true
} else {
this.html = false
};
textfield.addEventListener(Event.CHANGE, __onChanged);
textfield.addEventListener(FocusEvent.FOCUS_IN, __gotFocus);
textfield.addEventListener(FocusEvent.FOCUS_OUT, __lostFocus)
}var __cachedSelectionPos:int = 0;var __cachedSelectionSize:int = 0;function __cacheSelection ():void {
this.__cachedSelectionPos = textfield.selectionBeginIndex;
this.__cachedSelectionSize = textfield.selectionEndIndex - textfield.selectionBeginIndex
}override function getSelectionPosition ():int {
if (LFCApplication.stage.focus == this.textfield) {
return textfield.selectionBeginIndex
} else {
return __cachedSelectionPos
}}override function getSelectionSize ():int {
if (LFCApplication.stage.focus == this.textfield) {
return textfield.selectionEndIndex - textfield.selectionBeginIndex
} else {
return __cachedSelectionSize
}}public function gotFocus ():void {
if (LFCApplication.stage.focus === this.textfield) {
return
};
this.select();
LFCApplication.stage.focus = this.textfield
}function gotBlur ():void {
if (LFCApplication.stage.focus === this.textfield) {
LFCApplication.stage.focus = LFCApplication.stage
}}function select ():void {
var h = textfield.scrollH;
textfield.setSelection(0, textfield.text.length);
LzTimeKernel.setTimeout(function () {
textfield.scrollH = h
}, 0)
}function deselect ():void {
textfield.setSelection(0, 0)
}function __gotFocus ($0:FocusEvent):void {
if (owner) owner.inputtextevent("onfocus");
if (LFCApplication.stage.focus !== this.textfield) {
LzTimeKernel.setTimeout(this.updateStageFocus, 1)
}}private function updateStageFocus ():void {
LFCApplication.stage.focus = LFCApplication.stage.focus
}function __lostFocus ($0:FocusEvent):void {
__cacheSelection();
if ($0.relatedObject == null) {
if (owner) owner.inputtextevent("onblur")
}}function __onChanged ($0:Event):void {
this.text = this.textfield.text;
if (owner) owner.inputtextevent("onchange", this.text)
}public override function getText ():String {

        var pattern = /\r/g;
      ;
return this.textfield.text.replace(pattern, "\n")
}function setEnabled ($0:Boolean):void {
this.enabled = $0;
if (this.readReadonly) {
this.setFieldType(false)
} else {
this.setFieldType(this.enabled)
}}static function findSelection ():LzInputText {
var $0:InteractiveObject = LFCApplication.stage.focus;
if (($0 is TextField || $0 is LzTLFTextField) && $0.parent is LzInputTextSprite) {
return ($0.parent as LzInputTextSprite).owner
};
return null
}override function setSelection ($0:Number, $1:Number):void {
LFCApplication.stage.focus = this.textfield;
super.setSelection($0, $1)
}function setReadOnly ($0:Boolean):void {
this.readReadonly = $0;
this.setFieldType(!this.readReadonly)
}function setFieldType ($0:Boolean) {
if ($0) {
textfield.type = TextFieldType.INPUT
} else {
textfield.type = TextFieldType.DYNAMIC
};
textfield.defaultTextFormat = this.textformat
}}
}
