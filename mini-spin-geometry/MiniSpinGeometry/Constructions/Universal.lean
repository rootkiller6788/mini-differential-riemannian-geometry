/-
# MiniSpinGeometry: Constructions - Universal Properties
L3: Universal property of Clifford algebra
L4: Universal spin structure on BSpin(n)
-/

import MiniObjectKernel.Core.Basic
import MiniSpinGeometry.Core.Basic

namespace MiniSpinGeometry

/-! Universal property: generators determine the algebra homomorphism -/
def univPropClifford (n : Nat) : String :=
  s!"Cl({n}) is universal: any map on generators extends to algebra hom."

/-! Spin(n) is the universal cover of SO(n) for n >= 3. -/
def spinUniversalCoverDesc (n : Nat) : String :=
  s!"Spin({n}) -> SO({n}) is the universal covering (n>=3)"

/-! Spin cobordism groups in low dimensions. -/
def spinCobordism (d : Nat) : String :=
  match d with
  | 0 => "Omega_0 = Z"
  | 1 => "Omega_1 = Z/2"
  | 2 => "Omega_2 = Z/2"
  | 3 => "Omega_3 = 0"
  | 4 => "Omega_4 = Z"
  | _ => s!"Omega_{d}"

#eval "=== Constructions.Universal ==="
#eval univPropClifford 3
#eval spinUniversalCoverDesc 4
#eval "d=0: " ++ spinCobordism 0
#eval "d=4: " ++ spinCobordism 4

end MiniSpinGeometry
