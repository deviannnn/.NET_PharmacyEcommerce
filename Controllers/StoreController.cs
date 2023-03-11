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
        PharmacyEntities3 _db = new PharmacyEntities3();
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
    }
}