func isNumericValue(_ t:Term)->Bool {
    switch t {
    case .TmZero(_):
        return true
    case .TmSucc(_, let t1):
       return isNumericValue(t1)
    case _:
        return false
    }
}

func isValue(_ t: Term)->Bool {
    switch t {
    case .TmTrue(_), .TmFalse(_):
        return true
    case let x where isNumericValue(x):
        return true
    default:
        return false
    }
}

