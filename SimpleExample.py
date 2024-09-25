from chef import light

class SimpleTest(light.SymbolicTest):
    def setUp(self):
        pass
    
    def func1(self, input):
        if i<50:
            return 1
        else:
            return 0
    
    def func2(self,input):
        if i<45:
            return 1
        else:
            return 0

    def runTest(self):
        i=self.getInt("value",100,max_value=100,min_value=0)

        res=(func1(i)==func2(i))
        if res:
            print("same")
        else:
            print("diff")

class SimpleTest_Alternative(light.SymbolicTest):
    def setUp(self):
        pass
    
    def func1(self, input):
        if i<50:
            return 1
        else:
            return 0
    
    def func2(self,input):
        if i<45:
            return 1
        else:
            return 0

    def runTest(self):
        i=self.getInt("value",100,max_value=100,min_value=0)
        res1=50
        res2=50
        
        if i<50:
            res1=1
        else:
            res1=0
        
        if i<45:
            res2=1
        else:
            res2=0
        
        res=(res1==res2)

        if res:
            print("same")
        else:
            print("diff")