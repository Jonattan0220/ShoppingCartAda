using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ShoppingCart.Data;
using ShoppingCart.Models;
using ShoppingCart.Models.ViewModels;

namespace ShoppingCart.Controllers
{
    [Authorize(Roles = "Admin")]
    public class OrderItemsController : Controller
    {
        private readonly ShoppingCartContext _context;

        public OrderItemsController(ShoppingCartContext context)
        {
            _context = context;
        }

        // GET: OrderItems
        public async Task<IActionResult> Index()
        {
            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var orderItemsViewModel = await _context.OrderItemsViewModel.FromSqlRaw("EXEC SelectOrderItems").ToListAsync();
                    transaction.Commit();
                    return View(orderItemsViewModel);
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    ViewData["TransactionErrorMessage"] = ex.Message;
                    return View();
                }
            }
        }

        // GET: OrderItems/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            List<OrderItemViewModel> orderItemsViewModel;
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    orderItemsViewModel = await _context.OrderItemsViewModel.FromSqlRaw("EXEC SelectOrderItems").ToListAsync();
                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    ViewData["TransactionErrorMessage"] = ex.Message;
                    return View();
                }
            }

            if (id == null || orderItemsViewModel == null)
            {
                return NotFound();
            }

            var orderItemViewModel = orderItemsViewModel.Where(x => x.OrderItemId == id).FirstOrDefault();

            if (orderItemViewModel == null)
            {
                return NotFound();
            }

            return View(orderItemViewModel);
        }
    }
}
