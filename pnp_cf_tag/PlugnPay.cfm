<cfif #IsDefined("Attributes.XTRAFIELDS")#>
	<cfset #AdditionalParams# = #ListLen(Attributes.XTRAFIELDS)#>
<cfelse>
	<cfset #AdditionalParams# = '0'>
</cfif>

<cfhttp url="https://pay1.plugnpay.com/payment/pnpremote.cgi" method="post">
  <cfhttpparam type="Formfield" value="#Attributes.MERCHANT#" name="MERCHANT">
  <cfhttpparam type="Formfield" value="#Attributes.PUBLISHER_EMAIL#" name="PUBLISHER_EMAIL">
  <cfhttpparam type="Formfield" value="coldfusion" name="CLIENT">
  <cfhttpparam type="Formfield" value="#Attributes.CARD_NUMBER#" name="CARD_NUMBER">
  <cfhttpparam type="Formfield" value="#Attributes.CARD_EXP#" name="CARD_EXP">
  <cfhttpparam type="Formfield" value="#Attributes.CARD_AMOUNT#" name="CARD_AMOUNT">
  <cfhttpparam type="Formfield" value="#Attributes.CARD_NAME#" name="CARD_NAME">
  <cfhttpparam type="Formfield" value="#Attributes.CARD_ADDRESS1#" name="CARD_ADDRESS1">
  <cfhttpparam type="Formfield" value="#Attributes.CARD_ADDRESS2#" name="CARD_ADDRESS2">
  <cfhttpparam type="Formfield" value="#Attributes.CARD_STATE#" name="CARD_STATE">
  <cfhttpparam type="Formfield" value="#Attributes.CARD_ZIP#" name="CARD_ZIP">
  <cfhttpparam type="Formfield" value="#Attributes.CARD_COUNTRY#" name="CARD_COUNTRY">
  <cfhttpparam type="Formfield" value="#Attributes.ORDERID#" name="ORDERID">

  <cfif #AdditionalParams# GTE 1>
    <cfloop index="curField" list=#Attributes.XTRAFIELDS# DELIMITERS=":">
      <cfset #value# = #Evaluate("Attributes.#curField#")#>
      <cfhttpparam type="Formfield" value="#value#" name="#curField#">
    </cfloop>
  </cfif>
</cfhttp>

<!-- Create an empty struct -->
<CFSET Caller.pnpStruct = StructNew()>

<!--- Start the parsing loop to split up the name value pairs. --->
<cfloop list="#URLDecode(CFHTTP.FileContent)#" delimiters="&" index="mainLst">
 	<cfset eqCT = Find("=",mainLst)>
	<cfset fullCT = Len(mainLst)>
	<cfset rtCT = fullCT - eqCT>

        <cfif eqCT gt 0>
		<cfset Column = Left(mainLst,eqCT-1)>
        <cfelse>
		<cfset Column = "=">
	</cfif>

        <cfif rtCT gt 0>
		<cfset Value = Right(mainLst,rtCT)>
	<cfelse>
		<cfset Value = "=">
	</cfif>
		<cfif Value IS "=">
			<cfset Value = "">
		</cfif>
	<CFSET temp=StructInsert(Caller.pnpStruct,"#Column#","#Value#")>
</cfloop>
