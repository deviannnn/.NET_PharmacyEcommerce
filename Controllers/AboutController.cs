using Pharmacy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Pharmacy.Controllers
{
    public class AboutController : Controller
    {
        PharmacyEntities _db = new PharmacyEntities();
        // GET: About
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult getAboutBanner()
        {
            var v = from b in _db.Banners
                    where b.page == "ABOUT" && b.hide == true && b.order == 1
                    select b;
            return PartialView(v.FirstOrDefault());
        }

        public ActionResult getCompanyInfo()
        {
            var v = from ci in _db.CompanyInfoes
                    where ci.hide == true && ci.order > 0
                    orderby ci.order ascending
                    select ci;
            return PartialView(v.ToList());
        }

        public ActionResult getTeamInfo()
        {
            var v = from ti in _db.TeamInfoes
                    where ti.hide == true
                    orderby ti.order ascending
                    select ti;
            return PartialView(v.ToList());
        }
    }
}