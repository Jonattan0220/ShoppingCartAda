using System.ComponentModel.DataAnnotations;

namespace ShoppingCart.Models.ViewModels
{
    public class OrderItemViewModel
    {
        [Key]
        public int OrderItemId { get; set; }

        [Display(Name = "Transacción")]
        public string TransactionId { get; set; } = null!;

        [Display(Name = "Cantidad total")]
        public long TotalQuantity { get; set; }

        [Display(Name = "Precio")]
        [DataType(DataType.Currency)]
        public long TotalPrice { get; set; }

        [Display(Name = "Fecha")]
        [DataType(DataType.Date)]
        public DateTime Date { get; set; }

        public int? ProductItemId { get; set; }

        [Display(Name = "Usuario")]
        public string? UserId { get; set; }

        [Display(Name = "Tipo de producto")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string Type { get; set; } = null!;

        [Display(Name = "Producto")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string ProductName { get; set; } = null!;

        [Display(Name = "Artículo")]
        [Required(ErrorMessage = "Debe ingresar el nombre del artículo")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Debes ingresar como mínimo {2} y máximo {1} caracteres")]
        public string ProductItemName { get; set; } = null!;

        [Display(Name = "Marca")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string Brand { get; set; } = null!;
    }
}
