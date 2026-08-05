#include <bits/stdc++.h>
using namespace std;

template <typename T>
bool sameElements(vector<T> a, vector<T> b) {
  if (a.size() != b.size()) return false;
  sort(a.begin(), a.end());
  sort(b.begin(), b.end());
  return a == b;
}

template <typename T>
void loadVector(vector<T>& v, long long size) {
  for (long long i = 0; i < size; i++) {
    cin >> v[i];
  }
}

long long lcmVector(const vector<long long>& v) {
  if (v.empty()) return 1;
  long long ans = v[0];
  for (size_t i = 1; i < v.size(); i++) {
    ans = lcm(ans, v[i]);
    if (ans > 1000000000) return ans;
  }
  return ans;
}

template <typename T>
vector<T> shuffleUsingPattern(vector<T>& v, vector<long long>& pattern) {
  long long size = v.size();
  vector<T> shuffled(size);

  for (long long i = 0; i < size; i++) {
    shuffled[pattern[i]] = v[i];
  }

  return shuffled;
}

int main() {
  long long TOP_LIMIT = 1000000000;
  long long amountOfNumbers;
  cin >> amountOfNumbers;

  vector<long long> current(amountOfNumbers);
  vector<long long> pattern(amountOfNumbers);
  vector<long long> desired(amountOfNumbers);

  loadVector(current, amountOfNumbers);
  loadVector(desired, amountOfNumbers);

  for (long long i = 0; i < amountOfNumbers; i++) {
    cin >> pattern[i];
    pattern[i]--;
  }

  if (!sameElements(current, desired)) {
    cout << "IMPOSSIVEL" << endl;
    return 0;
  }

  vector<bool> visited(amountOfNumbers, false);
  vector<long long> cyclesSizes;

  for (int i = 0; i < amountOfNumbers; i++) {
    if (!visited[i]) {
      long long size = 0;
      long long pos = i;

      while (!visited[pos]) {
        visited[pos] = true;
        size++;
        pos = pattern[pos];
      }

      cyclesSizes.push_back(size);
    }
  }

  long long fullCycleSize = lcmVector(cyclesSizes);
  long long limit = min(fullCycleSize, TOP_LIMIT + 1);

  for (long long k = 0; k < limit; k++) {
    if (current == desired) {
      cout << k << endl;
      return 0;
    }

    current = shuffleUsingPattern(current, pattern);
  }

  if (fullCycleSize > TOP_LIMIT) {
    cout << "DEMAIS" << endl;
  } else {
    cout << "IMPOSSIVEL" << endl;
  }

  return 0;
}