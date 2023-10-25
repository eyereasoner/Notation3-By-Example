@prefix : <urn:odrl-compiler:> .
@prefix log: <http://www.w3.org/2000/10/swap/log#>.

(?P ?O) log:onQuestionSurface {
   :Result ?P ?O .
   () log:onAnswerSurface {
      :Result ?P ?O .
   }
} .

(?P ?O ?P2 ?O2) log:onQuestionSurface {
   :Result :constraint ?O .
   ?O ?P2 ?O2 .
   () log:onAnswerSurface {
      ?O ?P2 ?O2 .
   }
} .