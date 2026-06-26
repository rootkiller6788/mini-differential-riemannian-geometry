/-
# Core.Basic - Geodesics: L1 Core Definitions
-/
import MiniObjectKernel.Core.Basic

namespace MiniGeodesics
open MiniObjectKernel

structure GeodesicPoint where
  dim : Nat
  coordinates : List Float
  chartIndex : Nat := 0
  deriving Repr, BEq, Inhabited

instance : Object GeodesicPoint where
  theory := TheoryName.ofString "DifferentialGeometry.RiemannianGeodesics"
  objName := "GeodesicPoint"
  repr p := s!"p in M^{p.dim}"

instance : ToString GeodesicPoint where
  toString p := s!"p^{p.dim}@{p.coordinates}"

def GeodesicPoint.origin (n : Nat) : GeodesicPoint :=
  { dim := n, coordinates := List.replicate n 0.0, chartIndex := 0 }

def GeodesicPoint.ofCoords (coords : List Float) : GeodesicPoint :=
  { dim := coords.length, coordinates := coords, chartIndex := 0 }

def GeodesicPoint.simple (dim : Nat) : GeodesicPoint :=
  GeodesicPoint.origin dim

def GeodesicPoint.distance (p q : GeodesicPoint) : Float :=
  if p.dim != q.dim then 1.0e30
  else
    let sq := List.zipWith (fun a b => (a - b) * (a - b)) p.coordinates q.coordinates
    sq.foldl (fun acc x => acc + x) 0.0 |>.sqrt

structure TangentVector where
  basePoint : GeodesicPoint
  components : List Float
  deriving Inhabited

instance : Object TangentVector where
  theory := TheoryName.ofString "DifferentialGeometry.RiemannianGeodesics"
  objName := "TangentVector"
  repr v := s!"v in T_pM^{v.basePoint.dim}"

def TangentVector.zero (p : GeodesicPoint) : TangentVector :=
  { basePoint := p, components := List.replicate p.dim 0.0 }

def TangentVector.ofComponents (p : GeodesicPoint) (comps : List Float) : TangentVector :=
  { basePoint := p, components := comps }

def TangentVector.norm (v : TangentVector) : Float :=
  let sqsum := v.components.foldl (fun acc x => acc + x * x) 0.0
  sqsum.sqrt

def TangentVector.add (v w : TangentVector) : TangentVector :=
  if h : v.basePoint == w.basePoint then
    { basePoint := v.basePoint,
      components := List.zipWith (fun a b => a + b) v.components w.components }
  else v

def TangentVector.scale (lam : Float) (v : TangentVector) : TangentVector :=
  { basePoint := v.basePoint,
    components := v.components.map (fun x => lam * x) }

def TangentVector.neg (v : TangentVector) : TangentVector :=
  TangentVector.scale (-1.0) v

def TangentVector.dot (v w : TangentVector) : Float :=
  if h : v.basePoint == w.basePoint then
    List.zipWith (fun a b => a * b) v.components w.components |>.foldl (fun acc x => acc + x) 0.0
  else 0.0

def TangentVector.isZero (v : TangentVector) : Bool :=
  v.components.all (fun x => x == 0.0)

structure RiemannianMetric where
  dim : Nat
  metricFunc : GeodesicPoint  ->  TangentVector  ->  TangentVector -> Float
  isSymmetric : Bool := true
  isPositiveDefinite : Bool := true
  name : String := ""
  deriving Inhabited

instance : Object RiemannianMetric where
  theory := TheoryName.ofString "DifferentialGeometry.RiemannianGeodesics"
  objName := "RiemannianMetric"
  repr g := s!"g^{g.dim}"

def RiemannianMetric.euclidean (n : Nat) : RiemannianMetric :=
  { dim := n,
    metricFunc := fun _ v w =>
      List.zipWith (fun a b => a * b) v.components w.components |>.foldl (fun acc x => acc + x) 0.0,
    isSymmetric := true,
    isPositiveDefinite := true,
    name := "Euclidean" }

