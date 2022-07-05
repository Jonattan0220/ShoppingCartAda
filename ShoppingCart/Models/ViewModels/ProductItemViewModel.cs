using System.ComponentModel.DataAnnotations;

namespace ShoppingCart.Models.ViewModels
{
    public class ProductItemViewModel
    {
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

        [Display(Name = "Precio (en pesos colombianos)")]
        [Required(ErrorMessage = "Debe ingresar el precio del artículo (sólo números)")]
        [DataType(DataType.Currency)]
        [Range(2000, long.MaxValue, ErrorMessage = "El valor mínimo debe ser de {1} pesos y máximo {2} pesos colombianos")]
        public long Price { get; set; }

        [Display(Name = "Unidades vendidas")]
        [Required(ErrorMessage = "Debe ingresar la cantidad vendida del artículo")]
        [Range(0, long.MaxValue, ErrorMessage = "El valor mínimo debe ser de {1} pesos y máximo {2} pesos colombianos")]
        public long Sold { get; set; }

        [Display(Name = "Unidades disponibles")]
        [Required(ErrorMessage = "Debe ingresar la cantidad disponible del artículo")]
        [Range(0, long.MaxValue, ErrorMessage = "El valor mínimo debe ser de {1} pesos y máximo {2} pesos colombianos")]
        public long Available { get; set; }

        [Display(Name = "Fecha registro")]
        public DateTime CreationDate { get; set; }

        [Display(Name = "Fecha modificación")]
        public DateTime ModificationDate { get; set; }

        [Display(Name = "Tipo de producto")]
        [Required]
        public int? ProductTypeId { get; set; }

        [Display(Name = "Tipo de producto")]
        [Required(ErrorMessage ="Debe seleccionar el tipo de producto")]
        [StringLength(50, MinimumLength = 2)]
        public string Type { get; set; } = null!;

        [Display(Name = "Producto")]
        [Required(ErrorMessage = "Debe seleccionar el producto")]
        public int? ProductId { get; set; }

        [Display(Name = "Producto")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string ProductName { get; set; } = null!;

        [Display(Name = "Marca")]
        [Required(ErrorMessage = "Debe seleccionar la marca")]
        public int? ProductItemBrandId { get; set; }

        [Display(Name = "Marca")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string Brand { get; set; } = null!;
    }
}
