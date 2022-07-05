using System.ComponentModel.DataAnnotations;

namespace ShoppingCart.Models.ViewModels
{
    public class BuyProductItemViewModel : ProductItemViewModel
    {
        [Required(ErrorMessage = "Debe ingresar una cantidad igual o mayor a 1")]
        [Range(1, long.MaxValue, ErrorMessage = "Debe ingresar una cantidad igual o mayor a 1")]
        public long TotalQuantity { get; set; }
    }
}
