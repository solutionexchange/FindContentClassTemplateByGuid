<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="expires" content="-1"/>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<meta name="copyright" content="2016, Web Site Management" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<title>Find Content Class Template By Guid</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<style type="text/css">
		body
		{
			padding: 10px;
		}
	</style>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="rqlconnector/Rqlconnector.js"></script>
	<script type="text/javascript">
		var LoginGuid = '<%= session("loginguid") %>';
		var SessionKey = '<%= session("sessionkey") %>';
		var RqlConnectorObj = new RqlConnector(LoginGuid, SessionKey);
	
		$( document ).ready(function() {
			$('#find-tpl').on('click', function(){
				var TemplateGuid = $('#tpl-guid').val();
				GotoTreeSegment(TemplateGuid.replace(/-/g,'').toUpperCase(), "project.4045", "3AC0671EC0EB4A408CA9CD85166927DA");
			});
		});
	
		function GotoTreeSegment(sGuid, sType, sParentGuid)
		{
			if(top.opener.parent.frames.ioTreeData){
				// MS 10 or less
				top.opener.parent.frames.ioTreeData.document.location = '../../ioRDLevel1.asp?Action=GotoTreeSegment&Guid=' + sGuid + '&Type=' + sType + "&ParentGuid=" + sParentGuid + '&CalledFromRedDot=0';
			} else {
				// MS 11
				top.opener.parent.parent.parent.ioTreeIFrame.frames.ioTreeFrames.frames.ioTree.GotoTreeSegment(sGuid, sType, sParentGuid);
			}
		}
	</script>
</head>
<body>
	<div id="processing" class="modal hide fade" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<h3 id="myModalLabel">Processing</h3>
		</div>
		<div class="modal-body">
			<p>Please wait...</p>
		</div>
	</div>
	<div class="container">
		<div class="navbar navbar-inverse">
			<div class="navbar-inner">
				<span class="brand">Find Content Class Template By Guid</span>
			</div>
		</div>
		<div class="well">
			<div class="form-horizontal">
				<div class="control-group">
					<label class="control-label" for="inputEmail">Content Class Template Guid</label>
					<div class="controls">
						<input class="input-block-level" id="tpl-guid" type="text" placeholder="Content Class Template Guid" autofocus>
					</div>
				</div>
				<div class="controls">
					<button class="btn btn-success" id="find-tpl" type="button">Goto</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>