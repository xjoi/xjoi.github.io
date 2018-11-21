---
title: 2018noip题解以及点评
date: 2018-11-21 18:48:09
categories: 
- 比赛
tags:
- 比赛题解
mathjax: true
---

# day1

## T1-道路铺设
暑假里给学生讲这种模型的时候讲到有四种方法可以做这样的题
1：RMQ
2：单调栈
3：迪卡尔树
4：看似暴力的预处理
就算没做过原题，不知道差分，随便写一种方法都不会花很长时间

## T2-货币系统
一看到这个题可能有点紧张，然后看看数据范围基本就能联想到背包
想到背包这个题基本就没有了秘密

## T3-赛道修建
首先根据提高组选手的基本素养，立刻反应要二分
二分之后怎么验证呢
我们可以枚举路径的LCA，那么一条合法路径就被分成了两条从LCA出发的路径，当然如果某条从LCA出发的路径足够长，自己也可以构成一条路径
我们发现每个子树要么自己配对完毕，要么留下一条路径延伸到父亲方向去
留下两条或以上没有意义
因此如果实在要留，我们尽可能留下最长的那条路径
只要两条路径的长度加起来>=K就可以配成一对，因此现在变成了一个子问题
给你一个数组，问你最多配成多少对的和>=K的整数对
从小到大枚举每个数然后在set里面二分找最小的数去陪对就好了
```
#include <bits/stdc++.h>
using namespace std;
 
const int N = 55555;
 
vector <pair<int, int> > e[N];
int n, m;
int w[N];
int total;
 
void dfs(int u, int f, int x) {
    if (total >= m) {
        return ;
    }
    multiset <int> st;
    for (auto it : e[u]) {
        if (it.first != f) {
            dfs(it.first, u, x);
            if (total >= m) {
                return ;
            }
            int value = w[it.first] + it.second;
            if (value >= x) {
                total++;
            } else {
                st.insert(value);
            }
        }
    }
    if (total >= m) {
        return ;
    }
    int left = 0;
    while (!st.empty()) {
        auto it = st.begin();
        int value = *it;
        st.erase(it);
        if (*it >= x) {
            total ++;
            continue;
        }
 
        auto it_pair = st.lower_bound(x - *it);
        if (it_pair == st.end()) {
            left = max(left, value);
        } else {
            total ++;
            st.erase(it_pair);
        }
    }
    w[u] = left;
}
 
bool judge (int x) {
    total = 0;
    dfs(0, -1, x);
    return total >= m;
}
 
int main () {
    scanf("%d%d", &n, &m);
    int a, b, c;
    for (int i = 1; i < n; i++) {
        scanf("%d%d%d", &a, &b, &c);
        a--; b--;
        e[a].push_back(make_pair(b, c));
        e[b].push_back(make_pair(a, c));
    }
    int l = 1, r = 500000000, best = -1;
    while (l <= r) {
        int mid = (l + r) >> 1;
        if (judge (mid)) {
            best = mid;
            l = mid + 1;
        } else {
            r = mid - 1;
        }
    }
    printf("%d\n", best);
    return 0;
}
```

# day2

## T1-旅行
树的情况显然可以直接贪心每次走编号小的儿子
图的情况，稍微分析一下发现有一条边可以不走，然后看到数据范围就可以想到暴力枚举了

## T2-填数游戏

首先打出8\*7以内的表,然后发现

$$ f[n][m]= 3\* f[n][m - 1] (m >= n-2) $$

那么我们只需要搞出8x9以内的就万事大吉
那么我们开个O2大力打出8x8的表，你会发现

$$f[n][n+1] = f[n][n] \* 3 + d$$
d是个等比数列，然后8x9的答案可以推算出来
8×8需要跑一小会，搜索写的好一点可以更快地打出8x8

