using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using ShoppingCart.Models;

namespace ShoppingCart.Data
{
    public partial class ShoppingCartContext : IdentityDbContext<User, IdentityRole, string>
    {
        public ShoppingCartContext()
        {
        }

        public ShoppingCartContext(DbContextOptions<ShoppingCartContext> options)
            : base(options)
        {
        }

        public virtual DbSet<IdentificationType> IdentificationTypes { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<OrderItem> OrderItems { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<ProductItem> ProductItems { get; set; } = null!;
        public virtual DbSet<ProductItemBrand> ProductItemBrands { get; set; } = null!;
        public virtual DbSet<ProductType> ProductTypes { get; set; } = null!;
        public virtual DbSet<UserAddressCity> UserAddressCities { get; set; } = null!;
        public virtual DbSet<UserAddressProvince> UserAddressProvinces { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder builder)
        {
            foreach (var relationship in builder.Model.GetEntityTypes().SelectMany(e => e.GetForeignKeys()))
            {
                relationship.DeleteBehavior = DeleteBehavior.Restrict;
            }

                base.OnModelCreating(builder);
        }
    }
}
