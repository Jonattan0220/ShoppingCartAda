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
        [Required(ErrorMessage = "Debe ingresar el nombre del artículo")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Debes ingresar como mínimo {2} y máximo {1} caracteres")]
        public string Name { get; set; } = null!;

        [Display(Name = "Descripción")]
        [Required(ErrorMessage = "Debe ingresar la descripción del artículo")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Debes ingresar como mínimo {2} y máximo {1} caracteres")]
        public string Description { get; set; } = null!;

        [Display(Name = "Precio (sólo números) en pesos colombianos")]
        [Required(ErrorMessage = "Debe ingresar el precio del artículo (sólo números)")]
        [DataType(DataType.Currency)]
        [Range(2000,long.MaxValue,ErrorMessage = "El valor mínimo debe ser de {1} pesos y máximo {2} pesos colombianos")]
        public long Price { get; set; }

        [Display(Name = "Unidades vendidas")]
        [Required(ErrorMessage = "Debe ingresar la cantidad vendida del artículo")]
        [Range(0, long.MaxValue, ErrorMessage = "El valor mínimo debe ser de {1} pesos y máximo {2} pesos colombianos")]
        public long Sold { get; set; }

        [Display(Name = "Unidades disponibles")]
        [Required(ErrorMessage = "Debe ingresar la cantidad disponible del artículo")]
        [Range(0, long.MaxValue, ErrorMessage = "El valor mínimo debe ser de {1} pesos y máximo {2} pesos colombianos")]
        public long Available { get; set; }

        public int? ProductId { get; set; }
        public int? ProductItemBrandId { get; set; }

        [Display(Name = "Fecha registro")]
        public DateTime CreationDate { get; set; }

        [Display(Name = "Fecha modificación")]
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
