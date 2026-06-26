/-
# MiniRiemannianMetrics

Riemannian metric theory in Lean 4: metric tensors, Riemannian manifolds,
Levi-Civita connection, curvature tensors, and fundamental theorems
(Koszul formula, Myers, Bishop-Gromov).

## Sub-packages
- Core         — RiemannianMetric, MetricTensor, MusicalIso, VolumeForm
- Morphisms    — Isometries, conformal maps, metric equivalences
- Constructions — Product metrics, warped products, submanifold metrics
- Properties   — Curvature invariants, classification data
- Theorems     — Fundamental theorem, Myers, Synge, comparison geometry
- Examples     — Euclidean, spherical, hyperbolic, Schwarzschild metrics
- Bridges      — Physics (GR), geometry, analysis, topology
- Advanced     — Ricci flow, Einstein metrics, Kähler metrics
-/
import MiniRiemannianMetrics.Core.All
import MiniRiemannianMetrics.Morphisms.All
import MiniRiemannianMetrics.Constructions.All
import MiniRiemannianMetrics.Properties.All
import MiniRiemannianMetrics.Theorems.All
import MiniRiemannianMetrics.Examples.All
import MiniRiemannianMetrics.Bridges.All
import MiniRiemannianMetrics.Advanced.All
