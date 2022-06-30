using System.ComponentModel.DataAnnotations;

namespace ShoppingCart.Models.ViewModels
{
    public class ProductItemViewModel : ProductItem
    {
        [Display(Name = "Tipo de producto")]
        public int? ProductTypeId { get; set; }
    }
}
