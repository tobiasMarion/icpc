#include <bits/stdc++.h>
using namespace std;

const int INF = 1e9;

int dijkstra(int from, int to, vector<vector<pair<int, int>>>& graph) {
  vector<int> dist(graph.size(), INF);
  priority_queue<pair<int, int>, vector<pair<int, int>>, greater<>> pq;

  dist[from] = 0;
  pq.push({0, from});

  while (!pq.empty()) {
    auto [d, u] = pq.top();
    pq.pop();

    if (d > dist[u]) continue;
    if (u == to) return d;

    for (auto [v, w] : graph[u]) {
      // ignores direct connection
      if ((u == from && v == to) || (u == to && v == from)) continue;

      if (dist[v] > dist[u] + w) {
        dist[v] = dist[u] + w;
        pq.push({dist[v], v});
      }
    }
  }

  return dist[to] == INF ? -1 : dist[to];
}

int main() {
  int n, m;
  cin >> n >> m;

  vector<vector<pair<int, int>>> graph(n);
  vector<pair<int, int>> edges;

  for (int i = 0; i < m; i++) {
    int u, v, w;

    cin >> u >> v >> w;
    u--;
    v--;

    graph[u].push_back({v, w});
    graph[v].push_back({u, w});

    edges.push_back({u, v});
  }

  for (auto [u, v] : edges) {
    cout << dijkstra(u, v, graph) << endl;
  }
}
