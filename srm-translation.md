---
title: srm-翻译
date: 2018-08-30 17:33:15
categories: topcoder
tags: noip
mathjax: true
---


# srm-712-div2-T3-AverageVarianceSubset

## 题意

>求一个集合所有满足“最大数减最小数差小于等于R”的非空子集的方差的平均值
>集合最多有50个元素，每个元素都是唯一的, $1<=ai<=10^9$
>$0<=R<=10^9$

## 样例

```
{1,2,3}
1
Returns: 0.1

一共有7个非空子集，满足条件的有5个 {1}, {2}, {3}, {1,2}, and {2,3}
{1} 的方差是 0.
{2} 的方差是 0.
{3} 的方差是 0.
{1,2} 的方差是 1/4.
{2,3} 的方差是 1/4.
(0 + 0 + 0 + 1/4 + 1/4) / 5 = 1/10.


    	
{1,2,3}
3
Returns: 0.3095238095238096
This time Alice will consider all seven nonempty subsets. The two new subsets:
The variance of {1,3} is 1.
The variance of {1,2,3} is 2/3.
Bob will then compute the value (0+0+0+1/4+1/4+1+2/3)/7 = 13/42.

    	
{5,1,3,2}
1000000000
Returns: 1.2476851851851847


    	
{1,1000000000}
1000000000
Returns: 8.3333333166666672E16

    	
{1,1000000000}
1
Returns: 0.0
```

# srm-712-div1-T1-LR

## 题意

>给你一个循环数组S，再给你一个目标循环数组T，每次你可以做的操作有如下两种
>L:每个数都加上左边的数
>R:每个数都加上右边的数
>所有的加法都是瞬间同时完成，随意输出一个可以使得S变成T的操作序列
>2<=|s|<=50, 0<=ele<=10^15


## 样例

```
    	
{0,1,0,0,0}
{0,1,2,1,0}
Returns: "LL"
The first operation L will change A into {0,1,1,0,0} and then the second operation L will produce the array we wanted.


{0,0,0,1}
{0,1,0,0}
Returns: "No solution"
Even though A is cyclic, the precise indices matter. Here, s and t are two different configurations, and there is no valid way to change this s into this t.

    	
{1,2,3,4,5,6,7,8,9,10}
{12,24,56,95,12,78,0,100,54,88}
Returns: "No solution"
Regardless of the type and order of operations all elements of A will always remain positive. However, t contains a zero. Therefore, t cannot be reached.
3)	

    	
{1,0,0}
{11,11,10}
Returns: "RRRRR"
The sequence of five operations R will change the array A as follows: {1,0,0} -> {1,0,1} -> {1,1,2} -> {2,3,3} -> {5,6,5} -> {11,11,10}.

    	
{0,0,0,0,0}
{0,0,0,1,0}
Returns: "No solution"

    	
{1,1}
{562949953421312,562949953421312}
Returns: "RLLLRRRLLRRRLRLRRLLLLRLLRRLRRRLRRLRRLLRRRLLRRRLLL"
We start with A[0] = A[1] = 1, and we want A[0] = A[1] = 2^49. We can easily verify that in this case each operation changes A from {x, x} into {2x, 2x}. Therefore, any string of exactly 49 'L's and 'R's is a valid answer.
    	
{123,456}
{123,456}
Returns: ""

```

# srm-712-div2-T2-MakePalindrome

## 题意

>给你一些字符，求最少能拼成多少个回文串，输出任意一种方案
>$1<=len<=1000$

## 样例

``` 
"abbaa"
Returns: {"ababa" }

    	
"abc"
Returns: {"a", "b", "c" }

    	
"aaabbbccc"
Returns: {"aba", "bcb", "cac" }
There are other solutions like {"aaa", "bbb", "ccc"}


    	
"topcoder"
Returns: {"oco", "d", "e", "p", "r", "t" }

	
"z"
Returns: {"z" }
```

# srm-713-div1-T2-DFSCount

## 题意
>给你一个矩阵G[i][j]=N表示ij之间无边，G[i][j]=Y表示ij之间有边
>现有如下伪代码
```
p = []

dfs(current) := 
	p.append(current)
	Let adjs[] = list of vertices that are adjacent to current.
	random_shuffle(adjs)
	for v in adjs:
		if v is not in p:
			dfs(v)

Let start = random(0, n-1)   # a random number between 0 and n-1, inclusive
dfs(start)
output(p)
```

>显然上面代码会输出一个排列，但是观察到我们用了random，程序可能会输出多种答案，求可能产生多少不同的排列
>$1<=n<=14$

## 样例

```
    	
{"NYY",
 "YNY",
 "YYN"}
Returns: 6
G describes a complete graph with 3 vertices. There are 3! = 6 permutations of vertices, and we can easily verify that each of these permutations can appear as the output of Ciel's algorithm.
1)	

    	
{"NYNN",
 "YNYN",
 "NYNY",
 "NNYN"}
Returns: 6
This time the graph is a line: 0 - 1 - 2 - 3. These are the possible outputs:
0,1,2,3
1,0,2,3
1,2,3,0
2,1,0,3
2,3,1,0
3,2,1,0


    	
{"NYYY",
 "YNYY",
 "YYNN",
 "YYNN"}
Returns: 16
This graph looks as follows:
  2
 / \
0---1
 \ /
  3
There are 16 possible permutations:
0,1,2,3
0,1,3,2
0,2,1,3
0,3,1,2
1,0,2,3
1,0,3,2
1,2,0,3
1,3,0,2
2,0,1,3
2,0,3,1
2,1,0,3
2,1,3,0
3,0,1,2
3,0,2,1
3,1,0,2
3,1,2,0

{"NYYYYYYYYYYYYY",
 "YNYYYYYYYYYYYY",
 "YYNYYYYYYYYYYY",
 "YYYNYYYYYYYYYY",
 "YYYYNYYYYYYYYY",
 "YYYYYNYYYYYYYY",
 "YYYYYYNYYYYYYY",
 "YYYYYYYNYYYYYY",
 "YYYYYYYYNYYYYY",
 "YYYYYYYYYNYYYY",
 "YYYYYYYYYYNYYY",
 "YYYYYYYYYYYNYY",
 "YYYYYYYYYYYYNY",
 "YYYYYYYYYYYYYN"}
Returns: 87178291200
The answer is 14!


	
{"N"}
Returns: 1

```
# srm-713-div1-T1-PowerEquation

