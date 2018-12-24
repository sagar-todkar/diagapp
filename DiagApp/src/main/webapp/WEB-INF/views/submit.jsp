<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.text.*,com.cumulus.ReportManagement.*"  %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Submit Diagnostic Data</title>
</head>
<body>
<div id="sessionid" style="display: none;">${sessionid}</div>
<h1 style="text-align: center;">Generating the Diagnostic Analysis Report</h1>
<h2 style="text-align: center;">Your Session ID is ${sessionid}</h2>
<p>&nbsp;</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="http://chimplyimage.appspot.com/images/samples/classic-spinner/animatedCircle.gif" width="110" height="110" /></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>Please wait while your request is being processed.&nbsp;</p>
<p>If you do not wish to wait, note your session Id and view the report later.</p>
</body>


<script type="text/javascript">
	function myFunction(){
		for (var i = 0 ; i < 90 ; i++)
		{
			console.log("Inside myFunction");
			sessionStatus(12345);
			sleep(20000);
			window.location="http://www.google.com";
			break;
		}
	}
	function sleep(milliseconds){
		var start = new Date().getTime();
		for (var i =0;i<1e7;i++){
		if ((new Date().getTime() - start) > milliseconds){
			break;
			}
		}
	}
	function sessionStatus(sessionId){
		console.log("Inside sessionStatus");
		var java
		var Report = java.type("com.cumulus.ReportManagement.Report")
		var status = Report.getStatus(sessionId);
		return status;
		/*
		console.log("Inside sessionStatus");
		var Report = Packages.com.cumulus.ReportManagement.getStatus();
        var objReport = new Packages.com.cumulus.ReportManagement(12345);
        var status = objReport.getStatus();
        return status; */
	}
	myFunction();
</script>
<script type="text/javascript">
      var $body = document.getElementsByTagName('body')[0];
      var $btnCopy = document.getElementById('btnCopy');
      var sessionid = document.getElementById('sessionid').innerHTML;

      var copyToClipboard = function(sessionid) {
        var $tempInput = document.createElement('INPUT');
        $body.appendChild($tempInput);
        $tempInput.setAttribute('value', sessionid)
        $tempInput.select();
        document.execCommand('copy');
        $body.removeChild($tempInput);
      }

      $btnCopy.addEventListener('click', function(ev) {
        copyToClipboard(secretInfo);
      });
    </script>
</html>