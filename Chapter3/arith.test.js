const { arith } = require("./arith.js");

const { zero, TRUE, FALSE, succ, pred } = arith;

it.each(arith.PRIMITIVES)("axiom1 inclusion: %s", (primitive) => {
  expect(arith.axioms.contains(primitive)).toBe(true);
});

it.each([
  new Set().add(1),
  true,
  false,
  "hi",
  3,
  {},
  null,
  undefined,
  () => {},
])("axioms exclusion: %s", (primitive) => {
  expect(arith.axioms.contains(primitive)).toBe(false);
});

it("inSet", () => {
  console.log(arith.inSet(3));
});