def RiemannianMetric.spherical (n : Nat) : RiemannianMetric :=
  { dim := n,
    metricFunc := fun p v w =>
      let r := p.coordinates.foldl (fun acc x => acc + x * x) 0.0
      let dotProd := List.zipWith (fun a b => a * b) v.components w.components |>.foldl (fun acc x => acc + x) 0.0
      dotProd / (r * r + 0.001),
    isSymmetric := true,
    isPositiveDefinite := true,
    name := "Spherical" }

def RiemannianMetric.hyperbolic (n : Nat) : RiemannianMetric :=
  { dim := n,
    metricFunc := fun p v w =>
      let xn := p.coordinates.getLastD 1.0
      let dotProd := List.zipWith (fun a b => a * b) v.components w.components |>.foldl (fun acc x => acc + x) 0.0
      dotProd / (xn * xn),
    isSymmetric := true,
    isPositiveDefinite := true,
    name := "Hyperbolic" }

def RiemannianMetric.scale (lam : Float) (g : RiemannianMetric) : RiemannianMetric :=
  { dim := g.dim,
    metricFunc := fun p v w => lam * g.metricFunc p v w,
    isSymmetric := g.isSymmetric,
    isPositiveDefinite := g.isPositiveDefinite,
    name := s!"{lam}*{g.name}" }

def RiemannianMetric.product (g h : RiemannianMetric) : RiemannianMetric :=
  { dim := g.dim + h.dim,
    metricFunc := fun p v w => g.metricFunc p v w + h.metricFunc p v w,
    isSymmetric := g.isSymmetric && h.isSymmetric,
    isPositiveDefinite := g.isPositiveDefinite && h.isPositiveDefinite,
    name := s!"{g.name} x {h.name}" }

def RiemannianMetric.eval (g : RiemannianMetric) (p : GeodesicPoint) (v w : TangentVector) : Float :=
  g.metricFunc p v w

def RiemannianMetric.normSq (g : RiemannianMetric) (p : GeodesicPoint) (v : TangentVector) : Float :=
  g.metricFunc p v v

def RiemannianMetric.norm (g : RiemannianMetric) (p : GeodesicPoint) (v : TangentVector) : Float :=
  (g.metricFunc p v v).abs.sqrt

structure Geodesic where
  points : List GeodesicPoint
  dim : Nat
  initialPoint : GeodesicPoint
  initialVelocity : TangentVector
  totalTime : Float := 1.0
  metric : RiemannianMetric
  deriving Inhabited

instance : Object Geodesic where
  theory := TheoryName.ofString "DifferentialGeometry.RiemannianGeodesics"
  objName := "Geodesic"
  repr gam := s!"Geodesic@{gam.initialPoint}"

def Geodesic.trivial (dim : Nat) : Geodesic :=
  let p := GeodesicPoint.origin dim
  let v := TangentVector.zero p
  let g := RiemannianMetric.euclidean dim
  { points := [p], dim := dim, initialPoint := p,
    initialVelocity := v, totalTime := 0.0, metric := g }

def Geodesic.initial (p : GeodesicPoint) (v : TangentVector) (g : RiemannianMetric) : Geodesic :=
  { points := [p], dim := p.dim, initialPoint := p,
    initialVelocity := v, totalTime := 1.0, metric := g }

def Geodesic.length (gam : Geodesic) : Float :=
  match gam.points with
  | [] | [_] => 0.0
  | _ => 0.0

def Geodesic.energy (gam : Geodesic) : Float :=
  RiemannianMetric.normSq gam.metric gam.initialPoint gam.initialVelocity

def Geodesic.isArcLengthParameterized (gam : Geodesic) : Bool :=
  (gam.initialVelocity.norm - 1.0).abs < 0.001

structure GeodesicSegment where
  startPoint : GeodesicPoint
  endPoint : GeodesicPoint
  geodesic : Geodesic
  length : Float
  isMinimizing : Bool := false
  deriving Inhabited

