import Chapter7

let context:Context = Context(["a"])

let varTerm:Term = .tmVar(.blank, 0, 1)

printTerm(varTerm, inContext: context)

let identityTerm:Term = .tmAbs(.blank, "x", varTerm)

printTerm(identityTerm, inContext: Context([]))

let absTerm:Term = .tmAbs(.blank, "x", .tmApp(.blank,varTerm,varTerm))

printTerm(absTerm, inContext: Context([]))

let appTerm = Term.tmApp(.blank, absTerm, identityTerm)

printTerm(appTerm, inContext: Context([]))

printTerm(eval(appTerm,ctx:Context([])),inContext: Context([]))

