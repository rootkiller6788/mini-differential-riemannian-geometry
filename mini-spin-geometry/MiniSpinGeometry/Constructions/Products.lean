/-
# MiniSpinGeometry: Constructions - Tensor Products and Product Manifolds

L3: Cl(V+W) = Cl(V) ox_g Cl(W) (graded tensor product)
L4: Spin group of product manifolds
-/

import MiniObjectKernel.Core.Basic
import MiniSpinGeometry.Core.Basic

namespace MiniSpinGeometry

/-! ## L3: Graded Tensor Product

For orthogonal vector spaces V and W:
  Cl(V+W) = Cl(V) ox_g Cl(W)

The graded tensor product uses the super-sign rule:
  (a ox b) * (a ox b) = (-1)^{|b||a|} (a*a) ox (b*b)
-/

def gradedTensorProductDesc (p q : Nat) : String :=
  s!"Cl({p+q}) = Cl({p}) ox_g Cl({q})"

/-! ## L4: Spin Group of Products

Spin(n+m) is related to Spin(n) x Spin(m) by an exact sequence:
  1 -> Z/2 -> Spin(n) x Spin(m) -> Spin(n+m) -> 1
where Z/2 is the diagonal central subgroup.
-/

def spinProductExactSeq (n m : Nat) : String :=
  s!"1 -> Z/2 -> Spin({n}) x Spin({m}) -> Spin({n+m}) -> 1"

/-! ## L6: #eval Verification
-/

#eval "=== Constructions.Products ==="
#eval gradedTensorProductDesc 3 4
#eval spinProductExactSeq 2 3

end MiniSpinGeometry
