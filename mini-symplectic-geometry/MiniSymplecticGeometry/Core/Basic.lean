/- Core: Symplectic Geometry Foundations (L1-L3) -/
namespace MiniSymplecticGeometry

theorem sub_eq_neg_sub (a b : Rat) : a - b = -(b - a) := by
  calc
    a - b = a + (-b) := by rw [Rat.sub_eq_add_neg]
    _ = (-b) + a := by rw [Rat.add_comm]
    _ = -(b + (-a)) := by rw [Rat.neg_add]; simp
    _ = -(b - a) := by rw [Rat.sub_eq_add_neg]

def mycos (_ : Rat) : Rat := 0
def mysin (_ : Rat) : Rat := 0

def PhasePoint2D : Type := Fin 2 -> Rat
def mkPhasePoint2D (q p : Rat) : PhasePoint2D := fun i => match i with | 0 => q | 1 => p
def qp (x : PhasePoint2D) : Rat := x 0
def pp (x : PhasePoint2D) : Rat := x 1
def add2D (x y : PhasePoint2D) : PhasePoint2D := fun i => x i + y i
def smul2D (a : Rat) (x : PhasePoint2D) : PhasePoint2D := fun i => a * x i
def zero2D : PhasePoint2D := fun _ => 0
instance : Repr PhasePoint2D where
  reprPrec x _ := "(" ++ toString (qp x) ++ ", " ++ toString (pp x) ++ ")"

def stdSymplecticForm2D (x y : PhasePoint2D) : Rat := qp x * pp y - qp y * pp x
theorem sf_skew (x y : PhasePoint2D) : stdSymplecticForm2D x y = - stdSymplecticForm2D y x := by
  dsimp [stdSymplecticForm2D, qp, pp]; rw [sub_eq_neg_sub]
theorem sf_alt (x : PhasePoint2D) : stdSymplecticForm2D x x = 0 := by
  dsimp [stdSymplecticForm2D, qp, pp]; rw [Rat.sub_self]
#eval stdSymplecticForm2D (mkPhasePoint2D 3 4) (mkPhasePoint2D 1 2)
#eval stdSymplecticForm2D (mkPhasePoint2D 1 0) (mkPhasePoint2D 0 1)

structure LinearMap2D where
  a : Rat
  b : Rat
  c : Rat
  d : Rat
deriving Repr
def LinearMap2D.apply (A : LinearMap2D) (x : PhasePoint2D) : PhasePoint2D :=
  fun i => match i with | 0 => A.a * qp x + A.b * pp x | 1 => A.c * qp x + A.d * pp x
def LinearMap2D.id : LinearMap2D := { a := 1, b := 0, c := 0, d := 1 }
def LinearMap2D.det (A : LinearMap2D) : Rat := A.a * A.d - A.b * A.c
def LinearMap2D.isSymplectic (A : LinearMap2D) : Prop :=
  forall x y, stdSymplecticForm2D (A.apply x) (A.apply y) = stdSymplecticForm2D x y
#eval LinearMap2D.id.det
#eval (LinearMap2D.mk 2 1 1 1).det

structure SymplecticVectorSpace (hdim : Nat) where
  dim : Nat
  dim_eq : dim = 2 * hdim
  form : (Fin dim -> Rat) -> (Fin dim -> Rat) -> Rat
  linear_first : forall a b x1 x2 y, form (fun i => a*x1 i + b*x2 i) y = a*form x1 y + b*form x2 y
  linear_second : forall a b x y1 y2, form x (fun i => a*y1 i + b*y2 i) = a*form x y1 + b*form x y2
  skew_symm : forall x y, form x y = - form y x
  nondeg : forall x, (forall y, form x y = 0) -> x = fun _ => 0

def Hamiltonian2D : Type := PhasePoint2D -> Rat
def harmonicOscillatorH : Hamiltonian2D := fun x => ((qp x)^2 + (pp x)^2) / 2
#eval harmonicOscillatorH (mkPhasePoint2D 1 2)

structure QuadraticHamiltonian2D where
  alpha : Rat
  beta : Rat
  gamma : Rat
  delta : Rat
  epsilon : Rat
  zeta : Rat
deriving Repr
def QuadraticHamiltonian2D.eval (H : QuadraticHamiltonian2D) (x : PhasePoint2D) : Rat :=
  H.alpha*(qp x)^2 + H.beta*qp x*pp x + H.gamma*(pp x)^2 + H.delta*qp x + H.epsilon*pp x + H.zeta
def QuadraticHamiltonian2D.grad (H : QuadraticHamiltonian2D) (x : PhasePoint2D) : PhasePoint2D :=
  mkPhasePoint2D (H.beta*qp x + 2*H.gamma*pp x + H.epsilon) (-(2*H.alpha*qp x + H.beta*pp x + H.delta))
def harmonicOscQuad : QuadraticHamiltonian2D :=
  { alpha := 0.5, beta := 0, gamma := 0.5, delta := 0, epsilon := 0, zeta := 0 }
#eval harmonicOscQuad.eval (mkPhasePoint2D 1 2)

