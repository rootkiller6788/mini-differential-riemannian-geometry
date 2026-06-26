import MiniEinsteinEquations
open MiniEinsteinEquations

def main : IO Unit := do
  IO.println "===== mini-einstein-equations ====="
  IO.println "Einstein Field Equations of General Relativity"
  IO.println s!"Minkowski det: {Metric.det4 Metric.minkowski}"
  IO.println s!"Horizon radius (M=1): {schwarzschildHorizon 1}"
  IO.println s!"ISCO (M=1): {iscoRadius 1}"
  IO.println s!"Hawking temp (M=1): {hawkingTemp 1}"
  IO.println s!"Bekenstein entropy (M=1): {bekensteinEntropy 1}"
  IO.println s!"Chirp mass (36,29): {chirpMass 36 29}"
  IO.println "====================================="
