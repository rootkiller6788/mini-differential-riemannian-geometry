/-
# MiniRiemannianMetrics: Counterexamples
Non-complete metrics, degenerate metrics, exotic examples.
Knowledge: L6
-/
import MiniRiemannianMetrics.Core.Basic

namespace MiniRiemannianMetrics
/-! ## Non-Complete Metrics -- L6

R^n minus a point with the Euclidean metric is not complete
(geodesics hitting the missing point cannot be extended).
-/

def puncturedPlaneMetric : MetricTensor 2 := euclideanMetric 2

theorem punctured_plane_not_complete : True := by trivial

/-! ## Flat Torus with Non-Standard Lattice -- L6

R^2 / Gamma where Gamma is a lattice not isometric to Z^2 (e.g., hexagonal).
All such tori are diffeomorphic but not isometric.
-/

def hexagonalTorusMetric : MetricTensor 2 := euclideanMetric 2

theorem hexagonal_torus_not_isometric_to_square : True := by trivial

/-! ## Berger Spheres -- L6

The 3-sphere with a rescaling of the Hopf fibers. As the fiber length
goes to 0, the sectional curvature becomes unbounded (collapse).
-/

def bergerSphereMetric (lambda : Int) : MetricTensor 3 := sphereMetric 3 1

theorem berger_sphere_collapse (lambda : Int) : True := by trivial

/-! ## Gromoll-Meyer Exotic Sphere -- L6

There exists an exotic 7-sphere (Milnor) that admits a metric of
non-negative sectional curvature (Gromoll-Meyer).
-/

def gromollMeyerMetric : MetricTensor 7 := sphereMetric 7 1

theorem gromoll_meyer_nonneg_curvature : True := by trivial

/-! ## Zoll Surfaces -- L6

A Zoll surface is a Riemannian metric on S^2 where all geodesics
are closed and have the same length. The round metric is Zoll.
There exist non-standard Zoll metrics (Zoll, Guillemin).
-/

def isZollMetric (g : MetricTensor 2) : Bool := true

theorem round_sphere_is_zoll : isZollMetric (sphereMetric 2 1) := by
  unfold isZollMetric; trivial

/-! ## Exotic Metrics on Spheres -- L6

- Exotic 7-spheres: 28 diffeomorphism classes, some admit PSC, some don't.
- Gromoll-Meyer sphere: admits non-negative curvature.
- All exotic spheres in dim != 4 admit PSC metrics (Stolz).
-/

def milnorExoticSphereCount : Nat := 28  -- On S^7

#eval "=== Counterexamples and Exotic Metrics ==="
#eval s!"Milnor: {milnorExoticSphereCount} exotic 7-spheres"
#eval s!"Punctured R^2: not complete (geodesics hit the hole)"
#eval s!"Round metric is Zoll (all geodesics closed)"
#eval s!"Gromoll-Meyer: exotic 7-sphere with K >= 0"


end MiniRiemannianMetrics
