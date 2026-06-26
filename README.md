# Mini Differential & Riemannian Geometry

A collection of **from-scratch, zero-dependency Lean 4 formalizations** of university-level differential and Riemannian geometry. Each module maps to MIT, Cambridge, Stanford, and other top-tier university courses, bridging theory and computation by translating textbook theorems into verified Lean 4 code.

## Sub-Modules

| Sub-Module | Topics | Key Courses |
|------------|--------|-------------|
| [mini-riemannian-metrics](mini-riemannian-metrics/) | Metric tensors, Levi-Civita connection, curvature tensors (Riemann/Ricci/Scalar), Koszul formula, fundamental theorem, Einstein metrics, Kähler metrics, holonomy, Ricci flow | MIT 18.950/18.966, Stanford MATH 215C, Princeton MAT 540 |
| [mini-geodesics](mini-geodesics/) | Geodesic equation, exponential map, geodesic flow, Jacobi fields, cut locus, conjugate points, Hopf-Rinow, Cartan-Hadamard, Bonnet-Myers, Synge, Rauch comparison, Morse index theorem | MIT 18.950, Cambridge Part III, Oxford C3.10 |
| [mini-connections-curvature](mini-connections-curvature/) | Affine connections, Christoffel symbols, covariant derivatives, Riemann curvature tensor, Ricci tensor, sectional curvature, Bianchi identities, Einstein equations, Yang-Mills, Chern-Weil theory, index theorems | MIT 18.950/18.951/18.955, ETH 401-3354 |
| [mini-comparison-theorems](mini-comparison-theorems/) | Rauch comparison, Berger-Klingenberg, Toponogov comparison, Bishop-Gromov volume comparison, sphere theorems, Riccati equation, Alexandrov geometry, volume entropy | Cambridge Part III, ETH 401-3574, ENS |
| [mini-hodge-theory](mini-hodge-theory/) | Hodge decomposition, harmonic forms, Hodge star, Laplacian, Kähler manifolds, Hodge structures, Poincaré duality, signature, Betti numbers, algebraic cycles | MIT 18.965, Harvard Math 230a, Cambridge Part III |
| [mini-spin-geometry](mini-spin-geometry/) | Clifford algebras, spin groups, spinor representations, Dirac operators, Lichnerowicz formula, Weitzenböck formula, Atiyah-Singer index theorem, Seiberg-Witten invariants, positive scalar curvature | Harvard Math 242, Cambridge Part III, Princeton |
| [mini-einstein-equations](mini-einstein-equations/) | Einstein field equations, Einstein tensor, stress-energy tensor, Schwarzschild/FLRW/GW spacetimes, contracted Bianchi, Raychaudhuri equation, Penrose-Hawking singularity theorems, black hole thermodynamics | MIT 8.962, Cambridge Part III, Stanford Physics 364 |
| [mini-symplectic-geometry](mini-symplectic-geometry/) | Symplectic forms, Darboux theorem, Hamiltonian mechanics, moment maps, symplectic reduction, Gromov non-squeezing, Arnold conjectures, Floer homology, mirror symmetry | MIT 18.966, Cambridge Part III, ETH |

## Design Philosophy

- **Zero external dependencies** — Pure Lean 4 (v4.7.0), self-contained formalizations using only the Lean standard library
- **Self-contained modules** — Each directory has its own `lakefile.lean`, source files, `docs/`, and `Benchmark/` covering course-aligned theorems
- **Theory-to-theorem mapping** — Every module includes course-alignment documentation (`docs/course-alignment.md`) and benchmark files checking coverage against actual university curricula
- **Comprehensive coverage** — Each module spans L1 definitions through L8 advanced topics, with verified theorems, canonical examples, and cross-domain bridges

## Building

Each module is standalone. Navigate to a module directory and run:

```bash
cd mini-riemannian-metrics
lake build    # build everything
```

Requires **Lean 4** (v4.7.0+) and **Lake** build system.

## Project Structure

```
mini-differential-riemannian-geometry/
├── mini-riemannian-metrics/     # Riemannian Metrics & Curvature Tensors
├── mini-geodesics/              # Geodesic Theory & Jacobi Fields
├── mini-connections-curvature/  # Affine Connections & Curvature Invariants
├── mini-comparison-theorems/    # Comparison Theorems in Riemannian Geometry
├── mini-hodge-theory/           # Hodge Theory & Harmonic Forms
├── mini-spin-geometry/          # Spin Geometry & Dirac Operators
├── mini-einstein-equations/     # Einstein Equations & General Relativity
└── mini-symplectic-geometry/    # Symplectic Geometry & Hamiltonian Mechanics
```

## License

MIT
