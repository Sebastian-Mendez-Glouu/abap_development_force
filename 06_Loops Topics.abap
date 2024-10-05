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

"|& Define the structure for BSEG data (simplified version)
TYPES: BEGIN OF ty_bseg,
         bukrs TYPE bukrs,    "|& Company code
         belnr TYPE belnr_d,  "|& Document number
         gjahr TYPE gjahr,    "|& Fiscal year
         buzei TYPE buzei,    "|& Line item
         hkont TYPE hkont,    "|& General ledger account
         dmbtr TYPE dmbtr,    "|& Amount in local currency
       END OF ty_bseg.

DATA: lt_bseg    TYPE TABLE OF ty_bseg,    "|& Internal table for BSEG
      lt_bseg_fs TYPE TABLE OF ty_bseg,    "|& Another table for field-symbol usage
      lt_target  TYPE TABLE OF ty_bseg,    "|& Target table for loop examples
      wa_bseg    TYPE ty_bseg.             "|& Work area for traditional loops

FIELD-SYMBOLS: <fs_bseg> TYPE ty_bseg.     "|& Field symbol for dynamic assignment

"|& Fetch BSEG data using ABAP SQL with inline declaration
SELECT bukrs, 
       belnr, 
       gjahr, 
       buzei, 
       hkont, 
       dmbtr
  FROM bseg
 WHERE bukrs = '1000'
   AND gjahr = '2024'
  INTO TABLE @DATA(lt_fetched_bseg)




"|& Example of filling a table using traditional LOOP with a work area
LOOP AT lt_fetched_bseg INTO wa_bseg.
  "|& Fill the target table with the same data
  APPEND wa_bseg TO lt_target.
ENDLOOP.




"|& Example of filling another internal table using a LOOP with field-symbols
LOOP AT lt_fetched_bseg ASSIGNING <fs_bseg>.
  "|& Append the field symbol to the target table
  APPEND INITIAL LINE TO lt_target ASSIGNING <fs_bseg>.
  <fs_bseg>-dmbtr = <fs_bseg>-dmbtr * 1.05. "|& Example of adjusting amount by 5%
ENDLOOP.




"|& Display content of the target table
LOOP AT lt_target ASSIGNING <fs_bseg>.
  WRITE: / 'Company:', <fs_bseg>-bukrs, 'Doc:', <fs_bseg>-belnr, 'Amount:', <fs_bseg>-dmbtr.
ENDLOOP.




"|& Example of LOOP with EXISTS and CONTINUE using field-symbols
LOOP AT lt_fetched_bseg ASSIGNING <fs_bseg>.
  "|& Skip the iteration if the amount is less than 1000
  IF <fs_bseg>-dmbtr < 1000.
    CONTINUE.
  ENDIF.
  
  "|& Display the current row
  WRITE: / 'Processing item:', <fs_bseg>-belnr, <fs_bseg>-dmbtr.

  "|& Exit the loop if the amount is greater than 5000
  IF <fs_bseg>-dmbtr > 5000.
    EXIT.
  ENDIF.
ENDLOOP.




"|& Example of LOOP with AT FIRST, AT NEW, AT END, and AT LAST using field-symbols
LOOP AT lt_fetched_bseg ASSIGNING <fs_bseg>.
  "|& At the first iteration
  AT FIRST.
    WRITE: / 'Processing first item in the set'.
  ENDAT.

  "|& At the start of a new company code
  AT NEW bukrs.
    WRITE: / 'New company code:', <fs_bseg>-bukrs.
  ENDAT.

  "|& At the last item for a company code
  AT END OF bukrs.
    WRITE: / 'End of company code:', <fs_bseg>-bukrs.
  ENDAT.

  "|& At the last iteration of the loop
  AT LAST.
    WRITE: / 'Processing last item in the set'.
  ENDAT.

  "|& Process and display each row
  WRITE: / 'Company:', <fs_bseg>-bukrs, 'Doc:', <fs_bseg>-belnr, 'Amount:', <fs_bseg>-dmbtr.
ENDLOOP.




"|& Example of using FOR loop and table comprehension to filter and modify data
DATA(lt_filtered_bseg) = VALUE #( FOR <fs_bseg> IN lt_fetched_bseg
                                  WHERE ( dmbtr > 1000 )   "|& Only items with amount > 1000
                                  ( bukrs = <fs_bseg>-bukrs
                                    belnr = <fs_bseg>-belnr
                                    gjahr = <fs_bseg>-gjahr
                                    buzei = <fs_bseg>-buzei
                                    hkont = <fs_bseg>-hkont
                                    dmbtr = <fs_bseg>-dmbtr * 1.1 ) ). "|& Increase amount by 10%

"|& Display the filtered and modified data
LOOP AT lt_filtered_bseg ASSIGNING <fs_bseg>.
  WRITE: / 'Company:', <fs_bseg>-bukrs, 'Doc:', <fs_bseg>-belnr, 'Amount (adjusted):', <fs_bseg>-dmbtr.
ENDLOOP.