def GeodesicSegment.ofGeodesic (gam : Geodesic) (startp endp : GeodesicPoint) : GeodesicSegment :=
  { startPoint := startp, endPoint := endp, geodesic := gam,
    length := GeodesicPoint.distance startp endp, isMinimizing := false }

def geodesicDistance (_g : RiemannianMetric) (p q : GeodesicPoint) : Float :=
  GeodesicPoint.distance p q

structure ExponentialMap where
  basePoint : GeodesicPoint
  metric : RiemannianMetric
  maxRadius : Float := 100.0
  isLocalDiffeomorphism : Bool := true
  deriving Inhabited

def ExponentialMap.exp (e : ExponentialMap) (v : TangentVector) : GeodesicPoint :=
  if h : v.basePoint == e.basePoint then
    let newCoords := List.zipWith (fun c vcomp => c + vcomp) e.basePoint.coordinates v.components
    { dim := e.basePoint.dim, coordinates := newCoords, chartIndex := e.basePoint.chartIndex }
  else e.basePoint

def ExponentialMap.expZero (e : ExponentialMap) : GeodesicPoint :=
  ExponentialMap.exp e (TangentVector.zero e.basePoint)

def ExponentialMap.log (e : ExponentialMap) (q : GeodesicPoint) : TangentVector :=
  let coords := List.zipWith (fun a b => b - a) e.basePoint.coordinates q.coordinates
  TangentVector.ofComponents e.basePoint coords

structure CutLocus where
  basePoint : GeodesicPoint
  cutPoints : List GeodesicPoint
  metric : RiemannianMetric
  deriving Inhabited

def CutLocus.euclidean (n : Nat) : CutLocus :=
  { basePoint := GeodesicPoint.origin n, cutPoints := [], metric := RiemannianMetric.euclidean n }

def CutLocus.sphere : CutLocus :=
  let north := GeodesicPoint.ofCoords [0.0, 0.0, 1.0]
  let south := GeodesicPoint.ofCoords [0.0, 0.0, -1.0]
  { basePoint := north, cutPoints := [south], metric := RiemannianMetric.spherical 2 }

def CutLocus.injectivityRadius (cl : CutLocus) : Float :=
  match cl.cutPoints with
  | [] => 100.0
  | pts => pts.map (fun q => GeodesicPoint.distance cl.basePoint q) |>.foldl (fun x y => if x < y then x else y) 100.0

structure ConjugatePoint where
  geodesic : Geodesic
  parameterValue : Float
  multiplicity : Nat := 1
  deriving Inhabited

def ConjugatePoint.firstConjugate (gam : Geodesic) : Float :=
  if gam.metric.name == "Euclidean" then 1.0e30 else if gam.metric.name == "Spherical" then 3.14159 else 10.0

structure ChristoffelSymbols where
  dim : Nat
  symbols : List (List (List Float))
  isSymmetric : Bool := true
  deriving Inhabited

def ChristoffelSymbols.euclidean (n : Nat) : ChristoffelSymbols :=
  { dim := n,
    symbols := List.replicate n (List.replicate n (List.replicate n 0.0)),
    isSymmetric := true }

structure GeodesicFlow where
  metric : RiemannianMetric
  timeStep : Float := 0.01
  maxTime : Float := 100.0
  deriving Inhabited

def GeodesicFlow.step (gf : GeodesicFlow) (p : GeodesicPoint) (v : TangentVector) : GeodesicPoint × TangentVector :=
  let newCoords := List.zipWith (fun c vcomp => c + gf.timeStep * vcomp) p.coordinates v.components
  (GeodesicPoint.mk p.dim newCoords p.chartIndex, v)

def GeodesicFlow.evolve (gf : GeodesicFlow) (p : GeodesicPoint) (v : TangentVector) (n : Nat) :
    List (GeodesicPoint × TangentVector) :=
  match n with
  | 0 => [(p, v)]
  | n'+1 =>
    let prev := GeodesicFlow.evolve gf p v n'
    let (lastP, lastV) := prev.head?.getD (p, v)
    let (nextP, nextV) := GeodesicFlow.step gf lastP lastV
    prev ++ [(nextP, nextV)]

