# What are they?
Those code are for Factorization of polynomial in $Z[x]$.

# How to decompose polynomials(monic) in $Z[x]$?
We have 5 steps to do.

## step1. Squarefree factorization 
We make a polynomial squarefree i.e. it has no duplicated factor on $Z[x]$ by using theory of differential and GCD. 
Its program is written in squarefree.sage . For each factor in squarefree, we apply following steps.

## step2. Different degree factorization (DDF)
We can get polynomial which is squarefree by step1. Then we regard it as a polynomial on $F_p[x]=(Z/pZ)[x]$ ($p$:prime). 
Next, we decompose it in aspect of each irrreducible factor's degree (see Example1). 
Its program is writtten in DDF.sage .

## step3. Equal degree factorization (EDF)
For each factor in DDF, we decompose it on $F_{p}[x]$ by using theory of quadratic residue (see Example1).
Its program is written in EDF.sage .

### Example1 
For $f(x)=x^9+4x^8+10x^7+21x^6+31x^5+40x^4+38x^3+27x^2+16x+4 \in F_{3}[x]$ , its DDF is
$f(x)=(x^2 + 2)(x^4 + x^3 + x + 2)(x^3 + 2x + 1)$. 
Next, we apply EDF to each factors.
* $x^2+2=(x+1)(x+2)$: product of linear polynomials. 
* $x^4+x^3+x+2=(x^2 + x + 2)(x^2 + 1)$: product of quadratic polynomials. 
* $x^3 + 2x + 1$: product of cubic polynomials.

**After step2 and step3, decomposition in $F_{p}[x]$ is finished.**
Its program is written in FactorFp.sage .

## step4. Hensel lifting
Next, we transform factors in $F_{p}[x]$ into factors in $(F_{p^q})[x]$ by using Hensel's lemma.

## step5. Finding factors by searching combinations of factors in $(F_{p^q})[x]$
After step4, we can get factors in $(F_{p^q})[x]$. However, though they are factors in $(F_{p^q})[x]$, they can be fake in $Z[x]$.
So we have to find true factors in $Z[x]$ by searching combinations of factors in $(F_{p^q)}[x]$. Then we can finish decomposition on $Z[x]$. 

Overall program with squarefree is written in Factoriation_with_Squarefree.sage . It is written in sage. For example, you can use it on [SageMathCell](https://sagecell.sagemath.org/) 

## Bibliography
Kazuhiro Yokoyama (2022). Polynomials and computer algebra. 
Asakura Publishing Co., Ltd.
