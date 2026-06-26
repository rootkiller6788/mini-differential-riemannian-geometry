/-
# MiniGeodesics

Geodesic theory in Riemannian geometry with Lean 4:
geodesic curves, exponential map, Jacobi fields,
cut locus, conjugate points, geodesic flow,
comparison theorems, and applications.

## Sub-packages
- Core          — GeodesicPoint, RiemannianMetric, Geodesic, JacobiField, CutLocus
- Morphisms     — Isometries, GeodesicMorphisms, Coverings
- Constructions — Products, Submanifolds, Quotients, WarpedProducts
- Properties    — Completeness, Minimizing, Invariants
- Theorems      — HopfRinow, CartanHadamard, BonnetMyers, Synge, Comparison, MorseIndex, SecondVariation
- Examples      — Euclidean, Sphere, Hyperbolic, Projective, Surfaces, LieGroups
- Bridges       — ToMechanics, ToRelativity, ToOptimization, ToComputerGraphics
- Advanced      — MorseTheory, Ergodicity, CutLocusGeometry, Entropy, QuantumGeodesics
-/
import MiniGeodesics.Core.All
import MiniGeodesics.Morphisms.All
import MiniGeodesics.Constructions.All
import MiniGeodesics.Properties.All
import MiniGeodesics.Theorems.All
import MiniGeodesics.Examples.All
import MiniGeodesics.Bridges.All
import MiniGeodesics.Advanced.All
