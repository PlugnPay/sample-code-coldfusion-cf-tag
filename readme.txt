Updated 04/25/2002

The current cf tag is not compatible with the old tag.
The old tag returned a query this one returns a struct.
DO NOT just drop the custom tag onto your server and expect your old code to work.

First install the PlugnPay.cfm in your custom tags folder.
This should be in your coldfusion installation directory.

Review the usage.cfm for an example of how to use the tag.
The usage.cfm gives an example of how to loop through the returned structure and how to access individual values in the structure.

The XTRAFIELDS parameter is used to include any additional fields that are not supported by default.
The value of this field is a semicolon delimited list eg. NAME:NAME:NAME.


Useful code for generating orderID's to send to us.

<CFSET ORDERID = "#DateFormat(Now(),"YYYYMMDD")##TimeFormat(Now(),"HHMMSS")##RandRange(10000,99999)#">

