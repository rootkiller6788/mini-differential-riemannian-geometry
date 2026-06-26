/-
# MiniHodgeTheory

Hodge Theory submodule — covering the Hodge decomposition theorem,
harmonic forms, Hodge star operator, Laplace-Beltrami operator,
and applications to topology and physics.

## Sub-packages
- `Core`         — Vector spaces, inner products, Hodge star, orientation
- `Morphisms`    — Linear maps, chain maps, quasi-isomorphisms
- `Constructions` — Direct sums, cohomology, subcomplexes
- `Properties`   — Betti numbers, Hodge diamond, Poincaré duality
- `Theorems`     — Hodge decomposition, Hodge theorem
- `Examples`     — Spheres, tori, projective spaces
- `Bridges`      — To algebra, topology, geometry, computation
-/

import MiniHodgeTheory.Core.Basic
import MiniHodgeTheory.Core.Laws
import MiniHodgeTheory.Core.Objects
import MiniHodgeTheory.Morphisms.Hom
import MiniHodgeTheory.Morphisms.Iso
import MiniHodgeTheory.Morphisms.Equiv
import MiniHodgeTheory.Constructions.Products
import MiniHodgeTheory.Constructions.Quotients
import MiniHodgeTheory.Constructions.Subobjects
import MiniHodgeTheory.Constructions.Universal
import MiniHodgeTheory.Properties.Invariants
import MiniHodgeTheory.Properties.Preservation
import MiniHodgeTheory.Properties.ClassificationData
import MiniHodgeTheory.Theorems.Basic
import MiniHodgeTheory.Theorems.Classification
import MiniHodgeTheory.Theorems.Main
import MiniHodgeTheory.Theorems.UniversalProperties
import MiniHodgeTheory.Examples.Standard
import MiniHodgeTheory.Examples.Counterexamples
import MiniHodgeTheory.Bridges.ToAlgebra
import MiniHodgeTheory.Bridges.ToTopology
import MiniHodgeTheory.Bridges.ToGeometry
import MiniHodgeTheory.Bridges.ToComputation
