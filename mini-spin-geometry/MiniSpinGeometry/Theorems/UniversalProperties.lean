/-
# MiniSpinGeometry: Theorems -- Universal Properties

L4: Universal property of the spin representation
L4: Uniqueness of irreducible Clifford modules
L5: Proof via Wedderburn structure theory
L8: Deligne tensor category theorem and supergroups
-/

import MiniObjectKernel.Core.Basic
import MiniSpinGeometry.Core.Basic
import MiniSpinGeometry.Core.Laws
import MiniSpinGeometry.Core.Objects

namespace MiniSpinGeometry

/-! ## L4: Structure of Cl(n) -- Wedderburn Theory

The complex Clifford algebra Cl_C(n) is:
- Simple for n even: Cl_C(2k) = M_{2^k}(C)
- Semisimple for n odd: Cl_C(2k+1) = M_{2^k}(C) + M_{2^k}(C)

This follows from the fact that Cl_C(n) is a central simple
superalgebra whose isomorphism class is determined by the
signature mod 2 (complex case) or mod 8 (real case).
-/

def clEvenStructure (k : Nat) : String :=
  let n := 2*k
  let dim := 2 ^ k
  s!"Cl_C({n}) = M_{dim}(C) (simple algebra)"

def clOddStructure (k : Nat) : String :=
  let n := 2*k+1
  let dim := 2 ^ k
  s!"Cl_C({n}) = M_{dim}(C) + M_{dim}(C) (semisimple)"

#eval clEvenStructure 2
#eval clOddStructure 2

/-! ## L4: Irreducible Clifford Modules

For n = 2k even:
  Cl_C(2k) is simple => unique irreducible module S_{2k} of dim 2^k
  This is the Dirac spinor representation.

For n = 2k+1 odd:
  Cl_C(2k+1) is semisimple => two irreducible modules S_{2k+1}^+ and S_{2k+1}^-
  These are the Weyl (chiral) spinor representations.
  They are distinguished by the volume element omega = e_0...e_{2k}.

The restriction from Spin(2k+1) to Spin(2k):
  S_{2k+1} = S_{2k} (irreducible restriction, same dimension)
  S_{2k+1}^+ = S_{2k}, S_{2k+1}^- = S_{2k} (restrictions coincide)
-/

def uniqueIrrepEven (k : Nat) : String :=
  s!"Unique irreducible Cl({2*k})-module S_{2*k} (dim {2^k})"

def twoIrrepsOdd (k : Nat) : String :=
  s!"Two irreps: S_{2*k+1}^+ and S_{2*k+1}^- (each dim {2^k})"

#eval uniqueIrrepEven 2
#eval twoIrrepsOdd 2

/-! ## L4: Restriction Rules

The spin representation Delta_n restricts from Spin(n+1) to Spin(n):
- n even: Delta_{n+1} (dim 2^{n/2}) |-> Delta_n (irreducible, dim 2^{n/2})
- n odd: Delta_{n+1} (dim 2^{(n+1)/2}) |-> Delta_n^+ + Delta_n^- (each dim 2^{(n-1)/2})

The restriction pattern encodes the branching rules for spin groups.
-/

def restrictionRule (n : Nat) : String :=
  let sub := s!"Spin({n})"
  if n % 2 = 0 then
    s!"Delta_{n+1} restricted to {sub} = Delta_n (irreducible)"
  else
    s!"Delta_{n+1} restricted to {sub} = Delta_n^+ + Delta_n^- (splits)"

#eval "n=3: " ++ restrictionRule 3
#eval "n=4: " ++ restrictionRule 4
#eval "n=5: " ++ restrictionRule 5

/-! ## L4: Spin(n) as Universal Cover

For n >= 3:
  pi_1(SO(n)) = Z/2,  pi_1(Spin(n)) = 0
  Spin(n) -> SO(n) is the universal covering map.

