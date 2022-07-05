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
    public class UsersController : Controller
    {
        private readonly ShoppingCartContext _context;

        public UsersController(ShoppingCartContext context)
        {
            _context = context;
        }

        // GET: UsersController
        public async Task<IActionResult> Index()
        {
            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var users = await _context.UsersViewModel.FromSqlRaw("EXEC SelectUsers").ToListAsync();
                    transaction.Commit();
                    return View(users);
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    ViewData["TransactionErrorMessage"] = ex.Message;
                    return View();
                }
            }
        }
    }
}
