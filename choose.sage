def choose(list,r):
    ans=[]
    finalans=[]
    if r==1:
        for x in list:
            finalans.append([x])
        return finalans
    #起点の最小の位置はr-1
    for start in range(r-1,len(list)): #起点の場所を1個選ぶ
        ans_tmp=[]
        j=0
        while(j<start):
            ans_tmp.append(list[j])#起点を含まない小さいリストを生成
            j+=1
        ans=copy((choose(ans_tmp,r-1))) #ans_tmpからr-1個選びたい
        for y in ans:
            y+=[list[start]] #起点を追加
            finalans.append(y) #リストをひとまとめに
    return finalans
        
        
list=["a","b","c","d","e","f","g","h"]
print(choose(list,2))
#print(len(choose(list,2)))



def choice(List, number):
    if number == 1:
        temp = []
        for f in List:
            temp.append([f])
        return temp
    
    Goal = []
    
    for i in range(number-1,len(List)): #起点を動かすループ
        sublist = List[:i] #起点より前にあるリストを取り出す
        result = choice(sublist,number-1)
        for j in result:
            j.append(List[i]) #起点部分を追加する
        Goal += result
    
    return Goal