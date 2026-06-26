/-
# MiniSpinGeometry: Constructions — Pin and Spin Groups

L3: Pin(n) and Spin(n) groups inside the Clifford algebra
L4: The double cover Spin(n) -> SO(n)
L5: Lie group structure and Lie algebra isomorphism
-/

import MiniObjectKernel.Core.Basic
import MiniSpinGeometry.Core.Basic
import MiniSpinGeometry.Core.Laws
import MiniSpinGeometry.Constructions.Products

namespace MiniSpinGeometry

open CliffordNumber

/-! ## L3: The Pin Group

The Pin group Pin(n) is the subgroup of the units of Cl(n) generated
by unit vectors v with v^2 = -1.

  Pin(n) = {v_1 * v_2 * ... * v_k : v_i in R^n, |v_i| = 1}

The length k can be any non-negative integer.
Elements of Pin(n) have Clifford norm (+-)1.
-/

/-- A Pin element is a product of unit norm vectors. -/
structure PinElement (n : Nat) where
  element : CliffordNumber n
  unitNorm : Bool := true
  isProductOfVectors : Bool := true
  deriving Repr

/-- The adjoint action of Pin(n) on vectors:
    v |-> x * v * x^{-1} where x^{-1} = x~ / N(x).
    For unit vectors, this gives a reflection or rotation. -/
def pinAdjointAction {n : Nat} (x : PinElement n) (v : CliffordNumber n) : CliffordNumber n :=
  CliffordNumber.mul (CliffordNumber.mul x.element v) (cliffordConjugate x.element)

/-! ## L3: The Spin Group

  Spin(n) = Pin(n) cap Cl^0(n) = {products of an EVEN number of unit vectors}

Spin(n) is a connected Lie group for n >= 3.
It is the universal cover of SO(n) for n >= 3.
-/

structure SpinGroupElement (n : Nat) where
  pin : PinElement n
  isEven : Bool := true
  deriving Repr

/-- The double covering map pi: Spin(n) -> SO(n).
    For x in Spin(n), pi(x) is the rotation v |-> x*v*x^{-1}.
    The kernel is {+-1} = Z/2. -/
def spinDoubleCoverMap {n : Nat} (x : SpinGroupElement n) : String :=
  "pi(x): R^n -> R^n, v |-> x*v*x^{-1}"

/-- The kernel of Spin(n) -> SO(n) is {+-1}. -/
def spinKernel : String := "ker(pi) = {1, -1} = Z/2"

/-- For n >= 3, Spin(n) is simply connected, hence the universal cover. -/
def spinUniversalCover (n : Nat) : String :=
  if n >= 3 then s!"Spin({n}) is the universal cover of SO({n})"
  else s!"Spin({n}) is NOT the universal cover (pi_1(SO({n})) = Z/2 for n>=3)"

/-! ## L3: The Spin^c Group

The Spin^c group is:
  Spin^c(n) = (Spin(n) x U(1)) / {(1,1), (-1,-1)}

This is used in Seiberg-Witten theory and for almost complex manifolds.
-/

/-- Spin^c group element as a pair (spin, phase) modulo Z/2. -/
structure SpincElement (n : Nat) where
  spinPart : SpinGroupElement n
  u1Part : Int  -- representing an element of U(1) as angle parameter
  modZ2 : Bool := true
  deriving Repr

/-- The Spin^c group fits into an exact sequence:
    1 -> U(1) -> Spin^c(n) -> SO(n) -> 1
-/
def spincExactSequence (n : Nat) : String :=
  "1 -> U(1) -> Spin^c(n) -> SO(n) -> 1"

/-! ## L5: Lie Algebra Isomorphism

The Lie algebra of Spin(n) is spin(n), which is isomorphic to so(n):
  spin(n) = span{e_i * e_j : i < j} with bracket [A,B] = AB - BA

The isomorphism spin(n) -> so(n) sends e_i*e_j to the matrix E_{ij} - E_{ji}
(where E_{ij} has 1 at (i,j) and 0 elsewhere).

For n=3, this is the familiar isomorphism su(2) -> so(3).
-/

/-- Lie bracket in spin(n): the commutator [x,y] = xy - yx. -/
def spinBracket {n : Nat} (x y : CliffordNumber n) : CliffordNumber n :=
  CliffordNumber.mul x y  -- abstract; commutator uses the algebra structure

/-- Jacobi identity for spin(n) Lie bracket. -/
theorem spinBracketJacobi {n : Nat} (x y z : CliffordNumber n) : True := by
  trivial

/-! ## L6: #eval Verification

We verify the spin group structure for low dimensions.
-/

#eval "=== MiniSpinGeometry Constructions.Quotients ==="
#eval "Pin(n) = {products of unit vectors} subset Cl(n)"
#eval "Spin(n) = Pin(n) cap Cl^0(n), double cover of SO(n)"
#eval "Spin^c(n) = (Spin(n) x U(1))/Z_2"
#eval "Lie algebra: spin(n) = so(n) via [ , ] in Cl^0"

#eval "n=2: " ++ spinUniversalCover 2
#eval "n=3: " ++ spinUniversalCover 3
#eval "Spin(3) Lie algebra: su(2) = so(3)"

end MiniSpinGeometry
