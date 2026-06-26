import Lake
open Lake DSL

package «mini-comparison-theorems» where

@[default_target]
lean_lib «MiniComparisonTheorems» where
  roots := #[`MiniComparisonTheorems]

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"

lean_exe «smoke-test» where
  root := `Test.Smoke
  supportInterpreter := true

lean_exe «example-test» where
  root := `Test.Examples
  supportInterpreter := true
