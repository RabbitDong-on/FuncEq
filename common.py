from typing import List

def common(l1:list,l2:list) -> list:
    common_elems =list(set(l1).intersection(set(l2)))
    common_elems.sort()
    return list(set(common_elems))
