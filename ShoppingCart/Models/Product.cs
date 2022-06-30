using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingCart.Models
{
    public partial class Product
    {
        public Product()
        {
            ProductItems = new HashSet<ProductItem>();
        }

        [Key]
        [Display(Name = "Producto")]
        public int ProductId { get; set; }

        [Display(Name = "Producto")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string Name { get; set; } = null!;
        [Display(Name = "Descripción")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string Description { get; set; } = null!;

        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }

        public int? ProductTypeId { get; set; }

        [ForeignKey("ProductTypeId")]
        public virtual ProductType ProductType { get; set; } = null!;
        public virtual ICollection<ProductItem> ProductItems { get; set; }
    }
}