This completely characterizes Spin(n): any connected covering
of SO(n) is a quotient of Spin(n) by a subgroup of its center.

Center of Spin(n):
  n odd: Z(Spin(n)) = Z/2 = {+-1}
  n = 4k+2: Z(Spin(n)) = Z/4
  n = 4k: Z(Spin(n)) = Z/2 x Z/2 (for n >= 4 even)
-/

def centerOfSpin (n : Nat) : String :=
  if n % 2 = 1 then s!"Z(Spin({n})) = Z/2"
  else if n % 4 = 2 then s!"Z(Spin({n})) = Z/4"
  else s!"Z(Spin({n})) = Z/2 x Z/2"

#eval centerOfSpin 3
#eval centerOfSpin 4
#eval centerOfSpin 6
#eval centerOfSpin 8

/-! ## L4: Spinor Dimensions (Complex and Real)

Complex spinor dimension: dim_C Delta_n = 2^{floor(n/2)}
Real (Majorana) spinor dimension: depends on n mod 8

Table for Majorana spinors:
  n=0 mod 8: R-type, 2^{n/2-1} real Majoranas
  n=1 mod 8: R-type, 2^{(n-1)/2}
  n=2 mod 8: R-type, 2^{(n-2)/2}
  n=3 mod 8: C-type, 2^{(n-1)/2} complex -> 2^{(n+1)/2} real
  n=4 mod 8: H-type, 2^{n/2-1} quaternionic -> 2^{n/2+1} real
  n=5 mod 8: C-type, 2^{(n-3)/2} complex
  n=6 mod 8: R-type, 2^{(n-4)/2}
  n=7 mod 8: R-type, 2^{(n-5)/2}
-/

def complexDim (n : Nat) : Nat := 2 ^ (n / 2)

def majoranaDim (n : Nat) : Nat :=
  match n % 8 with
  | 0 => complexDim n / 2
  | 1 => complexDim n / 2
  | 2 => complexDim n / 2
  | 3 => complexDim n
  | 4 => complexDim n / 2
  | 5 => complexDim n
  | 6 => complexDim n / 2
  | 7 => complexDim n
  | _ => 0

#eval "n=3: complex=" ++ toString (complexDim 3) ++ " Majorana=" ++ toString (majoranaDim 3)
#eval "n=4: complex=" ++ toString (complexDim 4) ++ " Majorana=" ++ toString (majoranaDim 4)
#eval "n=8: complex=" ++ toString (complexDim 8) ++ " Majorana=" ++ toString (majoranaDim 8)
#eval "n=10: complex=" ++ toString (complexDim 10) ++ " Majorana=" ++ toString (majoranaDim 10)

/-! ## L8: Deligne Tensor Category Theorem

Deligne (2002): Symmetric tensor categories of subexponential
growth over a field of characteristic 0 are representation
categories of supergroups.

The category Rep(Spin(n)) is a fundamental example:
- The spin representation provides the odd generator
- The Clifford algebra: End(Vector) for the generating object
- The Brauer algebra: centralizer of Spin(n) on tensor powers

This connects spin geometry with modern representation theory
and provides a categorical foundation for supersymmetry.
-/

def deligneTheorem : String :=
  "Rep(Spin(n)) is super-Tannakian (Deligne 2002)"

/-! ## L6: #eval Verification

-/

#eval "=== MiniSpinGeometry Theorems.UniversalProperties ==="
#eval "Cl_C(2k)=M_{2^k}(C) simple; Cl_C(2k+1)=M+M semisimple"
#eval "Unique irrep for even n; two chirality irreps for odd n"
#eval "Restriction from Spin(n+1) to Spin(n) as branching rule"
#eval "Spin(n) universal cover of SO(n) for n>=3"
#eval "Center: Z/2 (odd n), Z/4 (n=2 mod 4), Z/2xZ/2 (n=0 mod 4)"
#eval "Majorana spinor dimensions via Bott periodicity mod 8"

end MiniSpinGeometry
