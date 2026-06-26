import MiniConnectionsCurvature.Core.Basic
namespace MiniConnectionsCurvature

set_option maxHeartbeats 400000

#eval "=== Almanac: Key Formulas ==="
#eval "Christoffel: Gamma^i_{jk} = (1/2)g^{il}(g_{lj,k}+g_{lk,j}-g_{jk,l})"
#eval "Riemann: R^i_{jkl} = d_kGamma - d_lGamma + GammaGamma - GammaGamma"
#eval "Ricci: R_{jl} = R^i_{jil}"
#eval "Scalar: R = g^{jl}R_{jl}"
#eval "Einstein: G_{ij} = R_{ij} - (1/2)Rg_{ij}"
#eval "Bianchi 1: R^i_{jkl} + R^i_{klj} + R^i_{ljk} = 0"
#eval "Bianchi 2: nabla_m R^i_{jkl} + cyclic = 0"
#eval "Contracted: nabla^i G_{ij} = 0"
#eval "Gauss-Bonnet (2D): int K dA = 2pi chi"
#eval "Gauss-Bonnet-Chern: int Pf(Omega) = (2pi)^n chi"
#eval "Signature theorem: sigma = L-genus"
#eval "Index theorem: ind(D) = A-hat ch(E)"

#eval "=== Einstein Equations ==="
#eval "G_{munu} + Lambda g_{munu} = 8pi G/c^4 T_{munu}"
#eval "Vacuum: R_{munu} = Lambda g_{munu}"

#eval "=== Symmetric Spaces ==="
#eval "S^n = SO(n+1)/SO(n)"
#eval "CP^n = SU(n+1)/U(n)"
#eval "HP^n = Sp(n+1)/Sp(n)xSp(1)"
#eval "CaP^2 = F_4/Spin(9)"
#eval "Gr(k,n) = O(n)/O(k)xO(n-k)"

#eval "=== Holonomy (Berger) ==="
#eval "SO(n): generic Riemannian"
#eval "U(n/2): Kaehler"
#eval "SU(n/2): Calabi-Yau (Ricci-flat)"
#eval "Sp(n/4): hyper-Kaehler (Ricci-flat)"
#eval "G2: 7-dimensional, Ricci-flat"
#eval "Spin(7): 8-dimensional, Ricci-flat"
#eval "Almanac complete"

end MiniConnectionsCurvature