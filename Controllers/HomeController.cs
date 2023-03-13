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
        PharmacyEntities _db = new PharmacyEntities();
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

        public ActionResult getHomeBanner()
        {
            var v = from b in _db.Banners
                    where b.page == "HOME" && b.hide == true && b.order == 1
                    select b;
            return PartialView(v.FirstOrDefault());
        }

        public ActionResult getFooterAboutUs()
        {
            var v = from ci in _db.CompanyInfoes
                    where ci.tittle == "About Us" && ci.hide == true
                    select ci;
            return PartialView(v.FirstOrDefault());
        }

        public ActionResult getFooterQuickLink()
        {
            var v = from ql in _db.QuickLinks
                    where ql.hide == true
                    orderby ql.order ascending
                    select ql;
            return PartialView(v.ToList());
        }

        public ActionResult getFooterContactInfo()
        {
            var v = from ci in _db.ContactInfoes
                    where ci.hide == true
                    orderby ci.order ascending
                    select ci;
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

        public ActionResult getPopularProduct()
        {
            var v = (from p in _db.Products
                     where p.hide == true
                     orderby p.purchase descending
                     select p).Take(6);
            return PartialView(v.ToList());
        }

        public ActionResult getNewProduct()
        {
            var v = (from p in _db.Products
                     where p.hide == true
                     orderby p.datebegin ascending
                     select p).Take(4);
            return PartialView(v.ToList());
        }

    }
}