## 题意

>求有多少abcd满足a^b = c^d， 1<=a,b,c,d<=n, mod 10^9+7
>$1<=n<=10^9$

## 样例

```
2
Returns: 6
We have these solutions:
1^1=1^1
1^1=1^2
1^2=1^1
1^2=1^2
2^1=2^1
2^2=2^2

    	
3
Returns: 15
Now we have:
1^1=1^1
1^1=1^2
1^1=1^3
1^2=1^1
1^2=1^2
1^2=1^3
1^3=1^1
1^3=1^2
1^3=1^3
2^1=2^1
2^2=2^2
2^3=2^3
3^1=3^1
3^2=3^2
3^3=3^3

    	
100
Returns: 21620
3)	

22306
Returns: 68467
The answer is 1000068474 mod 10^9+7.

```

# srm-714-div2-T3-Saleswoman

## 题意

>有n个人在x轴上，每个人的坐标是一个整数，爱丽丝是一个商人，她在轴上穿梭并与这n个人交易，交易的商品只有一种，每一个人都有对这种商品的需求或者供应，如果delta[i] 是正数，表示这个人要供应delta[i]的数量，如果是负数，表示这个人有-delta[i]的需求，保证delta的和非负，一开始alice在0位置，手里没有任何商品，每一秒她可以往左或者往右走1个单位的距离，如果她和一个人在同一个位置，就可以与之交易，交易是瞬间发生的，每笔交易的数量是由爱丽丝决定的，当然她不能卖出超出自己手里含有的商品数量，行走过程中爱丽丝手里可以拿着任意多的商品，到了一个人的位置，也可以选择不与之交易，最终爱丽丝需要满足以下两点：她必须满足所有人的需求，旅行必须要在最后一个人的位置结束。求最少需要花费多少时间。

## 样例

```
    	
{3,14,15,92,101}
{-3,2,3,-3,1}
Returns: 143
Here we have five people. Person 0 is at position 3 and has a demand of 3 units. Person 1 is at position 14 and has 2 units of supply. Person 2 is at position 15 and 3 units of supply. Person 3 is at position 92 and has a demand of 3 unit. Person 4 is at position 101 and has 1 unit of supply In this case, one optimal path for Alice is as follows:
First, walk to position 15. Since Alice is at the same position as person 2, she can take all of their supply.
Next, walk to position 14. Alice can take all of the supply here, so she has a total of 5 units of supply.
Next, walk to position 3. Alice can satisfy this person's demand. She will be left with 2 units of supply.
Walk to position 101. Alice grabs the supply, so she has 3 units.
Walk to position 92. Alice can satisfy this person's demands, and she is left with 0 units of supply.
Finally, walk back to position 101 and end the walk.
The total time taken by Alice is 15+1+11+98+9+9 = 143.

    	
{1,2,4,8,16,32,64,128}
{-1,-1,-1,-1,1,1,1,1}
Returns: 382
In this case, Alice's path will look like 0 -> 128 -> 1 -> 128.


    	
{100000}
{0}
Returns: 100000
Note that Alice must end at the rightmost person, even if she doesn't need to do any trades. Note that it is also allowed for a person's delta to be zero.

    	
{100,200,300,400}
{10,-3,-5,2}
Returns: 400

    	
{1,2,3,5,8,13,21,34,55,89}
{-1,1,-1,1,-1,1,-1,1,-1,1}
Returns: 199

    	
{1,2,3,6,10,15,21,28,36,45,55}
{-3,-5,10,-2,-6,-7,3,-2,8,5,-1}
Returns: 129
```
# srm-714-div1-T1-ParenthesisRemoval

同下，$2<=len<=2500$


# srm-714-div2-T2-RemovingParenthesis

## 题意

>给你一个合法的括号序列，每次操作分两步，第一步删除第一个左括号，第二步删除某一个右括号，要保证删除之后的括号序列还是合法的,求将括号删到空为止一共有多少种不同的删除方法，两种方法不同当且仅当存在某一步右括号的删除位置不同
> $2<=len<=20$, 保证答案在32位有符号整数范围内

## 样例

```
    	
"()()()()()"
Returns: 1

"(((())))" 
Returns: 24

"((()()()))" 
Returns: 54

"(())(())(())" 
Returns: 8

"((()))(()(()))((()))"
Returns: 432

```

# srm-715-div2-T3-InPrePost

## 题意

```
def order(v, mode):
    if v == None:
        return []
    if mode == "pre":
       return [v.label] + order(v.left, s[0]) + order(v.right, s[1])
    if mode == "in":
       return order(v.left, s[2]) + [v.label] + order(v.right, s[3])
    if mode == "post":
       return order(v.left, s[4]) + order(v.right, s[5]) + [v.label]
```
>定义如上二叉树遍历的伪代码，pre表示先序遍历，in表示中序列遍历，post表示后序遍历
{s[0],s[2],s[4]}与{s[1], s[3], s[5]}  中 都恰好包含"pre","in","post"   
现在告诉你三个数组以及字符串数组s[]
a1[] = order(root, "pre")
a2[] = order(root, "in")
a3[] = order(root, "post")
问你是否存在一颗二叉树满足按照如上方式调用order函数之后产生a1[],a2[],a3[]
a1,a2,a3的长度相同，且不超过50

