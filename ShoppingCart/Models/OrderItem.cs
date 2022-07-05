using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingCart.Models
{
    public partial class OrderItem
    {
        [Key]
        public int OrderItemId { get; set; }

        [Display(Name = "Transacción")]
        public string TransactionId { get; set; } = null!;

        [Display(Name = "Cantidad total comprada")]
        public long TotalQuantity { get; set; }

        [Display(Name = "Precio")]
        [DataType(DataType.Currency)]
        public long TotalPrice { get; set; }

        [Display(Name = "Fecha")]
        [DataType(DataType.Date)]
        public DateTime Date { get; set; }

        public int? ProductItemId { get; set; }
        public string? UserId { get; set; }

        [Display(Name = "Cliente")]
        [ForeignKey("UserId")]
        public virtual User User { get; set; } = null!;

        [Display(Name = "Artículo")]
        [ForeignKey("ProductItemId")]
        public virtual ProductItem ProductItem { get; set; } = null!;
    }
}
