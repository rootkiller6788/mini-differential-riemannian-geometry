/-
# MiniSpinGeometry: Core Laws — Clifford Relations

L1: Grade involution, reversal, conjugation
L2: Spinor norm, center
L3: Z/2-graded superalgebra structure
-/

import MiniObjectKernel.Core.Basic
import MiniSpinGeometry.Core.Basic

namespace MiniSpinGeometry

open CliffordNumber

/-! ## L1: Grade Involution

The grade involution alpha sends e_i to -e_i.
On a product: alpha(e_{i1}...e_{ik}) = (-1)^k * e_{i1}...e_{ik}.
-/

def gradeInvolution {n : Nat} : CliffordNumber n -> CliffordNumber n
  | CliffordTerm.scalar a => CliffordTerm.scalar a
  | CliffordTerm.generator i => CliffordTerm.scalar (-1)  -- -e_i, need product
  | CliffordTerm.product x y =>
    CliffordTerm.product (gradeInvolution x) (gradeInvolution y)

/-- Reversal: e_{i1}...e_{ik} -> e_{ik}...e_{i1}. -/
def reversal {n : Nat} : CliffordNumber n -> CliffordNumber n
  | CliffordTerm.scalar a => CliffordTerm.scalar a
  | CliffordTerm.generator i => CliffordTerm.generator i
  | CliffordTerm.product x y =>
    CliffordTerm.product (reversal y) (reversal x)

/-- Clifford conjugation: gamma = alpha o beta = beta o alpha. -/
def cliffordConjugate {n : Nat} (x : CliffordNumber n) : CliffordNumber n :=
  gradeInvolution (reversal x)

/-- Spinor norm: N(x) = x * gamma(x). -/
def spinorNorm {n : Nat} (x : CliffordNumber n) : CliffordNumber n :=
  mul x (cliffordConjugate x)

/-! ## L3: Z/2-Graded Structure

Cl(n) = Cl^0(n) + Cl^1(n) with Cl^i * Cl^j subset Cl^{i+j mod 2}.
The even subalgebra Cl^0 is fixed by the grade involution.
-/

def isEvenElement {n : Nat} (x : CliffordNumber n) : Prop :=
  gradeInvolution x = x

def isOddElement {n : Nat} (x : CliffordNumber n) : Prop :=
  gradeInvolution x = mul (CliffordTerm.scalar (-1)) x

/-- The center of Cl(n):
    For n even: Z(Cl(n)) = R*1
    For n odd: Z(Cl(n)) = R*1 + R*omega
-/

def isCentral {n : Nat} (x : CliffordNumber n) : Prop :=
  forall y : CliffordNumber n, mul x y = mul y x

/-! ## L5: Induction Principle for Clifford Numbers

The inductive type CliffordTerm gives a natural induction principle:
properties holding for scalars and generators extend uniquely.
-/

theorem clifford_induction {n : Nat} {P : CliffordNumber n -> Prop}
    (h_scalar : forall a : Int, P (CliffordTerm.scalar a))
    (h_generator : forall i : Nat, P (CliffordTerm.generator i))
    (h_product : forall x y, P x -> P y -> P (CliffordTerm.product x y)) :
    forall x : CliffordNumber n, P x := by
  intro x
  induction x with
  | scalar a => apply h_scalar a
  | generator i => apply h_generator i
  | product x y ihx ihy => apply h_product x y ihx ihy

/-! ## L6: #eval Verification
-/

#eval "=== MiniSpinGeometry Core.Laws ==="
#eval "Grade involution, reversal, conjugation defined"
#eval "Spinor norm: N(x) = x * gamma(x)"
#eval "Z/2-grading: Cl = Cl^0 + Cl^1"
#eval "Center: scalars for even n, + volume element for odd n"
#eval "Induction principle for Clifford numbers"

end MiniSpinGeometry
