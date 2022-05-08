class PredicateSet {
  contains
  constructor(characteristicFunction) {
    this.contains = characteristicFunction
  }
}

const isSet = x => x.constructor.name === "Set"

const zero = 0
const TRUE = "true"
const FALSE = "false"

export const CONSTANTS = new Set([zero, TRUE, FALSE])

export const axioms = new PredicateSet(x => CONSTANTS.has(x))

const succ = x => x + 1

const pred = x => x - 1

const isZero = x => x === zero

const succTerm = x => `succ ${x}`
const predTerm = x => `pred ${x}`
const isZeroTerm = x => `isZero ${x}`
const ifTerm = (x, y, z) => `if ${x} then ${y} else ${z}`

export const sGenerator = s => {
  const newSet = new Set(CONSTANTS)
  for (let el of s) {
    newSet.add(succTerm(el))
    newSet.add(predTerm(el))
    newSet.add(isZeroTerm(el))
    for (let y of s) {
      for (let z of s) {
        newSet.add(ifTerm(el, y, z))
      }
    }
  }
  return newSet
}

export const sSize = s => 3 + s.size * 3 + s.size ** 3
