import { CONSTANTS, axioms, sGenerator, sSize } from "./arith"

it.each([...CONSTANTS])("axiom1 inclusion: %s", primitive => {
  expect(axioms.contains(primitive)).toBe(true)
})

it.each([
  new Set().add(1),
  true,
  false,
  "hi",
  3,
  {},
  null,
  undefined,
  () => {}
])("axioms exclusion: %s", primitive => {
  expect(axioms.contains(primitive)).toBe(false)
})

it("generate terms", () => {
  let s1 = sGenerator(new Set())
  expect(s1.size).toBe(sSize(new Set()))
  let s2 = sGenerator(s1)
  expect(s2.size).toBe(39)
  let s3 = sGenerator(s2)
  expect(s3.size).toBe(59439)
})
