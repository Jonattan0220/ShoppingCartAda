using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingCart.Models
{
    public partial class ProductItem
    {
        public ProductItem()
        {
            OrderItems = new HashSet<OrderItem>();
        }

        [Key]
        public int ProductItemId { get; set; }

        [Display(Name = "Artículo")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string Name { get; set; } = null!;

        [Display(Name = "Descripción")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string Description { get; set; } = null!;

        [Display(Name = "Precio")]
        [DataType(DataType.Currency)]
        public long Price { get; set; }
        public long Quantity { get; set; }
        public long Sold { get; set; }

        [Display(Name = "Unidades disponibles")]
        public long Available { get; set; }

        [Display(Name = "Producto")]
        public int? ProductId { get; set; }
        public int? ProductItemBrandId { get; set; }

        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }

        [Display(Name = "Producto")]
        [ForeignKey("ProductId")]
        public virtual Product Product { get; set; } = null!;

        [Display(Name = "Marca")]
        [ForeignKey("ProductItemBrandId")]
        public virtual ProductItemBrand ProductItemBrand { get; set; } = null!;
        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }
}
