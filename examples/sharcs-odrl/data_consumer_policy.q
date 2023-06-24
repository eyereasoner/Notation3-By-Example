@prefix : <urn:odrl-compiler:> .
@prefix log: <http://www.w3.org/2000/10/swap/log#>.

(_:P _:O) log:onQuerySurface {
   :Result _:P _:O .
   () log:onAnswerSurface {
      :Result _:P _:O .
   }
} .

(_:P _:O _:P2 _:O2) log:onQuerySurface {
   :Result :constraint _:O .
   _:O _:P2 _:O2 .
   () log:onAnswerSurface {
      _:O _:P2 _:O2 .
   }
} .