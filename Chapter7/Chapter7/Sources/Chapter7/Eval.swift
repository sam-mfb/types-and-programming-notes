//public func shiftTerm(_ term:Term, c: Int, d: Int)->Term {
//    switch term {
//    case let .tmVar(fi, k, contextLength):
//        let shiftedK = k<c ? k : k + d
//        return Term.tmVar(fi, shiftedK, contextLength+1)
//    case let .tmAbs(fi, hint, t1):
//        return Term.tmAbs(fi, hint, shiftTerm(t1, c:c+1, d:d))
//    case let .tmApp(fi, t1, t2):
//        return Term.tmApp(fi, shiftTerm(t1, c: c, d: d), shiftTerm(t2, c: c, d: d))
//    }
//}

public func termShift(_ term:Term, by d: Int)->Term {
    func walk(_ term:Term, c:Int)->Term {
        switch term {
        case let .tmVar(fi, k, contextLength):
            let shiftedK = k<c ? k : k + d
            return Term.tmVar(fi, shiftedK, contextLength+1)
        case let .tmAbs(fi, hint, t1):
            return Term.tmAbs(fi, hint, walk(t1, c:c+1))
        case let .tmApp(fi, t1, t2):
            return Term.tmApp(fi, walk(t1, c: c), walk(t2, c: c))
        }
    }
    return walk(term,c:0)
}

public func termSubst(_ term:Term, sub j:Int, with s:Term)->Term{
    func walk(_ term:Term, c:Int)->Term {
        switch term {
        case let .tmVar(_, k, _):
            if(k==j+c) {
                return termShift(s,by:c)
            }
            else { return term }
        case let .tmAbs(fi, hint, t1):
            return Term.tmAbs(fi, hint, walk(t1, c:c+1))
        case let .tmApp(fi, t1, t2):
            return Term.tmApp(fi, walk(t1, c: c), walk(t2, c: c))
        }
    }
    return walk(term,c:0)
}

// beta reduction 
public func termSubstTop(_ term:Term, with s:Term)->Term {
    let shiftedS = termShift(s, by: 1)
    let subbedTerm = termSubst(term, sub: 0, with: shiftedS)
    return termShift(subbedTerm, by: -1)
}
