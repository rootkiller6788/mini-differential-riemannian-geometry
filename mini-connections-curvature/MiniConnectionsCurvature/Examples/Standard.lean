import MiniConnectionsCurvature.Core.Basic
namespace MiniConnectionsCurvature
set_option maxHeartbeats 400000

/-! # Examples/Standard - Canonical Examples (L6) -/

def sphereExample (n r : Int) : ConnectionCurvatureData :=
  ConnectionCurvatureData.spherical n.natAbs r

def euclideanExample (n : Nat) : ConnectionCurvatureData :=
  ConnectionCurvatureData.euclidean n

def hyperbolicExample (n : Nat) : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean n with
    metricName := "Hyperbolic"
    scalarValue := -(n * (n - 1))
    scalarSign := "negative"
    sectionalMin := -1
    sectionalMax := -1
  }

def cpExample (n : Nat) : ConnectionCurvatureData :=
  { ConnectionCurvatureData.spherical (2*n) 1 with
    metricName := s!"CP^{n} (Fubini-Study)"
    sectionalMin := 1
    sectionalMax := 4
  }

def schwarzschildExample (mass : Int) : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean 4 with
    metricName := "Schwarzschild"
    connectionName := "Levi-Civita (not flat)"
    scalarValue := 0
    scalarSign := "zero"
  }

def deSitterExample (H : Int) : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean 4 with
    metricName := "de Sitter"
    connectionName := "Levi-Civita"
    scalarValue := 12 * H * H
    scalarSign := "positive"
  }

def antiDeSitterExample : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean 4 with
    metricName := "Anti-de Sitter"
    scalarValue := -12
    scalarSign := "negative"
  }

def flrwExample (k : Int) : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean 4 with
    metricName := s!"FLRW (k={k})"
  }

def flatTorusExample (n : Nat) : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean n with
    metricName := s!"Flat torus T^{n}" }

def bergerSphereExample : ConnectionCurvatureData :=
  { ConnectionCurvatureData.spherical 3 1 with
    metricName := "Berger sphere (squashed)"
    sectionalMin := 1
    sectionalMax := 4
  }

def k3Example : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean 4 with
    metricName := "K3 surface (Calabi-Yau)"
    scalarValue := 0
    scalarSign := "zero"
  }

def calabiYauExample : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean 6 with
    metricName := "Calabi-Yau 3-fold"
    scalarValue := 0
    scalarSign := "zero"
  }

def g2Example : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean 7 with
    metricName := "G2 manifold"
    scalarValue := 0
    scalarSign := "zero"
  }

def spin7Example : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean 8 with
    metricName := "Spin(7) manifold"
    scalarValue := 0
    scalarSign := "zero"
  }

def einsteinExample (n lambda : Int) : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean n.natAbs with
    metricName := s!"Einstein manifold"
    scalarValue := n * lambda
    scalarSign := "positive"
  }

def lieGroupExample (name : String) : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean 3 with
    metricName := s!"Lie group {name} (bi-invariant)"
  }

def productExample : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean 4 with
    metricName := "S^2 x R^2"
    sectionalMin := 0
    sectionalMax := 1
  }

def warpedExample : ConnectionCurvatureData :=
  { ConnectionCurvatureData.euclidean 4 with
    metricName := "Warped product"
  }

#eval "=== Examples/Standard Verification ==="
#eval s!"S^4 (r=1): {(sphereExample 4 1).scalarValue}"
#eval s!"R^4: {(euclideanExample 4).scalarValue}"
#eval s!"H^4: {(hyperbolicExample 4).scalarValue}"
#eval s!"de Sitter: {(deSitterExample 1).scalarValue}"
#eval s!"AdS: {antiDeSitterExample.scalarValue}"
#eval s!"K3: {(k3Example).scalarValue}"
#eval s!"Calabi-Yau: {(calabiYauExample).scalarValue}"
#eval s!"G2: {(g2Example).scalarValue}"
#eval s!"Spin(7): {(spin7Example).scalarValue}"
#eval "L6 Standard examples: Complete"

end MiniConnectionsCurvature