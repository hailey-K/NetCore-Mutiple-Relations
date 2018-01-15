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
    public class HKPlotController : Controller
    {
        private readonly OECContext _context;

        public HKPlotController(OECContext context)
        {
            _context = context;
        }

        // GET: HKPlot
        public async Task<IActionResult> Index(string plotid, string varietyId, string varietyName, string sort, string cropid, string cropname, string idenfitierS)
        {
            var oECContext = from p in _context.Plot.Include(p => p.Farm)
                            .Include(p => p.Variety)
                            .Include(p => p.Treatment)
                            .Include(p => p.Variety.Crop)
                            select p;


            if (!String.IsNullOrEmpty(plotid))
            {
                HttpContext.Session.SetString("plotidSession", plotid);
            }
            else
            {
                if (!String.IsNullOrEmpty(HttpContext.Session.GetString("plotidSession")))
                {
                    plotid = HttpContext.Session.GetString("plotidSession");
                    oECContext = oECContext.Where(p=>p.PlotId.ToString()==plotid);
                }
            }

            string identifier;

            //when user clicks sort function on the heading
            if (idenfitierS != null)
            {
                if (idenfitierS.Contains("Crops"))
                {
                    cropid = HttpContext.Session.GetString("idSession");
                    cropname = _context.Crop.SingleOrDefault(c=>c.CropId.ToString() == cropid).Name;
                }
                else if (idenfitierS.Contains("Varieties"))
                {
                    varietyId = HttpContext.Session.GetString("idSession");
                    varietyName = _context.Variety.SingleOrDefault(v => v.VarietyId.ToString() == varietyId).Name;
                }
            }

            //Page coming from Crop
            if (!String.IsNullOrEmpty(cropid) || !String.IsNullOrEmpty(cropname))
            {
                oECContext = from p in _context.Plot.Include(p => p.Farm)
              .Include(p => p.Variety)
              .Include(p => p.Treatment)
              .Include(p => p.Variety.Crop)
                             select p;

                ViewData["Title"] = "Coming from " + cropname + " Of " + "Crops";
                identifier = cropid;
                oECContext = oECContext.Where(p=>p.Variety.CropId.ToString() == identifier);
                HttpContext.Session.SetString("identifierSession",ViewData["Title"].ToString());
                HttpContext.Session.SetString("idSession", cropid);
            }
            //Page coming from Variety
            else if (!String.IsNullOrEmpty(varietyId) || !String.IsNullOrEmpty(varietyName))
            {
                oECContext = from p in _context.Plot.Include(p => p.Farm)
              .Include(p => p.Variety)
              .Include(p => p.Treatment)
              .Include(p => p.Variety.Crop)
                             select p;

                ViewData["Title"] = "Coming from " + varietyName + " Of " + "Varieties";
                identifier = varietyId;
                oECContext = oECContext.Where(p => p.VarietyId.ToString() == identifier);
                HttpContext.Session.SetString("identifierSession", ViewData["Title"].ToString());
                HttpContext.Session.SetString("idSession", varietyId);
            }
            switch (sort)
            {
                case "Farm":
                    oECContext = oECContext.OrderBy(p => p.Farm.Name);
                    break;
                case "Variety":
                    oECContext = oECContext.OrderBy(p => p.Variety.Name);
                    break;
                case "CEC":
                    oECContext = oECContext.OrderBy(p => p.Cec);
                    break;
                default:
                    oECContext = oECContext.OrderByDescending(p => p.DatePlanted);
                    break;

            }
            return View(await oECContext.ToListAsync());
        }

        // GET: HKPlot/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var plot = await _context.Plot
                .Include(p => p.Farm)
                .Include(p => p.Variety)
                .Include(p=>p.Treatment)
                .Include(p=>p.Variety.Crop)
                .SingleOrDefaultAsync(m => m.PlotId == id);
            ViewData["Title"] = HttpContext.Session.GetString("identifierSession");
            if (plot == null)
            {
                return NotFound();
            }

            return View(plot);
        }

        // GET: HKPlot/Create
        public IActionResult Create()
        {
            ViewData["Title"] = HttpContext.Session.GetString("identifierSession");
            ViewData["FarmId"] = new SelectList(_context.Farm.OrderBy(f=>f.Name), "Name", "Name");
            if (ViewData["Title"].ToString().Contains("Crops"))
            {
                string cropid = HttpContext.Session.GetString("idSession");
                ViewData["VarietyId"] = new SelectList(_context.Variety.Where(v=>v.CropId.ToString() == cropid).OrderBy(v=>v.Name), "Name", "Name");
            }
            else if (ViewData["Title"].ToString().Contains("Varieties"))
            {
                string varietyid = HttpContext.Session.GetString("idSession");
                string varietyName = _context.Variety.SingleOrDefault(v => v.VarietyId.ToString() == varietyid).Name;
                ViewData["VarietyId"] = new SelectList(_context.Variety.OrderBy(v => v.Name), "Name", "Name" , varietyName);
            }
            return View();
        }

        // POST: HKPlot/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PlotId,FarmId,VarietyId,DatePlanted,DateHarvested,PlantingRate,PlantingRateByPounds,RowWidth,PatternRepeats,OrganicMatter,BicarbP,Potassium,Magnesium,Calcium,PHsoil,PHbuffer,Cec,PercentBaseSaturationK,PercentBaseSaturationMg,PercentBaseSaturationCa,PercentBaseSaturationH,Comments")] Plot plot)
        {
             if (ModelState.IsValid)
            {
                _context.Add(plot);
                await _context.SaveChangesAsync();

                return RedirectToAction(nameof(Index));
            }
            ViewData["FarmId"] = new SelectList(_context.Farm, "FarmId", "ProvinceCode", plot.FarmId);
            ViewData["VarietyId"] = new SelectList(_context.Variety, "VarietyId", "VarietyId", plot.VarietyId);
       
            return View(plot);
        }

        // GET: HKPlot/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var plot = await _context.Plot.SingleOrDefaultAsync(m => m.PlotId == id);
            if (plot == null)
            {
                return NotFound();
            }
            ViewData["FarmId"] = new SelectList(_context.Farm, "FarmId", "ProvinceCode", plot.FarmId);
            ViewData["VarietyId"] = new SelectList(_context.Variety, "VarietyId", "VarietyId", plot.VarietyId);
            ViewData["Title"] = HttpContext.Session.GetString("identifierSession");
            return View(plot);
        }

        // POST: HKPlot/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PlotId,FarmId,VarietyId,DatePlanted,DateHarvested,PlantingRate,PlantingRateByPounds,RowWidth,PatternRepeats,OrganicMatter,BicarbP,Potassium,Magnesium,Calcium,PHsoil,PHbuffer,Cec,PercentBaseSaturationK,PercentBaseSaturationMg,PercentBaseSaturationCa,PercentBaseSaturationH,Comments")] Plot plot)
        {
            if (id != plot.PlotId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(plot);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PlotExists(plot.PlotId))
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
            ViewData["FarmId"] = new SelectList(_context.Farm, "FarmId", "ProvinceCode", plot.FarmId);
            ViewData["VarietyId"] = new SelectList(_context.Variety, "VarietyId", "VarietyId", plot.VarietyId);
            ViewData["Title"] = HttpContext.Session.GetString("identifierSession");
            return View(plot);
        }

        // GET: HKPlot/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var plot = await _context.Plot
                .Include(p => p.Farm)
                .Include(p => p.Variety)
                .Include(p=> p.Treatment)
                .Include(p=>p.Variety.Crop)
                .SingleOrDefaultAsync(m => m.PlotId == id);


            if (plot == null)
            {
                return NotFound();
            }
            ViewData["Title"] = HttpContext.Session.GetString("identifierSession");
            return View(plot);
        }

        // POST: HKPlot/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            ViewData["Title"] = HttpContext.Session.GetString("identifierSession");
            var plot = await _context.Plot.SingleOrDefaultAsync(m => m.PlotId == id);
            _context.Plot.Remove(plot);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PlotExists(int id)
        {
            return _context.Plot.Any(e => e.PlotId == id);
        }
    }
}
