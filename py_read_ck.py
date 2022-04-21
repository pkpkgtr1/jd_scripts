def read_ck():
    f = open('jdCookie')
    cl=f.read().replace("'", "")

    f.close()
    #分割字符串 
    cl=cl.split(',\n')
    cl=[i for i in cl if i!='']
    return cl
