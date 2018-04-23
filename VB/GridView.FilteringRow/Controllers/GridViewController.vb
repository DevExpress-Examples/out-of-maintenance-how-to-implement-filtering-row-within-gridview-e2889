Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.Mvc
Imports GridView.FilteringRow.Models

Namespace GridView.FilteringRow.Controllers
	<HandleError> _
	Public Class GridViewController
		Inherits Controller
		Public Function Index() As ActionResult
			Return FilteringRow()
		End Function
		Public Function FilteringRow() As ActionResult
			ViewData("ShowFilterRow") = True
			ViewData("ShowFilterRowMenu") = True
			Return View("FilteringRow", NorthwindDataProvider.GetInvoices())
		End Function
		Public Function FilteringRowPartial() As ActionResult
			GetRequestParemetrs()
			Return PartialView("FilteringRowPartial", NorthwindDataProvider.GetInvoices())
		End Function

		Private Sub GetRequestParemetrs()
			ViewData("ShowFilterRow") = If(String.IsNullOrEmpty(Request.Params("ShowFilterRow")), True, Boolean.Parse(Request.Params("ShowFilterRow")))
			ViewData("ShowFilterRowMenu") = If(String.IsNullOrEmpty(Request.Params("ShowFilterRowMenu")), True, Boolean.Parse(Request.Params("ShowFilterRowMenu")))
		End Sub
	End Class
End Namespace

