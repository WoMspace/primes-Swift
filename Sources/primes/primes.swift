import ArgumentParser

@main
struct primes_swift: ParsableCommand {
    @Option(name: [.short, .long], help: "The maximum candidate to check for primes.")
    var maxCandidate: UInt?

    @Option(name: [.customShort("g"), .customLong("goal")], help: "The number of primes to search for. Setting this overrides --max-candidate.")
    var primeGoal: UInt = 10_000_000

    @Flag var verbose


    mutating func run() {
        print("Searching for primes")
        let loopEnd = maxCandidate ?? UInt.max
        
        var primes: [UInt] = [3]
        
        for candidate in stride(from: 5, to: loopEnd, by: 2) {
            if checkPrime(candidate: candidate, primes: primes) {
                primes.append(candidate)
                if((primes.count + 1) % 1_000_000 == 0) {
                    let n = (primes.count + 1) / 1_000_000
                    print("Found \(n) million primes.\nThe \(n)th million prime is \(primes.last!)")
                }
                else if verbose != 0 && (primes.count + 1) % 10_000 == 0 {
                    let tenThousand = primes.count / 10_000
                    print("\(tenThousand) | \(primes.last!)")
                }
            }
        }
    }

    func checkPrime(candidate: UInt, primes: [UInt]) -> Bool {
        let sqrt: UInt = UInt(Float(candidate).squareRoot())

        for prime in primes {
            if candidate % prime == 0 {
                return false
            }
            if prime > sqrt { break }
        }
        return true
    }
}
