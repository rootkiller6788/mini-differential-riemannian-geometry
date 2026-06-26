/-
# MiniSpinGeometry: Core Objects -- Concrete Clifford Algebras

L1: Quaternions, complex numbers as Clifford algebras
L3: Classification Cl(p,q) via Bott periodicity
L6: #eval verification
-/

import MiniObjectKernel.Core.Basic
import MiniSpinGeometry.Core.Basic

namespace MiniSpinGeometry

structure ComplexInt where
  re : Int
  im : Int
  deriving Repr, BEq, Inhabited

def ComplexInt.add (z w : ComplexInt) : ComplexInt :=
  { re := z.re + w.re, im := z.im + w.im }

def ComplexInt.mul (z w : ComplexInt) : ComplexInt :=
  { re := z.re * w.re - z.im * w.im
    im := z.re * w.im + z.im * w.re
  }

def ComplexInt.i : ComplexInt := { re := 0, im := 1 }

def verifyISq : Bool :=
  ComplexInt.mul ComplexInt.i ComplexInt.i == { re := -1, im := 0 : ComplexInt }

#eval "i^2 = -1: " ++ toString verifyISq

def verifyCl1IsC (a b c d : Int) : Bool :=
  let z1 : ComplexInt := { re := a, im := b }
  let z2 : ComplexInt := { re := c, im := d }
  let prod : ComplexInt := ComplexInt.mul z1 z2
  prod.re == a*c - b*d && prod.im == a*d + b*c

#eval "Cl(1) (2+3i)(5+7i): " ++ toString (verifyCl1IsC 2 3 5 7)
#eval "Cl(1) i*i=-1: " ++ toString (verifyCl1IsC 0 1 0 1)

structure QuaternionInt where
  w : Int
  x : Int
  y : Int
  z : Int
  deriving Repr, BEq, Inhabited

def QuaternionInt.add (q r : QuaternionInt) : QuaternionInt :=
  { w := q.w + r.w, x := q.x + r.x, y := q.y + r.y, z := q.z + r.z }

def QuaternionInt.mul (q r : QuaternionInt) : QuaternionInt :=
  { w := q.w * r.w - q.x * r.x - q.y * r.y - q.z * r.z
    x := q.w * r.x + q.x * r.w + q.y * r.z - q.z * r.y
    y := q.w * r.y - q.x * r.z + q.y * r.w + q.z * r.x
    z := q.w * r.z + q.x * r.y - q.y * r.x + q.z * r.w
  }

def QuaternionInt.normSq (q : QuaternionInt) : Int :=
  q.w * q.w + q.x * q.x + q.y * q.y + q.z * q.z

def QuaternionInt.i : QuaternionInt := { w := 0, x := 1, y := 0, z := 0 }
def QuaternionInt.j : QuaternionInt := { w := 0, x := 0, y := 1, z := 0 }
def QuaternionInt.k : QuaternionInt := { w := 0, x := 0, y := 0, z := 1 }

def minusOne : QuaternionInt := { w := -1, x := 0, y := 0, z := 0 }

def verifyQuaternionRelations : Bool :=
  QuaternionInt.mul QuaternionInt.i QuaternionInt.i == minusOne &&
  QuaternionInt.mul QuaternionInt.j QuaternionInt.j == minusOne &&
  QuaternionInt.mul QuaternionInt.k QuaternionInt.k == minusOne &&
  QuaternionInt.mul (QuaternionInt.mul QuaternionInt.i QuaternionInt.j) QuaternionInt.k == minusOne

def testSpin3Product : Bool :=
  QuaternionInt.normSq (QuaternionInt.mul QuaternionInt.i QuaternionInt.j) == 1

#eval "Quaternion relations: " ++ toString verifyQuaternionRelations
#eval "Spin(3) unit quats: " ++ toString testSpin3Product

def clClassName (n : Nat) : String :=
  match n % 8 with
  | 0 => "R-type"
  | 1 => "C-type"
  | 2 => "H-type"
  | 3 => "H+H"
  | 4 => "M_2(H)"
  | 5 => "M_4(C)"
  | 6 => "M_8(R)"
  | 7 => "M_8(R)+M_8(R)"
  | _ => "?"

def spinorDimTable (n : Nat) : Nat :=
  let cdim : Nat := 2 ^ (n / 2)
  match n % 8 with
  | 0 => cdim
  | 1 => cdim
  | 2 => cdim / 2
  | 3 => cdim
  | 4 => cdim / 2
  | 5 => cdim
  | 6 => cdim / 2
  | 7 => cdim
  | _ => 0

#eval "=== Core.Objects ==="
#eval "Cl(1)=C: " ++ toString (verifyCl1IsC 2 3 5 7)
#eval "Cl^0(3)=H: " ++ toString verifyQuaternionRelations
#eval "Cl(3): " ++ clClassName 3
#eval "Cl(6): " ++ clClassName 6
#eval "Spinor dim n=4: " ++ toString (spinorDimTable 4)
#eval "Spinor dim n=6: " ++ toString (spinorDimTable 6)

end MiniSpinGeometry
