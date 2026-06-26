import MiniRiemannianMetrics

-- Regression test: verify key theorems and properties

def testDistanceAxioms : IO Unit := do
  IO.println "=== Distance Function Axioms ==="
  let g := MiniRiemannianMetrics.euclideanMetric 3
  let d := MiniRiemannianMetrics.riemannianDistance g
  let p := [0,0,0]
  let q := [3,4,0]
  let r := [1,1,0]
  -- Non-negativity
  have h_nonneg : 0 <= d p q := MiniRiemannianMetrics.riemannianDistance_nonneg g p q
  -- Symmetry
  have h_symm : d p q = d q p := MiniRiemannianMetrics.riemannianDistance_symm g p q
  -- Triangle inequality
  have h_tri : d p r <= d p q + d q r := MiniRiemannianMetrics.riemannianDistance_triangle g p q r
  IO.println s!"Non-negativity: d(p,q)={d p q} >= 0"
  IO.println s!"Symmetry: d(p,q)={d p q} = d(q,p)={d q p}"
  IO.println s!"Triangle: d(p,r)={d p r} <= d(p,q)+d(q,r)={d p q + d q r}"

def testMetricProperties : IO Unit := do
  IO.println "=== Metric Properties ==="
  have h_sym := MiniRiemannianMetrics.euclidean_is_symmetric 3
  have h_pos := MiniRiemannianMetrics.euclidean_is_pos_def 3
  IO.println s!"Euclidean metric: symmetric=true, positive definite=true"

def testChristoffelSymmetry : IO Unit := do
  IO.println "=== Christoffel Symmetry ==="
  let g := MiniRiemannianMetrics.euclideanMetric 3
  have h_symm : MiniRiemannianMetrics.christoffelSecondKind g 0 1 0 = MiniRiemannianMetrics.christoffelSecondKind g 1 0 0 :=
    MiniRiemannianMetrics.christoffel_symmetry g 0 1 0
  IO.println s!"Gamma^0_01 = Gamma^0_10: proved"

def testProductMetric : IO Unit := do
  IO.println "=== Product Metrics ==="
  let M := MiniRiemannianMetrics.productManifold
    (MiniRiemannianMetrics.standardSphere 2)
    (MiniRiemannianMetrics.standardSphere 1)
  IO.println s!"S^2 x S^1: name={M.name}, dim={M.metric.dim}"

def main : IO Unit := do
  IO.println "=== Regression Tests ==="
  testDistanceAxioms
  testMetricProperties
  testChristoffelSymmetry
  testProductMetric
  IO.println "=== All regression tests passed ==="
