import Lake
open Lake DSL

package «mini-spin-geometry» where

@[default_target]
lean_lib «MiniSpinGeometry» where
  roots := #[`MiniSpinGeometry]

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
