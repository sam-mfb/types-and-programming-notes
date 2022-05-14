public func isNumericValue(_ t:Term)->Bool {
    switch t {
    case .TmZero(_):
        return true
    case .TmSucc(_, let t1):
       return isNumericValue(t1)
    case _:
        return false
    }
}

public func isValue(_ t: Term)->Bool {
    switch t {
    case .TmTrue(_), .TmFalse(_):
        return true
    case let x where isNumericValue(x):
        return true
    default:
        return false
    }
}

public func eval1(_ t: Term)throws -> Term {
    switch t {
    case .TmIf(_, .TmTrue(_),let t2, _):
        return t2
    case .TmIf(_, .TmFalse(_), _, let t3):
        return t3
    case .TmIf(let fi, let t1, let t2, let t3):
        let t1p = try eval1(t1)
        return .TmIf(fi,t1p,t2,t3)
    case .TmSucc(let fi, let t1):
        let t1p = try eval1(t1)
        return .TmSucc(fi,t1p)
    case .TmPred(_, .TmZero(_)):
        return .TmZero(Info())
    case .TmPred(_, .TmSucc(_, let nv)) where isNumericValue(nv):
        return nv
    case .TmPred(let fi, let t1):
        let t1p = try eval1(t1)
        return .TmPred(fi, t1p)
    case .TmIsZero(_, .TmZero(_)):
        return .TmTrue(Info())
    case .TmIsZero(_, .TmSucc(_, let nv)) where isNumericValue((nv)):
        return .TmFalse(Info())
    case .TmIsZero(let fi, let t1):
        let t1p = try eval1(t1)
        return .TmIsZero(fi, t1p)
    default:
        throw Exception.NoRuleApplies
    }
}

func eval(_ t: Term)->Term {
    var t1:Term = t
    do {
        while true {
            t1 = try eval1(t1)
        }
    } catch {
        return t1
    }
    return t1
}
