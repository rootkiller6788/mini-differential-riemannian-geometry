/-
# Main — MiniGeodesics

Entry point that prints package information.
-/

import MiniGeodesics

open MiniGeodesics

def main : IO Unit := do
  IO.println "══ mini-geodesics ══"
  IO.println "Geodesics Theory in Riemannian Geometry"
  IO.println ""
  IO.println "Modules:"
  IO.println "  Core:          Basic, Objects, Laws, Connections, JacobiFields, CutLocus, GeodesicFlow, DataTables"
  IO.println "  Morphisms:     Isometries, Hom, Coverings"
  IO.println "  Constructions: Products, Submanifolds, Quotients, WarpedProducts"
  IO.println "  Properties:    Completeness, Minimizing, Invariants"
  IO.println "  Theorems:      HopfRinow, CartanHadamard, BonnetMyers, Synge, Comparison, MorseIndex, SecondVariation"
  IO.println "  Examples:      Euclidean, Sphere, Hyperbolic, Projective, Surfaces, LieGroups"
  IO.println "  Bridges:       ToMechanics, ToRelativity, ToOptimization, ToComputerGraphics"
  IO.println "  Advanced:      MorseTheory, Ergodicity, CutLocusGeometry, Entropy, QuantumGeodesics"
  IO.println ""
  IO.println s!"Example geodesic point: {GeodesicPoint.simple 3}"
  IO.println s!"Example Riemannian metric: {RiemannianMetric.euclidean 3}"
  IO.println s!"Example geodesic: {Geodesic.trivial 3}"
  IO.println ""
  IO.println "══ End of mini-geodesics info ══"
