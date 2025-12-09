def fasterpowermod1(a,q,b): #a^q mod b
    ans=1
    while q>=1:
        if q%2==1:#展開の位の数が1なら積を計算する
            #print('ans',ans)
            ans*=a.mod(b)
        a=(a^2).mod(b) #2乗の計算
        q=q//2
    return ans.mod(b)


def random(deg): #Fp上のランダム多項式deg(h)<deg
    while(1):
        h_tmp=0
        deg_h=randint(1,deg-1) #deg次未満の次数指定
        for i in range(deg_h+1):
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
    
p=3
R.<x> = PolynomialRing(GF(p))
FindNonTrivialFactor(x^4+x^3+x+2,2)