## 样例

```
{"post", "in", "pre", "post", "in", "pre"}
{1,2,3,4,5}
{2,1,3,5,4}
{2,4,3,5,1}
Returns: "Possible"
```
![srm-715-div2-T3](/img/srm-715-div2-T3.png)

```
      
{"pre", "pre", "in", "in", "post", "post"}
{1,2,3,4}
{2,4,3,1}
{4,3,2,1}
Returns: "Possible"

{"post", "in", "pre", "post", "in", "pre"}
{1,2,3,4,5}
{2,1,3,5,4}
{1,4,3,5,2}
Returns: "Impossible"
备注：从a1看出根是1，从a3看出根是2，矛盾
```

# srm-716-div2-T3-JumpDistancesOnTreeEasy

## 题意

>给你一棵树,再给你一个数字集合S[]，元素唯一
>问你从0开始走，每次选择下一个点以最短路走过去，并记录距离，问你是否存在一个距离序列使得这个序列去重之后恰好为数字集合
>$1<=总点数<=51, S[i] < S[i+1]$

## 样例

```
        
{0,1,1,0,4,4} //p[i]与i+1之间连边
{2,4}
Returns: "Possible"
     0 
   /   \
  1     4
 / \   / \
2  3  5   6
一条可能的路径是0, 2, 3, 6, 5. 产生的距离数组为 {2, 2, 4, 2} 去重后S = {2, 4}.


    	
{0,1,1,0,4,4}
{1,2,3,4,5}
Returns: "Impossible"
    	
{0}
{1}
Returns: "Possible"

```

## 题意

# srm-716-div1-T1-ConstructLCS

## 题意

>同下，去除条件中的ab<=bc<=ca
>$ 1<= ab,bc,ca<=50$

# srm-716-div2-T2-ConstructLCSEasy

## 题意

>一个字符串的子序列可以通过删除这个字符串的若干个字符得到,两个字符串的最长公共子序列是这两个字符串所有的公共子序列中最长的一个，比如lcs("101","111000")=2,f("101","11011")=3,f("00","1111")=0,给你三个正整数,ab,bc,ca,请找出三个字符串A,B,C满足以下条件
> - 每一个字符串只包含0或者1
> - 每个字符串的长度是1到1000
> - lcs(A, B) = ab, lcs(B, C) = bc, lcs(C, A) = ca
> 输出一个字符串A + " " + B + " " + C(即用空格拼接三个字符串)
> $1 <= ab <= bc <= ca <= 50$

## 样例

```
2
3
4
Returns: "1111 101 1010101"

        
4
4
7
Returns: "10101010 1011 1010101"

6
7
8
Returns: "10101010 1111010 110101010"

```
# srm-717-div1-T1-ScoresSequence

## 题意

>告诉你一副图中每个点的度,求有多少对(u,v)，u可以直接或者间接到达v，包括u=v的情况
>数据保证答案是唯一的
>不会有自环，不会同时存在a->b b->a
>$1<=n<=100$

## 样例

```
{2, 0, 1}
Returns: 6
构造方法为：A->B A->C C->B

{1, 0, 2}
Returns: 6

        
{1, 1, 1}
Returns: 9

    
{0, 2, 8, 4, 3, 9, 1, 5, 7, 6}
Returns: 55

    
{22,20,14,13,17,15,12,18,23,15,21,26,33,5,19,9,37,0,25,28,4,12,35,32,25,7,31,6,2,29,10,33,36,27,39,28,40,3,8,38,3}
Returns: 1422
```
# srm-717-div2-T3-DerangementsDiv2

## 题意

>给你两个整数n,m,求{1,2,3,..,n+m}的排列中，前m个数是错排的方案数%(10^9+7)
>$1<=m<=50,0<=n<=50$

## 样例

```
2
1
Returns: 4

3
5
Returns: 21234

```

# srm-717-div2-T2-LexmaxReplace

## 题意

>给你两个字符串s1,s2，每次你可以选择s2中的一个字符去替换s1中的某个字符，替换之后在s2中删除这个字符，求替换后字典序最大的字符串

## 样例

```
    
        
"abb"
"c"
Returns: "cbb"

        
"z"
"f"
Returns: "z"

        
"fedcba"
"ee"
Returns: "feeeba"

```


# srm-718-div2-T2-InterleavingParenthesisDiv2

## 题意

>给你两个括号序列，不保证合法，求有多少种不同的方法可以将两个括号序列合并成一个合法的括号序列
>合并的时候不能改变各自序列原先的顺序
>序列长度都<=50

## 样例

```
        
"(()"
"())"
Returns: 19
```

![srm-718-div2-T2](/img/srm_718_div2_T2.png)

```
"()()()()()()()()()()()()()()()"
"()()()()()()()()"
Returns: 493841617

"()(()"
"))((())"
Returns: 10

"((((("
")))))"
Returns: 42

")"
"("
Returns: 1

```

# srm-718-div1-T1-InterleavingParenthesis

同上，范围改为2500 

# srm-718-div2-T3-ChainCity

## 题意

>在一条直线上有若干个建筑物，告诉你相邻两个建筑物之间的距离dist[]
>现在你可以建设k个任意门，任意门可以建造在直线上任意一个浮点位置
>任意门之间可以瞬间移动
>你的任务是求所有建筑物之间最大距离的最小值
>dist的大小为[2,2000]，相邻两个建筑物之间的距离最大为10^6
>任意门的个数为[2, size(dist) + 1]


## 样例

```
{3,5,4}
2
Returns: 4

```
![srm-718-div2-T3](/img/srm_718_div2_T3.png)

如上图片所示，d(A,B) = 3, d(A,C) = 4, d(A,D) = 4, d(B,C) = 3, d(B,D) = 3, and d(C,D) = 4. 
所以最大距离为4

