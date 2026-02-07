#include <bits/stdc++.h>
using namespace std;

int main() {
  int disposition, amountTiring, amountInvigoranting;
  cin >> disposition >> amountTiring >> amountInvigoranting;

  vector<int> tiring(amountTiring);
  for (int i = 0; i < amountTiring; i++) cin >> tiring[i];

  vector<int> invigorating(amountInvigoranting);
  for (int i = 0; i < amountInvigoranting; i++) cin >> invigorating[i];

  int tiringPointer = 0;
  int invigoratingPointer = 0;

  while (true) {
    if (tiringPointer < amountTiring && disposition >= tiring[tiringPointer]) {
      disposition -= tiring[tiringPointer];
      tiringPointer++;
      continue;
    }

    if (invigoratingPointer < amountInvigoranting) {
      disposition += invigorating[invigoratingPointer];
      invigoratingPointer++;
      continue;
    }

    break;
  }

  cout << tiringPointer + invigoratingPointer << endl;

  return 0;
}