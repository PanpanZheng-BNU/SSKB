> <small>Yan, G., Vértes, P., Towlson, E. _et al._ Network control principles predict neuron function in the _Caenorhabditis elegans_ connectome. _Nature_ **550**, 519–523 (2017). https://doi.org/10.1038/nature24056</small>

## 1. 文章总结与评论
### 1.1 文章研究了什么问题
本文引用了控制论中的**可控性 (Controllability)** 这一概念，对**秀丽隐杆线虫 (_C. elegans_)** （后简称“线虫”）的刺激-反应环路进行分析，找出了被先前研究者所忽略的而对于线虫运动控制具有重要作用的一类神经元PDB。

### 1.2 怎么来进行研究的
#### 1.2.1 理论分析部分
1. 首先，作者使用了一套方法来确定线虫环路中可控肌肉数目的上限<sup>[[#reference|1]]</sup>和下限<sup>[[#reference|2]]</sup>。得出正常（健康）线虫的刺激-反应环路中可控肌肉的数目。
2. 然后，作者尝试对线虫的某类神经元或某单个神经元进行<strong>消融 (ablation)</strong>，然后再次估计其可控神经元的数目，若其可控肌肉的数目下降，则说明过这类或这个神经元对于线虫的刺激-反应过程具有重要的作用。

#### 1.2.2 行为学实验部分
根据理论部分找出的对于刺激-反应过程具有重要作用的神经元，使用一些生物学技术来使得线虫中这些神经元消融，并记录消融这些神经元后的线虫和**模拟消融 (mock ablation)** 线虫之间的行为。使用Eigenworms技术来将记录所得的行为划分为多个维度并量化。并对量化后的结果进行组间差异的显著性检验。


### 1.3 为什么这样研究
#### 1.3.1 运用控制论进行研究的合理性
如下图所示，我们可将线虫的刺激-反应环路抽象成一个<strong>目标控制问题 (target control problem)</strong>：外部刺激（轻微触碰）作用于环路中的感觉神经元，使其产生信号，信号经过连接组的处理，最终传递至肌肉细胞，导致肌肉的活动产生运动。其中，外界刺激类比于控制信号，感觉神经元类比于控制系统中的<strong>输入节点 (input node)</strong>，而肌肉的活动类比<strong>输出节点 (output node)</strong> 的状态。
<figure>
<img src="https://new-pic-zpp.oss-cn-guangzhou.aliyuncs.com/pic/202312191116647.svg"/>
<figcaption><strong>fig.1</strong> 上图是一个刺激-反应环路的示意图，其为一个加权有向图，首先波浪线箭头表示的是外部的刺激，<font style="color:#1AA1E2">蓝色节点</font>表示的是线虫中的感觉神经元，<font style="color:#BAC8D3">灰色节点</font>表示的是中间神经元，<font style="color:#F0A309">橙色神经元</font>表示的是与肌肉组织相邻的神经元（或运动神经元），<font style="color:#D80273">红色节点</font>表示的是肌肉。</figcaption>
</figure>

#### 1.3.2 先前研究的局限性
一方面，大多数关于连接组中重要节点的研究都是基于单个节点的网络性质，如度，介数等，对于各个节点进行排序，进而寻找其中的重要节点。但是这一方法存在两个问题：首先，并不存在一个相对客观的标准来规定需要考虑哪些性质不考虑哪些性质；其次，并不存在一个判断节点是否重要的阈值（即高于（或低于）这一阈值的节点是重要的（或不重要的））。
另一方面，还有一些研究将神经元活动的具体动力学特征纳入模型进行考虑。虽然这样的模型相对还原真实的神经元活动，但会使得整个模型难以分析。

### 1.4 得到了什么结果
在根据神经元类别进行消融的研究中发现了一类被先前研究者所忽略的神经元PDB；而在对单个神经元消融的研究中发现了在DD类神经元（一类对刺激-反应过程具有影响的神经元）中，对DD01，DD02，DD03的单独消融并不会对整体活动产生影响；而对DD04，DD05，DD06的单独消融则会对整体的活动产生影响。
<figure>
<img src="https://new-pic-zpp.oss-cn-guangzhou.aliyuncs.com/pic/202312191750738.png"/>
<figcaption style="text-align:center"><strong>table.1</strong> 研究发现的对于线虫运动控制具有重要作用的神经元类别。</figcaption>
</figure>

在行为学实验中，结果如下图所示

<figure>
<img src="https://new-pic-zpp.oss-cn-guangzhou.aliyuncs.com/pic/202312121017000.png"/>
<figcaption><strong>fig.2</strong> 如上图所示，PDB消融组的线虫行为与模拟消融组的线虫行为在Eigenworms的四个维度上均有显著的差异。</figcaption>
</figure>

<figure>
<img src="https://new-pic-zpp.oss-cn-guangzhou.aliyuncs.com/pic/202312121122852.png"/>
<figcaption><strong>fig.3</strong> 上图说明，DD2，DD3的消融对于线虫的行为并没有明显的影响（与模拟消融组相比），而DD4，DD5的消融对于线虫的行为具有显著的影响。</figcaption>
</figure>

### 1.5 得到了什么结论
PDB这类神经元在线虫的刺激-反应过程中具有重要的作用。而在对线虫活动起重要作用的DD类神经元中，其中真正起到重要作用的是DD04，DD05，DD06；而DD01，DD02，DD03的消融并不会对线虫的运动产生影响。
通过行为学实验验证了这套线虫神经环路的分析框架的有效性。

### 1.6 问题方法结论对学科的意义
可控性分析这一框架在系统的结构和功能之间建立起桥梁，通过可控性分析，我们可以根据系统的结构来判断该系统在整体上是否是可控的。并且可根据此方法来寻找出系统中对于系统可控性有重要影响的节点。
虽然此前有很研究多将源于工程领域的可控性分析框架应用于如社会，生物等复杂系统中以探索系统的结构与功能之间关系，但很少缺乏基于实验的实证研究。此研究在一定程度上证实了可控性分析这一框架在神经系统中的有效性。
这一研究将可控性分析引入了神经系统的连接组分析之中，为神经网络的分析提供了一条不同于以往研究的新思路。

### 1.7 对我自己的意义
提供了一种新的研究思路。



## Reference
<small>[1](https://ieeexplore.ieee.org/abstract/document/58507/) Murota, K., & Poljak, S. (1990). Note on a graph-theoretic criterion for structural output controllability. _IEEE Transactions on Automatic Control_, _35_(8), 939-942.</small> <br/>
<small>[2](https://doi.org/10.1038/nature24056) Yan, G., Vértes, P. E., Towlson, E. K., Chew, Y. L., Walker, D. S., Schafer, W. R., & Barabási, A. L. (2017). Network control principles predict neuron function in the Caenorhabditis elegans connectome. _Nature_, _550_(7677), 519-523.</small>  

