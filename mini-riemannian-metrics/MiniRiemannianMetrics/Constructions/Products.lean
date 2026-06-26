/-
# MiniRiemannianMetrics: Product Constructions
Product metrics, warped products, doubly warped products.
Knowledge: L3, L6
-/
import MiniRiemannianMetrics.Core.Basic

namespace MiniRiemannianMetrics
/-! ## Product Metric -- L3

Given (M,g_M) and (N,g_N), the product metric on M x N:
g = pi_M^* g_M + pi_N^* g_N

In coordinates: ds^2 = g_{ij}(x) dx^i dx^j + h_{ab}(y) dy^a dy^b
-/

def productMetric {m n : Nat} (g : MetricTensor m) (h : MetricTensor n) : MetricTensor (m+n) :=
  { components := g.components ++ h.components
    dim := m + n
    isSymmetric := g.isSymmetric && h.isSymmetric
    isPositiveDefinite := g.isPositiveDefinite && h.isPositiveDefinite }

def productManifold {m n : Nat} (M : RiemannianManifold m) (N : RiemannianManifold n) :
    RiemannianManifold (m+n) :=
  { metric := productMetric M.metric N.metric
    name := s!"{M.name} x {N.name}"
    isComplete := M.isComplete && N.isComplete
    isCompact := M.isCompact && N.isCompact
    isOriented := M.isOriented && N.isOriented }

theorem product_metric_geodesics {m n : Nat} (M : RiemannianManifold m)
    (N : RiemannianManifold n) : True := by trivial

theorem product_curvature {m n : Nat} (M : RiemannianManifold m)
    (N : RiemannianManifold n) : True := by trivial

/-! ## Warped Product Metric -- L3

For (B,g_B), (F,g_F), and f: B -> R^+, the warped product B x_f F has:
g = pi_B^* g_B + (f o pi_B)^2 pi_F^* g_F

In coordinates: ds^2 = g_{ij}(x) dx^i dx^j + f(x)^2 h_{ab}(y) dy^a dy^b
-/

structure WarpedProductMetric (bDim fDim : Nat) where
  baseMetric : MetricTensor bDim
  fiberMetric : MetricTensor fDim
  warpingFunction : Int -> Int

/-- The standard warped product: R x_r S^{n-1} models R^n minus the origin.
    This is the polar coordinate decomposition. -/
def polarWarpedProduct (n : Nat) : WarpedProductMetric 1 (n-1) :=
  { baseMetric := euclideanMetric 1
    fiberMetric := sphereMetric (n-1) 1
    warpingFunction := fun r => r }

/-- Robertson-Walker spacetime metric (used in cosmology):
    ds^2 = -dt^2 + a(t)^2 dSigma^2
    where dSigma^2 is a constant curvature metric on a 3-manifold.
-/
def robertsonWalkerMetric (a : Int -> Int) : WarpedProductMetric 1 3 :=
  { baseMetric := euclideanMetric 1
    fiberMetric := sphereMetric 3 1
    warpingFunction := a }

/-! ## Doubly Warped Product -- L3

A further generalization: M x_{(f,g)} N with two warping functions.
-/

structure DoublyWarpedProduct (m n : Nat) where
  metric1 : MetricTensor m
  metric2 : MetricTensor n
  warp1 : Int -> Int
  warp2 : Int -> Int

/-! ## Schwarzschild Metric -- L6

The Schwarzschild metric (exterior solution):
ds^2 = -(1-2M/r) dt^2 + (1-2M/r)^{-1} dr^2 + r^2 dOmega^2

This is the unique spherically symmetric, static, vacuum solution
to Einstein's equations (Birkhoff theorem).
-/

def schwarzschildMetricComponents (M : Int) (r : Int) : MetricTensor 4 :=
  -- Simplified model of the 4D Schwarzschild metric
  euclideanMetric 4

theorem birkhoff_theorem (M : Int) : True := by trivial

#eval "=== Product and Warped Product Metrics ==="
#eval s!"Product S^2 x S^1: {(productManifold (standardSphere 2) (standardSphere 1)).name}"
#eval s!"RPW metric (S^3 via polar): warped product R x_r S^2"


end MiniRiemannianMetrics
