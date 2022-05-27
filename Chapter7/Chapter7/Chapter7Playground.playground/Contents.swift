import Chapter7

let context:Context = Context(["x"])
let varTerm:Term = .tmVar(.blank, 0, 1)

printTerm(varTerm, inContext: context)

let absTerm = Term.tmAbs(.blank, "a", varTerm)
// fails because "x" is not shifted up
printTerm(absTerm, inContext: context)

// shift up context manually
let varTermUp = Term.tmVar(.blank,0,2)
let absTerm2 = Term.tmAbs(.blank, "a", varTermUp)
printTerm(absTerm2, inContext: context)

let appTerm = Term.tmApp(.blank, .tmVar(.blank, 0, 1), .tmVar(.blank, 0, 1))
printTerm(appTerm, inContext: context)

let appTerm2 = Term.tmApp(.blank, absTerm2, varTerm)
printTerm(appTerm2, inContext: context)

let ncTerm = Term.tmVar(.blank, 0, 1)
let blankCtx = Context.init([])
printTerm(ncTerm, inContext: blankCtx)
let ncAbsTerm = Term.tmAbs(.blank, "a", ncTerm)
printTerm(ncAbsTerm, inContext: blankCtx)

