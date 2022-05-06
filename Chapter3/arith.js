class PredicateSet {
  contains;
  constructor(characteristicFunction) {
    this.contains = characteristicFunction;
  }
}

const isSet = (x) => x.constructor.name === "Set";

const ZERO = new Set();
const TRUE = Symbol("true");
const FALSE = Symbol("false");

const PRIMITIVES = [ZERO, TRUE, FALSE];

const axiom1 = new PredicateSet((x) => PRIMITIVES.includes(x));

const succ = (x) => {
  if (!isSet(x)) throw new Error("Must be a set");
  return new Set(x).add(new Set(x));
};
const pred = (x) => x - 1;
const isZero = (x) => x === ZERO;

exports.arith = {
  ZERO,
  TRUE,
  FALSE,
  PRIMITIVES,
  succ,
  pred,
  axiom1,
};
