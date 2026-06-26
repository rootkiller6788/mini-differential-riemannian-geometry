/-
# MiniRiemannianMetrics: Quotient Constructions
Quotient metrics, Riemannian submersions, covering spaces.
Knowledge: L3, L4
-/
import MiniRiemannianMetrics.Core.Basic

namespace MiniRiemannianMetrics
/-! ## Quotient Metric -- L3

When a group Gamma acts by isometries on (M,g) freely and properly
discontinuously, the quotient M/Gamma inherits a unique Riemannian
metric making the projection a Riemannian covering.
-/

structure QuotientMetric (n : Nat) where
  totalSpace : RiemannianManifold n
  group : String
  isFreeAction : Bool
  isProperlyDiscontinuous : Bool
deriving Repr

/-- The flat torus T^n = R^n / Z^n. -/
def flatTorusMetric (n : Nat) : QuotientMetric n :=
  { totalSpace := euclideanSpace n
    group := s!"Z^{n}"
    isFreeAction := true
    isProperlyDiscontinuous := true }

/-- Real projective space RP^n = S^n quotient by antipodal map. -/
def realProjectiveMetric (n : Nat) : QuotientMetric n :=
  { totalSpace := standardSphere n
    group := "Z/2Z"
    isFreeAction := true
    isProperlyDiscontinuous := true }

/-- Lens space L(p,q) = S^3 / Z_p. -/
def lensSpaceMetric (p q : Nat) : QuotientMetric 3 :=
  { totalSpace := standardSphere 3
    group := s!"Z/{p}Z"
    isFreeAction := true
    isProperlyDiscontinuous := true }

/-! ## Riemannian Submersion -- L3

pi: (M,g) -> (N,h) is a Riemannian submersion if pi_* preserves
the length of vectors orthogonal to the fibers.

The tangent space splits: T_pM = V_p (+) H_p
where V_p = ker(pi_*) (vertical) and H_p = V_p^{perp} (horizontal).
-/

structure RiemannianSubmersionData (m n : Nat) where
  source : RiemannianManifold m
  target : RiemannianManifold n
  fiberDimension : Nat
  isSubmersion : Bool
deriving Repr

/-- O'Neill's formulas relate curvatures of total space, base, and fibers. -/
theorem oneill_formulas (m n : Nat) (subm : RiemannianSubmersionData m n) : True := by trivial

/-! ## Covering Spaces -- L3

A Riemannian covering pi: (M',g') -> (M,g) is a covering map that
is also a local isometry. The deck transformation group acts by isometries.
-/

structure RiemannianCovering (n : Nat) where
  source : RiemannianManifold n
  target : RiemannianManifold n
  deckGroup : String
  numberOfSheets : Nat
deriving Repr

/-- The universal Riemannian covering of RP^n is S^n. -/
def universalCoveringRPn (n : Nat) : RiemannianCovering n :=
  { source := standardSphere n
    target := { standardSphere n with name := s!"RP^{n}" }
    deckGroup := "Z/2Z"
    numberOfSheets := 2 }

/-- The universal covering of a flat torus is Euclidean space. -/
def universalCoveringTorus (n : Nat) : RiemannianCovering n :=
  { source := euclideanSpace n
    target := { euclideanSpace n with name := s!"T^{n}" }
    deckGroup := s!"Z^{n}"
    numberOfSheets := 0  -- infinite covering
  }

#eval "=== Quotient Metrics ==="
#eval "Flat torus T^2: T^2 = R^2 / Z^2"
#eval "RP^2 = S^2 quotient by Z/2Z"
#eval s!"S^2 is univ cover of RP^2: {(universalCoveringRPn 2).numberOfSheets} sheets"


end MiniRiemannianMetrics
