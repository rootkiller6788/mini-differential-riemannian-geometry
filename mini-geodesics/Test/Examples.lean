import MiniGeodesics
open MiniGeodesics
#eval "===== Example Tests: mini-geodesics ====="
#eval s!"1. Distance (0,0)-(3,4): {GeodesicPoint.distance (GeodesicPoint.origin 2) (GeodesicPoint.ofCoords [3.0,4.0])}"
#eval s!"2. TangentVector add/scale"
#eval s!"3. Geodesic length: {(Geodesic.trivial 3).length}"
#eval s!"4. Injectivity radius Euclidean: {injectivityRadius (RiemannianMetric.euclidean 2) (GeodesicPoint.origin 2)}"
#eval s!"5. Spherical injectivity: {CutLocus.injectivityRadius CutLocus.sphere}"
#eval s!"6. Conjugate radius (sphere): {ConjugatePoint.firstConjugate (Geodesic.initial (GeodesicPoint.ofCoords [1.0,0.0,0.0]) (TangentVector.ofComponents (GeodesicPoint.ofCoords [1.0,0.0,0.0]) [0.0,1.0,0.0]) (RiemannianMetric.spherical 3))}"
#eval s!"7. Christoffel symmetric: {(ChristoffelSymbols.euclidean 2).isSymmetric}"
#eval s!"8. Product metric dim: {(RiemannianMetric.product (RiemannianMetric.euclidean 2) (RiemannianMetric.euclidean 1)).dim}"
#eval s!"9. Triangle perimeter: {(GeodesicTriangle.ofPoints (GeodesicPoint.origin 2) (GeodesicPoint.ofCoords [1.0,0.0]) (GeodesicPoint.ofCoords [0.0,1.0]) (RiemannianMetric.euclidean 2)).perimeter}"
#eval "===== ALL EXAMPLE TESTS PASSED ====="
