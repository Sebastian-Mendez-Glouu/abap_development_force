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

"|& Declaration of types for structure related to financial documents
TYPES: BEGIN OF ty_fin_document,
         bukrs TYPE bukrs,      "|& Company Code
         belnr TYPE belnr_d,    "|& Document Number
         gjahr TYPE gjahr,      "|& Fiscal Year
         buzei TYPE buzei,      "|& Line Item
         hkont TYPE hkont,      "|& General Ledger Account
         dmbtr TYPE dmbtr,      "|& Amount in Local Currency
       END OF ty_fin_document.

"|& Declaration of an internal table for financial documents
DATA: it_fin_documents          TYPE TABLE OF ty_fin_document WITH EMPTY KEY,
      it_fin_documents_standard TYPE STANDARD TABLE OF ty_fin_document.

"|& Declaration of a sorted internal table for financial documents, sorted by company code and document number
DATA: it_fin_documents_sorted TYPE SORTED TABLE OF ty_fin_document
                              WITH UNIQUE KEY bukrs belnr.

"|& Declaration of a hashed internal table for financial documents, hashed by company code and fiscal year
DATA: it_fin_documents_hashed TYPE HASHED TABLE OF ty_fin_document
                              WITH UNIQUE KEY bukrs gjahr.

"|& Declaration of a work area to handle individual financial document records
DATA: wa_fin_document TYPE ty_fin_document.

"|& Declaration of a variable for handling amounts
DATA: lv_amount TYPE dmbtr,   "|& Amount in local currency
      lv_tax    TYPE dmbtr.   "|& Tax amount

"|& Declaration of an object for a financial document handler class using NEW
DATA: o_fin_doc_handler TYPE REF TO zcl_financial_doc_handler.
      
o_fin_doc_handler = NEW zcl_financial_doc_handler( ).

"|& Declaration of a constant for maximum allowed amount
CONSTANTS: c_max_amount TYPE dmbtr VALUE '10000'. "|& Maximum allowable amount



