/-
# MiniSpinGeometry: Properties — Classification Data

L3: Full classification of Cl(p,q) for all signatures
L6: Computable verification tables
L8: Relation to topological insulators (Altland-Zirnbauer classification)
-/

import MiniObjectKernel.Core.Basic
import MiniSpinGeometry.Core.Basic
import MiniSpinGeometry.Core.Objects
import MiniSpinGeometry.Properties.Invariants

namespace MiniSpinGeometry

/-! ## L3: Complete Classification Table

The real Clifford algebras Cl(p,q) are classified up to isomorphism
by the signature difference d = p - q mod 8.

Table for Cl(p,q):
  d mod 8 = 0: M_{2^{(p+q)/2}}(R)
  d mod 8 = 1: M_{2^{(p+q-1)/2}}(C)    (complex matrices)
  d mod 8 = 2: M_{2^{(p+q-2)/2}}(H)    (quaternion matrices)
  d mod 8 = 3: H+H                     (two copies of H)
  d mod 8 = 4: M_{2^{(p+q-2)/2}}(H)    (quaternion matrices)
  d mod 8 = 5: M_{2^{(p+q-3)/2}}(C)    (complex matrices)
  d mod 8 = 6: M_{2^{(p+q-2)/2}}(R)    (real matrices)
  d mod 8 = 7: R+R                     (two copies of R)

The matrix dimension N depends on the total dimension n = p+q.
-/

/-- Full classification data for real Clifford algebras.
    For each (p,q) with 0 <= p,q <= 8, we store the isomorphism class. -/
structure CliffordClass where
  signature : Nat × Nat
  algebraType : String
  dimension : Nat
  realType : String  -- R, C, H
  deriving Repr

/-- Build the classification table for p,q up to 8. -/
def fullClassificationTable : List CliffordClass :=
  let entries : List (Nat × Nat × String × Nat × String) := [
    (0,0,"R",1,"R"),
    (1,0,"C",2,"C"),
    (2,0,"H",4,"H"),
    (3,0,"M_2(C)",4,"C"),
    (4,0,"M_2(H)",8,"H"),
    (5,0,"M_4(C)",8,"C"),
    (6,0,"M_8(R)",8,"R"),
    (7,0,"M_8(R)+M_8(R)",16,"R"),
    (8,0,"M_16(R)",16,"R"),
    (0,1,"R+R",2,"R"),
    (0,2,"M_2(R)",4,"R"),
    (0,3,"M_2(C)",4,"C"),
    (0,4,"M_2(H)",8,"H"),
    (0,5,"M_2(H)+M_2(H)",16,"H"),
    (0,6,"M_4(H)",16,"H"),
    (0,7,"M_8(C)",16,"C"),
    (0,8,"M_16(R)",16,"R")
  ]
  entries.map fun (p, q, t, d, r) =>
    { signature := (p, q), algebraType := t, dimension := d, realType := r }

/-- Lookup the Clifford algebra type for signature (p,q). -/
def lookupCliffordClass (p q : Nat) : String :=
  let d := (p + 8 - q % 8) % 8
  let n := p + q
  match d with
  | 0 => s!"M_{2^(n/2)}(R)"
  | 1 => s!"M_{2^((n-1)/2)}(C)"
  | 2 => s!"M_{2^((n-2)/2)}(H)"
  | 3 => if n = 3 then "H+H" else s!"M_{2^((n-3)/2)}(H)+M_{2^((n-3)/2)}(H)"
  | 4 => s!"M_{2^((n-2)/2)}(H)"
  | 5 => s!"M_{2^((n-3)/2)}(C)"
  | 6 => s!"M_{2^((n-2)/2)}(R)"
  | 7 => if n = 7 then "R+R" else s!"M_{2^((n-5)/2)}(R)+M_{2^((n-5)/2)}(R)"
  | _ => "Unknown"

#eval "Cl(1,0) = " ++ lookupCliffordClass 1 0
#eval "Cl(0,1) = " ++ lookupCliffordClass 0 1
#eval "Cl(2,0) = " ++ lookupCliffordClass 2 0
#eval "Cl(0,2) = " ++ lookupCliffordClass 0 2
#eval "Cl(1,3) = " ++ lookupCliffordClass 1 3
#eval "Cl(3,1) = " ++ lookupCliffordClass 3 1

/-! ## L8: Topological Insulator Classification (Altland-Zirnbauer)

The 10-fold way classifies topological insulators and superconductors
using Clifford algebras:

AZ Class | Symmetries | Classifying Space | pi_0
A        | None       | C_0               | Z
AIII     | S (chiral) | C_1               | 0
AI       | T^2=+1     | R_0               | Z
BDI      | T^2=+1, S  | R_1               | Z/2
D        | None       | R_2               | Z/2
DIII     | T^2=-1, S  | R_3               | 0
AII      | T^2=-1     | R_4               | Z
CII      | T^2=-1, S  | R_5               | 0
C        | None       | R_6               | 0
CI       | T^2=+1, S  | R_7               | 0

This classification is exactly the Bott periodic table.
-/

/-- AZ (Altland-Zirnbauer) symmetry classes.
    T = time-reversal, C = particle-hole, S = chiral (sublattice) symmetry. -/
inductive AZClass where
  | A | AIII | AI | BDI | D | DIII | AII | CII | C | CI
  deriving Repr, BEq

/-- The classifying space for each AZ class.
    This is the space of gapped Hamiltonians, given by the Clifford algebra
    extension problem: Cl(s) -> Cl(s+1). -/
def azClassifyingSpace (c : AZClass) : String :=
  match c with
  | AZClass.A => "C_0 = U(N+M)/U(N)xU(M)"
  | AZClass.AIII => "C_1"
  | AZClass.AI => "R_0 = O(N+M)/O(N)xO(M)"
  | AZClass.BDI => "R_1"
  | AZClass.D => "R_2 = O(2N)/U(N)"
  | AZClass.DIII => "R_3"
  | AZClass.AII => "R_4 = Sp(N+M)/Sp(N)xSp(M)"
  | AZClass.CII => "R_5"
  | AZClass.C => "R_6 = Sp(2N)/U(N)"
  | AZClass.CI => "R_7"

/-! ## L6: #eval Verification

-/

#eval "=== MiniSpinGeometry Properties.ClassificationData ==="
#eval "Full classification of Cl(p,q) by p-q mod 8"
#eval "Bott periodic table for real Clifford algebras"
#eval "10-fold way: AZ classification of topological insulators"
#eval "Cl(1,3) (spacetime): " ++ lookupCliffordClass 1 3
#eval "Cl(3,1) (spacetime): " ++ lookupCliffordClass 3 1

-- Test AZ classes
#eval "AZ class A: " ++ azClassifyingSpace AZClass.A
#eval "AZ class AII: " ++ azClassifyingSpace AZClass.AII
#eval "AZ class D: " ++ azClassifyingSpace AZClass.D

end MiniSpinGeometry
