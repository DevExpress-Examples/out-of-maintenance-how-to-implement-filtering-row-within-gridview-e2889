using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GridView.FilteringRow.Models;

namespace GridView.FilteringRow.Controllers {
    [HandleError]
    public class GridViewController : Controller {
        public ActionResult Index() {
            return FilteringRow();
        }
        public ActionResult FilteringRow() {
            ViewData["ShowFilterRow"] = true;
            ViewData["ShowFilterRowMenu"] = true;
            return View("FilteringRow", NorthwindDataProvider.GetInvoices());
        }
        public ActionResult FilteringRowPartial() {
            GetRequestParemetrs();
            return PartialView("FilteringRowPartial", NorthwindDataProvider.GetInvoices());
        }

        void GetRequestParemetrs() {
            ViewData["ShowFilterRow"] = string.IsNullOrEmpty(Request.Params["ShowFilterRow"]) ? true : bool.Parse(Request.Params["ShowFilterRow"]);
            ViewData["ShowFilterRowMenu"] = string.IsNullOrEmpty(Request.Params["ShowFilterRowMenu"]) ? true : bool.Parse(Request.Params["ShowFilterRowMenu"]);
        }
    }
}

