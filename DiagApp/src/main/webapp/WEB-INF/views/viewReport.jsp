<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html><html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
  $("#myInput2").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable2 tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<style>
table {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}
table, th, td,tr {
    border: 1px solid black;
}
td{
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #d3efff;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
tr:hover {background-color: #ddd;}
</style>
</head>
<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
			<h1>Diagnostic Analysis</h1>
		</div>
		<div data-role="main" class="ui-content">
			<div data-role="collapsible">
				<h1>HDCA Configuration</h1>
				<div data-role="main" class="ui-content">
				<div data-role="collapsible">
					<h3>Basic Information</h3>
					<table style="width:100%">
						<colgroup>
							<col style="width: 20%" />
							<col style="width: 40%" />
							<col style="width: 40%" />
						</colgroup>
						<tr>
							<td></td>
							<td><b>HDCA Probe</b></td> 
							<td><b>HDCA Server</b></td>
						</tr>
						<tr>
							<td>Version</td>
							<td>8.3.0-01_18013010
</td> 
							<td>9.0.0-01_18041109
</td>
						</tr>
						<tr>
							<td>Deployment Type</td>
							<td>RPM</td> 
							<td>RPM</td>
						</tr>
						<tr>
							<td>Megha Jetty Status</td>
							<td>Running</td> 
							<td>Running</td>
						</tr>
						<tr>
							<td>Customer Name</td>
							<td>NA</td>
							<td>HV_UnixEducationCenter
</td>
						</tr>
						<tr>
							<td>Upgrade History</td>
							<td>NA</td>
							<td>9.0.0-00_18033011
</td>
						</tr>
					</table>
				</div>	
				<div data-role="collapsible">
					<h3>Detailed Information</h3>
					 <table style="width:100%">
				 	<colgroup>
				 		<col style="width: 20%" />
				 		<col style="width: 40%" />
				 		<col style="width: 40%" />
					</colgroup>
				  	<tr>
						<td></td>
						<td><b>HDCA Probe</b></td> 
						<td><b>HDCA Server</b></td>
				  	</tr>
				  	<tr>
						<td>Memory</td>
						<td>Swap:  4128764k total,        0k used,  4128764k free,  3616268k cached
</td> 
						<td>NA</td>
				 	 </tr>
					<tr>
						<td>Swap Memory</td>
						<td>Mem:  16169208k total,  7941392k used,  8227816k free,   298856k buffers
</td>
						<td>NA</td>
					</tr>
					<tr>
						<td>CPU</td>
						<td>Cpu(s):  8.9%us,  0.9%sy,  0.0%ni, 88.6%id,  1.7%wa,  0.0%hi,  0.0%si,  0.0%st
</td>
						<td>NA</td>
					</tr>
					<tr>
						<td>megha Disk Usage</td>
						<td>2.1G	/usr/local/megha/
</td>
						<td>2.8G	/usr/local/megha/
</td>
					</tr>
					<tr>
						<td>megha/db Disk Usage</td>
						<td>1.5G	total
</td>
						<td>1.6G	total
</td>
					</tr>
					<tr>
						<td> db/conf Disk Usage </td>
						<td>NA</td>
						<td>120M	/usr/local/megha/db/conf
</td>
					</tr>
					<tr>
						<td>db/perf Disk Usage</td>
						<td>NA</td>
						<td>366M	/usr/local/megha/db/perf
</td>
					</tr>
					<tr>
						<td>/data/meghadata Disk Usage</td>
						<td>NA</td>
						<td>1.2G	/home/meghadata/
</td>
					</tr>
				</table>
				<h3>Server Download Status</h3>
				<table>
                        	        <thead>
                                	<tr>
                                        	<th>Appliance ID</th>
	                                        <th>Probe IP Address</th>
        	                                <th>Last File Downloaded</th>
						<th>Data Available Timestamp</th>
                        	        </tr>
                                </thead>
                                <tbody id="myTable">
                                <tr><td>40e709e3-4aad-4813-958f-79cb79120d08</td><td>192.168.1.62</td><td>20180806_104553</td><td>20180806_104553</td></tr><tr><td>b899649-0cf3-4410-9e35-a2080d155027</td><td>192.168.1.229</td><td>20180806_084920</td><td>20180806_084920</td></tr>
                                </tbody>
	                        </table>
				<br/>
				<h3>Server Import Status</h3>
			<!--	<p>Type something in the input field to search the table for Case Study and result:</p>
                        <input id="myInput" type="text" placeholder="Search.."/>
                        <br><br>
                        <table>
                                <thead>
                                <tr>
                                        <th>Probe Name</th>
                                        <th>Type</th>
                                        <th>Configuration Start Time</th>
										<th>Configuration End Time</th>
										<th>Performance Start Time</th>
										<th>Performance End Time</th>
                                </tr>
                                </thead>
                                <tbody id="myTable">
                                <tr><td>HVUnixEducationCenter_192.168.0.170</td><td>VMWare</td><td>20180625_095242</td><td>20180806_083600</td><td>20180625_104220</td><td>20180806_090320</td></tr><tr><td>HVUnixEducationCenter_53530_VSP_53530</td><td>HitachiEnterpriseStorage</td><td>20180625_130019</td><td>20180806_090000</td><td>20180625_130700</td><td>20180806_104200</td></tr><tr><td>Windows_192.168.1.62</td><td>Windows</td><td>20180710_063044</td><td>20180806_103901</td><td>20180710_064931</td><td>20180806_104125</td></tr>

                                </tbody>
                        </table>
			-->
			<button type="button" onclick="showimport()" target="_blank">Server Import Status</button>
                    	<script>
                        function showimport()
                        {
                            window.open('ImportStatus.html');
                        }
                    </script>
			</div>	
		</div>
	  </div>
	<div data-role="collapsible">
		<h1>System Configuration</h1>
		<div data-role="main" class="ui-content">
			<div data-role="collapsible">
				<h3>Basic Information</h3>
				<table style="width:100%">
				<colgroup>
					<col style="width: 20%" />
					<col style="width: 40%" />
					<col style="width: 40%" />
				</colgroup>
				<tr>
					<td></td>
					<td><b>HDCA Probe</b></td> 
					<td><b>HDCA Server</b></td>
				</tr>
				<tr>
					<td>Last Rebooted On </td>
					<td>   system boot  4.1.12-37.4.1.el Fri Apr 13 18:02 - 22:24 (6+04:21)   
</td> 
					<td>   system boot  4.1.12-94.3.9.el Mon Jun 25 15:31 - 13:47 (41+22:16)  
</td>
				</tr>
				<tr>
					<td>OS</td>
					<td>Oracle Linux Server release 6.8
</td> 
					<td>Oracle Linux Server release 7.4
</td>
				</tr>
				<tr>
					<td>Firewall</td>
					<td>Running</td> 
					<td>Running</td>
				</tr>
				<tr>
					<td>SELINUX</td>
					<td>Disabled</td> 
					<td>Disabled</td>
				</tr>
				<tr>
					<td>Kernel Version</td>
					<td>7.4.1.el6uek.x86_64 #2 SMP</td> 
					<td>9.el7uek.x86_64 #2 SMP Fri</td>
				</tr>
				<tr>
					<td>Disk Usage</td>
					<td>                     ext4   124G   27G   92G  23% /home
</td> 
					<td>/dev/mapper/DCAvg-DCAlv00 xfs       600G  4.1G  596G   1% /data
</td>
				</tr>
				<tr>
					<td>Java Version</td>
					<td>openjdk version "1.8.0_111"
</td> 
					<td>openjdk version "1.8.0_161"
</td>
				</tr>
				<tr>
					<td>Crond status</td>
					<td>Inactive</td> 
					<td>Active</td>
				</tr>
				<tr>
					<td>Console Timezone</td>
					<td>#Fri Apr 13 18:03:08 SGT 2018
</td>
					<td>#Thu Aug 02 11:12:36 UTC 2018
</td>
				</tr>
			</table>
		</div>	
		<div data-role="collapsible">
			<h3>Detail Information</h3>
		</div>	
	</div>
</div>
<div data-role="collapsible">
	<h1>Log Analysis</h1>
	<div data-role="main" class="ui-content">
		<div data-role="collapsible">
			<h3>Probe Case Studies</h3>
			<p>Type something in the input field to search the table for Case Study and result:</p>  
			<input id="myInput" type="text" placeholder="Search.."/>
			<br><br>
			<table>
  				<thead>
   	 			<tr>
      					<th>Sr. No.</th>
      					<th>Case Study</th>
      					<th>Result</th>
   		 		</tr>
				</thead>
  				<tbody id="myTable">
    				<tr>
      					<td>1</td>
  	    				<td>Daylight Saving Time Issue</td>
      					<td>
<br/> Currently Set timezone does not support DST 
<br/></td>
    				</tr>
   	 			<tr>
      					<td>2</td>
      					<td>Gaps in Performance Data for BNA Issue</td>
      					<td>
<br/>/data/diaganalysis/temp/probe_diag/application/data/usr/local/megha/logs/probe.log.2018-04-19-21.1.bak
<br/>--- Data Gap might be visible in some report of BNA because data is not present in REST Output. Found "timeSeriesDatas":[]},{"targetKey" 
<br/></td>
    				</tr>
				 <tr>
                                                <td>3</td>
                                                <td>Downloader Configuration Issue</td>
                                                <td>
<br/>No Issue is observed. Uploader is configured using meghadata user. 
<br/></td>
                                 </tr>

	  			</tbody>
			</table>
		</div>
		<div data-role="collapsible">
			<h3>Server Case Studies</h3>
			<p>Type something in the input field to search the table for Case Study and result:</p>  
			<input id="myInput2" type="text" placeholder="Search.." />
			<br><br>
			<table>
				<thead>
				<tr>
					<th>Sr. No.</th>
					<th>Case Study</th>
					<th>Result</th>
				</tr>
				</thead>
				<tbody id="myTable2">
					<tr>
						<td>1</td>
						<td>Upgrade Issue</td>
						<td>
<br/> No Exception/Error found in downloader logs.
<br/></td>
					</tr>
					<tr>
						<td>2</td>
						<td>Active Directory User Issue</td>
						<td>
<br/> No Exception/Error found in downloader logs. Please see detailed logs for further troubleshoting.  
<br/></td>
					</tr>
					<tr>
						<td>3</td>
						<td>Real Time Data Processing Issue</td>
						<td>
<br/> Found Errors in kafka_start logs : 
<br/>21-05-2018 09:22:56,070 [bash -c /usr/local/megha/bin/manage-kafka.sh status >> /usr/local/megha/logs/startUp.log 2>&1] [/bin/sh /usr/local/megha/bin/manage-kafka.sh status] [INFO] [21870] [21871] Kafka server is not running
<br/> 
<br/>No Errors found in realtime logs<br/></td>
					</tr>
					<tr>
						<td>4</td>
						<td>Daylight Saving Time Issue</td>
						<td>
<br/> Currently Set timezone does not support DST 
<br/></td>
					</tr>
					<tr>
						<td>5</td>
						<td>DB Purging Issue</td>
						<td>
<br/> Purging is not enabled<br/></td>
					</tr>
 					<tr>
                                                <td>6</td>
                                                <td>Downloader Configuration Issue</td>
                                                <td>
<br/>No Issue is observed. Uploader is configured using meghadata user. 
<br/></td>
                                        </tr>

				</tbody>
			</table>
		</div>	
		<div data-role="collapsible">
		<h3>Generic Exceptions</h3>
			<a href="generic_errors_probe.txt" target="_blank">Errors in Probe logs</a><br/>
			<br/>
			<a href="generic_errors_server.txt" target="_blank">Errors in Server logs</a>
			</div>		
		  </div>
	  </div>
	  </div>
	  <div data-role="footer">
		<h1></h1>
	  </div>
	</div> 

	</body>
	</html>