```
{3,5,4}
3
Returns: 3


        
        
{3,5,4}
4
Returns: 0


        
{3,1,4,1,5,9,2,6,5,3,5} 
4
Returns: 8

        
{
    1000000,1000000,1000000,1000000,1000000,
        1000000,1000000,1000000,1000000,1000000,
        1000000,1000000,1000000,1000000,1000000,
        1000000,1000000,1000000,1000000,1000000,
        1000000,1000000,1000000,1000000,1000000,
        1000000,1000000,1000000,1000000,1000000,
        1000000,1000000,1000000,1000000,1000000
}
6
Returns: 5000000
```
# srm-719-div1-T1-LongMansionDiv1

## 题意

>有一个nxm的数字迷宫，问你从起点走到终点经过的数字和的最小值
>每一次可以走上下左右相邻的任意一个格子
>每一行的数字都是相同的,给你一个a[],a[i]表示第i行的数字是什么
>$1<=n<=50, 1<=m<=10^9, 1<=a[i]<=1000$
>sx,sy ex,sy分别表示起点与终点
>$0<=sx,ex<=N-1, 0<=sy,ey<=10^9$

## 样例

```
{5, 3, 10}
2
0
2
2
Returns: 29

(2,0)是起点 (2,2)是终点

        
{5, 3, 10}
0
2
0
0
Returns: 15

        
{137, 200, 184, 243, 252, 113, 162}
0
2
4
2
Returns: 1016

{995, 996, 1000, 997, 999, 1000, 997, 996, 1000, 996, 1000, 997, 999, 996, 1000, 998, 999, 995, 995, 998, 995, 998, 995, 997, 998, 996, 998, 996, 997, 1000, 998, 997, 995, 1000, 996, 997, 1000, 997, 997, 999, 998, 995, 999, 999, 1000, 1000, 998, 997, 995, 999}
18
433156521
28
138238863
Returns: 293443080673
```

# srm-719-div2-T3-TwoDogsOnATree

## 题意

>给你一棵树,每条边有边权,alice先选择树上的一条路径,计算路径上的边权的xor值A，然后将路径上的边都删除，树会变成若干个联通块，bob会选择其中一个联通块中的一条路径，计算边权的xor值B，求A xor B的最大值
>$1<=n<=1000, 0<=边权<=1023$


## 样例

```
        
{0, 0, 0, 0} //p[]: p[i] 与i+1之间有一条w[i]的边
{1, 2, 4, 8} //w[i]
Returns: 15

alice选择1-0-2  bob选择3-0-4
```
# srm-719-div2-T2-LongMansionDiv2

## 题意

>有一个nxm的数字迷宫，问你从左上角走到右下角经过的数字和的最小值
>每一次可以走上下左右相邻的任意一个格子
>每一行的数字都是相同的,给你一个a[],a[i]表示第i行的数字是什么
>$1<=n<=50, 1<=m<=10^9, 1<=a[i]<=1000$


## 样例

```        
3
{1, 2, 1}
Returns: 6
矩阵为:
1 1 1
2 2 2
1 1 1

4
{3, 2, 4, 2}
Returns: 17

5
{3, 2, 5, 4, 2, 8}
Returns: 32
```

# srm-720-div1-T1-SumProduct

## 题意

>给你0-9每种数字的出现次数
>你需要从中选取一些数字构成A
>选出另一些数字构成B
>A的数位为X位，B的数位为Y位,可以有前导0
>求所有可能的A×B的和

## 样例

```
        
{0,2,1,1,0,0,0,0,0,0}表示0-9每种数字的出现次数
2
2
Returns: 4114

(A,B)可能的选择为(11, 23), (11, 32), (12, 13), (12, 31), (13, 12), (13, 21), (21, 13), (21, 31), (31, 12), (31, 21), (23, 11), (32, 11).

        
{1,6,0,0,0,0,0,0,0,0}
1
2
Returns: 22
```
# srm-720-div2-T3-RainbowGraph

## 题意

>给你一副无向图n个点,每个点有一种颜色
>你想要走遍图中的每一个点恰好一次
>同一种颜色的点一定要连着走，也就是走完一种颜色再去走另一种颜色
>请问有多少种不同的走法
>$2<=n<=100$
>每个点的颜色为0-9，每种颜色出现不会超过10次
>边数最多有2500条


## 样例
 
```
{0,0,0,1,1,1,2,2,2} 每个点的颜色
{0,1,2,3,4,5,6,7,8,0,4,8} a[]
{1,2,0,4,5,3,7,8,6,3,7,2} b[]
a[i]-b[i]是一条无向边

Returns: 24

```

# srm-720-div2-T2-MinProduct

## 题意

>给你一个长度为10的数组cnt,cnt[i]表示数字i的个数
>再给你两个数X，Y，你需要构造两个整数A,B
>A有X位，B有Y位数字，数字i在A，B中出现的总次数不能超过cnt[i]
>求AxB的最小值
>$0<=cnt[i]<=20,1<=X,Y<=9,cnt数组的和>=X+Y$

## 样例

```
{0,1,1,2,1,1,0,0,0,0}
2
3
Returns: 3042
可选的数字为 {1,2,3,3,4,5}
最优情况下A=13 B=234 

{1,3,0,0,0,0,0,0,0,0}
2
2
Returns: 11
A = 01  B = 11 允许前导0


    	
{0,20,20,20,20,20,20,20,20,20}
9
9
Returns: 12345678987654321

    	
{0,0,0,0,0,0,0,0,0,18}
9
8
Returns: 99999998900000001

```
# srm-721-div1-T1-RememberWords

## 题意

>给你d1,d2,w1,w2
>能否构造出一个x[]
>x[1]+..+x[d1] = w1, x[d1+1]+..+x[d1+d2] = w2，|x[i+1]-x[i]|<=1
>$1<=d1,d2<=10^9,0<=w1,w2<=10^9$

