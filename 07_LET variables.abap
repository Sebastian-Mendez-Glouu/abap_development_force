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


"|& Using LET within a COND expression to calculate discount
DATA(lv_value) = 50.

DATA(lv_discount) = COND #( LET lv_threshold = 100
                            IN
                            WHEN lv_value > lv_threshold THEN lv_value * 0.1
                            ELSE 0 ).

WRITE: / 'Discount:', lv_discount.




"|& Using LET in SWITCH to simplify conditions
DATA(lv_value) = 3.

DATA(lv_result) = SWITCH #( lv_value
                            LET lv_factor = 2
                            IN
                            WHEN 1 THEN lv_value * lv_factor
                            WHEN 2 THEN lv_value + lv_factor
                            ELSE 0 ).

WRITE: / 'Result:', lv_result.





"|& Using LET in table comprehension to define intermediate variables
DATA(lt_source) = VALUE #( ( 10 ) ( 20 ) ( 30 ) ( 40 ) ( 50 ) ).

DATA(lt_target) = VALUE #( FOR lv_value IN lt_source
                           LET lv_multiplier = 1.1
                           IN
                           ( lv_value * lv_multiplier ) ).

LOOP AT lt_target INTO DATA(lv_result).
  WRITE: / 'New Value:', lv_result.
ENDLOOP.




"|& Using LET in REDUCE to define local variables for sum calculation
DATA(lt_values) = VALUE #( ( 5 ) ( 10 ) ( 15 ) ( 20 ) ( 25 ) ).

DATA(lv_sum) = REDUCE i( INIT lv_total = 0
                          FOR lv_value IN lt_values
                          LET lv_increment = 2
                          IN
                          NEXT lv_total = lv_total + lv_value + lv_increment ).

WRITE: / 'Sum with increments:', lv_sum.




