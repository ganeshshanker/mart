<html>
<head>
<title>BILL PAYMENT</title>
</head>
<body>
<form name="req_frm" action="getcheck.php" method="post">
<input type="hidden" name="action" value="process">
<p>&nbsp;</p>
<br>
<table align="center" border="0">
	<tr>
		<td>Transaction ID</td>
		<td><input type="text" name="txtTranID" value="" /></td>
	</tr>
	<tr>
		<td>Market Code</td>
		<td><input type="text" name="txtMarketCode" value="" /></td>
	</tr>
	<tr>
		<td>Account Number</td>
		<td><input type="text" name="txtAcctNo" value="" /></td>
	</tr>
	<tr>
		<td>Txn Amount</td>
		<td><input type="text" name="txtTxnAmount" value="" /></td>
	</tr>
	<tr>
		<td>Bank</td>
		<td><input type="text" name="txtBankCode" value="" /></td>
	</tr>
	
</table>
<table align="center">
	<tr>
		<td><input type="submit" name="proceed" value="Proceed"/></td>
	</tr>
</table>
</form>

</body>
</html>
