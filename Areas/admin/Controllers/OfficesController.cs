﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Pharmacy.Models;

namespace Pharmacy.Areas.admin.Controllers
{
    public class OfficesController : Controller
    {
        private PharmacyEntities db = new PharmacyEntities();

        // GET: admin/Offices
        public ActionResult Index()
        {
            return View(db.Offices.ToList());
        }

        // GET: admin/Offices/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Office office = db.Offices.Find(id);
            if (office == null)
            {
                return HttpNotFound();
            }
            return View(office);
        }

        // GET: admin/Offices/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/Offices/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,location,address,img,link,hide,order,datebegin")] Office office)
        {
            if (ModelState.IsValid)
            {
                db.Offices.Add(office);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(office);
        }

        // GET: admin/Offices/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Office office = db.Offices.Find(id);
            if (office == null)
            {
                return HttpNotFound();
            }
            return View(office);
        }

        // POST: admin/Offices/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,location,address,img,link,hide,order,datebegin")] Office office)
        {
            if (ModelState.IsValid)
            {
                db.Entry(office).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(office);
        }

        // GET: admin/Offices/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Office office = db.Offices.Find(id);
            if (office == null)
            {
                return HttpNotFound();
            }
            return View(office);
        }

        // POST: admin/Offices/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Office office = db.Offices.Find(id);
            db.Offices.Remove(office);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}