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

}