## 样例

```
    	
2
3
7
18
Returns: "Possible"
x[] = {3,4,5,6,7} 3+4 = 7, 5+6+7=18


    	
1
1
3
5
Returns: "Impossible"

    	
3
5
300
500
Returns: "Possible"


    	
1000000000
1000000000
1000000000
1000000000
Returns: "Possible"

```

# srm-721-div2-T3-ApocalypseEasy

## 题意

>给你一棵n个点的无向树，有k个不同的节点上有玩具，一开始这k个点也放着炸弹
>炸弹在T秒后就会爆炸，因此你有T次机会可以移动玩具
>每次移动可以将某个玩具移动到相邻的点上，在T秒内允许多个玩具在同一个节点
>但是T秒后，一个节点只能有一个玩具
>求最终可以保护多少个玩具不被炸掉
>$2<=n<=50$

## 样例

```
    	
{0,1,2} p[0]=0,p[1]=1,p[2]=2   p[i]与i+1之间有一条边
{2,3} 表示一开始放着炸弹与玩具的点
1
Returns: 1
这个树就是一条链0-1-2-3 
一开始2,3有玩具与炸弹，我们只能移动一次，把2的玩具移动到1
3的玩具会被炸毁

{0,1,2}
{2,3}
2
Returns: 2
    	
{0,0,0,1,2,3}
{1,2,3}
1
Returns: 3

    	
{0,1,2,3,4,5,6,7,8,9}
{0,1,2,3,4,5,6}
50
Returns: 4

    	
{0}
{0,1}
1


```
# srm-722-div1-T1-TCPhoneHomeEasy

## 题意

>给你一个整数n表示手机号码的位数
>再给你一些字符串表示保留的号码，比如911 110 120等
>问你一共有多少的手机号码不以保留号码开头
>$1<=n<=17,保留号码的个数<=50$

## 样例

```
7
{ "0", "1", "911" }
Returns: 7990000

5
{ "0", "1", "911" }
Returns: 79900

6
{ "1", "2", "3" }
Returns: 700000


6
{ "1", "23", "345" }
Returns: 889000
```

# srm-723-div1-T1-TopXorer

## 题意

>给你一个n个元素的数组x[],$0<=x[i]<=10^9,1<=n<=50$
>你需要找到一个数组a[], 0<=a[i]<=x[i]
>使得a[0]^a[1]..^a[n-1] 最大
>输出这个最大值

## 样例

```
    	
{2,2,2}
Returns: 3
a[]= (2, 0, 1). (2 ^ 0 ^ 1) = 3.

    	
{1,2,4,8,16}
Returns: 31
  	
{1024,1024}
Returns: 2047

 	
{7,4,12,33,6,8,3,1}
Returns: 47

{0}
Returns: 0

```


# srm-723-div2-T3-SimpleMazeEasy

```
 .
...
 .

   ...
   ...
   ...
.........
.........
.........
   ...
   ...
   ...

```
## 题意

>如上第一个是一级十字迷宫，第二个是三级十字迷宫
>一个点可以走到上下左右相邻的某一个点
>给你一个n级十字迷宫，求所有点对之间最短路的和对 (1e9+7)取模
>$1<=n<=10^{18}$

## 样例

```
1
Returns: 16

3
Returns: 4680

1000000000000
Returns: 763641672

```


# srm-723-div2-T2-TopXorerEasy

## 题意

>给你三个整数A,B,C
>求最大的$a^b^c,(0<=a<=A,0<=b<=B,0<=c<=C)$
>$0<=A<=10^9,0<=B<=10^9,0<=C<=10^9$

## 样例

```
2
1
0
Returns: 3

        
1
2
4
Returns: 7

3
4
5
Returns: 7

        
1
100
10000
Returns: 10101

        
1000000000
1000000000
1000000000
Returns: 1073741823

        
0
0
0
Returns: 0

```
# srm-724-div1-T1-OrAndSum

## 题意
>给你两个数组X[],Y[],都包含n个元素
>是否存在一个a数组a[0]到a[n]使得
>$a[i]|a[i+1] = X[i], a[i]+a[i+1] = Y[i](0<=i<=n-1)$
>$1<=n<=50, 0<=X[i],Y[i]<=10^{18}$

## 样例

```
        
{7}
{11}
Returns: "Possible"
a[] = {5,6}.
        
{3,3,7,5,7}
{3,5,7,9,11}
Returns: "Possible"

a[] = {1,2,3,4,5,6}.

        
{261208776456074191,261208776456074191,261208776456074191}
{333333333333333333,333333333333333333,333333333333333333}
Returns: "Possible"

```

# srm-724-div2-T3-UnfinishedTournamentEasy

## 题意

>给你一个n\*n的字符矩阵G表示n个人之间的胜负关系, 如果x能赢y，则G[x][y]='W',G[y][x]='L'
>如果还不知道x y之间的胜负，G[x][y]=G[y][x]='?'
>每个人的胜率 s[i] = 第i个人胜出的场次/(n - 1)
>你需要补充未知的一些胜负关系使得最终胜率的方差尽可能大
>输出最大的方差
>方差的定义：$aver = (s[0]+s[1]+..s[n-1]) / n$
>方差 = $( (s[0]-aver)^2+(s[1]-aver)^2+..+(s[n-1]-aver)^2 )/ n$
>$2<=n<=20$
>误差不超过1e-9

## 样例

