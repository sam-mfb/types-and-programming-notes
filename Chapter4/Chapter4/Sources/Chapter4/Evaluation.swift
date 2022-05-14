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
