---
title: 冒泡排序
date: 2018-09-23 12:32:02
categories: 普及
tags: 排序
mathjax: true 
---

# 主要思想

>假设我们现在要按照从小到大的顺序排,每一轮我们都比较相邻元素的大小,如果前面的元素比较大,就交换,那么第一轮下来最大的数字肯定能跑到最后面去,接下来的每一轮我们都这样执行,那么第二轮,第二大的数会跑到倒数第二个数的位置去...第三轮..,n-1轮之后,整个序列就会变成有序的,每次相当于冒出一个最大的数来,因此叫做冒泡排序
>复杂度
>$$
>O(n^2)
>$$
>


# 代码实现



```c++
#include <bits/stdc++.h>
using namespace std;

int a[1010];
int main() {
    int n;
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n - i - 1 ; j++) { //最后面i个数是已经冒出来的i个数，不用再比较了
            if (a[j] > a[j + 1]) {
                swap(a[j], a[j + 1]);
            }
        }
    }
    for (int i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }
    return 0;
}
```
