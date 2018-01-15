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
    public class HKTreatmentyController : Controller
    {
        private readonly OECContext _context;

        public HKTreatmentyController(OECContext context)
        {
            _context = context;
        }

        // GET: HKTreatmenty
        public async Task<IActionResult> Index(string plotid,string farmName, string criteria)
        {
            ViewData["Title"] = "Treatements for plot at " + farmName;
            var oECContext = _context.Treatment.Include(t => t.Plot).Include(t => t.TreatmentFertilizer).Where(t => t.PlotId.ToString() == plotid).OrderBy(t => t.Name);

            if (!String.IsNullOrEmpty(plotid))
            {
                HttpContext.Session.SetString("plotidSession",plotid);
                HttpContext.Session.SetString("farmNameSession", farmName);
               
            }
            else if (String.IsNullOrEmpty(plotid))
            {
                if (!String.IsNullOrEmpty(HttpContext.Session.GetString("plotidSession")))
                {
                    plotid = HttpContext.Session.GetString("plotidSession");
                    farmName = HttpContext.Session.GetString("farmNameSession");
                    
                    foreach (var item in oECContext)
                    {
                        string treatementName = "";
                        int i = 0;
                        int count = item.TreatmentFertilizer.Count();
                        foreach (var tfitem in item.TreatmentFertilizer)
                        {
                            treatementName += tfitem.FertilizerName;
                            if(i != count - 1)
                            {
                                treatementName += "+";
                            }
                            i++;
                        }
                        if (i == 0)
                        {
                            item.Name = "no fertilizer";
                        }
                        else
                        {
                        item.Name = treatementName;
                        }
                    }
                }
                else
                {
                    if (criteria == "treatment")
                    {
                        oECContext = _context.Treatment.OrderBy(t => t.Name);
                    }
                    else
                    {
                        TempData["messageFromTreatmenty"] = "Please select plot to see its treatments.";
                        return RedirectToAction("Index", "HKPlot");
                    }
                }
            }
         
            return View(await oECContext.ToListAsync());
        }

        // GET: HKTreatmenty/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var treatment = await _context.Treatment
                .Include(t => t.Plot)
                .SingleOrDefaultAsync(m => m.TreatmentId == id);
            if (treatment == null)
            {
                return NotFound();
            }
            ViewData["Title"] = "Details : Treatements for plot at " + HttpContext.Session.GetString("farmNameSession");
            return View(treatment);
        }

        // GET: HKTreatmenty/Create
        public IActionResult Create()
        {
            ViewData["PlotId"] = HttpContext.Session.GetString("plotidSession");
            ViewData["Title"] = "Create : Treatements for plot at " + HttpContext.Session.GetString("farmNameSession");
            return View();
        }

        // POST: HKTreatmenty/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("TreatmentId,Name,PlotId,Moisture,Yield,Weight")] Treatment treatment)
        {
            if (ModelState.IsValid)
            {
                _context.Add(treatment);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["PlotId"] = HttpContext.Session.GetString("plotidSession");
            return View(treatment);
        }

        // GET: HKTreatmenty/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var treatment = await _context.Treatment.SingleOrDefaultAsync(m => m.TreatmentId == id);
            if (treatment == null)
            {
                return NotFound();
            }
            ViewData["Title"] = "Edit : Treatements for plot at " + HttpContext.Session.GetString("farmNameSession");
            ViewData["PlotId"] = HttpContext.Session.GetString("plotidSession");
            return View(treatment);
        }

        // POST: HKTreatmenty/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("TreatmentId,Name,PlotId,Moisture,Yield,Weight")] Treatment treatment)
        {
            if (id != treatment.TreatmentId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(treatment);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TreatmentExists(treatment.TreatmentId))
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
            ViewData["PlotId"] = HttpContext.Session.GetString("plotidSession");
            return View(treatment);
        }

        // GET: HKTreatmenty/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var treatment = await _context.Treatment
                .Include(t => t.Plot)
                .SingleOrDefaultAsync(m => m.TreatmentId == id);
            if (treatment == null)
            {
                return NotFound();
            }
            ViewData["PlotId"] = HttpContext.Session.GetString("plotidSession");
            ViewData["Title"] = "Delete : Treatements for plot at " + HttpContext.Session.GetString("farmNameSession");
            return View(treatment);
        }

        // POST: HKTreatmenty/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var treatment = await _context.Treatment.SingleOrDefaultAsync(m => m.TreatmentId == id);
            _context.Treatment.Remove(treatment);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TreatmentExists(int id)
        {
            return _context.Treatment.Any(e => e.TreatmentId == id);
        }
    }
}
