## 0. 可控性分析的对象——LTI系统
对于如下微分方程形式的系统我们称之为**线性非时变系统 (LTI, linear time-invariant)**
$$
\begin{split}
\dot{\mathbf{x}}(t) &= A\mathbf{x}(t) + B\mathbf{u}(t) \\
\mathbf{y}(t) & = C \mathbf{x}(t)
\end{split} \tag{1} 
$$
其中：
- $\mathbf{x}(t) = [x_{1}(t),x_{2}(t),\dots,x_{N+M}(t)]^{\text{T}} \in\mathbb{R}^{N+M}$ 表示我们所研究的系统中的 $N+M$ 个节点在时刻 $t$ 的状态。如 $x_{i}(t)$ 表示系统中第 $i$ 个节点在时刻 $t$ 的状态。
- $\mathbf{u}(t) = [u_{1}(t),u_{2}(t),\dots,u_{S}(t)]^{\text{T}}\in\mathbb{R}^{S}$ 表示作用于系统的 $S$ 个外部刺激（或控制信号）在时刻 $t$ 的状态。如 $u_{j}(t)$ 表示第 $j$ 个外部刺激在时刻 $t$ 的状态。
- $\mathbf{y}(t) = [y_{1}(t),y_{2}(t),\dots,y_{M}(t)]^{\text{T}}\in\mathbb{R}^{M}$ 表示在系统中我们所希望控制的 $M$ 个目标节点在时刻 $t$ 的状态。
- $A\in \mathbb{R}^{(N+M)\times(N+M)}$ 的非主对角线元素表示系统内节点之间的相互作用，主对角线元素表示系统中节点自身的动力学特性。如：$a_{ij}\neq 0 \,(i\neq j)$ 表示系统内第 $j$ 个节点的状态会影响第 $i$ 个节点状态；而 $a_{ii} \neq 0$ 表示第 $i$ 个节点自身的动力学特征。
- $B\in \mathbb{R}^{(N+M)\times S}$ 表示外部刺激与系统内部节点之间的联系，即：哪些刺激直接作用于哪些系统内部节点。如 $b_{ij} \neq 0$ 表示第 $j$ 个外部刺激直接作用于第 $i$ 个系统内部节点。
- $C\in \mathbb{R}^{M\times(N+M)}$ 是一个从 $N+M$ 个元素中筛选出 $M$ 个元素的矩阵。即通过一定的行列变化，可以将矩阵 $C$ 拆分为一个 $M$ 维的单位矩阵和一个 $N\times M$ 维的零矩阵。

## 1. 可控性 (Controllability) 的定义
对于我们希望控制的节点，这些节点状态组成的向量 $\mathbf{y}(t)$ 可以从任一初始状态 $\mathbf{y}(t_{0})$ 出发，经过有限的时间 $t_{f} - t_{0}$，以及在这段时间内的外部刺激的作用 $\mathbf{u}(t),\,t\in(t_{0},t_{f})$。其最终能抵达任一最终状态 $\mathbf{y}(t_{f})$。即：$M$ 维向量 $\mathbf{y}(t)$ 可以到达 $M$ 维空间 $(\mathbb{R}^{M})$ 内的任意一点。


<figure>
<img src="https://new-pic-zpp.oss-cn-guangzhou.aliyuncs.com/pic/202312191434226.svg"/>
<figcaption><strong>fig.1</strong>以三维空间为例，可控性指的是希望控制的三个节点的状态组成的向量 $\mathbf{y}(t) \in\mathbb{R}^{3}$，可以从从<font color=#0072B2>初始状态</font>出发，经过一定的外部刺激，抵达任意的<font color=#E69F00>最终状态</font>。</figcaption>
</figure>


## 2. 可控性的判定——Kalman Rank Criterion
根据Kalman的秩判断标准：只有当矩阵 $K = [CB,CAB, CA^{2}B, \dots, CA^{N+M-1}B]$ 行满秩时，我们期望控制的节点才是可控的。即对于$(1)$式描述的系统，我们希望控制的节点时可控的，当且仅当：
$$
\mathrm{rank}(K) = \mathrm{rank}([CB,CAB, CA^{2}B, \dots, CA^{N+M-1}B]) = M \tag{2} 
$$

对于矩阵 $A,B$ 内的非零元素的具体数值，我们也可以将其抽象为一个个独立非零变量。即只保留其结构，再对其进行可控性的判断。

<div id="example1"></div>

