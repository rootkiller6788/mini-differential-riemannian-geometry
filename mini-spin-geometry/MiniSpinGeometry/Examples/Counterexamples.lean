/-
# MiniSpinGeometry: Examples -- Counterexamples

L6: Non-spin manifolds and obstructions
L6: #eval verification of w_2 != 0 cases
L7: Why spin matters: physical and geometric consequences
-/

import MiniObjectKernel.Core.Basic
import MiniSpinGeometry.Core.Basic
import MiniSpinGeometry.Theorems.Classification

namespace MiniSpinGeometry

/-! ## L6: CP^2 -- The Simplest Non-Spin 4-Manifold

CP^2 is oriented but NOT spin.
w_2(CP^2) = x (the generator of H^2(CP^2, Z/2) = Z/2).

Consequences:
- No Dirac operator can be defined on CP^2
- No spinor fields exist on CP^2
- Must use Spin^c structures instead (CP^2 does admit Spin^c)
- A-hat(CP^2) = -1/8 not integral (violates integrality theorem)
-/

#eval "=== CP^2: The simplest non-spin 4-manifold ==="
#eval "w_2(CP^2) = x != 0 (x generates H^2 = Z/2)"
#eval "CP^2 is NOT spin"
#eval "CP^2 IS Spin^c (as are all oriented 4-manifolds)"
#eval "Can define Spin^c Dirac operator, but not spin Dirac"

/-! ## L6: CP^n for Even n

All even-dimensional complex projective spaces are NOT spin:
  w_2(CP^n) = (n+1) mod 2 * x  =>  w_2 = x != 0 for even n

Examples: CP^2, CP^4, CP^6, ... are NOT spin.
Only CP^odd (CP^1=S^2, CP^3, CP^5, ...) are spin.
-/

#eval "=== CP^n spin condition ==="
#eval "CP^2: " ++ toString (cpIsSpin 2) ++ " (w_2 = x != 0)"
#eval "CP^4: " ++ toString (cpIsSpin 4) ++ " (w_2 = x != 0)"
#eval "CP^6: " ++ toString (cpIsSpin 6) ++ " (w_2 = x != 0)"
#eval "CP^8: " ++ toString (cpIsSpin 8) ++ " (w_2 = x != 0)"
#eval "CP^1=S^2: " ++ toString (cpIsSpin 1) ++ " (spin!)"
#eval "CP^3: " ++ toString (cpIsSpin 3) ++ " (spin!)"

/-! ## L6: RP^5 -- Orientable but NOT Spin

RP^5 is an orientable 5-manifold (RP^n orientable iff n odd).
But RP^5 is NOT spin: w_2(RP^5) = binom(6,2) mod 2 * a^2 = 1*a^2 != 0.

RP^3 and RP^7 are spin (w_2 = 0 since binom(4,2)=6=0 mod 2
and binom(8,2)=28=0 mod 2).
-/

#eval "=== RP^n spin condition ==="
#eval "RP^3: spin? " ++ toString (rpIsSpin 3) ++ " (w_2 = 0, binom(4,2)=6=0 mod 2)"
#eval "RP^5: spin? " ++ toString (rpIsSpin 5) ++ " (w_2 != 0, binom(6,2)=15=1 mod 2)"
#eval "RP^7: spin? " ++ toString (rpIsSpin 7) ++ " (w_2 = 0, binom(8,2)=28=0 mod 2)"
#eval "RP^11: spin? " ++ toString (rpIsSpin 11) ++ " (w_2 = 0?)"

-- Check w_2 formula: binom(n+1, 2) mod 2 for RP^n
#eval "binom(4,2) mod 2 = " ++ toString ((4*3/2) % 2) ++ " (RP^3, expect 0)"
#eval "binom(6,2) mod 2 = " ++ toString ((6*5/2) % 2) ++ " (RP^5, expect 1)"
#eval "binom(8,2) mod 2 = " ++ toString ((8*7/2) % 2) ++ " (RP^7, expect 0)"

/-! ## L6: SU(3)/SO(3) -- Homogeneous Non-Spin Space

The homogeneous space M = SU(3)/SO(3) (the Wu manifold) is a
5-manifold that is NOT spin (w_2 != 0).
It is a classic counterexample in spin geometry:
H^*(SU(3)/SO(3)) = Z[e]/(e^3) with deg e = 2, and w_2 = e.
-/

#eval "=== SU(3)/SO(3) Wu manifold ==="
#eval "dim = 5, oriented, NOT spin"
#eval "w_2 = e != 0 (e generates H^2)"
#eval "H^1 = 0, so no spin structures even if it were spin"

/-! ## L6: The Importance of w_2

The second Stiefel-Whitney class w_2 is the complete obstruction
to a spin structure on an oriented manifold.

w_2 = 0  =>  M admits a spin structure
w_2 != 0 =>  M does NOT admit a spin structure

w_2 is additive:
  w_2(M x N) = w_2(M) + w_2(N)  (in H^2(M) + H^2(N))
  w_2(M # N) = w_2(M) + w_2(N)  (by Mayer-Vietoris)

This makes w_2 a computable obstruction.
-/

/-! ## L7: Physical Consequences of Non-Spin

1. No fermions: Spinor fields cannot exist on non-spin manifolds.
   CP^2 cannot support fermionic matter without a Spin^c structure.

2. Instanton physics: The moduli space of instantons on CP^2
   has different properties due to the lack of spin structure.

3. Anomaly cancellation: In string theory, the worldsheet must
   be spin for consistent fermion propagation (GSO projection).

4. Index theorem fails: The A-hat genus is not integral on CP^2,
   reflecting that no Dirac operator exists.
-/

#eval "=== Why spin matters in physics ==="
#eval "1. Fermions need spin structure (spin bundles)"
#eval "2. Anomalies: path integral phase ambiguity without spin"
#eval "3. String worldsheet: must be spin (GSO projection)"
#eval "4. A-hat integrality: fails for non-spin (CP^2: A-hat = -1/8)"

/-! ## L6: Manifolds that are Spin^c but NOT Spin

All oriented 4-manifolds are Spin^c. But not all are spin.

Examples:
- CP^2: Spin^c, NOT spin
- S^2 x S^2: Spin, Spin^c
- K3 surface: Spin, Spin^c
- Enriques surface: NOT spin, NOT Spin^c

Spin^c structures form an affine space over H^2(M, Z).
This is much richer than spin structures (over H^1(M, Z/2)).
-/

#eval "=== Spin vs Spin^c ==="
#eval "All oriented 4-manifolds are Spin^c"
#eval "Spin condition: w_2 = 0 (much more restrictive)"
#eval "Spin^c structures: affine H^2(M, Z)"
#eval "Spin structures: affine H^1(M, Z/2) (fewer choices)"

end MiniSpinGeometry