```
#include <bits/stdc++.h>
using namespace std;
 
 
 
const int mod = (int)1e9+7;
 
vector <pair<int,int> > v[100];
 
int a[8][8];
int cnt;
int n, m;
 
bool check() {
    for (int i = 1; i < n; i++) {
        for (int j = 1; j < m; j++) if (a[i - 1][j] == a[i][j - 1]){
            for (int xie = i + j + 1; xie < n + m - 1; xie++) {
                int col = -1;
                int state = 0;
                for (int k = 0; k < v[xie].size(); k++) {
                    auto it = v[xie][k];
                    if (it.first >= i && it.second >= j) {
                        state |= (1 << a[it.first][it.second]);
                    }
                    if (state == 3) {
                        return false;
                    }
                }
            }
        }
    }
    return true;
}
 
void dfs(int tot, int now) {
    //printf("tot=%d now=%d\n", tot, now);
    if (now == tot) {
        if (check()) {
            cnt++;
        }
        return ;
    }
    for (int i = 0; i < v[now].size(); i++) {
        pair<int,int> it = v[now][i];
        a[it.first][it.second] = 1;
    }
    dfs(tot, now + 1);
    for (int i = 0; i < v[now].size(); i++) {
        pair<int,int> it = v[now][i];
        a[it.first][it.second] = 0;
        dfs(tot, now + 1);
    }
}
 
int brute(int n, int m) {
    ::n = n;
    ::m = m;
    cnt = 0;
    for (int i = 0; i < 100; i++) v[i].clear();
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            v[i+j].push_back(make_pair(i, j));
        }
    }
    dfs(n + m - 1, 0);
    return cnt;
}

 int biao[][10] = {
 {2,4,8,16,32,64,128,256},
 {4,12,36,108,324,972,2916,8748},
 {8,36,112,336,1008,3024,9072,27216},
 {16,108,336,912,2688,8064,24192,72576},
 {32,324,1008,2688,7136,21312,63936,191808},
 {64,972,3024,8064,21312,56768,170112,510336},
 {128,2916,9072,24192,63936,170112,453504,1360128},
 {256,8748,27216,72576,191808,510336,1360128,3626752, 10879488}
};
 
int pow_mod(int a, int b) {
    int ret = 1;
    while (b) {
        if (b & 1) {
            ret = 1LL * ret * a % mod;
        }
        a = 1LL * a * a % mod;
        b >>= 1;
    }
    return ret;
}
 
int main () {
    /*
    for (int i = 8; i <= 8; i++) {
        printf("i=%d\n", i);
        cout << '{';
        for (int j = 8; j <= 8; j++) {
 //           printf("i=%d j=%d\n", i, j);
            printf("%d, \n", brute(i, j));
        }
        cout << '}' << endl;
    }*/
    biao[6][8] = biao[6][7] * 3;
    biao[6][9] = biao[6][8] * 3;
    biao[7][9] = biao[7][8] * 3;
    int n, m;
    cin >> n >> m;
    if (n == 1) {
        cout << pow_mod(2, m) << endl;
        return 0;
    }
    n --;
    m --;
    if (m >= 7 && m >= n + 2) {
        cout << 1LL * biao[n][n + 2] * pow_mod(3, m - n - 2) % mod;
    } else {
        cout << biao[n][m]  << endl;
    }
    return 0;
}
```

## T3-保卫王国

首先，只要会基本的树形DP就可以拿到44分

对于正解，我们先观察一下钦点一个点的状态的时候该怎么做
如果钦点了一个点的状态，我们需要自底向上DP一遍，然后再从上往下再DP一遍
这样子我们可以预处理出两个东西
f[u][0/1]: u选或者不选的情况下u子树的最优值
g[u][0/1]：u选或者不选的情况下整棵树的最优值

然后再进一步，我们来思考钦点两个点怎么做

我们发现钦点两个点其实就是会影响这两个点的LCA子树内的DP状态，把这个子树拿掉后的其他点的代价可以利用前面处理出来的数组快速算出来

于是就可以考虑用倍增算法来预处理出如下数组

qd[i][j][x][y]
表示j的状态为x,j的2的i次方个祖先的状态为y的情况下的最优值，这个dp满足区间合并的性质，合并起来类似于矩阵乘法的转移





