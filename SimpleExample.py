from chef import light

class SimpleTest(light.SymbolicTest):
    def setUp(self):
        pass
    
    def func1(self, input):
        if input<50:
            return 1
        else:
            return 0
    
    def func2(self,input):
        if input<45:
            return 1
        else:
            return 0

    def runTest(self):
        i=self.getInt("value",100,max_value=100,min_value=0)

        res=(self.func1(i)==self.func2(i))
        if res:
            print("same")
        else:
            print("diff")

