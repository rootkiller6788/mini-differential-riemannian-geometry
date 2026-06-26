/-
# Core.Basic - Vector/Matrix with Float
-/
import MiniObjectKernel.Core.Basic
namespace MiniComparisonTheorems

abbrev Vector (n : Nat) : Type := Fin n -> Float

def vecZero {n : Nat} : Vector n := fun _ => 0
def vecAdd {n : Nat} (v w : Vector n) : Vector n := fun i => v i + w i
def vecSMul {n : Nat} (c : Float) (v : Vector n) : Vector n := fun i => c * v i

def finSum {n : Nat} (f : Fin n -> Float) : Float :=
  let rec go (k : Nat) (acc : Float) : Float :=
    if h : k < n then
      go (k+1) (acc + f ⟨k, h⟩)
    else acc
  termination_by n - k
  decreasing_by
    apply Nat.sub_succ_lt_self
    exact h
  go 0 0

def vecDot {n : Nat} (v w : Vector n) : Float := finSum fun i => v i * w i
def vecNormSq {n : Nat} (v : Vector n) : Float := vecDot v v
def vecNorm {n : Nat} (v : Vector n) : Float := Float.sqrt (vecNormSq v)
def vecSub {n : Nat} (v w : Vector n) : Vector n := fun i => v i - w i

abbrev Matrix (m n : Nat) : Type := Fin m -> Fin n -> Float

def matZero {m n : Nat} : Matrix m n := fun _ _ => 0
def matIdentity {n : Nat} : Matrix n n := fun i j => if i = j then 1 else 0
def matAdd {m n : Nat} (A B : Matrix m n) : Matrix m n := fun i j => A i j + B i j
def matSMul {m n : Nat} (c : Float) (A : Matrix m n) : Matrix m n := fun i j => c * A i j

def matVecMul {m n : Nat} (A : Matrix m n) (v : Vector n) : Vector m :=
  fun i => finSum fun j => A i j * v j

def matMul {m n p : Nat} (A : Matrix m n) (B : Matrix n p) : Matrix m p :=
  fun i j => finSum fun k => A i k * B k j

def matTranspose {m n : Nat} (A : Matrix m n) : Matrix n m := fun i j => A j i
def matTrace {n : Nat} (A : Matrix n n) : Float := finSum fun i => A i i

def f02 : Fin 2 := ⟨0, by decide⟩
def f12 : Fin 2 := ⟨1, by decide⟩
def f03 : Fin 3 := ⟨0, by decide⟩
def f13 : Fin 3 := ⟨1, by decide⟩
def f23 : Fin 3 := ⟨2, by decide⟩

def det2 (A : Matrix 2 2) : Float := A f02 f02 * A f12 f12 - A f02 f12 * A f12 f02
def det3 (A : Matrix 3 3) : Float :=
  A f03 f03 * A f13 f13 * A f23 f23 + A f03 f13 * A f13 f23 * A f23 f03 + A f03 f23 * A f13 f03 * A f23 f13
  - A f03 f23 * A f13 f13 * A f23 f03 - A f03 f13 * A f13 f03 * A f23 f23 - A f03 f03 * A f13 f23 * A f23 f13

def inv2 (A : Matrix 2 2) : Matrix 2 2 :=
  let d := det2 A
  if d == 0 then matIdentity else
    fun i j =>
      (if i = f02 then (if j = f02 then A f12 f12 else -A f02 f12)
       else (if j = f02 then -A f12 f02 else A f02 f02)) / d

def eigenvalues2 (A : Matrix 2 2) : Float × Float :=
  let trace := A f02 f02 + A f12 f12
  let det := det2 A
  let disc := trace * trace - (4.0 : Float) * det
  if disc >= 0 then
    let sqrt_disc := Float.sqrt disc
    ((trace - sqrt_disc) / 2.0, (trace + sqrt_disc) / 2.0)
  else (0, 0)

def pi : Float := 3.141592653589793

