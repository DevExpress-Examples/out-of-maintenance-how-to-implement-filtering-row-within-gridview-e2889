<%@ Page Language="vb" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<script type="text/javascript">
		var showFilterRow = <%=ViewData("ShowFilterRow").ToString().ToLower()%>
		var showFilterRowMenu = <%=ViewData("ShowFilterRowMenu").ToString().ToLower()%>

		$(document).ready(function() {
			$("#btShowFilterRow").click(
				function() {
					showFilterRow = !showFilterRow;
					dxGridView.PerformCallback();
					$("#btShowFilterRow").val((showFilterRow ? "Hide" : "Show") + " filter row");
				}
			);
			$("#btShowFilterRowMenu").click(
				function() {
					showFilterRowMenu = !showFilterRowMenu;
					dxGridView.PerformCallback();
					$("#btShowFilterRowMenu").val((showFilterRowMenu ? "Hide" : "Show") + " filter RowMenu");
				}
			);
		}); 
		function OnBeginCallBack(s, e){
			e.customArgs["ShowFilterRow"] = showFilterRow;
			e.customArgs["ShowFilterRowMenu"] = showFilterRowMenu;
		}
	</script>
	<%
		Html.RenderPartial("FilteringRowPartial")
	%>
	<div>
		<input id="btShowFilterRow" type="button" value="Hide filter row"/>
		<input id="btShowFilterRowMenu" type="button" value="Hide filter RowMenu"/>
	</div>
</asp:Content>