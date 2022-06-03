import Chapter7

let context:Context = Context(["a"])

let varTerm:Term = .tmVar(.blank, 0, 1)

printTerm(varTerm, inContext: context)

let identityTerm:Term = .tmAbs(.blank, "x", varTerm)

printTerm(identityTerm, inContext: .empty)

let absTerm:Term = .tmAbs(.blank, "x", .tmApp(.blank,varTerm,varTerm))

printTerm(absTerm, inContext: .empty)

let appTerm = Term.tmApp(.blank, absTerm, identityTerm)

printTerm(appTerm, inContext: .empty)

printTerm(eval(appTerm,ctx:.empty),inContext: .empty)

