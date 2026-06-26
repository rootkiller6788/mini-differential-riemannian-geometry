# 迷你微分几何与黎曼几何

一套**从零开始、零依赖的 Lean 4 形式化**，涵盖大学层次的微分几何与黎曼几何。每个模块对应 MIT、剑桥、斯坦福等顶尖大学的课程，通过将教科书定理翻译为可验证的 Lean 4 代码，实现理论与计算的桥接。

## 子模块

| 子模块 | 主题 | 参考课程 |
|--------|------|-------------|
| [mini-riemannian-metrics](mini-riemannian-metrics/) | 黎曼度量张量、Levi-Civita 联络、曲率张量（Riemann/Ricci/Scalar）、Koszul 公式、基本定理、Einstein 度量、Kähler 度量、和乐群、Ricci 流 | MIT 18.950/18.966, Stanford MATH 215C, Princeton MAT 540 |
| [mini-geodesics](mini-geodesics/) | 测地线方程、指数映射、测地流、Jacobi 场、割迹、共轭点、Hopf-Rinow、Cartan-Hadamard、Bonnet-Myers、Synge、Rauch 比较、Morse 指标定理 | MIT 18.950, Cambridge Part III, Oxford C3.10 |
| [mini-connections-curvature](mini-connections-curvature/) | 仿射联络、Christoffel 符号、协变导数、Riemann 曲率张量、Ricci 张量、截面曲率、Bianchi 恒等式、Einstein 方程、Yang-Mills、Chern-Weil 理论、指标定理 | MIT 18.950/18.951/18.955, ETH 401-3354 |
| [mini-comparison-theorems](mini-comparison-theorems/) | Rauch 比较、Berger-Klingenberg、Toponogov 比较、Bishop-Gromov 体积比较、球定理、Riccati 方程、Alexandrov 几何、体积熵 | Cambridge Part III, ETH 401-3574, ENS |
| [mini-hodge-theory](mini-hodge-theory/) | Hodge 分解、调和形式、Hodge 星算子、Laplace 算子、Kähler 流形、Hodge 结构、Poincaré 对偶、符号差、Betti 数、代数链 | MIT 18.965, Harvard Math 230a, Cambridge Part III |
| [mini-spin-geometry](mini-spin-geometry/) | Clifford 代数、旋量群、旋量表示、Dirac 算子、Lichnerowicz 公式、Weitzenböck 公式、Atiyah-Singer 指标定理、Seiberg-Witten 不变量、正数量曲率 | Harvard Math 242, Cambridge Part III, Princeton |
| [mini-einstein-equations](mini-einstein-equations/) | Einstein 场方程、Einstein 张量、应力-能量张量、Schwarzschild/FLRW/引力波时空、缩并 Bianchi、Raychaudhuri 方程、Penrose-Hawking 奇点定理、黑洞热力学 | MIT 8.962, Cambridge Part III, Stanford Physics 364 |
| [mini-symplectic-geometry](mini-symplectic-geometry/) | 辛形式、Darboux 定理、Hamilton 力学、矩映射、辛约化、Gromov 不可压缩定理、Arnold 猜想、Floer 同调、镜像对称 | MIT 18.966, Cambridge Part III, ETH |

## 设计理念

- **零外部依赖** — 纯 Lean 4（v4.7.0），仅使用 Lean 标准库的自包含形式化
- **模块自包含** — 每个目录自带 `lakefile.lean`、源码文件、`docs/` 和 `Benchmark/`，覆盖课程对齐的定理
- **理论到定理的映射** — 每个模块包含课程对齐文档（`docs/course-alignment.md`）和对照实际大学课程大纲的基准文件
- **全面覆盖** — 每个模块跨越 L1 定义到 L8 进阶主题，涵盖已验证的定理、典则示例和跨域桥接

## 构建方式

每个模块相互独立。进入模块目录后运行：

```bash
cd mini-riemannian-metrics
lake build    # 构建全部
```

需要 **Lean 4**（v4.7.0+）和 **Lake** 构建系统。

## 项目结构

```
mini-differential-riemannian-geometry/
├── mini-riemannian-metrics/     # 黎曼度量与曲率张量
├── mini-geodesics/              # 测地线理论与 Jacobi 场
├── mini-connections-curvature/  # 仿射联络与曲率不变量
├── mini-comparison-theorems/    # 黎曼几何中的比较定理
├── mini-hodge-theory/           # Hodge 理论与调和形式
├── mini-spin-geometry/          # 旋量几何与 Dirac 算子
├── mini-einstein-equations/     # Einstein 方程与广义相对论
└── mini-symplectic-geometry/    # 辛几何与 Hamilton 力学
```

## 许可证

MIT
