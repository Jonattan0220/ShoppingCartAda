using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ShoppingCart.Models
{
    public partial class ProductType
    {
        public ProductType()
        {
            Products = new HashSet<Product>();
        }

        [Key]
        public int ProductTypeId { get; set; }

        [Display(Name = "Tipo de producto")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string Type { get; set; } = null!;

        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
