import Chapter7

let context:Context = Context([])
let varTerm:Term = .tmVar(.blank, 1, 2)

printTerm(varTerm, inContext: context)

let absTerm:Term = .tmAbs(.blank, "x", varTerm)

printTerm(absTerm, inContext: context)

let absTerm2:Term = .tmAbs(.blank, "y", .tmApp(.blank, varTerm, varTerm))

printTerm(termSubstTop(absTerm, with: .tmApp(.blank, varTerm, varTerm)), inContext: Context(["a"]))
