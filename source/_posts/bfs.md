---
title: 广度优先搜索
date: 2018-11-22 10:18:49
categories:
- 普及
tags:
- 搜索
- 广搜
---

# 预备知识

## 队列

队列是一种线性数据结构，其结构就跟我们平时排队是一样的，有一个人在头，一个人在尾，队伍中的人当前都在队列中，我们注意到这种普通的队列可能会有两种操作

- 删除一个头节点（排在第一的人完成了任务，走了）
- 插入一个尾节点（多一个人来排队）

由上我们知道队列满足先进队先出队的性质，简称先进先出

在代码实现上我们一般用一个数组来模拟队列，用两个变量来模拟队列的头尾在数组中的位置

# 一道例题



> 给你一个 nxm的地图，'@'是你所在的位置，'#'是障碍，不能经过，'.' 是空地，可以经过，你只能往上下左右四个方向行走，现在问你最多可以走到多少个位置，包括你自己所处的位置。



```
9 11
.#......... 
.#.#######. 
.#.#.....#. 
.#.#.###.#. 
.#.#..@#.#. 
.#.#####.#. 
.#.......#. 
.#########. 
...........

输出：59
```



这道题我们可以利用队列来扩展还没有访问过的空地，用一个二维数组来标记某个位置是否访问过，访问过的位置不用再管，每次从队列中取出一个队头元素，去看看它的上下左右是否还有新的空地，有的话就加入队尾，下面是代码实现



```c
#include <bits/stdc++.h>
using namespace std;


struct node {
	int x, y;	//队列中的每个元素的信息

};

char mp[100][100];

node Q[1000]; // 保存队列的数组
int vis[22][22];

int dx[] = {1, 0, -1, 0};
int dy[] = {0, 1, 0, -1};


void bfs(int n, int m, int sx, int sy) {
	int head = 0, tail = 0; // 队头的位置与队尾的位置
	Q[tail].x = sx;
	Q[tail].y = sy;
	tail++;
	vis[sx][sy] = 1; //一开始将起点放入队列开始广搜
	while (head < tail) { // 当队列非空时，不断取出队头的元素
		node front = Q[head]; head++;
		int nowx = front.x;
		int nowy = front.y;
		for (int i = 0; i < 4; i++) { // 向队头元素的四周扩展
			int tox = nowx + dx[i];
			int toy = nowy + dy[i];
            //越界检查 障碍判断 是否已经访问过
			if (tox < 0 || tox >= n || toy < 0 || toy >= m || mp[tox][toy] == '#' || vis[tox][toy]) {
				continue;
			}
            //发现新大陆
			vis[tox][toy] = 1;
			Q[tail].x = tox;
			Q[tail].y = toy;
			tail++;
		}
	}
	printf("%d\n", tail);

}


int main() {
	int n, m;
	scanf("%d%d", &n, &m);
	int sx =-1, sy = -1;
	for (int i = 0; i < n; i++) {
		scanf("%s", mp[i]);			
		for (int j = 0; j < m; j++) {
			if( mp[i][j] == '@') {
				sx = i;
				sy = j;
			}
		}
	}
	bfs(n, m, sx, sy);
	return 0;
}
```

**当然这还没有完全体现出队列的功能，下面我们再看一道例题**

# 骑士出行

## 题意

>告诉你一个棋盘的大小，问你从棋盘的一个点走到另一个点的最小步数，走的规则是国际象棋中骑士的走法，即走日字形

![knight](/img/knight.jpg)

我们观察第一个例题中的队列扩展的过程其实是由近及远扩展的，每一个新的节点都是以最少的步数扩展到的，这个很显然，因为一开始0步的能走到所有距离起点为1的点，所有距离起点为2的点都是由距离起点为1的点扩展到的，以此类推。
因此我们考虑在将每个点扩展进队列的时候顺便增加一个信息，就是这个点距离起点的距离，那么我们就可以在广搜的过程中顺便求出每个点到起点的最短路径了
因为在搜索的过程中队列的扩展形式是一层层往外扩展的，所以得名广度优先搜索

```cpp
#include <bits/stdc++.h>
using namespace std;
//八个方向
int dx[] = {1, 1, 2, 2, -1, -1, -2, -2};
int dy[] = {2, -2, 1, -1, 2, -2, 1, -1};
int queue[90010][3]; // 保存队列，包含三个信息，x坐标，y坐标，与起点之间的距离
int flag[310][310]; //标记某个点是否走过了
int main() {
        int t, n;
        int bfs(int, int, int , int, int);
        scanf("%d", &n);
        for(int i = 0; i < n; i++) {
                for(int j = 0; j < n; j++) {
                        flag[i][j] = 0;
                }
        }
        int sx, sy, tx, ty;
        scanf("%d%d%d%d", &sx, &sy, &tx, &ty);
        int ret = bfs(sx, sy, tx, ty, n);
        printf("%d\n", ret);
        return 0;
}
int bfs(int sx, int sy, int tx, int ty, int n) {
        if(sx == tx && sy == ty) {
                return 0;
        }
        flag[sx][sy] = 1;
        int head = 0, tail = 0;
        queue[tail][0] = sx;
        queue[tail][1] = sy;
        queue[tail][2] = 0;
        tail++;
        while(head < tail) {
                int x = queue[head][0];
                int y = queue[head][1];
                int step = queue[head][2];
                head++;
                for(int i = 0; i < 8; i++) {
                        int nowx = x + dx[i];
                        int nowy = y + dy[i];
                        if(nowx < 0 || nowx >= n || nowy < 0 || nowy >= n) {
                                continue;
                        }
                        if(flag[nowx][nowy] == 1) {
                                continue;
                        }
                        if(nowx == tx && nowy == ty) {
                                return step + 1;
                        }
                        flag[nowx][nowy] = 1;
                        queue[tail][0] = nowx;
                        queue[tail][1] = nowy;
                        queue[tail][2] = step + 1; //距离等于搜到它的点的距离 加 1
                        tail++;
                }
        }
}
```