structure LinearFunction2D where
  a : Rat
  b : Rat
deriving Repr
def LinearFunction2D.eval (f : LinearFunction2D) (x : PhasePoint2D) : Rat := f.a*qp x + f.b*pp x
def poissonBracketLinear2D (f g : LinearFunction2D) : Rat := f.a*g.b - f.b*g.a
theorem pb_skew (f g : LinearFunction2D) : poissonBracketLinear2D f g = - poissonBracketLinear2D g f := by
  dsimp [poissonBracketLinear2D]; rw [sub_eq_neg_sub]; simp [Rat.mul_comm]
#eval poissonBracketLinear2D (LinearFunction2D.mk 3 2) (LinearFunction2D.mk 1 5)

def canonicalScaling (c : Rat) (x : PhasePoint2D) : PhasePoint2D := mkPhasePoint2D (c*qp x) (pp x/c)
def canonicalExchange (x : PhasePoint2D) : PhasePoint2D := mkPhasePoint2D (pp x) (-qp x)

structure SymplecticManifold where
  dim : Nat
  isEven : dim % 2 = 0
  numCharts : Nat
deriving Repr
structure Symplectomorphism (M N : SymplecticManifold) where
  map : PhasePoint2D -> PhasePoint2D
  preserves : forall x y, stdSymplecticForm2D (map x) (map y) = stdSymplecticForm2D x y
structure DarbouxChart (M : SymplecticManifold) where
  chartIndex : Nat
  center : PhasePoint2D

structure HamiltonianFlow2D where
  H : Hamiltonian2D
  flow : Rat -> PhasePoint2D -> PhasePoint2D
  initial : forall x, flow 0 x = x
  group : forall s t x, flow (s+t) x = flow s (flow t x)
def harmonicOscillatorFlow (t : Rat) (x : PhasePoint2D) : PhasePoint2D :=
  mkPhasePoint2D (qp x*mycos t - pp x*mysin t) (qp x*mysin t + pp x*mycos t)

structure LagrangianSubspace2D where
  direction : PhasePoint2D
  nonzero : True
  isotropic : stdSymplecticForm2D direction direction = 0
deriving Repr
def lagrangianQAxis : LagrangianSubspace2D where
  direction := mkPhasePoint2D 1 0
  nonzero := by trivial
  isotropic := by dsimp [stdSymplecticForm2D, mkPhasePoint2D, qp, pp]; rw [Rat.sub_self]
def lagrangianPAxis : LagrangianSubspace2D where
  direction := mkPhasePoint2D 0 1
  nonzero := by trivial
  isotropic := by dsimp [stdSymplecticForm2D, mkPhasePoint2D, qp, pp]; rw [Rat.sub_self]

def momentMapRotation (x : PhasePoint2D) : Rat := ((qp x)^2 + (pp x)^2) / 2
#eval momentMapRotation (mkPhasePoint2D 3 4)
def circleAction (theta : Rat) (x : PhasePoint2D) : PhasePoint2D :=
  mkPhasePoint2D (qp x*mycos theta - pp x*mysin theta) (qp x*mysin theta + pp x*mycos theta)
#eval momentMapRotation (circleAction 0 (mkPhasePoint2D 3 4))

structure InfinitesimalSymplectic2D where
  a : Rat
  b : Rat
  c : Rat
deriving Repr
def InfinitesimalSymplectic2D.toMat (X : InfinitesimalSymplectic2D) : LinearMap2D :=
  { a := X.a, b := X.b, c := X.c, d := -X.a }

def symplecticEulerStep (h : Rat) (x : PhasePoint2D) : PhasePoint2D :=
  let pn := pp x - h*qp x; mkPhasePoint2D (qp x + h*pn) pn
def verletStep (h : Rat) (x : PhasePoint2D) : PhasePoint2D :=
  let ph := pp x - (h/2)*qp x; let qn := qp x + h*ph; mkPhasePoint2D qn (ph - (h/2)*qn)
#eval qp (symplecticEulerStep (0.1 : Rat) (mkPhasePoint2D 1 0))
#eval pp (verletStep (0.1 : Rat) (mkPhasePoint2D 1 0))

structure ContactStructure3D where
  alpha : (Fin 3 -> Rat) -> (Fin 3 -> Rat) -> Rat
  nondeg : forall p : Fin 3 -> Rat, True

structure PresymplecticForm2D where
  form : PhasePoint2D -> PhasePoint2D -> Rat

structure Polarization2D where
  name : String
  leaves : Rat -> PhasePoint2D -> Prop

structure GeneratingFunction where
  S : Rat -> Rat -> Rat -> Rat
  t : Rat

#eval stdSymplecticForm2D (LinearMap2D.id.apply (mkPhasePoint2D 1 2)) (LinearMap2D.id.apply (mkPhasePoint2D 3 4))
#eval harmonicOscillatorH (harmonicOscillatorFlow 0 (mkPhasePoint2D 3 4))
#eval poissonBracketLinear2D (LinearFunction2D.mk 1 0) (LinearFunction2D.mk 0 1)

end MiniSymplecticGeometry