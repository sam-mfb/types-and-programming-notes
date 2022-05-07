class PredicateSet {
  contains;
  constructor(characteristicFunction) {
    this.contains = characteristicFunction;
  }
}

const isSet = (x) => x.constructor.name === "Set";

const zero = 0;
const TRUE = Symbol("true");
const FALSE = Symbol("false");

const PRIMITIVES = [zero, TRUE, FALSE];

const axioms = new PredicateSet((x) => PRIMITIVES.includes(x));

const succ = (x) => x + 1;

const pred = (x) => x - 1;

const inSet = (x) => {
  if (x < -500 || x > 500) return false;
  if (axioms.contains(x)) return true;
  if (inSet(succ(x))) return true;
  if (inSet(pred(x))) return true;
};

const isZero = (x) => x === zero;

exports.arith = {
  zero,
  TRUE,
  FALSE,
  PRIMITIVES,
  succ,
  pred,
  axioms,
  inSet,
};
