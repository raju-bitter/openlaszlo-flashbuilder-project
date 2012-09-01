package {

        import flash.events.*;
        import flash.display.Sprite;
        import flash.events.TextEvent;
        import flash.events.KeyboardEvent;
        import flash.geom.Rectangle;
        import flashx.textLayout.operations.FlowOperation;

        import flashx.textLayout.edit.SelectionManager;
        import flash.ui.Mouse;

        import flashx.textLayout.container.ContainerController;
        import flashx.textLayout.elements.TextFlow;
        import flashx.textLayout.conversion.TextConverter;
        import flashx.textLayout.conversion.ConversionType;
        import flashx.textLayout.edit.EditManager;
        import flashx.undo.UndoManager;
        import flashx.undo.IUndoManager;
        import flash.events.MouseEvent;
    public class LzEditManager extends EditManager {


        public var textfield:LzTLFTextField;


        public function LzEditManager(undoManager:IUndoManager, owner:LzTLFTextField)
        {
            super(undoManager);
            this.textfield = owner;
            //Debug.info("LzEditManager constructor", owner);
        }

        // this handlesfires on any inserts and edit operations
        public override function  doOperation(op:FlowOperation):void {
                super.doOperation(op);
                textfield.__onChanged(op);
        }


        /*    public override function  textInputHandler(event:flash.events.TextEvent):void {
            super.textInputHandler(event);
            textfield.__onChanged(event);
            Debug.info(" textInputHandler", event);
        }
        */
    ;}
}