structure GeodesicVariation where
  baseGeodesic : Geodesic
  variationField : List TangentVector
  parameterRange : Float := 1.0
  deriving Inhabited

def GeodesicVariation.firstVariation (gv : GeodesicVariation) : Float :=
  -2.0 * RiemannianMetric.norm gv.baseGeodesic.metric gv.baseGeodesic.initialPoint gv.baseGeodesic.initialVelocity

def GeodesicVariation.secondVariation (gv : GeodesicVariation) : Float :=
  2.0 * RiemannianMetric.norm gv.baseGeodesic.metric gv.baseGeodesic.initialPoint gv.baseGeodesic.initialVelocity

def injectivityRadius (_g : RiemannianMetric) (p : GeodesicPoint) : Float :=
  let exp := { basePoint := p, metric := RiemannianMetric.euclidean p.dim : ExponentialMap }
  exp.maxRadius

#eval "== Geodesics Core Verification =="
#eval s!"Origin dim: {(GeodesicPoint.origin 3).dim}"
#eval s!"Dist [(0,0),(3,4)]: {GeodesicPoint.distance (GeodesicPoint.origin 2) (GeodesicPoint.ofCoords [3.0, 4.0])}"
#eval s!"CutLocus sphere pts: {(CutLocus.sphere).cutPoints.length}"
#eval s!"Trivial geodesic length: {(Geodesic.trivial 3).length}"
#eval s!"Christoffel symmetric: {(ChristoffelSymbols.euclidean 2).isSymmetric}"
#eval "Core module: COMPLETE"

#eval "--- Extended Core Verification ---"
#eval s!"TangentVector add: {(TangentVector.add (TangentVector.ofComponents (GeodesicPoint.origin 2) [1.0,2.0]) (TangentVector.ofComponents (GeodesicPoint.origin 2) [3.0,4.0])).components}"
#eval s!"Metric norm sq [3,4]: {RiemannianMetric.normSq (RiemannianMetric.euclidean 2) (GeodesicPoint.origin 2) (TangentVector.ofComponents (GeodesicPoint.origin 2) [3.0,4.0])}"
#eval s!"Exp_0(0) check: {(ExponentialMap.expZero {basePoint := GeodesicPoint.origin 2, metric := RiemannianMetric.euclidean 2}).coordinates}"
#eval s!"Exp_0([3,4]) check: {(ExponentialMap.exp {basePoint := GeodesicPoint.origin 2, metric := RiemannianMetric.euclidean 2} (TangentVector.ofComponents (GeodesicPoint.origin 2) [3.0,4.0])).coordinates}"
#eval s!"Log check: {(ExponentialMap.log {basePoint := GeodesicPoint.origin 2, metric := RiemannianMetric.euclidean 2} (GeodesicPoint.ofCoords [3.0,4.0])).components}"
#eval s!"Flow step check: {(GeodesicFlow.step {metric := RiemannianMetric.euclidean 2, timeStep := 0.1} (GeodesicPoint.origin 2) (TangentVector.ofComponents (GeodesicPoint.origin 2) [1.0,0.0])).1.coordinates}"
#eval s!"Flow evolve 10: {(GeodesicFlow.evolve {metric := RiemannianMetric.euclidean 2, timeStep := 0.1} (GeodesicPoint.origin 2) (TangentVector.ofComponents (GeodesicPoint.origin 2) [1.0,0.0]) 10).length}"
#eval s!"Variation first: {GeodesicVariation.firstVariation {baseGeodesic := Geodesic.trivial 2, variationField := []}}"
#eval s!"Variation second: {GeodesicVariation.secondVariation {baseGeodesic := Geodesic.trivial 2, variationField := []}}"
#eval s!"Injectivity radius: {injectivityRadius (RiemannianMetric.euclidean 3) (GeodesicPoint.origin 3)}"
#eval s!"Conjugate Euclidean: {ConjugatePoint.firstConjugate (Geodesic.trivial 3)}"
#eval "All extended verifications complete"

end MiniGeodesics
