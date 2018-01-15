using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using a1OEC.Models;
using Microsoft.AspNetCore.Http;

namespace a1OEC.Controllers
{
    public class HKTreatmentFertilizerController : Controller
    {
        private readonly OECContext _context;

        public HKTreatmentFertilizerController(OECContext context)
        {
            _context = context;
        }

        // GET: HKTreatmentFertilizer
        public async Task<IActionResult> Index(string treatementId)
        {
            if (!String.IsNullOrEmpty(treatementId))
            {
                HttpContext.Session.SetString("treatementIdSession", treatementId);
            }
            else
            {
                if (!String.IsNullOrEmpty(HttpContext.Session.GetString("treatementIdSession")))
                {
                    treatementId = HttpContext.Session.GetString("treatementIdSession");
                }
                else
                {
                    TempData["messageFromTreatementFertilizer"] = "Please select a treatement to see its fertilizer composition.";

                    return RedirectToAction("Index","HKTreatmenty", new {@criteria = "treatment" });
                }
            }
            var oECContext = _context.TreatmentFertilizer
                .Include(t => t.FertilizerNameNavigation)
                .Include(t => t.Treatment)
                .Where(t=>t.TreatmentId.ToString() == treatementId)
                .OrderBy(t=>t.FertilizerName);
            return View(await oECContext.ToListAsync());
        }

        // GET: HKTreatmentFertilizer/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var treatmentFertilizer = await _context.TreatmentFertilizer
                .Include(t => t.FertilizerNameNavigation)
                .Include(t => t.Treatment)
                .SingleOrDefaultAsync(m => m.TreatmentFertilizerId == id);
            if (treatmentFertilizer == null)
            {
                return NotFound();
            }

            return View(treatmentFertilizer);
        }

        // GET: HKTreatmentFertilizer/Create
        public IActionResult Create()
        {
            ViewData["FertilizerName"] = new SelectList(_context.Fertilizer.OrderBy(f=>f.FertilizerName), "FertilizerName", "FertilizerName");
            ViewData["TreatmentId"] = HttpContext.Session.GetString("treatementIdSession");
            return View();
        }

        // POST: HKTreatmentFertilizer/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("TreatmentFertilizerId,TreatmentId,FertilizerName,RatePerAcre,RateMetric")] TreatmentFertilizer treatmentFertilizer)
        {
            if (ModelState.IsValid)
            {

                bool liquid = _context.Fertilizer.SingleOrDefault(f => f.FertilizerName.ToString() == treatmentFertilizer.FertilizerName).Liquid;

                if(liquid == true)
                {
                    treatmentFertilizer.RateMetric = "Gal";
                }
                else
                {
                    treatmentFertilizer.RateMetric = "LB";
                }
         
                _context.Add(treatmentFertilizer);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["FertilizerName"] = new SelectList(_context.Fertilizer.OrderBy(f => f.FertilizerName), "FertilizerName", "FertilizerName", treatmentFertilizer.FertilizerName);
            ViewData["TreatmentId"] = HttpContext.Session.GetString("treatementIdSession");
            return View(treatmentFertilizer);
        }

        // GET: HKTreatmentFertilizer/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var treatmentFertilizer = await _context.TreatmentFertilizer.SingleOrDefaultAsync(m => m.TreatmentFertilizerId == id);
            if (treatmentFertilizer == null)
            {
                return NotFound();
            }
            ViewData["FertilizerName"] = new SelectList(_context.Fertilizer.OrderBy(f => f.FertilizerName), "FertilizerName", "FertilizerName", treatmentFertilizer.FertilizerName);
            ViewData["TreatmentId"] = HttpContext.Session.GetString("treatementIdSession");
            return View(treatmentFertilizer);
        }

        // POST: HKTreatmentFertilizer/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("TreatmentFertilizerId,TreatmentId,FertilizerName,RatePerAcre,RateMetric")] TreatmentFertilizer treatmentFertilizer)
        {
            if (id != treatmentFertilizer.TreatmentFertilizerId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    bool liquid = _context.Fertilizer.SingleOrDefault(f => f.FertilizerName.ToString() == treatmentFertilizer.FertilizerName).Liquid;

                    if (liquid == true)
                    {
                        treatmentFertilizer.RateMetric = "Gal";
                    }
                    else
                    {
                        treatmentFertilizer.RateMetric = "LB";
                    }

                    _context.Update(treatmentFertilizer);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TreatmentFertilizerExists(treatmentFertilizer.TreatmentFertilizerId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["FertilizerName"] = new SelectList(_context.Fertilizer.OrderBy(f => f.FertilizerName), "FertilizerName", "FertilizerName", treatmentFertilizer.FertilizerName);
            ViewData["TreatmentId"] = HttpContext.Session.GetString("treatementIdSession");
            return View(treatmentFertilizer);
        }

        // GET: HKTreatmentFertilizer/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var treatmentFertilizer = await _context.TreatmentFertilizer
                .Include(t => t.FertilizerNameNavigation)
                .Include(t => t.Treatment)
                .SingleOrDefaultAsync(m => m.TreatmentFertilizerId == id);
            if (treatmentFertilizer == null)
            {
                return NotFound();
            }

            return View(treatmentFertilizer);
        }

        // POST: HKTreatmentFertilizer/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var treatmentFertilizer = await _context.TreatmentFertilizer.SingleOrDefaultAsync(m => m.TreatmentFertilizerId == id);
            _context.TreatmentFertilizer.Remove(treatmentFertilizer);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TreatmentFertilizerExists(int id)
        {
            return _context.TreatmentFertilizer.Any(e => e.TreatmentFertilizerId == id);
        }
    }
}
