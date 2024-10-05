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

"|& Declaration of all common ABAP data types

"|& Character string (fixed length)
DATA: lv_char TYPE c LENGTH 10.  "|& 10-character fixed-length string

"|& Numeric text (character with numbers)
DATA: lv_num_text TYPE n LENGTH 5. "|& 5-character numeric text

"|& Date (YYYYMMDD)
DATA: lv_date TYPE d.

"|& Time (HHMMSS)
DATA: lv_time TYPE t.

"|& Integer
DATA: lv_int TYPE i.

"|& Floating point (real number)
DATA: lv_float TYPE f.

"|& Packed number (decimal), with 10 digits and 2 decimal places
DATA: lv_packed TYPE p LENGTH 10 DECIMALS 2.

"|& Currency amount
DATA: lv_currency TYPE p LENGTH 15 DECIMALS 2.

"|& String (variable-length character data)
DATA: lv_string TYPE string.

"|& Binary string (for storing files, images, etc.)
DATA: lv_xstring TYPE xstring.

"|& Raw byte sequence (fixed length binary data)
DATA: lv_raw TYPE x LENGTH 5.

"|& Hexadecimal value (fixed-length)
DATA: lv_hex TYPE x LENGTH 2.

"|& Floating decimal number (decimal float)
DATA: lv_decfloat TYPE decfloat34.

"|& Time stamp (UTC time and date)
DATA: lv_timestamp TYPE timestampl.

"|& Currency type (ISO code)
DATA: lv_currency_code TYPE waers.

"|& Quantity type
DATA: lv_quantity TYPE qty.

"|& Unit of measure
DATA: lv_unit TYPE unit.

"|& Boolean value
DATA: lv_boolean TYPE abap_bool.

"|& Character for user-defined IDs (usually for GUIDs or other identifiers)
DATA: lv_guid TYPE sysuuid_c.


