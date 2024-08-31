from typing import List

def power3_A(input:int) -> int:
    out_a=input
    for i in range(2):
        out_a=out_a*input
    return out_a

def power3_B(input:int) -> int:
    out_b=(input*input)*input
    return out_b

print(power3_A(2))
print(power3_B(2))