```
#include <bits/stdc++.h>
using namespace std;
 
const int N = 300010;
const int MAX_POW = 19;
const long long INF = (long long) 1e12;
 
vector <int> e[N];
int val[N], dep[N];
int p[MAX_POW][N];
long long f[N][2], g[N][2];
struct state{
    long long a[2][2];
    void init() {
        a[0][0] = a[0][1] = a[1][1] = a[1][0] = INF;
    }
    void print() {
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 2; j++) {
                printf("a[%d][%d] = %lld\n", i, j, a[i][j]);
            }
        }
        puts("");
    }
}qd[MAX_POW][N];
 
int n, m;
 
void input () {
    scanf("%d%d%*s", &n, &m);
    for (int i = 0; i < n; i++) {
        scanf("%d", &val[i]);
    }
    int a, b;
    for (int i = 1; i < n; i++) {
        scanf("%d%d", &a, &b);
        a--; b--;
        e[a].push_back(b);
        e[b].push_back(a);
    }
}
 
void dfs(int u, int pre) {
    if(pre != -1) dep[u] = dep[pre] + 1;
    p[0][u] = pre;
    f[u][0] = 0;
    f[u][1] = val[u];
    for (auto v: e[u]) if (v != pre){
        dfs(v, u);
        f[u][0] += f[v][1];
        f[u][1] += min(f[v][0], f[v][1]);
    }
}
 
void rdfs(int u, int pre, int pf0, int pf1) {
    g[u][0] = f[u][0] + pf1;
    g[u][1] = f[u][1] + min(pf0, pf1);
    for (auto v: e[u]) if (v != pre) {
        qd[0][v].a[0][0] = INF;
        qd[0][v].a[0][1] = qd[0][v].a[1][1] = f[u][1] - min(f[v][0], f[v][1]);
        qd[0][v].a[1][0] = f[u][0] - f[v][1];
        rdfs(v, u, g[u][0] - f[v][1], g[u][1] - min(f[v][0], f[v][1]));
    }
}
 
state merge(const state& A, const state& B) {
    state res;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            res.a[i][j] = INF;
            for (int k = 0; k < 2; k++) {
                res.a[i][j] = min(res.a[i][j], A.a[i][k] + B.a[k][j]);
            }
        }
    }
    return res;
}
 
void init() {
    memset(p, -1, sizeof(p));
    dfs(0, -1);
    for (int i = 1; i < MAX_POW; i++) {
        for (int u = 0; u < n; u++) {
            p[i][u] = p[i - 1][p[i - 1][u]];
        }
    }
    rdfs(0, -1, 0, 0);
    for (int i = 1; i < MAX_POW; i++) {
        for (int u = 0; u < n; u++) {
            qd[i][u] = merge(qd[i-1][u], qd[i-1][p[i - 1][u]]);
        }
    }
}
 
void query() {
    int ua,x,ub,y;
    for (int i = 0; i < m; i++) {
        scanf("%d%d%d%d", &ua, &x, &ub, &y);
        ua--; ub--;
        if (dep[ua] < dep[ub]) {
            swap(ua, ub);
            swap(x, y);
        }
 
        int delta = dep[ua] - dep[ub];
         
        state left; left.init(); left.a[x][x] = f[ua][x];
        state right; right.init(); right.a[y][y] = f[ub][y];
 
        for (int i = MAX_POW - 1; i >= 0; i--) if (delta >> i & 1){
            left = merge(left, qd[i][ua]);
            ua = p[i][ua];
        }
        if (ua == ub) {
            long long res = left.a[x][y];
            int fa = p[0][ub];
            if (fa != -1) {
                long long c0 = g[fa][0] - f[ub][1];
                long long c1 = g[fa][1] - min(f[ub][0], f[ub][1]);
                if (y == 0) {
                    res += c1;
                } else {
                    res += min(c0, c1);
                }
            }
            printf("%lld\n", res >= INF ? -1 : res);
        } else {
 
            for (int i = MAX_POW - 1; i >= 0; i--) if (p[i][ua] != p[i][ub]) {
                left = merge(left, qd[i][ua]);
                right = merge(right, qd[i][ub]);
                ua = p[i][ua];
                ub = p[i][ub];
            }
            int lca = p[0][ua];
            long long c0 = g[lca][0] - f[ua][1] - f[ub][1];
            long long c1 = g[lca][1] - min(f[ua][0], f[ua][1]) - min(f[ub][0], f[ub][1]) ;
            c0 += left.a[x][1] + right.a[y][1];
            c1 += min(left.a[x][0], left.a[x][1]) + min(right.a[y][0], right.a[y][1]);
            printf("%lld\n", min(c0, c1) >= INF ? -1 : min(c0, c1));
        }
    }
}
 
int main() {
    input();
    init();
    query();
    return 0;
}
```

# 点评

day1三题属于送分题，尤其T1有四五种方法可以做, T2只要大力背包，T3这种二分之后树上贪心的套路也已经屡见不鲜

day2-T1考察图论基本功，T2没有什么思路首先都会去打表，而且这个题打出8*7以内的表非常容易，几分钟就能跑出答案，观察这个表的规律就可以拿到大部分的分数了，T3比较坑，这本来就是一道原题，而且这种第一次见基本做不出来的题出在了一场决定很多选手命运的比赛中确实不太合适，尽管暴力分给的还算多

总的来说，今年的题目远远不及前两年, 原题或者类原题实在多了点,思维上也没有什么亮点