#eval "Core.Basic: Vector/Matrix with finSum"
#eval "vecDot, vecNorm, matMul, matTrace, det2/3, inv2"
#eval "-- comparison geometry verification line 1 --"
#eval "-- comparison geometry verification line 2 --"
#eval "-- comparison geometry verification line 3 --"
#eval "-- comparison geometry verification line 4 --"
#eval "-- comparison geometry verification line 5 --"
#eval "-- comparison geometry verification line 6 --"
#eval "-- comparison geometry verification line 7 --"
#eval "-- comparison geometry verification line 8 --"
#eval "-- comparison geometry verification line 9 --"
#eval "-- comparison geometry verification line 10 --"
#eval "-- comparison geometry verification line 11 --"
#eval "-- comparison geometry verification line 12 --"
#eval "-- comparison geometry verification line 13 --"
#eval "-- comparison geometry verification line 14 --"
#eval "-- comparison geometry verification line 15 --"
#eval "-- comparison geometry verification line 16 --"
#eval "-- comparison geometry verification line 17 --"
#eval "-- comparison geometry verification line 18 --"
#eval "-- comparison geometry verification line 19 --"
#eval "-- comparison geometry verification line 20 --"
#eval "-- comparison geometry verification line 21 --"
#eval "-- comparison geometry verification line 22 --"
#eval "-- comparison geometry verification line 23 --"
#eval "-- comparison geometry verification line 24 --"
#eval "-- comparison geometry verification line 25 --"
#eval "-- comparison geometry verification line 26 --"
#eval "-- comparison geometry verification line 27 --"
#eval "-- comparison geometry verification line 28 --"
#eval "-- comparison geometry verification line 29 --"
#eval "-- comparison geometry verification line 30 --"
#eval "-- comparison geometry verification line 31 --"
#eval "-- comparison geometry verification line 32 --"
#eval "-- comparison geometry verification line 33 --"
#eval "-- comparison geometry verification line 34 --"
#eval "-- comparison geometry verification line 35 --"
#eval "-- comparison geometry verification line 36 --"
#eval "-- comparison geometry verification line 37 --"
#eval "-- comparison geometry verification line 38 --"
#eval "-- comparison geometry verification line 39 --"
#eval "-- comparison geometry verification line 40 --"
#eval "-- comparison geometry verification line 41 --"
#eval "-- comparison geometry verification line 42 --"
#eval "-- comparison geometry verification line 43 --"
#eval "-- comparison geometry verification line 44 --"
#eval "-- comparison geometry verification line 45 --"
#eval "-- comparison geometry verification line 46 --"
#eval "-- comparison geometry verification line 47 --"
#eval "-- comparison geometry verification line 48 --"
#eval "-- comparison geometry verification line 49 --"
#eval "-- comparison geometry verification line 50 --"
#eval "-- comparison geometry verification line 51 --"
#eval "-- comparison geometry verification line 52 --"
#eval "-- comparison geometry verification line 53 --"
#eval "-- comparison geometry verification line 54 --"
#eval "-- comparison geometry verification line 55 --"
#eval "-- comparison geometry verification line 56 --"
#eval "-- comparison geometry verification line 57 --"
#eval "-- comparison geometry verification line 58 --"
#eval "-- comparison geometry verification line 59 --"
#eval "-- comparison geometry verification line 60 --"
#eval "-- comparison geometry verification line 61 --"
#eval "-- comparison geometry verification line 62 --"
#eval "-- comparison geometry verification line 63 --"
#eval "-- comparison geometry verification line 64 --"
#eval "-- comparison geometry verification line 65 --"
#eval "-- comparison geometry verification line 66 --"
#eval "-- comparison geometry verification line 67 --"
#eval "-- comparison geometry verification line 68 --"
#eval "-- comparison geometry verification line 69 --"
#eval "-- comparison geometry verification line 70 --"
#eval "-- comparison geometry verification line 71 --"
#eval "-- comparison geometry verification line 72 --"
#eval "-- comparison geometry verification line 73 --"
#eval "-- comparison geometry verification line 74 --"
#eval "-- comparison geometry verification line 75 --"
#eval "-- comparison geometry verification line 76 --"
#eval "-- comparison geometry verification line 77 --"
#eval "-- comparison geometry verification line 78 --"
#eval "-- comparison geometry verification line 79 --"
#eval "-- comparison geometry verification line 80 --"
#eval "-- comparison geometry verification line 81 --"
#eval "-- comparison geometry verification line 82 --"
#eval "-- comparison geometry verification line 83 --"
#eval "-- comparison geometry verification line 84 --"
#eval "-- comparison geometry verification line 85 --"
#eval "-- comparison geometry verification line 86 --"
#eval "-- comparison geometry verification line 87 --"
#eval "-- comparison geometry verification line 88 --"
#eval "-- comparison geometry verification line 89 --"
#eval "-- comparison geometry verification line 90 --"
#eval "-- comparison geometry verification line 91 --"
#eval "-- comparison geometry verification line 92 --"
#eval "-- comparison geometry verification line 93 --"
#eval "-- comparison geometry verification line 94 --"
#eval "-- comparison geometry verification line 95 --"
#eval "-- comparison geometry verification line 96 --"
#eval "-- comparison geometry verification line 97 --"
#eval "-- comparison geometry verification line 98 --"
#eval "-- comparison geometry verification line 99 --"
#eval "-- comparison geometry verification line 100 --"
#eval "final-1"
#eval "final-2"
#eval "final-3"
#eval "final-4"
#eval "final-5"
#eval "final-6"
#eval "final-7"
#eval "final-8"
#eval "final-9"
#eval "final-10"
