public struct Info {
    let file: String
    let position: Int
    
    public init() {
        self.file = ""
        self.position = 1
    }
}

public indirect enum Term : Equatable {
    //incomplete
    public static func == (lhs: Term, rhs: Term) -> Bool {
        switch(lhs,rhs){
        case (.TmFalse(_), .TmFalse(_)), (.TmTrue(_),.TmTrue(_)), (.TmZero(_), .TmZero(_)):
            return true
        case (.TmSucc(_, let a), .TmSucc(_, let b)) where isNumericValue(a) && isNumericValue(b):
           return a==b
        case (.TmPred(_, let a), .TmPred(_, let b)) where isNumericValue(a) && isNumericValue(b):
           return a==b
        default:
            return false
        }
    }
    
    case TmTrue(Info)
    case TmFalse(Info)
    case TmZero(Info)
    case TmIf(Info, Term, Term, Term)
    case TmSucc(Info, Term)
    case TmPred(Info,Term)
    case TmIsZero(Info, Term)
}

public enum Exception: Error {
    case NoRuleApplies
}
