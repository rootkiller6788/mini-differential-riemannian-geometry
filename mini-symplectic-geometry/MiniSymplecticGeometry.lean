/-
# MiniSymplecticGeometry

Symplectic Geometry formalization in Lean 4: symplectic linear algebra,
symplectic manifolds, Hamiltonian mechanics, Darboux theorem,
moment maps, Kähler geometry, and Floer homology.

## Sub-packages
- Core               — Symplectic vector spaces, forms, Hamiltonian vector fields
- Theorems           — Darboux-Moser, symplectic basis, linear algebra theorems
- Structures         — Poisson geometry, Lagrangian submanifolds
- ProofTechniques    — Multiple proof methods for symplectic results
- Examples           — Canonical symplectic manifolds with #eval verification
- Applications       — Classical mechanics, optics, celestial mechanics
- Advanced           — Moment maps, Kähler geometry, Floer homology
- Bridges            — Connections to linear algebra, differential geometry, physics
-/
import MiniSymplecticGeometry.Core.All
import MiniSymplecticGeometry.Theorems.All
import MiniSymplecticGeometry.Structures.All
import MiniSymplecticGeometry.ProofTechniques.All
import MiniSymplecticGeometry.Examples.All
import MiniSymplecticGeometry.Applications.All
import MiniSymplecticGeometry.Advanced.All
import MiniSymplecticGeometry.Bridges.All
