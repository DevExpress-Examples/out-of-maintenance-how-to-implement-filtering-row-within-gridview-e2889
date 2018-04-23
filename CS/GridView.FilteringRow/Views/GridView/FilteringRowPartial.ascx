<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%
    Html.DevExpress().GridView(settings => {
        settings.Name = "dxGridView";
        settings.CallbackRouteValues = new { Controller = "GridView", Action = "FilteringRowPartial" };

        settings.Columns.Add("ShipName");
        settings.Columns.Add("Quantity").PropertiesEdit.DisplayFormatString = "c";

        settings.ClientSideEvents.BeginCallback = "OnBeginCallBack";
        settings.Settings.ShowFilterRow = (bool)ViewData["ShowFilterRow"];
        settings.Settings.ShowFilterRowMenu = (bool)ViewData["ShowFilterRowMenu"];
    })
    .Bind(Model)
    .Render();
%>

