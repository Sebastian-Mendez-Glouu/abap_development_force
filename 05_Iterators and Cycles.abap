*&-------------------------------------------------------------------------*
*& Author          :  Sebastián Méndez
*& Enterprise      :  Glouu Technologies
*& Project         :  ABAP Learning
*& Development ID  :  DES-001-001
*& Description     :  ABAP Code Snippets
*& Transport Order :  DS4K1001001
*& Creation Date   :  03/07/2024
*&-------------------------------------------------------------------------*
*&-------------------------------------------------------------------------*
*& Modifications Log:
*& 
*& Modification Date     : 
*& Modified by           :     
*& Description of Change :  
*&-------------------------------------------------------------------------*

"|& Example of LOOP at internal table
DATA: lt_data TYPE TABLE OF i,
      lv_value TYPE i.

"|& Populating the internal table
lt_data = VALUE #( ( 10 ) ( 20 ) ( 30 ) ( 40 ) ( 50 ) ).

"|& Iterating over the internal table using LOOP
LOOP AT lt_data INTO lv_value.
  WRITE: / lv_value.
ENDLOOP.



"|& Example of WHILE loop
DATA: lv_counter TYPE i VALUE 1.

"|& Simple WHILE loop
WHILE lv_counter <= 5.
  WRITE: / 'Counter:', lv_counter.
  lv_counter = lv_counter + 1.
ENDWHILE.



"|& Example of DO ... ENDDO loop
DATA: lv_iteration TYPE i VALUE 0.

"|& Iterating 3 times using DO
DO 3 TIMES.
  lv_iteration = lv_iteration + 1.
  WRITE: / 'Iteration number:', lv_iteration.
ENDDO.



"|& Example of FOR loop for table comprehensions
DATA: lt_filtered TYPE TABLE OF i.

"|& Filtering and iterating the internal table using FOR expression
lt_filtered = VALUE #( FOR lv_item IN lt_data
                       WHERE ( lv_item > 20 )   "|& Only values greater than 20
                       ( lv_item ) ).

"|& Output the filtered results
LOOP AT lt_filtered INTO lv_value.
  WRITE: / 'Filtered value:', lv_value.
ENDLOOP.



"|& Example of FOR iteration over a range of numbers
DATA: lt_range TYPE TABLE OF i.

"|& Filling a range of numbers from 1 to 10 using FOR
lt_range = VALUE #( FOR lv_num = 1 THEN lv_num + 1 UNTIL lv_num > 10
                    ( lv_num ) ).

"|& Output the range of numbers
LOOP AT lt_range INTO lv_value.
  WRITE: / 'Range value:', lv_value.
ENDLOOP.


