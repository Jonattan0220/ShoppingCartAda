using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ShoppingCart.Data;
using ShoppingCart.Models;
using ShoppingCart.Models.ViewModels;

namespace ShoppingCart.Controllers
{
    [Authorize(Roles = "Admin, Client")]
    public class ProductItemsController : Controller
    {
        private readonly ShoppingCartContext _context;
        private readonly UserManager<User> _userManager;

        public ProductItemsController(ShoppingCartContext context, UserManager<User> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        //List ProductItems with quantity greater than 0
        // GET: ProductItems
        public async Task<IActionResult> Index()
        {
            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var productTypes = await _context.ProductTypes.FromSqlRaw("EXEC SelectProductTypes").ToListAsync();
                    ViewData["ProductTypes"] = new SelectList(productTypes, "ProductTypeId", "Type");
                    return View();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    TempData["TransactionErrorMessage"] = string.Concat("Error para visualizar los tipos de productos: ", ex.Message, " Intente por favor nuevamente en unos minutos, gracias.");
                    return View();
                }
            }
        }

        public async Task<IActionResult> OnGetProductsById(int selectedProductTypeId)
        {
            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var productsAll = await _context.Products.FromSqlRaw("EXEC SelectProducts").ToListAsync();
                    var p = productsAll.Where(x => x.ProductTypeId == selectedProductTypeId).ToList();
                    var products = new SelectList(p.Select(x => new SelectListItem { Value = x.ProductId.ToString(), Text = x.Name }).ToList(), "Value", "Text");

                    return new JsonResult(products);
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    string transactionErrorMessage = string.Concat("Error para visualizar los productos: ", ex.Message, " Intente por favor nuevamente en unos minutos, gracias.");
                    return new JsonResult(transactionErrorMessage)
                    {
                        StatusCode = (int)HttpStatusCode.InternalServerError
                    };
                }
            }
        }

        public async Task<IActionResult> IndexPartial(int selectedProductId)
        {
            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var productItemsAll = await _context.ProductItemsViewModel.FromSqlRaw("EXEC SelectProductItems").ToListAsync();
                    var productsItems = productItemsAll.Where(x => x.ProductId == selectedProductId && x.Available > 0).ToList();
                    return PartialView(productsItems);
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    TempData["TransactionErrorMessage"] = string.Concat("Error para visualizar los artículos: ", ex.Message, " Intente por favor nuevamente en unos minutos, gracias.");
                    return PartialView(new List<ProductItem>());
                }
            }
        }

        [Authorize(Roles = "Client")]
        public async Task<IActionResult> Buy(int? id)
        {
            var productItems = new List<ProductItemViewModel>();

            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    productItems = await _context.ProductItemsViewModel.FromSqlRaw("EXEC SelectProductItems").ToListAsync();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    TempData["TransactionErrorMessage"] = string.Concat("Ocurrió el siguiente error para comprar:  ", ex.Message);
                    return RedirectToAction(nameof(Index));
                }
            }

            if (id == null || productItems == null)
            {
                return NotFound();
            }

            var productItem = productItems.Where(x => x.ProductItemId == id).First();

            if (productItem == null)
            {
                return NotFound();
            }

            var buyProductItemViewModel = new BuyProductItemViewModel()
            {
                ProductItemId = productItem.ProductItemId,
                Name = productItem.Name,
                Description = productItem.Description,
                Price = productItem.Price,
                Sold = productItem.Sold,
                Available = productItem.Available,
                CreationDate = productItem.CreationDate,
                ModificationDate = productItem.ModificationDate,    
                ProductTypeId = productItem.ProductTypeId,
                Type = productItem.Type,
                ProductId = productItem.ProductId,
                ProductName = productItem.ProductName,
                ProductItemBrandId = productItem.ProductItemBrandId,
                Brand = productItem.Brand,
                TotalQuantity = 0
            };

            return View(buyProductItemViewModel);
        }

        [Authorize(Roles = "Client")]
        [HttpPost, ActionName("Buy")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddOrderItem(BuyProductItemViewModel buyProductItemViewModel)
        {
            if (buyProductItemViewModel.Available < buyProductItemViewModel.TotalQuantity)
            {
                ModelState.AddModelError(string.Empty, "La cantidad de unidades que va a comprar debe ser menor o igual a la cantidad de unidades disponibles");
                return View(buyProductItemViewModel);
            }

            var productItems = new List<ProductItemViewModel>();

            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    productItems = await _context.ProductItemsViewModel.FromSqlRaw("EXEC SelectProductItems").ToListAsync();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    TempData["TransactionErrorMessage"] = string.Concat("Ocurrió el siguiente error para comprar:  ", ex.Message);
                    return RedirectToAction(nameof(Index));
                }
            }

            if (productItems == null)
            {
                return Problem("Entity set 'ShoppingCartContext.ProductItems'  is null.");
            }
            var productItem = productItems.Where(x => x.ProductItemId == buyProductItemViewModel.ProductItemId && x.Available > 0).First();
            if (productItem != null)
            {
                //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
                using (var transaction = _context.Database.BeginTransaction())
                {
                    try
                    {
                        var parameters = new List<SqlParameter>
                        {
                            new SqlParameter("@UserId", SqlDbType.Text) { Direction = ParameterDirection.Input, Value = _userManager.GetUserId(User) },
                            new SqlParameter("@ProductItemId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = buyProductItemViewModel.ProductItemId },
                            new SqlParameter("@TotalQuantity", SqlDbType.BigInt) { Direction = ParameterDirection.Input, Value = buyProductItemViewModel.TotalQuantity },
                            new SqlParameter("@TransactionId", SqlDbType.UniqueIdentifier) { Direction = ParameterDirection.Input, Value = transaction.TransactionId }
                        };
                        await _context.Database.ExecuteSqlRawAsync("EXEC InsertOrderItems @UserId, @ProductItemId, @TotalQuantity, @TransactionId", parameters.ToArray());

                        transaction.Commit();
                        TempData["PurchaseConfirmationMessage"] = "Se efectuó la compra con éxito";
                        return RedirectToAction(nameof(Index));
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        ViewData["TransactionErrorMessage"] = string.Concat("Ocurrió el siguiente problema: ", ex.Message);
                        return View(buyProductItemViewModel);
                    }
                }
            }
            TempData["TransactionErrorMessage"] = "El/los artículo(s) fue/fueron comprado/s hace un instante por otro usuario o ya no se encuentra(n) registrado(s) para la venta";
            return RedirectToAction(nameof(Index));
        }

        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create()
        {
            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var productTypes = await _context.ProductTypes.FromSqlRaw("EXEC SelectProductTypes").ToListAsync();
                    var productItemBrands = await _context.ProductItemBrands.FromSqlRaw("EXEC SelectProductItemBrands").ToListAsync();
                    ViewData["ProductTypes"] = new SelectList(productTypes, "ProductTypeId", "Type");
                    ViewData["ProductItemBrands"] = new SelectList(productItemBrands, "ProductItemBrandId", "Brand");
                    return View();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    TempData["TransactionErrorMessage"] = string.Concat("Error para registrar un nuevo producto: ", ex.Message);
                    return RedirectToAction(nameof(Index));
                }
            }
        }

        // POST: ProductItems1/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create(ProductItemViewModel productItemViewModel)
        {
            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var parameters = new List<SqlParameter>
                        {
                            new SqlParameter("@Name", SqlDbType.Text) { Direction = ParameterDirection.Input, Value = productItemViewModel.Name },
                            new SqlParameter("@Description", SqlDbType.Text) { Direction = ParameterDirection.Input, Value = productItemViewModel.Description },
                            new SqlParameter("@Price", SqlDbType.BigInt) { Direction = ParameterDirection.Input, Value = productItemViewModel.Price },
                            new SqlParameter("@Sold", SqlDbType.BigInt) { Direction = ParameterDirection.Input, Value = 0 },
                            new SqlParameter("@Available", SqlDbType.BigInt) { Direction = ParameterDirection.Input, Value = productItemViewModel.Available },
                            new SqlParameter("@ProductId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = productItemViewModel.ProductId },
                            new SqlParameter("@ProductItemBrandId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = productItemViewModel.ProductItemBrandId },
                        };
                    await _context.Database.ExecuteSqlRawAsync("EXEC InsertProductItems @Name, @Description, @Price, @Sold, @Available, @ProductId, @ProductItemBrandId", parameters.ToArray());

                    transaction.Commit();
                    TempData["PurchaseConfirmationMessage"] = "Se registró el artículo con éxito";
                    return RedirectToAction(nameof(Index));
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    ViewData["TransactionErrorMessage"] = string.Concat("Ocurrió el siguiente problema: ", ex.Message);
                    return View(productItemViewModel);
                }
            }
        }

        // GET: ProductItems/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            List<ProductItemViewModel> productItemsAll;

            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    productItemsAll = await _context.ProductItemsViewModel.FromSqlRaw("EXEC SelectProductItems").ToListAsync();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    TempData["TransactionErrorMessage"] = string.Concat("Error para editar un nuevo producto: ", ex.Message);
                    return RedirectToAction(nameof(Index));
                }
            }

            if (id == null || productItemsAll == null)
            {
                return NotFound();
            }
            
            var productItem = productItemsAll.Where(x => x.ProductItemId == id).First();
            if (productItem == null)
            {
                return NotFound();
            }

            return View(productItem);
        }

        // POST: ProductItems/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int id, ProductItemViewModel productItemViewModel)
        {
            if (id != productItemViewModel.ProductItemId)
            {
                return NotFound();
            }

            var productItems = new List<ProductItemViewModel>();

            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    productItems = await _context.ProductItemsViewModel.FromSqlRaw("EXEC SelectProductItems").ToListAsync();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    TempData["TransactionErrorMessage"] = string.Concat("Ocurrió el siguiente error para comprar:  ", ex.Message);
                    return RedirectToAction(nameof(Index));
                }
            }

            if (productItems == null)
            {
                return Problem("Entity set 'ShoppingCartContext.ProductItems'  is null.");
            }
            var productItem = productItems.Where(x => x.ProductItemId == productItemViewModel.ProductItemId).First();
            if (productItem != null)
            {
                //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
                using (var transaction = _context.Database.BeginTransaction())
                {
                    try
                    {
                        var parameters = new List<SqlParameter>
                        {
                            new SqlParameter("@ProductItemId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = productItem.ProductItemId },
                            new SqlParameter("@Name", SqlDbType.Text) { Direction = ParameterDirection.Input, Value =productItemViewModel.Name },
                            new SqlParameter("@Description", SqlDbType.Text) { Direction = ParameterDirection.Input, Value = productItemViewModel.Description },
                            new SqlParameter("@Price", SqlDbType.BigInt) { Direction = ParameterDirection.Input, Value = productItemViewModel.Price },
                            new SqlParameter("@Sold", SqlDbType.BigInt) { Direction = ParameterDirection.Input, Value = productItem.Sold },
                            new SqlParameter("@Available", SqlDbType.BigInt) { Direction = ParameterDirection.Input, Value = productItemViewModel.Available },
                            new SqlParameter("@ProductId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = productItem.ProductId },
                            new SqlParameter("@ProductItemBrandId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = productItem.ProductItemBrandId },
                            new SqlParameter("@CreationDate", SqlDbType.DateTime2) { Direction = ParameterDirection.Input, Value = productItem.CreationDate }
                        };
                        await _context.Database.ExecuteSqlRawAsync("EXEC UpdateProductItems @ProductItemId, @Name, @Description, @Price, @Sold, @Available, @ProductId, @ProductItemBrandId, @CreationDate", parameters.ToArray());

                        transaction.Commit();
                        TempData["PurchaseConfirmationMessage"] = "Se actualizó el artículo con éxito";
                        return RedirectToAction(nameof(Index));
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        ViewData["TransactionErrorMessage"] = string.Concat("Ocurrió el siguiente problema: ", ex.Message);
                        return View(productItemViewModel);
                    }
                }
            }
            TempData["TransactionErrorMessage"] = "Artículo ya no se encuentra registrado";
            return RedirectToAction(nameof(Index));
        }

        // GET: ProductItems/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            var productItems = new List<ProductItemViewModel>();

            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    productItems = await _context.ProductItemsViewModel.FromSqlRaw("EXEC SelectProductItems").ToListAsync();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    TempData["TransactionErrorMessage"] = string.Concat("Ocurrió el siguiente error para comprar:  ", ex.Message);
                    return RedirectToAction(nameof(Index));
                }
            }

            if (id == null || productItems == null)
            {
                return NotFound();
            }

            var productItem = productItems.Where(x => x.ProductItemId == id).First();
            if (productItem != null)
            {
                return View(productItem);
            }

            TempData["TransactionErrorMessage"] = "Artículo ya no se encuentra registrado";
            return RedirectToAction(nameof(Index));
        }

        // POST: ProductItems/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var productItems = new List<ProductItemViewModel>();

            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    productItems = await _context.ProductItemsViewModel.FromSqlRaw("EXEC SelectProductItems").ToListAsync();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    TempData["TransactionErrorMessage"] = string.Concat("Ocurrió el siguiente error para comprar:  ", ex.Message);
                    return RedirectToAction(nameof(Index));
                }
            }

            if (productItems == null)
            {
                return Problem("Entity set 'ShoppingCartContext.ProductItems'  is null.");
            }

            var productItem = productItems.Where(x => x.ProductItemId == id).First();
            if (productItem != null)
            {
                //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
                using (var transaction = _context.Database.BeginTransaction())
                {
                    try
                    {
                        var parameters = new List<SqlParameter>
                        {
                            new SqlParameter("@ProductItemId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = productItem.ProductItemId }
                        };
                        await _context.Database.ExecuteSqlRawAsync("EXEC DeleteProductItems @ProductItemId", parameters.ToArray());

                        transaction.Commit();
                        TempData["PurchaseConfirmationMessage"] = "Se eliminó el artículo con éxito";
                        return RedirectToAction(nameof(Index));
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        ViewData["TransactionErrorMessage"] = string.Concat("Ocurrió el siguiente problema: ", ex.Message);
                        return View(productItem);
                    }
                }
            }
            TempData["TransactionErrorMessage"] = "Artículo ya no se encuentra registrado";
            return RedirectToAction(nameof(Index));
        }

        private bool ProductItemExists(int id)
        {
            return (_context.ProductItems?.Any(e => e.ProductItemId == id)).GetValueOrDefault();
        }
    }
}
