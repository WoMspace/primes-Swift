struct numlang {

    static func getName(num: UInt) -> String {
        let digits = num.description.count
        switch digits {
            case 3: return "hundred"
            case 4: return "thousand"
            case 5: return "ten thousand"
            case 6: return "hundred thousand"
            case 7: return "million"
            case 8: return "ten million"
            case 9: return "hundred million"
            case 10: return "billion"
            case 11: return "ten billion"
            case 12: return "hundred billion"
            case 13: return "trillion"
            case 14: return "ten trillion"
            case 15: return "hundred trillion"
            case 16: return "quadrillion"
            default: return "ERR"
        }
    }

    static func decimalPlaces(num: Double, places: Int) -> String {
        let digits: [Character] = [Character](num.description)
        var index = 0
        for ch in digits {
            if (ch == ".") {
                break
            }
            index += 1
        }

        // "1000"
        if(!digits.contains(".")) {
            return num.description
        }
        // num = "1000.0" but places = 2
        else if(index + places + 1 > digits.count) {
            let missingPlaces = index + places - digits.count
            var zeroes: String = ""
            for _ in 0...missingPlaces {
                zeroes += "0"
            }
            return digits + zeroes
        }
        else if(places == 0) {
            return String(digits[0...index - 1])
        }
        else {
            return String(digits[0...index + places])
        }
    }

}