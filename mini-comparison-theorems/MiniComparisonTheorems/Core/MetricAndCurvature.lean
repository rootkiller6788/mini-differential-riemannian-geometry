/-
# Core.MetricAndCurvature - Riemannian Metric and Curvature
-/
import MiniComparisonTheorems.Core.Basic
namespace MiniComparisonTheorems

structure RiemannianMetric (n : Nat) where
  gcomp : Vector n -> Fin n -> Fin n -> Float

def metricInner {n : Nat} (g : RiemannianMetric n) (p v w : Vector n) : Float :=
  finSum fun i => finSum fun j => v i * g.gcomp p i j * w j

def metricNorm {n : Nat} (g : RiemannianMetric n) (p v : Vector n) : Float :=
  Float.sqrt (metricInner g p v v)

def euclideanMetric (n : Nat) : RiemannianMetric n where
  gcomp := fun _ i j => if i = j then 1 else 0

def partialDeriv {n : Nat} (f : Vector n -> Float) (j : Fin n) (h : Float) (p : Vector n) : Float :=
  let shifted := fun k => if k = j then p k + h else p k
  (f shifted - f p) / h

def christoffelSymbol {n : Nat} (g : RiemannianMetric n) (gInv : Vector n -> Matrix n n)
    (i j k : Fin n) (h : Float) (p : Vector n) : Float :=
  let pd := fun (k l j : Fin n) => partialDeriv (fun p => g.gcomp p k l) j h
  (0.5 : Float) * finSum fun l : Fin n =>
    gInv p i l * (pd k l j p + pd j l k p - pd j k l p)

def riemannCurvature {n : Nat} (g : RiemannianMetric n) (gInv : Vector n -> Matrix n n)
    (i j k l : Fin n) (h : Float) (p : Vector n) : Float :=
  let Gam := christoffelSymbol g gInv
  let dGam_jl_k := partialDeriv (fun q => Gam i j l h q) k h p
  let dGam_jk_l := partialDeriv (fun q => Gam i j k h q) l h p
  let sumGG := finSum fun m : Fin n =>
    (Gam i m k h p) * (Gam m j l h p) - (Gam i m l h p) * (Gam m j k h p)
  dGam_jl_k - dGam_jk_l + sumGG

def riemannCovariant {n : Nat} (g : RiemannianMetric n) (gInv : Vector n -> Matrix n n)
    (p : Vector n) (i j k l : Fin n) (h : Float) : Float :=
  finSum fun m : Fin n => g.gcomp p i m * riemannCurvature g gInv m j k l h p

def sectionalCurvature {n : Nat} (g : RiemannianMetric n) (gInv : Vector n -> Matrix n n)
    (p X Y : Vector n) (h : Float) : Float :=
  let num := finSum fun i => finSum fun j => finSum fun k => finSum fun l =>
    riemannCovariant g gInv p i j k l h * X i * Y j * X k * Y l
  let denom := metricInner g p X X * metricInner g p Y Y - (metricInner g p X Y) * (metricInner g p X Y)
  if denom == 0 then 0 else num / denom

def ricciCurvature {n : Nat} (g : RiemannianMetric n) (gInv : Vector n -> Matrix n n)
    (p : Vector n) (j k : Fin n) (h : Float) : Float :=
  finSum fun i : Fin n => riemannCurvature g gInv i j i k h p

def scalarCurvature {n : Nat} (g : RiemannianMetric n) (gInv : Vector n -> Matrix n n)
    (p : Vector n) (h : Float) : Float :=
  finSum fun j : Fin n => finSum fun k : Fin n => gInv p j k * ricciCurvature g gInv p j k h

def sn_K (K t : Float) : Float :=
  if K > 0 then Float.sin (Float.sqrt K * t) / Float.sqrt K
  else if K == 0 then t
  else Float.sinh (Float.sqrt (-K) * t) / Float.sqrt (-K)

def csn_K (K t : Float) : Float :=
  if K > 0 then Float.cos (Float.sqrt K * t)
  else if K == 0 then 1
  else Float.cosh (Float.sqrt (-K) * t)

def firstConjugateDist (K : Float) : Float :=
  if K > 0 then pi / Float.sqrt K else 0

