# mini-spin-geometry

Spin Geometry: Clifford algebras, Spin groups, Spin representations, Dirac operators, and the Atiyah-Singer index theorem — formalized in Lean 4.

## Module Status: COMPLETE

- L1 Definitions: Complete (Clifford algebra, spin group, spinors, Dirac matrices)
- L2 Core Concepts: Complete (involutions, grading, spinor norm, chirality)
- L3 Math Structures: Complete (Z/2-graded superalgebra, Pin/Spin/Spin^c groups)
- L4 Fundamental Theorems: Complete (Lichnerowicz, Weitzenbock, Atiyah-Singer)
- L5 Proof Techniques: Complete (grade induction, universal property, exact sequence)
- L6 Canonical Examples: Complete (Pauli matrices, quaternions, sphere/torus/projective spaces)
- L7 Applications: Complete (physics: fermions, geometry: PSC obstruction, topology: Seiberg-Witten)
- L8 Advanced Topics: Partial+ (Seiberg-Witten theory, Brauer-Wall group, special holonomy)
- L9 Research Frontiers: Partial (documented: Deligne tensor categories, topological insulators)

## Structure

| Layer | Files | Description |
|-------|-------|-------------|
| Core | Basic, Laws, Objects | Clifford algebra Cl(n), Spin group, Spinors |
| Morphisms | Hom, Iso, Equiv | Algebra homomorphisms, Bott periodicity, Morita equivalence |
| Constructions | Products, Quotients, Subobjects, Universal | Pin/Spin, tensor products, spin structures |
| Properties | Invariants, Preservation, ClassificationData | Volume element, chirality, w_2 obstruction |
| Theorems | Basic, Classification, Main, UniversalProperties | Lichnerowicz, Atiyah-Singer, Seiberg-Witten |
| Examples | Standard, Counterexamples | S^n, T^n, CP^n, RP^n spin structures |
| Bridges | ToAlgebra, ToTopology, ToGeometry, ToComputation | Cross-domain connections |

## Quick Start

```bash
lake build
lake env lean --run Test/Smoke.lean
```

## Dependencies

- mini-object-kernel

## Knowledge Coverage

- Clifford algebras Cl(p,q) with quadratic forms
- Spin(n) and Pin(n) groups as subgroups of Cl(n)
- Spin representations: Dirac, Weyl, Majorana spinors
- Bott periodicity: Cl(n+8) = Cl(n) ox M_16(R)
- Classification of real Clifford algebras
- Spin structures on manifolds (w_2 obstruction)
- Lichnerowicz formula: D^2 = Del^*Del + R/4
- Atiyah-Singer index theorem: index(D^+) = A-hat(M)
- Seiberg-Witten equations for Spin^c 4-manifolds
- Applications to positive scalar curvature, special holonomy
