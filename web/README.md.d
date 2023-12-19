# Network control principles predict neuron function in the _Caenorhabditis elegans_ connectome

## Outline
本研究主要分为两个部分：第一，作者使用控制论中的**可控性 (Controllability)** 这一概念对于线虫的连接组进行分析，从中找出对于线虫的**刺激-反应过程 (stimulus-response process)** 具有重要作用的神经元。第二，作者使用去除神经元的行为学实验，验证第一步分析的有效性。

<figure>
<img align="center" width="450" height="320"  src="https://new-pic-zpp.oss-cn-guangzhou.aliyuncs.com/pic/202312141907860.svg" title="title"/>
<figcaption><strong>fig.1</strong> 上图是一个从刺激-反应过程的示意图，其为一个加权有向图，首先波浪线箭头表示的是外部的刺激，<font style="color:#1AA1E2">蓝色节点</font>表示的是线虫中的感受神经元，<font style="color:#BAC8D3">灰色节点</font>表示的是中间神经元，<font style="color:#F0A309">橙色神经元</font>表示的是与肌肉组织相邻的神经元（或运动神经元），<font style="color:#D80273">红色节点</font>表示的是肌肉。</figcaption>
</figure>



## 可控性 (Controllability) 分析 
### 线性非时变 (LTI, linear time-invariant) 系统
对于如下微分方程表示的系统，我们称之为**线性非时变 (LTI, linear time-invariant) 系统**
$$
\dot{\mathbf{x}}(t) = A \mathbf{x}(t) + B \mathbf{u}(t)
$$

- $\mathbf{x}(t) = [x_{1}(t), x_{2}(t), \cdots, x_{N+M}(t)]^{\text{T}} \in \mathbb{R}^{N+M}$ 表示系统内 $N+M$ 个节点的状态。如：$x_{i}(t)$ 表示的就是系统内第 $i$ 个节点在时刻 $t$ 的状态。
- $\mathbf{u}(t) = [u_{1}(t),u_{2}(t), \cdots, u_{S}(t)]^{\text{T}} \in \mathbb{R}^{S}$ 表示作用于系统的 $S$ 个外部刺激的状态。例如：$u_{i}(t)$ 表示的就是第 $i$ 个外部刺激在时刻 $t$ 的状态。
- $A \in \mathbb{R}^{(N+M)\times (N+M)}$ 表示的是 $N+M$ 个内部节点之间的相互作用 ($a_{ij}, (i \neq j)$ ) 或节点自身的动力学 ($a_{ii}$)。如：$a_{ij}$ 表示的存在系统内节点 $x_{j}$ 对于节点 $x_{i}$ 的作用。
- $B \in \mathbb{R}^{(N+M) \times S}$ 表示的是 $S$ 个外部刺激与 $N+M$  个系统内部节点之间的关系，即哪些刺激直接作用于哪些节点。例如，$b_{ij}\neq 0$ 表示外部刺激 $u_{j}$ 直接作用于内部节点 $x_{i}$。





