import struct Foundation.Date

struct Timer {

    private var startTime: Date?

    mutating func start() {
        self.startTime = Date();
    }
    mutating func stop() {
        self.startTime = nil;
    }

    mutating func elapsed() -> Double {
        return -(self.startTime?.timeIntervalSinceNow ?? 0)
    }
}