using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ShoppingCart.Data;
using ShoppingCart.Models;

namespace ShoppingCart.Controllers
{
    public class ProductItemsController : Controller
    {
        private readonly ShoppingCartContext _context;

        public ProductItemsController(ShoppingCartContext context)
        {
            _context = context;
        }

        // GET: ProductItems
        public async Task<IActionResult> Index()
        {
            ViewData["ProductTypes"] = new SelectList(await _context.ProductTypes.ToListAsync(), "ProductTypeId", "Type");
            return View();
        }

        public async Task<IActionResult> OnGetProductsById(int selectedProductTypeId)
        {

            var p = await _context.Products.Where(x => x.ProductTypeId == selectedProductTypeId).ToListAsync();
            var products = new SelectList(p.Select(x => new SelectListItem { Value = x.ProductId.ToString(), Text = x.Name }).ToList(), "Value", "Text");

            return new JsonResult(products);
        }

        //public async Task<IActionResult> OnGetProductItemsById(int selectedProductId)
        //{

        //    var productItems = await _context.ProductItems.Where(x => x.ProductId == selectedProductId).ToListAsync();
        //    return new JsonResult(productItems);
        //}

        public async Task<IActionResult> IndexPartial(int selectedProductId)
        {
            return PartialView(await _context.ProductItems.Where(x => x.ProductId == selectedProductId).ToListAsync());
        }

        // GET: ProductItems/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.ProductItems == null)
            {
                return NotFound();
            }

            var productItem = await _context.ProductItems
                .Include(p => p.Product)
                .Include(p => p.ProductItemBrand)
                .FirstOrDefaultAsync(m => m.ProductItemId == id);
            if (productItem == null)
            {
                return NotFound();
            }

            return View(productItem);
        }

        // GET: ProductItems/Create
        public IActionResult Create()
        {
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "Description");
            ViewData["ProductItemBrandId"] = new SelectList(_context.ProductItemBrands, "ProductItemBrandId", "Brand");
            return View();
        }

        // POST: ProductItems/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProductItemId,Name,Description,Price,Quantity,Sold,Available,ProductId,ProductItemBrandId,CreationDate,ModificationDate")] ProductItem productItem)
        {
            if (ModelState.IsValid)
            {
                _context.Add(productItem);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "Description", productItem.ProductId);
            ViewData["ProductItemBrandId"] = new SelectList(_context.ProductItemBrands, "ProductItemBrandId", "Brand", productItem.ProductItemBrandId);
            return View(productItem);
        }

        // GET: ProductItems/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.ProductItems == null)
            {
                return NotFound();
            }

            var productItem = await _context.ProductItems.FindAsync(id);
            if (productItem == null)
            {
                return NotFound();
            }
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "Description", productItem.ProductId);
            ViewData["ProductItemBrandId"] = new SelectList(_context.ProductItemBrands, "ProductItemBrandId", "Brand", productItem.ProductItemBrandId);
            return View(productItem);
        }

        // POST: ProductItems/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductItemId,Name,Description,Price,Quantity,Sold,Available,ProductId,ProductItemBrandId,CreationDate,ModificationDate")] ProductItem productItem)
        {
            if (id != productItem.ProductItemId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(productItem);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductItemExists(productItem.ProductItemId))
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
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "Description", productItem.ProductId);
            ViewData["ProductItemBrandId"] = new SelectList(_context.ProductItemBrands, "ProductItemBrandId", "Brand", productItem.ProductItemBrandId);
            return View(productItem);
        }

        // GET: ProductItems/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.ProductItems == null)
            {
                return NotFound();
            }

            var productItem = await _context.ProductItems
                .Include(p => p.Product)
                .Include(p => p.ProductItemBrand)
                .FirstOrDefaultAsync(m => m.ProductItemId == id);
            if (productItem == null)
            {
                return NotFound();
            }

            return View(productItem);
        }

        // POST: ProductItems/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.ProductItems == null)
            {
                return Problem("Entity set 'ShoppingCartContext.ProductItems'  is null.");
            }
            var productItem = await _context.ProductItems.FindAsync(id);
            if (productItem != null)
            {
                _context.ProductItems.Remove(productItem);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductItemExists(int id)
        {
          return (_context.ProductItems?.Any(e => e.ProductItemId == id)).GetValueOrDefault();
        }
    }
}
