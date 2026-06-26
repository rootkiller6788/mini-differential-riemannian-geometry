/-
# MiniSpinGeometry: Examples -- Standard Spin Manifolds

L6: Spin structures on spheres, tori, projective spaces
L6: #eval verification of spin condition
L7: Applications to physics and geometry
-/

import MiniObjectKernel.Core.Basic
import MiniSpinGeometry.Core.Basic
import MiniSpinGeometry.Core.Objects
import MiniSpinGeometry.Theorems.Classification

namespace MiniSpinGeometry

/-! ## L6: S^n -- Spheres

All spheres S^n are spin for all n.
Proof: w_2(S^n) = 0 since H^2(S^n, Z/2) = 0 for n != 2,
and for n=2, S^2 = CP^1 which is spin.

Spin structures: unique for all n (H^1(S^n, Z/2) = 0).
-/

#eval "=== S^n spin structures ==="
#eval "S^1: 2 spin structures (periodic and antiperiodic boundary conditions)"
#eval "S^2: 1 spin structure"
#eval "S^3: 1 spin structure (H^1 = 0)"
#eval "S^4: 1 spin structure"
#eval "S^n (n>=2): 1 spin structure"

/-! ## L6: T^n -- Tori

The n-torus T^n = (S^1)^n is spin for all n.
b_1(T^n) = n, so number of spin structures = 2^n.

Spin structures correspond to choices of periodic/antiperiodic
boundary conditions in each circle direction.
-/

#eval "=== T^n spin structures ==="
#eval "T^1 = S^1: 2^1 = 2 spin structures"
#eval "T^2: 2^2 = 4 spin structures"
#eval "T^3: 2^3 = 8 spin structures"
#eval "T^4: 2^4 = 16 spin structures"

/-! ## L6: Surfaces of Genus g

Closed oriented surface Sigma_g:
- Always spin (w_2 = 0 in dimension 2)
- Number of spin structures = 2^{2g}
- Arf invariant distinguishes even/odd structures
-/

#eval "=== Surface spin structures ==="
#eval "S^2 (g=0): " ++ toString (totalSpinStructures 0) ++ " structure(s)"
#eval "T^2 (g=1): " ++ toString (totalSpinStructures 1) ++ " spin structures"
#eval "g=2: " ++ toString (totalSpinStructures 2) ++ " spin structures"
#eval "g=3: " ++ toString (totalSpinStructures 3) ++ " spin structures"
#eval "g=4: " ++ toString (totalSpinStructures 4) ++ " spin structures"

#eval "Even/odd breakdown for g=2:"
#eval "  Even (Arf=0): " ++ toString (evenSpinStruct 2)
#eval "  Odd (Arf=1): " ++ toString (oddSpinStruct 2)

/-! ## L6: Projective Spaces

CP^n: spin iff n is odd.
  CP^1 = S^2: spin (1 structure)
  CP^3: spin (1 structure, H^1 = 0)
  CP^2, CP^4, CP^6, ...: NOT spin

HP^n: spin for all n (w_2 = 0 for all quaternionic projective spaces)

RP^n (n odd, orientable):
  RP^3: spin (1 structure)
  RP^7: spin (1 structure)
  RP^5, RP^9, ...: NOT spin (orientable but w_2 != 0)
-/

#eval "=== Projective spaces ==="
#eval "CP^1=S^2 spin: " ++ toString (cpIsSpin 1)
#eval "CP^2 spin: " ++ toString (cpIsSpin 2)
#eval "CP^3 spin: " ++ toString (cpIsSpin 3)
#eval "CP^4 spin: " ++ toString (cpIsSpin 4)
#eval "CP^5 spin: " ++ toString (cpIsSpin 5)
#eval "RP^3 spin: " ++ toString (rpIsSpin 3)
#eval "RP^5 spin: " ++ toString (rpIsSpin 5)
#eval "RP^7 spin: " ++ toString (rpIsSpin 7)

/-! ## L6: Lie Groups

Every compact Lie group is spin.
Simply connected compact Lie groups (SU(n), Spin(n), Sp(n), G_2, F_4, E_6, E_7, E_8):
  always simply connected => unique spin structure.

Non-simply-connected: U(n) (pi_1 = Z), SO(n) (pi_1 = Z/2 for n>=3)
  have multiple spin structures if w_2 = 0.
-/

#eval "=== Lie groups ==="
#eval "SU(2)=S^3: spin, 1 structure"
#eval "SO(3)=RP^3: spin, pi_1=Z/2"
#eval "U(2): spin, pi_1=Z, 2 spin structures"
#eval "G_2: spin, simply connected, 1 structure"

/-! ## L7: Physics Applications

Spin structures appear in:
1. Fermions on curved spacetime: spinor fields require spin structure
2. String theory: worldsheet spin structures (GSO projection)
3. Topological insulators: spin structures classify topological phases
4. Quantum Hall effect: spin^c structures on Brillouin zone
5. Supergravity: spin structures constrain consistent theories
-/

#eval "=== Physics applications ==="
#eval "1. Fermions on curved manifolds need spin structure"
#eval "2. String theory GSO projection = choice of spin structure"
#eval "3. Topological insulators: 10-fold way = Bott periodic table"
#eval "4. Quantum Hall: Spin^c structure on magnetic Brillouin zone"
#eval "5. Supergravity: Spin(1,10) for M-theory"

/-! ## L7: Geometry Applications

1. Positive scalar curvature: spin obstructions via Dirac index
2. Einstein metrics: Lichnerowicz formula and scalar curvature
3. Holonomy groups: Berger's list includes Spin(7) and G_2
4. Calabi-Yau manifolds: SU(n) holonomy => spin (n odd)
5. Special holonomy: Spin(7)-manifolds are Ricci-flat
-/

#eval "=== Geometry applications ==="
#eval "1. PSC obstructions via Dirac index (Lichnerowicz)"
#eval "2. Einstein metrics and the Lichnerowicz formula"
#eval "3. Spin(7) holonomy: exceptional holonomy manifolds"
#eval "4. G_2 manifolds: 7-dimensional with G_2 holonomy"
#eval "5. Calabi-Yau: SU(3) => spin, used in string compactification"

end MiniSpinGeometry
