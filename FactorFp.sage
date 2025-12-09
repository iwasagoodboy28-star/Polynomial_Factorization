p=3
R.<x> = PolynomialRing(GF(p))

def fasterpowermod1(a,q,b): 
    ans=1
    while q>=1:
        if q%2==1:#展開の位の数が1なら積を計算する
            ans*=a.mod(b)
        a=(a^2).mod(b) #2乗の計算
        q=q//2
    return ans.mod(b)

def DDF(f):
    list=[]
    h=x
    g=f
    k=0
    while(g!=1):
        k=k+1
        h=fasterpowermod1(h,p,g) 
        gk=gcd(h-x,g)
        list.append(gk)
        g=g//gk
    return list


def random(deg): #Fp上のランダム多項式deg(h)<deg
    while(1):
        h_tmp=0
        deg_h=randint(1,deg) #次数指定
        for i in range(deg_h):
            h_tmp+=randint(0,p-1)*x^i
        if h_tmp!=h_tmp.constant_coefficient(): #hが定数
            return h_tmp

def FindNonTrivialFactor(f,d):
    q=(p^d-1)//2
    while(1):
        while(1):
            h=random(f.degree()) #ランダム多項式
            if gcd(f,h)==1: #fと互いに素か判定
                break
        g=gcd(h,f)
        if g!=1:
            return g,f//g
        f1=gcd(fasterpowermod1(h,q,f)-1,f) #h^q-1 mod y とfとのgcd ユークリッドの定理
        if f1!=1 and f1!=f:
            return f1,f//f1


def EDF(f,d):
    SF=[]
    F=[f]
    while(len(SF)<(f.degree()//d)):
        g=F[0]#先頭要素
        F.remove(g) #使用した多項式を削除
        if f.is_irreducible()==False:
            g1,g2=FindNonTrivialFactor(g,d)
            if  g1.degree()!=d:
                F.append(g1)
            else:
                SF.append(g1)
            if  g2.degree()!=d:
                F.append(g2)
            else:
                SF.append(g2)
        else:
            SF.append(f)
    return SF

def FactorFp(f):
    D=DDF(f)
    F=[]
    c=0
    for g in D:
        #print(g)
        if g!=1: #要検討
            c+=1
            ##print(c)
            G=EDF(g,c)
            #print(G)
            F=F+G
    return F



#DDFの例
f=x^9+4*x^8+10*x^7+21*x^6+31*x^5+40*x^4+38*x^3+27*x^2+16*x+4
print('DDF',DDF(f))
print('EDF',EDF(x^3+2*x+1,3))
print(FactorFp(f))



