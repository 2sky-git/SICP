# SICP习题集
> $ scheme < xx.rkt

## 第一章： 构造过程抽象
### 1.1 程序设计的基本元素
- 1.1.1 表达式
- 1.1.2 命名和环境
- 1.1.3 组合式的求值
- 1.1.4 复合过程
- 1.1.5 过程应用的代换模型
- 1.1.6 条件表达式和谓词([Ex1.1]()，[Ex1.2]()，[Ex1.3](Chapter1/E1.3.md)，[Ex1.4](Chapter1/E1.4.md)，[Ex1.5](Chapter1/E1.5.md))
- 1.1.7 实例： 采用牛顿法求平方根([Ex1.6](Chapter1/E1.6.md)，[Ex1.7](Chapter1/E1.7.md)，[Ex1.8](Chapter1/E1.8.md))
- 1.1.8 过程作为黑箱抽象

### 1.2 过程与它们所产生的计算
- 1.2.1 线性的递归和迭代([Ex1.9](Chapter1/E1.9.md)，[Ex1.10](Chapter1/E1.10.md))
- 1.2.2 树形递归([Ex1.11](Chapter1/E1.11.md)，[Ex1.12](Chapter1/E1.12.md), Ex1.13)
- 1.2.3 增长的阶(Ex1.14，[Ex1.15](Chapter1/E1.15.md) )
- 1.2.4 求幂(Ex1.16，Ex1.17，[Ex1.18](Chapter1/E1.18.md)，[Ex1.19](Chapter1/E1.19.md))
- 1.2.5 最大公约数([Ex1.20](Chapter1/E1.20.md))
- 1.2.6 实例： 素数检测([Ex1.21](Chapter1/E1.21.md)，[Ex1.22](Chapter1/E1.22.md)，[Ex1.23](Chapter1/E1.23.md)，[Ex1.24](Chapter1/E1.24.md)，[Ex1.25](Chapter1/E1.25.md)，[Ex1.26](Chapter1/E1.26.md)，[Ex1.27](Chapter1/E1.27.md)，[Ex1.28](Chapter1/E1.28.md))


### 1.3 用高阶函数做抽象
- 1.3.1 过程作为参数([Ex1.29](Chapter1/E1.29.md)，[Ex1.30, Ex1.31, Ex1.32, Ex1.33](Chapter1/E1.30.md))
- 1.3.2 用 lambda 构造过程([Ex1.34](Chapter1/E1.34.md))
- 1.3.3 过程作为一般性的方法([Ex1.35](Chapter1/E1.35.md)，[Ex1.36](Chapter1/E1.36.md)，[Ex1.37](Chapter1/E1.37.md)，[Ex1.38](Chapter1/E1.38.md)，Ex1.39)
- 1.3.4 过程作为返回值([Ex1.40](Chapter1/E1.40.md)，Ex1.41，Ex1.42，Ex1.43，Ex1.44，Ex1.45，Ex1.46)

## 第二章： 构造数据抽象
### 2.1 数据抽象导引
- 2.1.1 实例： 有理数的算术运算([Ex2.1](Chapter2/E2.1.md))
- 2.1.2 抽象屏障([Ex2.2，Ex2.3 (见Note)]())
- 2.1.3 数据意味着什么([Ex2.4](Chapter2/E2.4.md)，[Ex2.5](Chapter2/E2.5.md)，Ex2.6)
- 2.1.4 扩展练习： 区间算术([Ex2.7，Ex2.8 (见Note)](),[Ex2.9](Chapter2/E2.9.md)，[Ex2.10](Chapter2/E2.10.md)，[Ex2.11](Chapter2/E2.11.md)，[Ex2.12 (见Note)]()，[Ex2.13](Chapter2/E2.13.md)，[Ex2.14，Ex2.15，Ex2.16](Chapter2/E2.14.md))

### 2.2 层次性数据和闭包性质
- 2.2.1 序列的表示([Ex2.17，Ex2.18 (Note)]()，[Ex2.19](Chapter2/E2.19.md)，[Ex2.20](Chapter2/E2.20.md)，[Ex2.21，Ex2.22，Ex2.23 (Note)]())
- 2.2.2 层次性结构([Ex2.24]()，[Ex2.25](Chapter2/E2.25.md)，[Ex2.26](Chapter2/E2.26.md)，Ex2.27，Ex2.28，Ex2.29，Ex2.30，Ex2.31，Ex2.32)
- 2.2.3 序列作为一种约定的界面(Ex2.33，Ex2.34，Ex2.35，Ex2.36，Ex2.37，Ex2.38，Ex2.39，Ex2.40，Ex2.41，Ex2.42，Ex2.43)
- 2.2.4 实例： 一个图形语言([Ex2.44，Ex2.45，Ex2.46，Ex2.47，Ex2.48，Ex2.49，Ex2.50，Ex2.51，Ex2.52 (Note)]())

### 2.3 符号数据
- 2.3.1 引号(Ex2.53，Ex2.54，Ex2.55)
- 2.3.2 实例： 符号求导(Ex2.56，Ex2.57，Ex2.58)
- 2.3.3 实例： 集合的表示(Ex2.59，Ex2.60，Ex2.61，Ex2.62，Ex2.63，Ex2.64，Ex2.65，Ex2.66)
- 2.3.4 实例： Huffman 编码树(Ex2.67，Ex2.68，Ex2.69，Ex2.70，Ex2.71，Ex2.72)

### 2.4 抽象数据的多重表示
- 2.4.1 复数的表示
- 2.4.2 带标志数据
- 2.4.3 数据导向的程序设计的可加性(Ex2.73，Ex2.74，Ex2.75，Ex2.76)

### 2.5 带有通用型操作的系统
- 2.5.1 通用型算术运算(Ex2.77，Ex2.78，Ex2.79， Ex2.80)
- 2.5.2 不同类型数据的组合(Ex2.81，chp2/82，chp2/83，chp2/84，chp2/85，chp2/86)
- 2.5.3 实例： 符号代数(chp2/87，chp2/88，chp2/89，chp2/90，chp2/91，chp2/92，chp2/93，chp2/94，chp2/95，chp2/96，chp2/97)

## Rrference
- [SICP 解题集](https://sicp.readthedocs.io/en/latest/)
- [SICP wiki](http://wiki.drewhess.com/wiki/Category:SICP_solutions)