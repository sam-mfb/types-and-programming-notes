const { arith } = require("./arith.js");

const { ZERO, TRUE, FALSE, succ } = arith;

it.each(arith.PRIMITIVES)("axiom1 inclusion: %s", (primitive) => {
  expect(arith.axiom1.contains(primitive)).toBe(true);
});

it.each([
  new Set().add(1),
  0,
  true,
  false,
  "hi",
  3,
  {},
  null,
  undefined,
  () => {},
])("axiom1 exclusion: %s", (primitive) => {
  expect(arith.axiom1.contains(primitive)).toBe(false);
});

it("counting", () => {
  const one = succ(ZERO);
  const two = succ(one);
  const three = succ(two);
  console.log({ one }, { two }, { three });
});
