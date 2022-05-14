public struct Info {
    let file: String
    let position: Int
    
    public init() {
        self.file = ""
        self.position = 1
    }
}

public indirect enum Term {
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
