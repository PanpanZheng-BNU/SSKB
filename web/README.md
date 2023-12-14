# Network control principles predict neuron function in the _Caenorhabditis elegans_ connectome

## Outline
本研究主要分为两个部分：第一，作者使用控制论中的**可控性 (Controllability)** 这一概念对于线虫的连接组进行分析，从中找出对于线虫的**刺激-反应过程 (stimulus-response process)** 具有重要作用的神经元。第二，作者使用去除神经元的行为学实验，验证第一步分析的有效性。

<figure align="center" style="margin:0px 30px">
<img align="center" width="800" height="300"  src="https://new-pic-zpp.oss-cn-guangzhou.aliyuncs.com/pic/202312141907860.svg" title="title"/>
<figcaption style="text-align:left"><small><strong>fig.1</strong> 上图是一个从刺激-反应过程的示意图，其为一个加权有向图，首先波浪线箭头表示的是外部的刺激，<font style="color:#1AA1E2">蓝色节点</font>表示的是线虫中的感受神经元，<font style="color:#BAC8D3">灰色节点</font>表示的是中间神经元，<font style="color:#F0A309">橙色神经元</font>表示的是与肌肉组织相邻的神经元（或运动神经元），<font style="color:#D80273">红色节点</font>表示的是肌肉。</small></figcaption>
</figure>


## 线性非时变系统 (LTI system, linear time-invariant system)



