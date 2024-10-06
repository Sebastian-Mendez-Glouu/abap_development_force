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

"|& Example of IF, ELSEIF, and ENDIF
DATA: lv_value TYPE i VALUE 50.

"|& Simple conditional check using IF, ELSEIF, and ENDIF
IF lv_value = 100.
  "|& Value equals 100
  WRITE: / 'Value is 100'.
ELSEIF lv_value > 50.
  "|& Value is greater than 50
  WRITE: / 'Value is greater than 50'.
ELSE.
  "|& Value is 50 or less
  WRITE: / 'Value is 50 or less'.
ENDIF.




"|& Example of CASE ... ENDCASE
DATA: lv_case_value TYPE i VALUE 2.

"|& Conditional check using CASE
CASE lv_case_value.
  WHEN 1.
    "|& Case when the value is 1
    WRITE: / 'Value is 1'.
  WHEN 2.
    "|& Case when the value is 2
    WRITE: / 'Value is 2'.
  WHEN 3.
    "|& Case when the value is 3
    WRITE: / 'Value is 3'.
  WHEN OTHERS.
    "|& Default case
    WRITE: / 'Value is something else'.
ENDCASE.




"|& Example of SWITCH expression
DATA: lv_switch_result TYPE string.

"|& Use of SWITCH to assign a string based on an integer value
lv_switch_result = SWITCH #( lv_value
                              WHEN 100 THEN 'Hundred'
                              WHEN 50 THEN 'Fifty'
                              ELSE 'Unknown' ).
WRITE: / lv_switch_result.




"|& Example of COND expression
DATA: lv_cond_result TYPE string.

"|& Conditional assignment using COND
lv_cond_result = COND #( WHEN lv_value = 100 THEN 'Perfect'
                         WHEN lv_value > 50 THEN 'Good'
                         ELSE 'Average' ).
WRITE: / lv_cond_result.




"|& Example of Table Comprehension with COND, ELSE, THEN
DATA: lt_values TYPE TABLE OF i,
      lt_filtered TYPE TABLE OF i.

lt_values = VALUE #( ( 100 ) ( 55 ) ( 75 ) ( 120 ) ( 30 ) ).

"|& Filtering values using table comprehension with COND
lt_filtered = VALUE #( FOR lv_item IN lt_values
                       WHERE ( lv_item > 50 )
                       ( COND i( WHEN lv_item = 100 THEN 100
                                 WHEN lv_item > 75 THEN lv_item
                                 ELSE 0 ) ) ).

"|& Output the filtered table results
LOOP AT lt_filtered INTO DATA(lv_filtered_value).
  WRITE: / lv_filtered_value.
ENDLOOP.