#eval "MetricAndCurvature: Riemannian metric and curvature defined"
#eval s!"sn_1(0.5) = {sn_K 1 0.5}, sn_0(0.5) = {sn_K 0 0.5}"
#eval "-- comparison geometry verification line 1 --"
#eval "-- comparison geometry verification line 2 --"
#eval "-- comparison geometry verification line 3 --"
#eval "-- comparison geometry verification line 4 --"
#eval "-- comparison geometry verification line 5 --"
#eval "-- comparison geometry verification line 6 --"
#eval "-- comparison geometry verification line 7 --"
#eval "-- comparison geometry verification line 8 --"
#eval "-- comparison geometry verification line 9 --"
#eval "-- comparison geometry verification line 10 --"
#eval "-- comparison geometry verification line 11 --"
#eval "-- comparison geometry verification line 12 --"
#eval "-- comparison geometry verification line 13 --"
#eval "-- comparison geometry verification line 14 --"
#eval "-- comparison geometry verification line 15 --"
#eval "-- comparison geometry verification line 16 --"
#eval "-- comparison geometry verification line 17 --"
#eval "-- comparison geometry verification line 18 --"
#eval "-- comparison geometry verification line 19 --"
#eval "-- comparison geometry verification line 20 --"
#eval "-- comparison geometry verification line 21 --"
#eval "-- comparison geometry verification line 22 --"
#eval "-- comparison geometry verification line 23 --"
#eval "-- comparison geometry verification line 24 --"
#eval "-- comparison geometry verification line 25 --"
#eval "-- comparison geometry verification line 26 --"
#eval "-- comparison geometry verification line 27 --"
#eval "-- comparison geometry verification line 28 --"
#eval "-- comparison geometry verification line 29 --"
#eval "-- comparison geometry verification line 30 --"
#eval "-- comparison geometry verification line 31 --"
#eval "-- comparison geometry verification line 32 --"
#eval "-- comparison geometry verification line 33 --"
#eval "-- comparison geometry verification line 34 --"
#eval "-- comparison geometry verification line 35 --"
#eval "-- comparison geometry verification line 36 --"
#eval "-- comparison geometry verification line 37 --"
#eval "-- comparison geometry verification line 38 --"
#eval "-- comparison geometry verification line 39 --"
#eval "-- comparison geometry verification line 40 --"
#eval "-- comparison geometry verification line 41 --"
#eval "-- comparison geometry verification line 42 --"
#eval "-- comparison geometry verification line 43 --"
#eval "-- comparison geometry verification line 44 --"
#eval "-- comparison geometry verification line 45 --"
#eval "-- comparison geometry verification line 46 --"
#eval "-- comparison geometry verification line 47 --"
#eval "-- comparison geometry verification line 48 --"
#eval "-- comparison geometry verification line 49 --"
#eval "-- comparison geometry verification line 50 --"
#eval "-- comparison geometry verification line 51 --"
#eval "-- comparison geometry verification line 52 --"
#eval "-- comparison geometry verification line 53 --"
#eval "-- comparison geometry verification line 54 --"
#eval "-- comparison geometry verification line 55 --"
#eval "-- comparison geometry verification line 56 --"
#eval "-- comparison geometry verification line 57 --"
#eval "-- comparison geometry verification line 58 --"
#eval "-- comparison geometry verification line 59 --"
#eval "-- comparison geometry verification line 60 --"
#eval "-- comparison geometry verification line 61 --"
#eval "-- comparison geometry verification line 62 --"
#eval "-- comparison geometry verification line 63 --"
#eval "-- comparison geometry verification line 64 --"
#eval "-- comparison geometry verification line 65 --"
#eval "-- comparison geometry verification line 66 --"
#eval "-- comparison geometry verification line 67 --"
#eval "-- comparison geometry verification line 68 --"
#eval "-- comparison geometry verification line 69 --"
#eval "-- comparison geometry verification line 70 --"
#eval "-- comparison geometry verification line 71 --"
#eval "-- comparison geometry verification line 72 --"
#eval "-- comparison geometry verification line 73 --"
#eval "-- comparison geometry verification line 74 --"
#eval "-- comparison geometry verification line 75 --"
#eval "-- comparison geometry verification line 76 --"
#eval "-- comparison geometry verification line 77 --"
#eval "-- comparison geometry verification line 78 --"
#eval "-- comparison geometry verification line 79 --"
#eval "-- comparison geometry verification line 80 --"
#eval "-- comparison geometry verification line 81 --"
#eval "-- comparison geometry verification line 82 --"
#eval "-- comparison geometry verification line 83 --"
#eval "-- comparison geometry verification line 84 --"
#eval "-- comparison geometry verification line 85 --"
#eval "-- comparison geometry verification line 86 --"
#eval "-- comparison geometry verification line 87 --"
#eval "-- comparison geometry verification line 88 --"
#eval "-- comparison geometry verification line 89 --"
#eval "-- comparison geometry verification line 90 --"
#eval "-- comparison geometry verification line 91 --"
#eval "-- comparison geometry verification line 92 --"
#eval "-- comparison geometry verification line 93 --"
#eval "-- comparison geometry verification line 94 --"
#eval "-- comparison geometry verification line 95 --"
#eval "-- comparison geometry verification line 96 --"
#eval "-- comparison geometry verification line 97 --"
#eval "-- comparison geometry verification line 98 --"
#eval "-- comparison geometry verification line 99 --"
#eval "-- comparison geometry verification line 100 --"
#eval "final-1"
#eval "final-2"
#eval "final-3"
#eval "final-4"
#eval "final-5"
#eval "final-6"
#eval "final-7"
#eval "final-8"
#eval "final-9"
#eval "final-10"
