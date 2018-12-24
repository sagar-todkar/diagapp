<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DiagApp|Submit New Request</title>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<style>
body {
  background-image: url("src/main/resources/images/wallpaper.jpg");
  background-repeat: no-repeat;
  background-position: right top;
  margin-right: 200px;
}
</style>
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="https://colorlib.com/etc/cf/ContactFrom_v3/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="https://colorlib.com/etc/cf/ContactFrom_v3/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="https://colorlib.com/etc/cf/ContactFrom_v3/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="https://colorlib.com/etc/cf/ContactFrom_v3/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="https://colorlib.com/etc/cf/ContactFrom_v3/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="https://colorlib.com/etc/cf/ContactFrom_v3/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="https://colorlib.com/etc/cf/ContactFrom_v3/css/util.css">
	<link rel="stylesheet" type="text/css" href="https://colorlib.com/etc/cf/ContactFrom_v3/css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://unpkg.com/filepond@1.8.8/dist/filepond.min.css"/>
</head>
<body>
      <div class="bg-contact3">
		<div class="container-contact3">
			<div class="wrap-contact3">
				<form class="contact3-form validate-form" action = "/DiagApp/submit/index" method = "POST" id='submitRequest' enctype="multipart/form-data">
					<span class="contact3-form-title">
						DiagAnalysis
					</span>

					<div class="wrap-contact3-form-radio">
						<div class="contact3-form-radio m-r-42">
							<input class="input-radio3" id="radio1" type="radio" name="choice" value="new-report" checked="checked" onclick=hideSession()>
							<label class="label-radio3" for="radio1">
								New Request
							</label>
						</div>

						<div class="contact3-form-radio">
							<input class="input-radio3" id="radio2" type="radio" name="choice" value="report-status" onclick=hideelement()>
							<label class="label-radio3" for="radio2">
								Report Status
							</label>
						</div>
					</div>
					
					<div class="wrap-input3 validate-input" data-validate="Customer Name is required" id="customername">
						<input class="input3" type="text" name="customerName" placeholder="Customer Name">
						<span class="focus-input3"></span>
					</div>


					<div class="wrap-input3 validate-input" data-validate = "Valid diagnostic file is required" id="diagnostic">
						<input class="input3" type="file" name="diagnostic" placeholder="Dignostic File">
						<span class="focus-input3"></span>
					</div>

					<div class="wrap-input3 input3-select" data-validate="Session ID is required" id="sessionid">
						<input class="input3" type="text" name="sessionid" placeholder="Session ID">
						<span class="focus-input3"></span>
					</div>
					<div class="container-contact3-form-btn">
						<center><button class="contact3-form-btn" style="align-center">
							Submit
						</button></center>
						<a href="uploadform">Upload Image</a>
					</div>
				</form>
			</div>
		</div>
	</div>
      
<!--===============================================================================================-->
	<script src="https://colorlib.com/etc/cf/ContactFrom_v3/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="https://colorlib.com/etc/cf/ContactFrom_v3/vendor/bootstrap/js/popper.js"></script>
	<script src="https://colorlib.com/etc/cf/ContactFrom_v3/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="https://colorlib.com/etc/cf/ContactFrom_v3/vendor/select2/select2.min.js"></script>
	<script src="https://colorlib.com/etc/cf/ContactFrom_v3/js/main.js"></script>
	
      <script type="text/javascript">
      function hideelement() 
      {
  	    document.getElementById('customername').style.display = "none";
  	    document.getElementById('diagnostic').style.display = "none";
  	  document.getElementById('sessionid').style.display = "block";
  	    document.getElementById('submitRequest').action='/DiagApp/report/status';
  		}
  	function hideSession() 
  	{
  		document.getElementById('customername').style.display = "block";
  	    document.getElementById('diagnostic').style.display = "block";
  	    document.getElementById('sessionid').style.display = "none";
  	    document.getElementById('submitRequest').action='/DiagApp/submit/index';
  	}
  	</script>
	<script type="text/javascript">
	$("form").submit(function(){
	  	   $(this).children('#diagnostic').remove();
	  	 	$(this).children('#customername').remove();
	  	});})
	</script>
</body>
</html>