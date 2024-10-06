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

*&-------------------------------------------------------------------------*
"|& Begin of traditional ABAP 'Hello World' program
REPORT z_hello_world.

START-OF-SELECTION.

"|& Initialization of the string variable for the greeting message
DATA: lv_message TYPE string.

"|& Assignment of the 'Hello World' message to the variable
lv_message = 'Hello World!'.

"|& Display the greeting message on the screen
WRITE: / lv_message.

"|& End of traditional ABAP 'Hello World' program
*&-------------------------------------------------------------------------*




*&-------------------------------------------------------------------------*
CLASS zcl_hello_world DEFINITION.

  PUBLIC SECTION.
    "|& Interface necessary for executable class in Eclipse ADT
    INTERFACES: if_oo_adt_classrun. 

  PROTECTED SECTION.

  PRIVATE SECTION.
    "|& Declaration of a string-type variable for message storage
    DATA: lv_message TYPE string.

ENDCLASS.

CLASS zcl_hello_world IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "|& Assignment of the 'Hello World' message to the variable
    lv_message = 'Hello World!'.

    "|& Use of out->write to display the message in Eclipse ADT
    out->write( lv_message ). 
  ENDMETHOD.

ENDCLASS.