> [!note|label:Example1 - 可控性判定] 
> 对于下图所表述的一个系统
> 
> <figure><img src="https://new-pic-zpp.oss-cn-guangzhou.aliyuncs.com/pic/202312191515061.svg"/><figcaption style="text-align:center"><strong>fig.e.1</strong> 蓝色节点表示系统的输入节点，红色节点表示目标控制节点</figcaption></figure>
>
> 据此，可获得如下三个矩阵：其中 $a_{ij} \neq 0$ 且相互独立，$a_{ij}$ 表示存在从节点 $X_{j}$ 到节点 $X_{i}$ 的有向连接；而 $b_{ik}$ 表示存在刺激 $k$ 向节点 $i$ 的连接
> 
> $$\begin{gather*}  A =  \begin{bmatrix} 0  & 0 & 0  & 0  \\ * & 0 & 0 & 0 \\ * & 0 & 0 & 0 \\ 0 & 0 & * & 0 \end{bmatrix} \implies\begin{bmatrix} 0  & 0 & 0  & 0  \\ a_{21} & 0 & 0 & 0 \\ a_{31} & 0 & 0 & 0 \\ 0 & 0 & a_{43} & 0 \end{bmatrix}  \\ \\  B =  \begin{bmatrix} * \\ 0 \\ 0 \\ 0 \end{bmatrix} \implies \begin{bmatrix} b_{11}  \\ 0 \\ 0 \\ 0 \end{bmatrix} \\ \\ C =  \begin{bmatrix} 0 & 1  & 0 & 0 \\ 0 & 0 & 0 & 1 \end{bmatrix} \implies  \begin{bmatrix} 0 & c_{12}  & 0 & 0  \\ 0  & 0 & 0 & c_{24} \end{bmatrix} \end{gather*} $$
> 然后我们对这些抽象独立变量进行计算，得到矩阵 $[CB,CAB,CA^{2}B,CA^{3}B]$
> $$ K =[CB,\,CAB,\,CA^{2}B,\, CA^{3}B] =  \begin{bmatrix} 0  & c_{12}b_{11}a_{21}  & 0 & 0 \\ 0  & 0  & c_{24}b_{11}a_{43}a_{31} & 0 \end{bmatrix} $$
> 明显可见矩阵 $K = [CB,CAB,CA^{2}B,CA^{3}B]$ 行满秩，故是可控的



# 3. 可控节点的数值估计
### 3.1 可控节点的数目的上限
1. **动态图 (dynamic graph)** 对于 $(1)$ 式所描述的系统，我们可以把节点分为三类：外部刺激节点 $V_{B}$，系统内部节点 $V_{A}$ 和目标控制节点 $V_{C}$；在根据矩阵 $A,B,C$ 以及上一时刻的刺激作用于下一时刻的节点，或上一时刻的上游节点影响下一时刻的下游节点的规则建立相应的连边。用集合语言可表示为，动态图 $\tilde{G}(V,E)$（$V=V_{A}\cup V_{B} \cup V_{C},\, E = E_{A}\cup E_{B}\cup E_{C}$）其中：
	$$
	\begin{split}
	V_{A} &= \{ v^{A}_{i,t}\, \vert\, i = 1,2,\dots, N+M,\,t = 1,2,\dots,N+M \} \\
	V_{B} &= \{ v^{B}_{i,t}\, \vert\, i = 1,2,\dots, S,\,t = 0, 1,\dots,N+M -1 \} \\
	V_{C} &= \{ v^{C}_{i}\, \vert\, i = 1,2,\dots, M \}  \\ \\
	E_{A} & = \{ v^{A}_{j,t} \to v^{A}_{i,t+1}\, \vert\, a_{ij} \neq 0, t=1,2,\dots,N+M-1 \} \\
	E_{B} & = \{ v^{B}_{j,t} \to v^{A}_{i,t+1}\, \vert\, b_{ij} \neq 0, t=0,1,\dots,N+M-1 \} \\
	E_{C} & = \{ v^{A}_{j,t} \to v^{C}_{i}\, \vert\, b_{ij} \neq 0, t=N+M \} \\
	\end{split}
	$$
