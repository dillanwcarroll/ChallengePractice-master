using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication.Models;
using NLog;

namespace WebApplication.Controllers
{
    public class TourEventsController : Controller
    {
        private challengedatabaseEntities db = new challengedatabaseEntities();
        private static NLog.Logger nlogger = NLog.LogManager.GetCurrentClassLogger();
        // GET: TourEvents
        public ActionResult Index()
        {
            try
            {
                var tourEvents = db.TourEvents.Include(t => t.Tour);
                return View(tourEvents.ToList());
            }
            catch(Exception ex)
            {
                nlogger.Trace("Index view found");
                throw ex;
            }
        }

        // GET: TourEvents/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TourEvent tourEvent = db.TourEvents.Find(id);
            if (tourEvent == null)
            {
                return HttpNotFound();
            }
            return View(tourEvent);
        }

        // GET: TourEvents/Create
        public ActionResult Create()
        {
            ViewBag.tourID = new SelectList(db.Tours, "tourID", "name");
            return View();
        }

        // POST: TourEvents/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "eventID,eventDay,eventMonth,eventYear,fee,tourID")] TourEvent tourEvent)
        {
            if (ModelState.IsValid)
            {
                db.TourEvents.Add(tourEvent);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.tourID = new SelectList(db.Tours, "tourID", "name", tourEvent.tourID);
            return View(tourEvent);
        }

        // GET: TourEvents/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TourEvent tourEvent = db.TourEvents.Find(id);
            if (tourEvent == null)
            {
                return HttpNotFound();
            }
            ViewBag.tourID = new SelectList(db.Tours, "tourID", "name", tourEvent.tourID);
            return View(tourEvent);
        }

        // POST: TourEvents/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "eventID,eventDay,eventMonth,eventYear,fee,tourID")] TourEvent tourEvent)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tourEvent).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.tourID = new SelectList(db.Tours, "tourID", "name", tourEvent.tourID);
            return View(tourEvent);
        }

        // GET: TourEvents/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TourEvent tourEvent = db.TourEvents.Find(id);
            if (tourEvent == null)
            {
                return HttpNotFound();
            }
            return View(tourEvent);
        }

        // POST: TourEvents/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TourEvent tourEvent = db.TourEvents.Find(id);
            db.TourEvents.Remove(tourEvent);
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
