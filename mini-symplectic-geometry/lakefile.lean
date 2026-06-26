import Lake
open Lake DSL

package «mini-symplectic-geometry» where

@[default_target]
lean_lib «MiniSymplecticGeometry» where
  roots := #[`MiniSymplecticGeometry]

lean_exe «smoke-test» where
  root := `Main
  supportInterpreter := true
