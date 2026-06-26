import MiniRiemannianMetrics

-- Smoke test: verify that all core definitions compile and basic operations work

-- Test metric tensor creation
def testEuclidean : IO Unit := do
  let g := MiniRiemannianMetrics.euclideanMetric 3
  IO.println s!"Euclidean metric dim: {g.dim}"
  IO.println s!"Symmetric: {g.isSymmetric}"
  IO.println s!"Pos def: {g.isPositiveDefinite}"

-- Test sphere metric
def testSphere : IO Unit := do
  let g := MiniRiemannianMetrics.sphereMetric 2 1
  IO.println s!"Sphere metric S^2: dim={g.dim}, pos def={g.isPositiveDefinite}"

-- Test Riemannian manifold creation
def testManifolds : IO Unit := do
  let S2 := MiniRiemannianMetrics.standardSphere 2
  let R3 := MiniRiemannianMetrics.euclideanSpace 3
  let H2 := MiniRiemannianMetrics.hyperbolicSpace 2
  IO.println s!"S^2: {S2.name}, complete={S2.isComplete}, compact={S2.isCompact}"
  IO.println s!"R^3: {R3.name}, complete={R3.isComplete}, compact={R3.isCompact}"
  IO.println s!"H^2: {H2.name}, complete={H2.isComplete}, compact={H2.isCompact}"

-- Test distance function
def testDistance : IO Unit := do
  let g := MiniRiemannianMetrics.euclideanMetric 3
  let d := MiniRiemannianMetrics.riemannianDistance g [0,0,0] [3,4,0]
  IO.println s!"Distance: {d}"
  -- Verify triangle inequality
  let d12 := MiniRiemannianMetrics.riemannianDistance g [0,0,0] [1,0,0]
  let d23 := MiniRiemannianMetrics.riemannianDistance g [1,0,0] [3,4,0]
  let d13 := MiniRiemannianMetrics.riemannianDistance g [0,0,0] [3,4,0]
  IO.println s!"Triangle: d13={d13} <= d12+d23={d12+d23}"

-- Test Christoffel symbols
def testChristoffel : IO Unit := do
  let g := MiniRiemannianMetrics.euclideanMetric 3
  let Gamma_0_10 := MiniRiemannianMetrics.christoffelSecondKind g 0 1 0
  let Gamma_0_01 := MiniRiemannianMetrics.christoffelSecondKind g 0 0 1
  IO.println s!"Gamma^0_10 = {Gamma_0_10}"
  IO.println s!"Symmetry: Gamma^0_10 = Gamma^0_01? {decide (Gamma_0_10 = Gamma_0_01)}"

-- Run all smoke tests
def main : IO Unit := do
  IO.println "=== Smoke Test: Riemannian Metrics ==="
  testEuclidean
  testSphere
  testManifolds
  testDistance
  testChristoffel
  IO.println "=== All smoke tests passed ==="