```
{"-??",
 "?-?",
 "??-"}
Returns: 0.16666666666666669
一种方案是
-WW
L-W
LL-
胜率为 {1, 0.5, 0}. 平均值： 0.5
方差：((1-0.5)^2 + (0.5-0.5)^2 + (0-0.5)^2) / 3 = 0.5 / 3 = 0.16667.

        
{"-WL",
 "L-W",
 "WL-"}
Returns: 0.0
胜率为 {0.5, 0.5, 0.5} 方差为0.

        
{"-WWL",
 "L-??",
 "L?-?",
 "W??-"}
Returns: 0.1388888888888889

        
{"-WWL",
 "L-WW",
 "LL-?",
 "WL?-"}
Returns: 0.08333333333333331

        
{"-?",
 "?-"}
Returns: 0.25

```

# srm-724-div2-T2-OrAndSumEasy

## 题意

>给你两个非负整数X,Y
>是否存在两个整数A,B满足$A | B = X, A + B = Y$
>$0<=X,Y<=10^{18}$

## 样例

        
```
7
11
Returns: "Possible"
 A = 5 and B = 6.

        
11
7
Returns: "Impossible"

1
100
Returns: "Possible"
        
999799115789631487
999999999999999999
Returns: "Possible"
A = 111111111111111111, B = 888888888888888888.
```

# srm-726-div1-T1-Unpacking

## 题意

>有n个盒子，每个盒子里外面有一张标签告诉你有a[i]个红球，b[i]个蓝球，需要c[i]的钱购买
>现在告诉你每个盒子球的总量是符合标签的说明的,但是具体的种类可能会有如下偏差>比如可能有a[i]+1 b[i]-1 a[i] b[i]  a[i]-1 b[i]+1三种可能
>现在问你最少花多少钱买盒子能够使得至少会有K个球是同色的
>$1<=n<=50, 1<=a[i],b[i],c[i]<=10000$

```
{6,5}
{4,4}
{1,1}
10
Returns: 2

{5,5}
{4,4}
{1,1}
10
Returns: -1

{10}
{5}
{13}
9
Returns: 13


        
{1,2,3,4,5}
{1,2,3,4,5}
{1,2,3,4,5}
10
Returns: 10

```



# srm-726-div2-T3-HeroicScheduled2

## 题意

>给你n个任务的开始时间start[]与结束时间finish[]
>每天你可以选择一个任务完成,求有多少种任务的集合是可完成的
>$1<=n<=50, 0<=start[i]<=finish[i]<=15$

## 样例

```
{0,0,0}
{0,0,0}
Returns: 4


{14,14,14}
{15,15,15}
Returns: 7
注：三个任务不能完成，其他所有组合都可以完成
```

# srm-726-div2-T2-TurtleGame


## 题意

>给你一个网格，有些点被#覆盖了，现在hexo和jack轮流开始将空地变成#
>如果当前轮到的人操作之后左上角到右下角不存在通路了，当前操作的人就输了
>通路只能是从左上角到右下角往右或者往下走的路径
>问你hexo是否存在必胜策略

## 样例

```
{"..",
 ".."}
Returns: "Win"

{"...",
 ".#.",
 ".#.",
 "..."}
Returns: "Lose"
```

# srm-727-div1-T1-OnlySanta

## 题意

>给你一个字符串S,一开始不包含"SATAN",长度小于1000
>你可以在任意位置插入若干个字符使得
>S包含"SANTA"但是不包含"SATAN",不需要最小化插入字符的个数
>随便输出一个解即可

## 样例

```
"STANA"
Returns: "STANTA"

"STN"
Returns: "SANTNA"

"SXAYNTA"
Returns: "OOOOSOXAYNTOOOOAOOO"
```
# srm-727-div2-T3-ManageSubsequences

## 题意

>给你三个字符串S,A,B
>求在S中插入最少多少个字符可以使得S包含A，不包含B
>如果不能达成，返回-1
>$字符串长度<=300$

## 样例

```
"ABXBCA"
"ABCD"
"XD"
Returns: 2
```

# srm-727-div2-T2-Twodiagonals

## 题意

>平面上有n个点,现在你需要建造两条路，一条是斜率为1,
>另一条斜率为-1
>你的任务是让这两条路经过尽可能多的点
>求最多经过几个点
>$1<=N<=1000,0<=x[i],y[i]<=999$

## 样例

```
{1, 4, 4, 5}
{3, 0, 2, 3}
Returns: 4

(1,3) (4,0) (4,2) (5,3)四个点都可以被经过

```
# srm-728-div1-T1-Halving

## 题意

>你有一些木棍，现在你想让这些木棍都变成同样的长度
>你可以进行如下的操作
>选择一根长度为L>=2的木棍
>如果L为偶数，将木棍一分为2，变成两根L/2的木棍
>否则，分成一根为(L+1) / 2, 另一根为(L-1) / 2;
>在分成的两根中选择其中一根，扔掉另外一根
>可以证明的是任何集合的木棍都能最终变成一样长度的木棍
>现在问你最少需要几步可以完成任务
>$2<=n<=50, 1<=a_i<=10^9$

## 样例

```
{11, 4}
Returns: 3

最优方案是
选择长度为 11的木棍, 分成 5 and 6 ,保留5
选择长度为4的木棍,分成两个长度为2的，保留一个2
选择长度为5的, 分成2和3，保留2
现在得到了 两个2


{1, 2, 3, 4, 5, 6, 7}
Returns: 10
```

# srm-728-div2-T3-IncreasingSequencesEasy

## 题意

>给你一个有向图，每个点都只有一个出度
>问你存在多少的有向图，可以从原图中选择一个三元组$a,b,c$，重标号成$b,c,a$之后得到
>$1<=n<=10$



## 样例

```
{2, 2, 0}//表示0->2,1->2,2->0这个有向图
Returns: 2

0 1 2 -> 1 2 0 
1 2 0 -> 2 0 1
可以得到两个 {1, 2, 1} 与 {1, 0, 0}两个新图


{0, 1, 2, 3}
Returns: 0

每个点都是自环，不管怎么改变标号，图还是原图

{4, 5, 3, 1, 1, 5}
Returns: 179
```

