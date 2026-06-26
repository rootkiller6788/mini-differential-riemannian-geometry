import Lake
open Lake DSL

package «mini-hodge-theory» where

@[default_target]
lean_lib «MiniHodgeTheory» where
  roots := #[`MiniHodgeTheory]

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
