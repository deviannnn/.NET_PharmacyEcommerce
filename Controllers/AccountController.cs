using Pharmacy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Pharmacy.Controllers
{
    public class AccountController : Controller
    {
        private PharmacyEntities db = new PharmacyEntities();

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            if (IsValidCustomer(email, password))
            {
                FormsAuthentication.SetAuthCookie(email, false);

                if (!Roles.RoleExists("Customer"))
                {
                    Roles.CreateRole("Customer");
                }
                Roles.AddUserToRole(email, "Customer");

                return RedirectToAction("Index", "Home");
            }
            else if (IsValidAdmin(email, password))
            {
                FormsAuthentication.SetAuthCookie(email, false);

                if (!Roles.RoleExists("Admin"))
                {
                    Roles.CreateRole("Admin");
                }
                Roles.AddUserToRole(email, "Admin");

                return RedirectToAction("Index", "Home", new { area = "Admin" });
            }
            else
            {
                ModelState.AddModelError("", "Thông tin đăng nhập không hợp lệ.");
                return View();
            }
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Login", "Account");
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }

        private bool IsValidCustomer(string email, string password)
        {
            var customer = db.Accounts.FirstOrDefault(a => a.email == email && a.password == password && a.role == 0);

            return (customer != null) ? true : false;
        }

        private bool IsValidAdmin(string email, string password)
        {
            var admin = db.Accounts.FirstOrDefault(a => a.email == email && a.password == password && a.role == 1);

            return (admin != null) ? true : false;
        }
    }
}