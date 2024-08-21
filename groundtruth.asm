  1           0 LOAD_CONST               0 (0)
              2 LOAD_CONST               1 (('List',))
              4 IMPORT_NAME              0 (typing)
              6 IMPORT_FROM              1 (List)
              8 STORE_NAME               1 (List)
             10 POP_TOP

  4          12 LOAD_NAME                1 (List)
             14 LOAD_NAME                2 (float)
             16 BINARY_SUBSCR
             18 LOAD_NAME                2 (float)
             20 LOAD_NAME                3 (bool)
             22 LOAD_CONST               2 (('numbers', 'threshold', 'return'))
             24 BUILD_CONST_KEY_MAP      3
             26 LOAD_CONST               3 (<code object has_close_elements at 0x7f9ca424e240, file "groundtruth.py", line 4>)
             28 LOAD_CONST               4 ('has_close_elements')
             30 MAKE_FUNCTION            4 (annotations)
             32 STORE_NAME               4 (has_close_elements)
             34 LOAD_CONST               5 (None)
             36 RETURN_VALUE

Disassembly of <code object has_close_elements at 0x7f9ca424e240, file "groundtruth.py", line 4>:
 12           0 LOAD_FAST                1 (threshold)
              2 LOAD_CONST               1 (0)
              4 COMPARE_OP               4 (>)
              6 POP_JUMP_IF_TRUE        16
              8 LOAD_GLOBAL              0 (AssertionError)
             10 LOAD_CONST               2 ('invalid inputs')
             12 CALL_FUNCTION            1
             14 RAISE_VARARGS            1

 13     >>   16 LOAD_GLOBAL              1 (all)
             18 LOAD_CONST               3 (<code object <listcomp> at 0x7f9ca424e0e0, file "groundtruth.py", line 13>)
             20 LOAD_CONST               4 ('has_close_elements.<locals>.<listcomp>')
             22 MAKE_FUNCTION            0
             24 LOAD_FAST                0 (numbers)
             26 GET_ITER
             28 CALL_FUNCTION            1
             30 CALL_FUNCTION            1
             32 POP_JUMP_IF_TRUE        42
             34 LOAD_GLOBAL              0 (AssertionError)
             36 LOAD_CONST               2 ('invalid inputs')
             38 CALL_FUNCTION            1
             40 RAISE_VARARGS            1

 15     >>   42 LOAD_GLOBAL              2 (sorted)
             44 LOAD_FAST                0 (numbers)
             46 CALL_FUNCTION            1
             48 STORE_FAST               2 (sorted_numbers)

 16          50 LOAD_GLOBAL              3 (range)
             52 LOAD_GLOBAL              4 (len)
             54 LOAD_FAST                2 (sorted_numbers)
             56 CALL_FUNCTION            1
             58 LOAD_CONST               5 (1)
             60 BINARY_SUBTRACT
             62 CALL_FUNCTION            1
             64 GET_ITER
        >>   66 FOR_ITER                34 (to 102)
             68 STORE_FAST               3 (i)

 17          70 LOAD_FAST                2 (sorted_numbers)
             72 LOAD_FAST                3 (i)
             74 LOAD_CONST               5 (1)
             76 BINARY_ADD
             78 BINARY_SUBSCR
             80 LOAD_FAST                2 (sorted_numbers)
             82 LOAD_FAST                3 (i)
             84 BINARY_SUBSCR
             86 BINARY_SUBTRACT
             88 LOAD_FAST                1 (threshold)
             90 COMPARE_OP               0 (<)
             92 POP_JUMP_IF_FALSE       66

 18          94 POP_TOP
             96 LOAD_CONST               6 (True)
             98 RETURN_VALUE
            100 JUMP_ABSOLUTE           66

 19     >>  102 LOAD_CONST               7 (False)
            104 RETURN_VALUE

Disassembly of <code object <listcomp> at 0x7f9ca424e0e0, file "groundtruth.py", line 13>:
 13           0 BUILD_LIST               0
              2 LOAD_FAST                0 (.0)
        >>    4 FOR_ITER                18 (to 24)
              6 STORE_FAST               1 (v)
              8 LOAD_GLOBAL              0 (isinstance)
             10 LOAD_FAST                1 (v)
             12 LOAD_GLOBAL              1 (int)
             14 LOAD_GLOBAL              2 (float)
             16 BUILD_TUPLE              2
             18 CALL_FUNCTION            2
             20 LIST_APPEND              2
             22 JUMP_ABSOLUTE            4
        >>   24 RETURN_VALUE