# srm-728-div2-T2-IncreasingSequencesEasy

## 题意

>给你两个长度为n的数组L[],R[]
>求满足```L[i]<=A[i]<=R[i]```而且```A[0]<A[1]<...<A[n-1]```的序列的数量
>答案对998244353取模
>$1<=n<=300,1<=L[i]<=10^4,L[i]<=R[i]<=10^4$

## 样例

```
    
{1, 3, 1, 4}
{6, 5, 4, 6}
Returns: 4
There are 4 strictly increasing sequences satisfying the conditions: {1, 3, 4, 5}, {1, 3, 4, 6}, {2, 3, 4, 5} and {2, 3, 4, 6}.
1)

{10, 20}
{20, 30}
Returns: 120
```

# srm-729-div2-T2-SoManyRectangles


## 题意

>有n个矩形，问你最大重叠的次数
>边或者点的重叠不算
>$1<=n<=50$

## 样例

```
    
{0, 0, 0, 0, 0} // x1[]
{0, 0, 0, 0, 0} // y1[]
{1, 1, 1, 1, 1} // x2[]
{1, 1, 1, 1, 1} // y2[]

(x1[i], y1[i])  (x2[i], y2[i]) 表示一个矩形的左下角和右上角
Returns: 5

```

# srm-729-div2-T3-RareItems

## 题意

>给你一个数组表示每种物品的出现个数
>现在根据每种物品的比例随机购买每种物品
>期望购买几次能将每种物品都买到手
>$1<=n<=20$

## 样例

```
{2,2}
Returns: 3.0
```

# srm-729-div1-T1-MagicNumberThree

## 题意
>给你一个长度为50的数字串，问你有多少个子序列构成的数字可以被3整除
>答案对1e9+7取模

## 样例
    
```
"132"
Returns: 3

"00"
Returns: 3
```


# srm-730-div2-T2-ExpectedMinimumPowerDiv2

## 题意

>给你两个整数$n,x$, $1<=n<=50$
>假如要选择x个整数，每个整数都在1-n之间，
>现在在所有的这些选择中，我们选取x个数都不同的选择
>假设选择中最小的数为$S$,求$2^S$的期望
>也就是说每一种x个数不同的选择都会有一个$S_i$,求
>$2^{S_i}$的平均值，也就是期望

## 样例

```
    
4
4
Returns: 2.0
只能选择1 2 3 4
最小的数是1，所以答案是2^1=2
{1,2,3,4}其实有4!的排列，但是我们要算的是平均值，乘以排列数再除以排列数就相互抵消了

    
3
2
Returns: 2.6666666666666665
有三种选择 {1,2} or {1,3} or {2,3}. 
S值分别为1 1 2
2^S的期望为 (2^1 + 2^1 + 2^2) / 3 = 8 / 3 = 2.6666666
```

# srm-730-div2-T3-StonesOnATreeDiv2

## 题意

>给你一棵树，每个点有点权
>现在你可以在一些点上放石头，也可以拿掉某些点上的石头
>一个点可以放石头当且仅当这个点的所有儿子都放上了石头
>根节点放上石头任务完成
>求在整个过程中放着石头的节点的点权之和的最大值的最小值
>n<=1000

## 样例

```
{0,1,2,3} //分别表示1的父亲 2的父亲 3的父亲 4的父亲
{1,2,2,4,4}//每个点的点权值
Returns: 8
五个节点构成了一条链
在节点4上放一个石头 (权值和 = 4).
在节点3上放一个石头 (权值和 = 8).
移除节点4上的石头   (权值和 = 4).
在节点2上放一个石头 (权值和 = 6).
在节点1上放一个石头 (权值和 = 8).
移除节点2上的石头   (权值和 = 6)
在节点0(根节点)上放一个石头 (权值和 = 7)
整个过程中最大的权值和为8，不存在比最大值比8小的方案了
```

# srm-731-div2-T3-JustBrackets

## 题意

>给你一个合法的括号序列，每次你可以删除一个"()"
>你可以删除0个或者多个"()"
>求操作之后字典序最小的序列
>字符串长度<=100

## 样例

```
    
"()"
Returns: "()"

解释:要保证非空


"()()"
Returns: "()"


"(())"
Returns: "(())"


"(()(()))"
Returns: "((()))"
```

# srm-731-div1-T1-TreesAndBractkets

## 题意

>给你一个合法的括号序列s1，每次你可以删除一个"()"
>你可以删除0个或者多个"()"
>求能否删成另一个括号序列s2

## 样例

```
    
"()"
"()"
Returns: "Possible"

    
"(()()())"
"((()))"
Returns: "Impossible"

    
"((())((())())())"
"(()(())())"
Returns: "Possible"
```

# srm-733-div2-T2-BuildingSpanningTreesDiv2

## 题意

>有一副n个点的完全图G（每两个点之间都有边，一共有 n*(n-1)/2条边)
>告诉你一个边的集合E,里面有n-3条边
>G的生成树是选取G里面的n-1条边连接G中所有的点
>请问有多少的生成树会包括E，返回答案对987654323取模
>$4 <= n <= 1000$
>假设$x[i]->y[i]$表示E里面的一条边
>$x[i] < y[i]$ 

## 样例

```
    
n=4
x={1}
x={2}
Returns: 8

解释
8个生成树如下会包括边(1, 2):
{(1, 2), (1, 3), (1, 4)}
{(1, 2), (1, 3), (2, 4)}
{(1, 2), (1, 3), (3, 4)}
{(1, 2), (2, 3), (2, 4)}
{(1, 2), (1, 4), (2, 3)}
{(1, 2), (1, 4), (3, 4)}
{(1, 2), (2, 3), (3, 4)}
{(1, 2), (2, 4), (3, 4)}

    
n=6
x={1,1,2}
y={2,3,3}
Returns: 0

解释
n-3条边之间形成了环，无解

    
5
{1,2}
{4,5}
Returns: 20

```


