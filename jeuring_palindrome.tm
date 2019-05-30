<TeXmacs|1.99.9>

<style|generic>

<\body>
  <\doc-data|<doc-title|Jeuring's Algorithm on Palindromes>>
    \;
  <|doc-data>
    \;
  </doc-data>

  <\warning>
    The notes have not been proofread. Use at your own peril.
  </warning>

  <\question>
    Given a string <math|<around*|(|s<rsub|i>|)><rsub|0\<leq\>i\<less\>n>>,
    try to compute the longest palindrome in <math|s> with
    <math|O<around*|(|n|)>> time complexity.
  </question>

  In fact, we will compute <math|<around*|(|a<rsub|m>|)><rsub|0\<leq\>m\<leq\>2*<around*|(|n-1|)>>>
  where <math|a<rsub|m>> is the maximal length of a palindrome
  <math|<around*|(|s<rsub|i>|)><rsub|l\<leq\>i\<leq\>r>> such that
  <math|l+r=m>.

  For sake of convenience, we set <math|s<rsub|-1>> and <math|s<rsub|n>> to
  be two distinct unused characters in <math|<around*|(|s<rsub|i>|)><rsub|0\<leq\>i\<less\>n>>.
  The array <math|A<around*|[|0\<ldots\>2*<around*|(|n-1|)>|]>> will
  gradually compute <math|<around*|(|a<rsub|m>|)><rsub|0\<leq\>m\<leq\>2*<around*|(|n-1|)>>>.
  We design the scheme of the algorithm as

  <\render-code>
    <\math>
      m\<leftarrow\>0
    </math>

    <strong|for> <math|i> <strong|from> <math|1> <strong|to> <math|n>
    <strong|do>

    <\indent>
      <strong|if> <math|s<rsub|i>\<neq\>s<rsub|m-i>> <strong|then>

      <\indent>
        <math|A<around*|[|m|]>\<leftarrow\>2*i-m-1>

        Increase <math|m> to some new <math|m<rprime|'>> and compute
        <math|A<around*|[|j|]>> for all <math|j> such that
        <math|m\<leq\>j\<less\>m<rprime|'>>
      </indent>
    </indent>
  </render-code>

  where the loop invariant is that <math|i-1\<leq\>m\<leq\>2*<around*|(|i-1|)>>,
  and <math|A<around*|[|j|]>=a<rsub|j>> for all <math|0\<leq\>j\<less\>m>,
  and that <math|<around*|(|s<rsub|j>|)><rsub|m-i+1\<leq\>j\<leq\>i-1>> is
  the longest palindrome which ends at <math|i-1>. The algorithm terminates
  with <math|i=n+1> and we succeed in computing the array <math|A>.

  The increment in question is implemented as follows:

  <\render-code>
    <strong|for> <math|j> <strong|from> <math|m+1> <strong|to>
    <math|\<infty\>> <strong|do>

    <\indent>
      <strong|if> <math|<around*|(|s<rsub|k>|)><rsub|j-i\<leq\>k\<leq\>i>> is
      a palindrome <strong|then>

      <\indent>
        <\math>
          m\<leftarrow\>j
        </math>

        <strong|break>
      </indent>

      <strong|else>

      <\indent>
        Compute <math|A<around*|[|j|]>>
      </indent>
    </indent>
  </render-code>

  The trick is to determine whether <math|<around*|(|s<rsub|k>|)><rsub|j-i\<leq\>k\<leq\>i>>
  is a palindrome and compute <math|A<around*|[|j|]>> in constant time. For
  the former, we note that <math|<around*|(|s<rsub|k>|)>> in question is a
  palindrome if and only if <math|A<around*|[|2*j-m|]>>, which computes
  <math|a<rsub|2*j-m>>, equals to <math|2*i-j-1>, and that
  <math|s<rsub|i>=s<rsub|j-i>>. For the later, we set
  <math|A<around*|[|j|]>\<leftarrow\>A<around*|[|2*j-m|]>>:

  <\render-code>
    <math|u\<leftarrow\>s<rsub|i>>

    <strong|for> <math|j> <strong|from> <math|m+1> <strong|to>
    <math|\<infty\>> <strong|do>

    <\indent>
      <math|t\<leftarrow\>A<around*|[|2*j-m|]>>

      <strong|if> <math|<around*|(|t=2*i-j+1|)>> <strong|and>
      <math|<around*|(|u=s<rsub|j-i>|)>> <strong|then>

      <\indent>
        <\math>
          m\<leftarrow\>j
        </math>

        <strong|break>
      </indent>

      <strong|else>

      <\indent>
        <math|A<around*|[|j|]>\<leftarrow\>t>
      </indent>
    </indent>
  </render-code>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|12>
    <associate|page-height|auto>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|footnote-1|<tuple|1|?>>
    <associate|footnr-1|<tuple|1|?>>
    <associate|outer-loop|<tuple|1|?>>
  </collection>
</references>