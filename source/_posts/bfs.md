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

# 营救计划

## 题意

>在一个nxm的迷宫里，有一个萌新被困住了，你作为一个久经码场的战士，决定去营救萌新。地图中还会有一些守卫，你必须打败守卫才能通过守卫所在的位置，打败守卫需要花费1分钟，移动一步需要花费一分钟，每次你只能往上下左右某个方向移动一步。问你最少需要花费多少时间才能救到萌新。


```
7 8 
#.#####. 
#.M#..@. 
#..#G... 
..#..#.# 
#...##.. 
.#...... 
........

13


2 2
M.
G@

2
```

## 解法

此问题的关键在于当我们搜到守卫的时候，能否将守卫直接放入队列，如果直接放入队列就要将时间直接加上2分钟，那么队列中就会出现时间花费较大的元素排在时间花费较少的元素前面，具体见上面第二个例子，所以从这里我们可以看出队列中元素的步长一定要满足非递减的顺序

那么该如何解决这个问题呢？

假如我们学过优先队列，我们可以直接将时间+2然后插入队列，因为这个元素会自动排在时间较小的元素后面

如果还是用普通的队列可以这样处理：碰到守卫先当作普通的空地一样放入队列，等到取出来的时候，不去扩展周边的格子，而是重新放回队列，并且步数加1

这样子，还是满足了队列的性质，一层层向外扩展，队列中的元素的步长是每次严格的+1

参考代码

```c++
#include<stdio.h>
#include<string.h>
int n,m,x0,y0,k;
int flag[201][201];
char str[201][201];
int step[4][2]={-1,0,1,0,0,1,0,-1};
struct node{
    int x,y;
    int steps;
}move[400002];
int bfs()
{
    int i,head,rear,tempx,tempy;
    move[1].x=x0;move[1].y=y0;
    move[1].steps=0;
    head=0;rear=1;
    while(head<rear)
    {
        head++;
        if(str[move[head].x][move[head].y]=='G')
        {
            rear++;
            move[rear].x=move[head].x;
            move[rear].y=move[head].y;
            move[rear].steps=move[head].steps+1;
            str[move[head].x][move[head].y]='.';
        }
        else
        {
            for(i=0;i<4;i++)
            {
                tempx=move[head].x+step[i][0];
                tempy=move[head].y+step[i][1];
                if(tempx<0||tempx>=n||tempy<0||tempy>=m||flag[tempx][tempy]||str[tempx][tempy]=='#')
                    continue;
                flag[tempx][tempy]=1;
                rear++;
                move[rear].x=tempx;
                move[rear].y=tempy;
                move[rear].steps=move[head].steps+1;
                if(str[tempx][tempy]=='M')
                    return move[rear].steps;
            }
        }
    }
    return 0;
}
int main()
{
    int i,j,ans;
    while(scanf("%d%d",&n,&m)==2)
    {
        memset(str,'\0',sizeof(str));
        memset(flag,0,sizeof(flag));
        for(i=0;i<n;i++)
            for(j=0;j<m;j++)
            {
                scanf("%1s",&str[i][j]);
                if(str[i][j]=='@')
                {
                    x0=i;y0=j;
                    str[i][j]='#';
                }
            }
            ans=bfs();
            if(ans) printf("%d\n",ans);
            else printf("You can't save Mengxin\n");
    }
    return 0;
}
```

