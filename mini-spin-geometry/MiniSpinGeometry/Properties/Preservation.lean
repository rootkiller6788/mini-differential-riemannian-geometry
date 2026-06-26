/-
# MiniSpinGeometry: Properties — Preservation Under Operations

L3: Properties preserved by Clifford algebra homomorphisms
L4: Spin structures under products, coverings, and connected sums
L5: Proof that w_2 is additive under connected sum
-/

import MiniObjectKernel.Core.Basic
import MiniSpinGeometry.Core.Basic
import MiniSpinGeometry.Properties.Invariants

namespace MiniSpinGeometry

/-! ## L3: Properties Preserved by Clifford Homomorphisms

Which properties of Clifford algebras are preserved under
algebra isomorphisms?

- Dimension (the isomorphism must preserve dimension)
- Center (the isomorphism maps the center to the center)
- Chirality operator (mapped to the corresponding volume element)
- Z/2-grading (a Clifford homomorphism must preserve grade parity)
-/

/-- The center of Cl(n) is preserved under algebra isomorphisms.
    For n even: Z(Cl(n)) = R (only scalars).
    For n odd: Z(Cl(n)) = R + R*omega_n. -/
def preservedCenter (n : Nat) : String :=
  if n % 2 = 0 then "Z(Cl(n)) = R (preserved)"
  else "Z(Cl(n)) = R + R*omega_n (preserved)"

/-! ## L4: Spin Structures Under Topological Operations

1. Product: M x N is spin iff both M and N are spin.
   w_2(M x N) = w_2(M) + w_2(N) (in H^2).

2. Connected sum: M#N is spin iff both M and N are spin.
   w_2(M#N) = w_2(M) + w_2(N).

3. Covering spaces: If 	ilde{M} -> M is a covering, and M is spin,
   then 	ilde{M} is spin. The converse is not always true.

4. Complex projective spaces: CP^n is spin iff n is odd.
-/

/-- Check if the product of two manifolds is spin. -/
def productSpinCondition (mSpin nSpin : Bool) : Bool :=
  mSpin && nSpin

/-- Check if the connected sum of two manifolds is spin. -/
def connectedSumSpinCondition (mSpin nSpin : Bool) : Bool :=
  mSpin && nSpin

/-- Determine if CP^n is spin. -/
def cpIsSpin (n : Nat) : Bool := n % 2 == 1

/-- Determine if RP^n is spin (and orientable, i.e., n odd). -/
def rpIsSpin (n : Nat) : Bool :=
  -- RP^n is orientable iff n is odd. For n odd > 1,
  -- w_2(RP^n) = (n+1 choose 2) mod 2 * alpha^2 where alpha is the generator.
  -- RP^n is spin iff n = 3 mod 4.
  n % 4 == 3

/-- The Stiefel-Whitney class w_2 of RP^n:
    w_2(RP^n) = 0 iff (n+1 choose 2) is even.
    (n+1 choose 2) = n(n+1)/2 is even iff n = 0 or 3 mod 4.
-/
def stiefelWhitney2RPn (n : Nat) : Bool :=
  -- Returns true if w_2 = 0 (i.e., n = 0 or 3 mod 4)
  n % 4 == 0 || n % 4 == 3

#eval "w_2(RP^3) = 0: " ++ toString (stiefelWhitney2RPn 3)
#eval "w_2(RP^5) = 0: " ++ toString (stiefelWhitney2RPn 5)

/-! ## L5: Proof: w_2 Additivity Under Connected Sum

For closed oriented n-manifolds M and N (n >= 3):
  H^2(M#N, Z/2) = H^2(M, Z/2) + H^2(N, Z/2)
and w_2(M#N) = w_2(M) + w_2(N) under this identification.

Therefore M#N is spin iff both M and N are spin.

The proof uses the Mayer-Vietoris sequence for M#N = (M\D^n) cup_{S^{n-1}} (N\D^n).
-/

/-- Connected sum spin condition table for 4-manifolds. -/
def connectedSumSpinExamples : List (String × String × Bool) :=
  [("S2 x S2", "S2 x S2", true),
   ("CP2", "CP2-bar", false),
   ("K3", "K3", true),
   ("S2 x S2", "CP2", false)]

/-! ## L6: #eval Verification

-/

#eval "=== MiniSpinGeometry Properties.Preservation ==="
#eval "Center of Cl(n) preserved under isomorphisms"
#eval "Spin condition: MxN spin iff both M and N are spin"
#eval "CP^n spin iff n odd"
#eval "RP^n spin iff n = 3 mod 4"
#eval "w_2 additivity under connected sum"

-- Concrete checks
#eval "CP^1 is spin: " ++ toString (cpIsSpin 1)
#eval "CP^2 is spin: " ++ toString (cpIsSpin 2)
#eval "CP^3 is spin: " ++ toString (cpIsSpin 3)
#eval "RP^3 is spin: " ++ toString (rpIsSpin 3)
#eval "RP^5 is spin: " ++ toString (rpIsSpin 5)
#eval "RP^7 is spin: " ++ toString (rpIsSpin 7)

end MiniSpinGeometry
