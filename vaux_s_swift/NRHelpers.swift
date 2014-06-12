import Foundation


class NRMethodTimer {
    var timer: NRTimer

    init(methodName name:String, forObject context:AnyObject, ofCategory category:NRTraceType) {
        timer = NRTimer()

        NewRelic.startTracingMethod(Selector(name), object: context, timer: timer, category: category)
    }

    func exit() {
        NewRelic.endTracingMethodWithTimer(timer)
    }
}

