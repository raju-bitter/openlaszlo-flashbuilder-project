package {

        import flash.display.Sprite;
        import flashx.textLayout.container.TextContainerManager;
        import flashx.textLayout.elements.IConfiguration;
        import flash.events.ContextMenuEvent;
        import flash.events.FocusEvent;
        import flash.events.MouseEvent;
        import flash.events.TextEvent;
        import flash.events.Event;
        import flash.ui.ContextMenu;
        import flashx.undo.IUndoManager;
        import flashx.textLayout.edit.ISelectionManager;
        import flashx.textLayout.edit.IEditManager;
    public class LzTextContainerManager extends TextContainerManager {


        // Pointer back to the owner LzTLFTextField, so we can forward change events
        public var textfield:LzTLFTextField;


        // restrict entry of chars to anything in this regexp
        public var restrict:String = null;

        // max number of chars, an int value, 0 means unlimited
        public var maxChars:int = 0;

        public var password:Boolean = false;

        
        public function LzTextContainerManager(container:Sprite, configuration:IConfiguration, owner:LzTLFTextField) {
            super(container, configuration);
            this.textfield = owner;
        }


        override protected function createEditManager(undoManager:IUndoManager):IEditManager
        {
            //Debug.info("createEditManager LzTLFEditManager");
            return new LzEditManager(undoManager, textfield);
        }


        override public function textInputHandler(event:TextEvent):void {
            if (restrict == null || event.text.match(restrict)) {
                if ((maxChars == 0) || ((maxChars > 0) && (getText("\n").length < maxChars))) {
                    super.textInputHandler(event);
                }
            }
        }

    ;}
}
