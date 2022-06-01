import Chapter7

let context:Context = Context([])
let varTerm:Term = .tmVar(.blank, 1, 2)

printTerm(varTerm, inContext: context)

let absTerm:Term = .tmAbs(.blank, "x", varTerm)

printTerm(absTerm, inContext: context)


let context2:Context = Context(["a"])
let var2Term:Term = .tmVar(.blank, 0, 1)

let appTerm:Term = .tmApp(.blank, absTerm, var2Term)

printTerm(appTerm, inContext: context2)

printTerm(eval(appTerm, ctx:context2), inContext: context2)
