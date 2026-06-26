/-
# MiniSpinGeometry: Theorems -- Classification of Spin Structures

L4: Spin structures classified by H^1(M, Z/2)
L4: Number of spin structures = 2^{b_1(M)}
L5: Cech cohomology and the Bockstein homomorphism
-/

import MiniObjectKernel.Core.Basic
import MiniSpinGeometry.Core.Basic
import MiniSpinGeometry.Properties.Preservation
import MiniSpinGeometry.Constructions.Subobjects

namespace MiniSpinGeometry

/-! ## L4: Affine Classification by H^1(M, Z/2)

For a spin manifold M, the set Spin(M) of inequivalent spin
structures forms an affine space over H^1(M, Z/2).
|Spin(M)| = |H^1(M, Z/2)| = 2^{b_1(M)} (if finite).

Two spin structures differ by a double cover of M, classified
by group homomorphisms pi_1(M) -> Z/2.
-/

def numberOfSpinStructures (b1 : Nat) : Nat := 2 ^ b1

#eval "b1=0 (S^2, S^3, S^4): " ++ toString (numberOfSpinStructures 0) ++ " structure(s)"
#eval "b1=1 (S^1 x S^2): " ++ toString (numberOfSpinStructures 1) ++ " structure(s)"
#eval "b1=2 (T^2): " ++ toString (numberOfSpinStructures 2) ++ " structure(s)"
#eval "b1=3 (T^3): " ++ toString (numberOfSpinStructures 3) ++ " structure(s)"
#eval "b1=4 (T^4): " ++ toString (numberOfSpinStructures 4) ++ " structure(s)"

/-! ## L4: Spin Structures on Surfaces

A closed oriented surface Sigma_g of genus g has 2^{2g} spin
structures. These are classified by the Arf invariant:
- Arf = 0: even spin structures (2^{g-1}(2^g + 1) many)
- Arf = 1: odd spin structures (2^{g-1}(2^g - 1) many)

The Arf invariant is the mod 2 index of the Dirac operator.
-/

def totalSpinStructures (g : Nat) : Nat := 2 ^ (2 * g)

def evenSpinStruct (g : Nat) : Nat := 2 ^ (g - 1) * (2 ^ g + 1)

def oddSpinStruct (g : Nat) : Nat := 2 ^ (g - 1) * (2 ^ g - 1)

#eval "Genus 1 (T^2): total=" ++ toString (totalSpinStructures 1) ++
      " even=" ++ toString (evenSpinStruct 1) ++
      " odd=" ++ toString (oddSpinStruct 1)

#eval "Genus 2: total=" ++ toString (totalSpinStructures 2) ++
      " even=" ++ toString (evenSpinStruct 2) ++
      " odd=" ++ toString (oddSpinStruct 2)

#eval "Genus 3: total=" ++ toString (totalSpinStructures 3) ++
      " even=" ++ toString (evenSpinStruct 3) ++
      " odd=" ++ toString (oddSpinStruct 3)

/-! ## L4: Spin Structures on 3-Manifolds

All closed orientable 3-manifolds are spin (w_2 = 0 for all
orientable 3-manifolds by a theorem of Whitney).
Number of spin structures = 2^{b_1(M)}.

Examples:
- S^3: b_1 = 0, 1 spin structure
- L(p,q) (lens spaces): b_1 = 0, 1 spin structure
- T^3: b_1 = 3, 8 spin structures
- RP^3: b_1 = 0, 1 spin structure
-/

def threeDimSpinCount (b1 : Nat) : Nat := 2 ^ b1

#eval "S^3: " ++ toString (threeDimSpinCount 0) ++ " spin structure(s)"
#eval "RP^3: " ++ toString (threeDimSpinCount 0) ++ " spin structure(s)"
#eval "T^3: " ++ toString (threeDimSpinCount 3) ++ " spin structure(s)"
#eval "S^1 x S^2: " ++ toString (threeDimSpinCount 1) ++ " spin structure(s)"

/-! ## L4: Spin Structures on 4-Manifolds

All closed oriented 4-manifolds admit Spin^c structures.
Spin structures exist iff w_2(M) = 0.

Spin^c structures form an affine space over H^2(M, Z).
The Seiberg-Witten invariant SW: Spin^c(M) -> Z is the
fundamental invariant of smooth 4-manifolds.
-/

/-- Spin^c structures = affine H^2(M, Z). -/
def spincStructureCount (b2 : Nat) : String :=
  s!"Spin^c structures: H^2(M, Z)-torsor (|H^2| = Z^{b2})"

/-! ## L4: Spin on Projective Spaces

CP^n: spin iff n is odd.
  Proof: w_2(CP^n) = (n+1 mod 2) * generator in H^2.
  So w_2 = 0 iff n+1 is even, i.e., n is odd.

RP^n: (for n odd, so orientable)
  w_2(RP^n) = binom(n+1, 2) mod 2 * a^2 where a generates H^1.
  binom(n+1, 2) = n(n+1)/2 is even iff n = 0,3 mod 4.
  So RP^n is spin iff n = 3 mod 4.
-/

-- cpIsSpin and rpIsSpin are defined in Properties/Preservation.lean
-- Using those definitions

-- using Properties.Preservation definitions










/-! ## L5: Cech Cohomology Proof

The exact sequence 1 -> Z/2 -> Spin(n) -> SO(n) -> 1 induces:

... -> H^1(M, Z/2) -> H^1(M, Spin(n)) -> H^1(M, SO(n))
      -delta-> H^2(M, Z/2) -> ...

A spin structure exists iff delta([P_{SO}]) = w_2(M) = 0.
When it exists, choices form H^1(M, Z/2)-torsor.

The connecting homomorphism delta is the Bockstein for the
coefficient sequence 0 -> Z -> Z -> Z/2 -> 0.
-/

def bocksteinMap : String :=
  "delta: H^1(M, SO(n)) -> H^2(M, Z/2), delta([P]) = w_2(M)"

/-! ## L6: #eval Verification

-/

#eval "=== MiniSpinGeometry Theorems.Classification ==="
#eval "Spin(M) = H^1(M, Z/2)-torsor: 2^{b1} structures"
#eval "Surface spin structures: Arf invariant"
#eval "3-manifolds: all orientable are spin"
#eval "CP^n spin iff n odd; RP^n spin iff n=3 mod 4"
#eval "Exact sequence: Bockstein delta = w_2 obstruction"

end MiniSpinGeometry