2. 计算该动态图的**连接尺寸 (linking size)** 即动态图中的从节点集合 $V_{B}$ 到节点集合 $V_{C}$ 中不相交通路的个数，其为可控节点数的上限<sup>[[#reference|1]]</sup>。


> [!NOTE|label:Example2 - 动态图的绘制] 
> 对于[[#example1|Example1]]中所示的系统，我们可以将其转化为如下的动态图。
> 
> <figure><img src="https://new-pic-zpp.oss-cn-guangzhou.aliyuncs.com/pic/202312191552118.svg"/><figcaption><strong>fig.e.2</strong> 如图所示，左图表示的系统的拓扑结构。右图是根据左图的拓扑结构得出的动态图。<font color=#FFB570>黄色节点</font> $V_{B}$ 对应于外部刺激 $u$，黑色节点 $V_{B}$ 对应于我们所研究系统中的所有的节点，<font color=#D80273>红色节点</font>对应于我们希望控制的节点。对于连边：外部刺激作用于节点 $X_{1}$，故存在上一时刻的外部刺激 $v^{B}_{1,t}$ 指向下一时刻系统内节点 $v^{A}_{1,t+1}$ 的连边；而节点 $X_{1}$ 直接作用于节点 $X_{2},X_{3}$，因此存在上一时刻的节点 $v^{A}_{1,t}$ 指向下一时刻的节点 $v_{2,t+1}^{A},v_{3,t+1}^{A}$；而我们希望控制的是节点 $X_{2},X_{4}$ 故存在分别由 $v^{A}_{2,4},v^{A}_{4,4}$ 指向 $v^{C}_{1},v^{C}_{2}$ 的连边。此外，图中的红色连边代表由 $V_{B}$ 指向 $V_{C}$ 的两条不相交路径，故其连接尺寸为 $2$。<strong></strong></figcaption></figure>


> [!tip|label:Tips - 如何在计算机中计算连接尺寸] 
> 我们可以将如上的动态图转化为如下图所示的每个节点和边的最大容量均为 $1$ 的多源多汇最大流问题，并进行求解
> 
> <figure><img src="https://new-pic-zpp.oss-cn-guangzhou.aliyuncs.com/pic/202312191612256.svg"/></figure>


### 3.2 可控节点的数目的下限
（对于线虫神经环路的研究）通过以下方法确定可控节点数目的下限<sup>[[#reference|2]]</sup>：如下图所示，作者将整个连接组网络分为如下的子网络

<figure>
<img src="https://new-pic-zpp.oss-cn-guangzhou.aliyuncs.com/pic/202312191650615.svg"/>
<figcaption><strong>fig.2</strong> 对于网络的划分：首先可以根据节点的类型分为两个子网络：$G_{O}$ 代表其中神经元组成的子网络、$G_{M}$ 代表其中由肌肉组成的子网络；其中，子网络 $G_{O}$ 可进一步分为由感觉神经元组成的子网络 $G_{S}$ 和运动神经元（肌肉邻近神经元）组成的子网络 $G_{D}$。</figcaption>
</figure>

 1. 首先，在子网络 $G_{O} - G_{D}$ 中，根据外部刺激 $V_{S}$，我们先找出一个可由外部刺激 $V_{S}$ 完全可控的子网络。（<mark>后面再看了看Supplement发现和pre里说的不太一样</mark>）
 2. 在第一步的基础上，向第一步所得的子网络中依次加入 $G_{D}$ 中的节点（及其相关的连边），直到新的子网络无法完全由外部刺激 $V_{S}$ 控制为止。并得到一个新子图 $G_{F}$，记同属于子图 $G_{D}$ 和 $G_{F}$ 的节点为 $V_{D-}$。
 3. 寻找从集合 $V_{D-}$ 向 $V_{M}$ 的**最大匹配 (maximum matching)** 并通过匹配获得节点集合 $U\subseteq V_{M}$。集合 $U$ 的**势 (cardinality)** ，即集合中的元素个数为可控节点数的最小值。


## 4. 举例
运用以上的分析方法，我们可以模拟计算和对比正常线虫的可控肌肉数目和消融某类神经元后的线虫的可控肌肉数目，进而判断所消融的神经元对于线虫的运动是否重要。

# Reference
<small>[1](https://ieeexplore.ieee.org/abstract/document/58507/) Murota, K., & Poljak, S. (1990). Note on a graph-theoretic criterion for structural output controllability. _IEEE Transactions on Automatic Control_, _35_(8), 939-942.</small> <br/>
<small>[2](https://doi.org/10.1038/nature24056) Yan, G., Vértes, P. E., Towlson, E. K., Chew, Y. L., Walker, D. S., Schafer, W. R., & Barabási, A. L. (2017). Network control principles predict neuron function in the Caenorhabditis elegans connectome. _Nature_, _550_(7677), 519-523.</small>  










