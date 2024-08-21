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
             26 LOAD_CONST               3 (<code object has_close_elements at 0x7f6146c09ea0, file "chat.py", line 4>)
             28 LOAD_CONST               4 ('has_close_elements')
             30 MAKE_FUNCTION            4 (annotations)
             32 STORE_NAME               4 (has_close_elements)
             34 LOAD_CONST               5 (None)
             36 RETURN_VALUE

Disassembly of <code object has_close_elements at 0x7f6146c09ea0, file "chat.py", line 4>:
 12           0 LOAD_GLOBAL              0 (range)
              2 LOAD_GLOBAL              1 (len)
              4 LOAD_FAST                0 (numbers)
              6 CALL_FUNCTION            1
              8 CALL_FUNCTION            1
             10 GET_ITER
        >>   12 FOR_ITER                60 (to 74)
             14 STORE_FAST               2 (i)

 13          16 LOAD_GLOBAL              0 (range)
             18 LOAD_FAST                2 (i)
             20 LOAD_CONST               1 (1)
             22 BINARY_ADD
             24 LOAD_GLOBAL              1 (len)
             26 LOAD_FAST                0 (numbers)
             28 CALL_FUNCTION            1
             30 CALL_FUNCTION            2
             32 GET_ITER
        >>   34 FOR_ITER                36 (to 72)
             36 STORE_FAST               3 (j)

 14          38 LOAD_GLOBAL              2 (abs)
             40 LOAD_FAST                0 (numbers)
             42 LOAD_FAST                2 (i)
             44 BINARY_SUBSCR
             46 LOAD_FAST                0 (numbers)
             48 LOAD_FAST                3 (j)
             50 BINARY_SUBSCR
             52 BINARY_SUBTRACT
             54 CALL_FUNCTION            1
             56 LOAD_FAST                1 (threshold)
             58 COMPARE_OP               0 (<)
             60 POP_JUMP_IF_FALSE       34

 15          62 POP_TOP
             64 POP_TOP
             66 LOAD_CONST               2 (True)
             68 RETURN_VALUE
             70 JUMP_ABSOLUTE           34
        >>   72 JUMP_ABSOLUTE           12

 16     >>   74 LOAD_CONST               3 (False)
             76 RETURN_VALUE
