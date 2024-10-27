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

"||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"1. Declaración Inline en Consultas (SELECT):

"| Antigua Sintaxis:
DATA ls_mara TYPE mara.

SELECT SINGLE * 
  FROM mara 
 WHERE matnr = '000000000000001234'
 INTO ls_mara.


"| Nueva Sintaxis:
"  Con la declaración inline @DATA(ls_mara), eliminamos la necesidad 
"  de declarar la variable antes del SELECT. Esto hace que el código 
"  sea más conciso y fácil de leer.
SELECT SINGLE * 
  FROM mara    
 WHERE matnr = '000000000000001234'
  INTO @DATA(ls_mara).



"||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"2. Declaración Inline en Bucles (LOOP):

"| Antigua Sintaxis:
DATA: lt_mara TYPE TABLE OF mara,
      ls_mara TYPE mara.

SELECT * 
  FROM mara 
 WHERE matnr LIKE '00000000000000%'
  INTO TABLE lt_mara .

LOOP AT lt_mara INTO ls_mara.
  " Procesar ls_mara
ENDLOOP.


"| Nueva Sintaxis:
SELECT * 
  FROM mara 
 WHERE matnr LIKE '00000000000000%'
  INTO TABLE @DATA(lt_mara). 

LOOP AT lt_mara ASSIGNING FIELD-SYMBOL(<ls_mara>).
  " Procesar <ls_mara>-
ENDLOOP.


"||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"3. Uso de LET en Table Comprehensions:

"| Sin LET:
DATA lt_matnr TYPE TABLE OF matnr.

lt_matnr = VALUE #( FOR ls_mara IN lt_mara ( ls_mara-matnr ) ).


"| Con LET:
" El uso de LET dentro de las table comprehensions permite definir variables 
" temporales para cálculos intermedios, haciendo el código más legible cuando 
" hay operaciones complejas.
DATA lt_matnr TYPE TABLE OF matnr.

lt_matnr = VALUE #(
  FOR ls_mara IN lt_mara
  LET lv_matnr = ls_mara-matnr IN
  ( lv_matnr )
).



