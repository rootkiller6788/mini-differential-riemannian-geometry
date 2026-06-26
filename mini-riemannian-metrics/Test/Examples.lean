import MiniRiemannianMetrics

-- Example tests: verify canonical examples

def testCurvatureInvariants : IO Unit := do
  IO.println "=== Curvature Invariants ==="
  let S2 := MiniRiemannianMetrics.standardSphere 2
  let R3 := MiniRiemannianMetrics.euclideanSpace 3
  let H2 := MiniRiemannianMetrics.hyperbolicSpace 2
  IO.println s!"S^2: complete={S2.isComplete}, compact={S2.isCompact}, oriented={S2.isOriented}"
  IO.println s!"R^3: complete={R3.isComplete}, compact={R3.isCompact}, oriented={R3.isOriented}"
  IO.println s!"H^2: complete={H2.isComplete}, compact={H2.isCompact}, oriented={H2.isOriented}"

def testKillingFields : IO Unit := do
  IO.println "=== Killing Vector Fields ==="
  let kS2 := MiniRiemannianMetrics.killingFieldCount 2 "S"
  let kR2 := MiniRiemannianMetrics.killingFieldCount 2 "R"
  let kH2 := MiniRiemannianMetrics.killingFieldCount 2 "H"
  IO.println s!"S^2: {kS2} Killing fields (SO(3))"
  IO.println s!"R^2: {kR2} Killing fields (E(2))"
  IO.println s!"H^2: {kH2} Killing fields (SO(2,1))"

def testKoszulFormula : IO Unit := do
  IO.println "=== Koszul Formula ==="
  let k := MiniRiemannianMetrics.koszulFormula 1 2 3 4 5 6
  IO.println s!"Koszul(1,2,3,4,5,6) = {k}"

def testSpaceForms : IO Unit := do
  IO.println "=== Space Forms ==="
  let modelPos := MiniRiemannianMetrics.modelSpacePositiveCurvature 2 1 (by omega)
  let modelZero := MiniRiemannianMetrics.modelSpaceZeroCurvature 2
  let modelNeg := MiniRiemannianMetrics.modelSpaceNegativeCurvature 2 (-1) (by omega)
  IO.println s!"K>0: {modelPos.name}"
  IO.println s!"K=0: {modelZero.name}"
  IO.println s!"K<0: {modelNeg.name}"

def main : IO Unit := do
  testCurvatureInvariants
  testKillingFields
  testKoszulFormula
  testSpaceForms
  IO.println "=== All example tests completed ==="
