@prefix : <urn:odrl-compiler:> .
@prefix log: <http://www.w3.org/2000/10/swap/log#>.

(_P _O) log:onQuestionSurface {
   :Result _P _O .
   () log:onAnswerSurface {
      :Result _P _O .
   }
} .

(_P _O _P2 _O2) log:onQuestionSurface {
   :Result :constraint _O .
   _O _P2 _O2 .
   () log:onAnswerSurface {
      _O _P2 _O2 .
   }
} .