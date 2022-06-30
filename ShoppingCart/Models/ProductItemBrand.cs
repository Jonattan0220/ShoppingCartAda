using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ShoppingCart.Models
{
    public partial class ProductItemBrand
    {
        public ProductItemBrand()
        {
            ProductItems = new HashSet<ProductItem>();
        }

        [Key]
        public int ProductItemBrandId { get; set; }

        [Display(Name = "Marca")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string Brand { get; set; } = null!;
        [Display(Name = "Descripción")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string Description { get; set; } = null!;

        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }

        public virtual ICollection<ProductItem> ProductItems { get; set; }
    }
}
