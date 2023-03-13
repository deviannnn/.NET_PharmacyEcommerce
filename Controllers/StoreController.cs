using Pharmacy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Pharmacy.Controllers
{
    public class StoreController : Controller
    {
        // GET: Store
        PharmacyEntities _db = new PharmacyEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult getProduct()
        {
            var v = (from p in _db.Products
                     where p.hide == true
                     orderby p.purchase descending
                     select p).Take(6);
            return PartialView(v.ToList());
        }
        public ActionResult Detail(long id)
        {
            var v = from t in _db.Products
                    where t.id == id
                    select t;
            return View(v.FirstOrDefault());
        }

    }
}