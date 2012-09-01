package {

    import flash.utils.Timer;
  final class LzKernelTimer extends Timer {

    private static var idCounter :uint = 0;
    private static const MAX_POOL :int = 10;
    private static var timerPool :Array = [];

    /**
     * Use this method instead of the constructor to create an instance
     */
    public static function create () :LzKernelTimer {
        var timer:LzKernelTimer = timerPool.pop() || new LzKernelTimer();
        timer._timerID = ++idCounter;
        return timer;
    }

    /**
     * Allow timers to be pooled and reused later
     */
    public static function remove (timer:LzKernelTimer) :void {
        if (timerPool.length < MAX_POOL) {
            timerPool.push(timer);
        }
    }

    public function LzKernelTimer () {
        super(0);
    }

    private var _timerID :uint;
    public function get timerID () :uint {
        return this._timerID;
    }

    private var _closure :Function;
    public function get closure () :Function {
        return this._closure;
    }
    public function set closure (c:Function) :void {
        this._closure = c;
    }

    private var _arguments :Array;
    public function get arguments () :Array {
        return this._arguments;
    }
    public function set arguments (a:Array) :void {
        this._arguments = a;
    }
  ;}
}
