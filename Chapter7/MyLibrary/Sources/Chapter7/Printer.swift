func printTerm(_ term:Term, inContext context:Context)->String {
    switch term {
    case let .tmVar(_, idx, ctxCheck):
        if(context.length == ctxCheck) {
            return context.name(from: idx)
        } else {
            return "Bad index"
        }
    case let .tmAbs(_, hint, t1):
        let (newName, newCtx) = freshName(hint: hint, context: context)
        return "λ." + newName + "." + printTerm(t1, inContext: newCtx)
    case let .tmApp(_, t1, t2):
        return printTerm(t1,inContext: context) + printTerm(t2, inContext: context)
    }
}

func freshName(hint: String, context oldContext:Context)->(String, Context) {
    if(oldContext.includesName(hint)) {
        var revisedName:String
        var suffix:Int = 1
        repeat {
            revisedName = hint + "_\(suffix)"
            suffix += 1
        } while (oldContext.includesName(revisedName))
        return (revisedName, Context(oldContext, with: revisedName))
    }
    else {
        return (hint, Context(oldContext, with: hint))
    }
}
