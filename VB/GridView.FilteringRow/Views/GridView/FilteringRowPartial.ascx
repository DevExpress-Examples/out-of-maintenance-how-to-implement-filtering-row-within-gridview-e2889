<%@ Control Language="vb" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%
	Html.DevExpress().GridView(Function(settings) AnonymousMethod1(settings)).Bind(Model).Render()
%>



private bool AnonymousMethod1(object settings)
{
	settings.Name = "dxGridView";
	settings.CallbackRouteValues = New { Controller = "GridView", Action = "FilteringRowPartial" };
	settings.Columns.Add("ShipName");
	settings.Columns.Add("Quantity").PropertiesEdit.DisplayFormatString = "c";
	settings.ClientSideEvents.BeginCallback = "OnBeginCallBack";
	settings.Settings.ShowFilterRow = (bool)ViewData["ShowFilterRow"];
	settings.Settings.ShowFilterRowMenu = (bool)ViewData["ShowFilterRowMenu"];
	Return True;
}