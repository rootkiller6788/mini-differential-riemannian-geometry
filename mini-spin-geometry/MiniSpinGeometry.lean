/-
# MiniSpinGeometry

Spin geometry — Clifford algebras, spin groups, spin representations,
spin structures, Dirac operators, and index theory.

## Sub-packages
- `Core`         — Clifford algebra, generators, relations
- `Morphisms`    — Algebra homomorphisms, periodicity isomorphisms
- `Constructions` — Pin/Spin groups, tensor products, spin structures
- `Properties`   — Invariants, chirality, volume element
- `Theorems`     — Bott periodicity, Atiyah-Singer, Weitzenböck
- `Examples`     — Spin structures on spheres, tori
- `Bridges`      — To algebra, topology, geometry, computation
-/

import MiniSpinGeometry.Core.Basic
import MiniSpinGeometry.Core.Laws
import MiniSpinGeometry.Core.Objects
import MiniSpinGeometry.Morphisms.Hom
import MiniSpinGeometry.Morphisms.Iso
import MiniSpinGeometry.Morphisms.Equiv
import MiniSpinGeometry.Constructions.Products
import MiniSpinGeometry.Constructions.Quotients
import MiniSpinGeometry.Constructions.Subobjects
import MiniSpinGeometry.Constructions.Universal
import MiniSpinGeometry.Properties.Invariants
import MiniSpinGeometry.Properties.Preservation
import MiniSpinGeometry.Properties.ClassificationData
import MiniSpinGeometry.Theorems.Basic
import MiniSpinGeometry.Theorems.Classification
import MiniSpinGeometry.Theorems.Main
import MiniSpinGeometry.Theorems.UniversalProperties
import MiniSpinGeometry.Examples.Standard
import MiniSpinGeometry.Examples.Counterexamples
import MiniSpinGeometry.Bridges.ToAlgebra
import MiniSpinGeometry.Bridges.ToTopology
import MiniSpinGeometry.Bridges.ToGeometry
import MiniSpinGeometry.Bridges.ToComputation
