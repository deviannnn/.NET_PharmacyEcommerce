using Pharmacy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Pharmacy.Controllers
{
    public class HomeController : Controller
    {
        PharmacyEntities3 _db = new PharmacyEntities3();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult getMenu()
        {
            var v = from t in _db.Menus
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }

        public ActionResult getFooter()
        {
            var v = from t in _db.Footers
                    where t.hide == true
                    orderby t.column ascending, t.order ascending
                    select t;
            return PartialView(v.ToList());
        }

        public ActionResult getPopularProduct()
        {
            var v = (from p in _db.Products
                     where p.hide == true
                     orderby p.purchase descending
                     select p).Take(6);
            return PartialView(v.ToList());
        }

        public ActionResult getNews()
        {
            var v = (from n in _db.News
                     where n.hide == true
                     orderby n.datebegin descending, n.order ascending
                     select n).Take(3);
            return PartialView(v.ToList());
        }
    }
}