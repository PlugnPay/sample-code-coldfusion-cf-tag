<!-- Call PlugnPay custom tag with these values -->
<CF_PlugnPay
MERCHANT="pnptest"
PUBLISHER_EMAIL="trash@plugnpay.com"
CARD_NUMBER="4111111111111111"
CARD_EXP="05/05"
CARD_AMOUNT="1.00"
CARD_NAME="pnptest"
CARD_ADDRESS1="Line 1 of Billing Address"
CARD_ADDRESS2="Line 2 of Billing Address"
CARD_CITY="Billing Address City"
CARD_STATE="NY"
CARD_ZIP="11788"
CARD_COUNTRY="US"
ORDERID="123456"
XTRAFIELDS="CARD_CVV:ADDRESS1:ADDRESS2"
CARD_CVV="1111"
ADDRESS1="Line 1 of shipping address"
ADDRESS2="Line 2 of shipping address"
>

<!-- Simple loop to output data.-->
<CFLOOP collection="#pnpStruct#" item="structIndex">
  <cfoutput> #structIndex# = #StructFind(pnpStruct, structIndex)# <br> </cfoutput>
</CFLOOP>

<!-- Simple test to check FinalStatus -->
<CFIF #StructFind(pnpStruct, "FINALSTATUS")# is "success">
  <!--   Enter Code Here For Success  -->
  <cfoutput>#StructFind(pnpStruct, "FINALSTATUS")#<br></cfoutput>
<CFELSE>
  <!--   Enter Code Here For Failure -->
  <cfoutput>#StructFind(pnpStruct, "FINALSTATUS")#<br></cfoutput>
</CFIF>
