import Foundation
import ArgumentParser

@main
struct primes_swift: ParsableCommand {
    @Option(name: [.customShort("c"), .long], help: "The maximum candidate to check for primes.")
    var maxCandidate: UInt?

    @Option(name: [.customShort("g"), .customLong("goal")], help: "The number of primes to search for.")
    var primeGoal: UInt = 1_000_000

    @Option(name: [.customShort("m"), .customLong("major")], help: "How often to report major statistics. Set to 0 to disable.")
    var majorInterval: UInt = 1_000_000

    @Option(name: [.customShort("n"), .customLong("minor")], help: "How often to report minor statistics. Set to 0 to disable.")
    var minorInterval: UInt = 10_000

    @Flag var verbose

    mutating func run() {

        var primes: [UInt] = [3]
        var majorTimer = Timer.init()
        var minorTimer = Timer.init()

        print("Searching for primes")
        let loopEnd = maxCandidate ?? UInt.max
        
        // var primes: [UInt] = [3]
        
        majorTimer.start()
        minorTimer.start()

        for candidate in stride(from: 5, to: loopEnd, by: 2) {
            if checkPrime(candidate: candidate) {
                primes.append(candidate)
                if(majorInterval != 0 && UInt(primes.count + 1) % majorInterval == 0) {
                    majorReport(indexOfLast: primes.count)
                }
                else if minorInterval != 0 && UInt(primes.count + 1) % minorInterval == 0 {
                    minorReport(indexOfLast: primes.count - 1)
                }
                if(primes.count >= primeGoal) {
                    break
                }
            }
        }

        func checkPrime(candidate: UInt) -> Bool {
        let sqrt: UInt = UInt(Float(candidate).squareRoot())

        for prime in primes {
            if candidate % prime == 0 {
                return false
            }
            if prime > sqrt { break }
        }
        return true
    }

        func minorReport(indexOfLast: Int) {
            if(minorInterval == 0) { return }
            // For Nth prime, print
            // N | prime | elapsed
            let nth = UInt(indexOfLast + 1) / minorInterval
            let prime = primes[indexOfLast]
            let timeMessage: String;
            if(minorTimer.elapsed() < 5.0) {
                timeMessage = "\(Int(minorTimer.elapsed() * 1000))ms"
            }
            else {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.maximumFractionDigits = 3
                let formattedValue: String = formatter.string(from: minorTimer.elapsed() as NSNumber) ?? "ERR"
                timeMessage = formattedValue + "s"
            }
            minorTimer.start()

            print("\(nth) | \(prime) | \(timeMessage)")
        }

        func majorReport(indexOfLast: Int) {
            if(majorInterval == 0) { return }
            let avg = Double(majorInterval) / majorTimer.elapsed()

            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 3
            let formattedTimer = formatter.string(from: majorTimer.elapsed() as NSNumber) ?? "ERR"
            let formattedAvg = formatter.string(from: avg as NSNumber) ?? "ERR"
            let formattedLast = numlang.getName(num: majorInterval)

            print("Last \(formattedLast) took \(formattedTimer) seconds")
            print("Average speed: \(formattedAvg) primes/second")
            print("N  | Prime | Time")
        }
    }
}