# srm-733-div2-T3-HamiltonianPathsInGraph

## 题意
>有一个有向图,恰好有n*(n-1)/2条边，对于每一个(i，j)要么有一条
>i->j的边，要么有一条j->i的边,但不会同时存在这两条边
>给你这个图的邻接矩阵a，a[i][j]='+'表示i->j有边，'-'表示没有
>a[i][i]='.'表示这个图没有自环
>图的汉密尔顿路径是长度为n包含每个点恰好一次的路径
>实际上对于上面这种特性的图，一定存在至少一条汉密尔顿路径
>输出任意一条汉密尔顿路径

## 样例

```
{".+",
 "-."}
Returns: {0, 1 }

有唯一一条汉密尔顿路径0->1

{".--+",
 "+.+-",
 "+-.-",
 "-++."}
Returns: {3, 1, 2, 0 }
下面都是答案
{0, 3, 1, 2}
{1, 0, 3, 2}
{1, 2, 0, 3}
{2, 0, 3, 1}
{3, 1, 2, 0}

```


# srm-734-div2-T2-TheSquarecityDiv2

## 题意

>给你一个n*n的数字网格,每个格子表示一个房间,每个格子里面的数字表示房间的温度
>每个房间的温度都是不同的
>每个房间一开始都有一个人
>从(x1,y1)移动到(x2,y2)需要花费|x1-x2|+|y1-y2|的时间
>一个人每次移动的时间不得超过r
>现在所有人都开始重复如下操作:
>每个人都去寻找最近的比自己房间温度高的房间,直到距离r以内不存在温度更高的房间为止
>求最终有多少个房间里面有人 以及 人数最多的房间有多少人
>$1<=n<=20$

## 样例

```
r = 1

{
    9, 1, 6, 
    5, 3, 2, 
    7, 4, 8
}

ans = {4, 4}


温度为1与5的房间的人都走到了温度9的房间
3先走到5再走到9
2和4房间的最终都会到8
...

```

# srm-734-div2-T3-TheRectangularCityDiv2

## 题意

>给你一个n*m的网格，里面有空地和障碍,
>请问有多少种走法可以从边界的某个空地出发走遍每一个空地恰好一次，
>最后从某个边界的空地走出去
>$n\times m<=20$

## 样例

```
{
    "....", 
    ".##.", 
    "...."
}
Returns: 20



    
{
    "....", 
    ".###", 
    "...."
}
Returns: 2


{
    "....", 
    "####", 
    "...."
}
Returns: 0
```


# srm-734-div1-T1-TheRoundCityDiv1

## 题意

>给你一个半径为r，圆心在0 0位置的圆
>求从圆心处能看到多少个圆内的整点
>比如0 0 可以看到1 1，但是看不到2 2，因为2 2被1 1 挡住了
>$ 1 <= r <= 1e6 $


## 样例

```
2
Returns: 8
一共有12个点: (0, 1), (0, -1), (1, 0), (-1, 0), (1, 1), (1, -1), (-1, 1), (-1, -1), (0, 2), (0, -2), (2, 0), (-2, 0),  
最后四个点看不到
```

# srm-735-div2-T2-TeleportationMaze

## 题意

>给你一个网格迷宫，求从起点走到终点的最短路
>有两种走法
> - 走到上下左右某个相邻的空地，代价是1
> - 飞到上下左右离子集最近的空地，代价是2，可以跨越障碍
>网格大小<=50
## 样例

```
0 0 -> 3 3 
.##.
.###
.###
....

answer: 4

从0 0直接飞到0 3,再从0 3直接飞到3 3

0 1 -> 1 0
#.
.#

answer:-1 （无解）


0 0 -> 6 1
......
#####.
#.###.
#####.
#.###.
#####.
#.....

answer: 5
```


# srm-735-div2-T3-MajoritySubarray

## 题意
>给你一个数组，长度为100000, 每个元素都在0-49之间
>求多少子区间存在一个众数的数量大于区间长度的一半
>众数：出现最多的数

## 样例

```
0 0 1 2 0

answer： 8
一共是如下8个子区间

{0} {0} {1} {2} {0}
{0,0}:0的出现次数超过一半 
{0,0,1}：0的出现次数超过一半
{0,0,1,2,0}
```


# 736-div2-T2-Reroll

## 题意
>给你n个数,表示n个骰子向上的面的数字
>再给你一个数target(n<=target<=6*n)
>你可以选取这n个骰子中的若干个骰子重新扔
>最少需要选择几个骰子重新扔能使得所有朝上的数的和为target
>$1<=n<=20$

## 样例

```
42 
{1,3,5,3,6,4,2}

answer: 6

10
{4,2,4,5}

answer: 2
```

# 736-div2-T3-MazeWithKeys

## 题意
>你正在设计一个网格地图游戏，网格满足如下条件
>1：恰好有一个出口
>2：可能有一些门，门的标号为大写字母A-Z，每种门最多只有一个
>3：可能有一些钥匙，钥匙的标号为小写字母a-z，每种钥匙只能打开对应的大写字母的门
>4：可能有一些空地，空地的标号为小数点
>5：可能有一些障碍，障碍不能经过
>对于一个地图，你想要知道有多少的空地可以到达出口，为了使游戏显得不那么简单，你想要知道到达出口至少开一扇门的的空地有多少个
>n,m<=50
>'.' 代表空地
>'#' 代表障碍
>'*'代表出口


## 样例

```
6 7
...#.A.
.#B#.#.
.#.#.#.
.#.#.#.
.#b#.#.
a#...#*

输出:10


3 5 
a#a#*
#..#.
a..A.
输出:4
```
