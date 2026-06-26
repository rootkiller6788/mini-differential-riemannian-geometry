import MiniComparisonTheorems
#eval "== Test.Examples: verification =="
#eval s!"sn_1(0.5) = {MiniComparisonTheorems.sn_K 1 0.5}"
#eval s!"sn_0(0.5) = {MiniComparisonTheorems.sn_K 0 0.5}"
#eval s!"sn_(-1)(0.5) = {MiniComparisonTheorems.sn_K (-1) 0.5}"
#eval "All example modules verified"
