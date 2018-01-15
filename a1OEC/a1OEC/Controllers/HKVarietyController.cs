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
    public class HKVarietyController : Controller
    {
        private readonly OECContext _context;

        public HKVarietyController(OECContext context)
        {
            _context = context;
        }

        // GET: HKVariety
        public async Task<IActionResult> Index(string cropid)
        {
            string cropnName;
            if (!string.IsNullOrEmpty(cropid))
            {
                HttpContext.Session.SetString("cropidSession",cropid);
            }
            else
            {
                if (String.IsNullOrEmpty(HttpContext.Session.GetString("cropidSession")))
                {
                    TempData["errorMessageFromVariety"] = "Please select a crop to see its varieties.";
                    return RedirectToAction("Index","a1Crop");
                }
                else
                {
                    cropid = HttpContext.Session.GetString("cropidSession");
                }
            }
            cropnName = _context.Crop.SingleOrDefault(v => v.CropId.ToString() == cropid).Name;
            var oECContext = _context.Variety.Include(v => v.Crop).Where(v=>v.CropId.ToString() == cropid).OrderBy(v=>v.Name);
            ViewData["Title"] = "Varieties of " + cropnName;
            return View(await oECContext.ToListAsync());
        }

        // GET: HKVariety/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var variety = await _context.Variety
                .Include(v => v.Crop)
                .SingleOrDefaultAsync(m => m.VarietyId == id);
            if (variety == null)
            {
                return NotFound();
            }
            string cropid = HttpContext.Session.GetString("cropidSession");
            string cropnName = _context.Crop.SingleOrDefault(v => v.CropId.ToString() == cropid).Name;
            ViewData["Title"] = "Detail : Varieties of " + cropnName;
            return View(variety);
        }

        // GET: HKVariety/Create
        public IActionResult Create()
        {
            ViewData["CropId"] = HttpContext.Session.GetString("cropidSession");
            string cropid = HttpContext.Session.GetString("cropidSession");
            string cropnName = _context.Crop.SingleOrDefault(v => v.CropId.ToString() == cropid).Name;
            ViewData["Title"] = "Add " + cropnName +" Variety";
            return View();
        }

        // POST: HKVariety/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("VarietyId,CropId,Name")] Variety variety)
        {
            if (ModelState.IsValid)
            {
                _context.Add(variety);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CropId"] = HttpContext.Session.GetString("cropidSession");
            return View(variety);
        }

        // GET: HKVariety/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var variety = await _context.Variety.SingleOrDefaultAsync(m => m.VarietyId == id);
            if (variety == null)
            {
                return NotFound();
            }
            ViewData["CropId"] = HttpContext.Session.GetString("cropidSession");
            string cropid = HttpContext.Session.GetString("cropidSession");
            string cropnName = _context.Crop.SingleOrDefault(v => v.CropId.ToString() == cropid).Name;
            ViewData["Title"] = "Edit : Varieties of " + cropnName;
            return View(variety);
        }

        // POST: HKVariety/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("VarietyId,CropId,Name")] Variety variety)
        {
            if (id != variety.VarietyId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(variety);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!VarietyExists(variety.VarietyId))
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
            ViewData["CropId"] = HttpContext.Session.GetString("cropidSession");
            return View(variety);
        }

        // GET: HKVariety/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var variety = await _context.Variety
                .Include(v => v.Crop)
                .SingleOrDefaultAsync(m => m.VarietyId == id);
            if (variety == null)
            {
                return NotFound();
            }
            string cropid = HttpContext.Session.GetString("cropidSession");
            string cropnName = _context.Crop.SingleOrDefault(v => v.CropId.ToString() == cropid).Name;
            ViewData["Title"] = "Delete : Varieties of " + cropnName;
            return View(variety);
        }

        // POST: HKVariety/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var variety = await _context.Variety.SingleOrDefaultAsync(m => m.VarietyId == id);
            _context.Variety.Remove(variety);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool VarietyExists(int id)
        {
            return _context.Variety.Any(e => e.VarietyId == id);
        }
    }
}
