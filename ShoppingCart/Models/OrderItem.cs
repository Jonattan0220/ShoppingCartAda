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
        public long TotalQuantity { get; set; }

        [DataType(DataType.Currency)]
        public long TotalPrice { get; set; }

        [DataType(DataType.Date)]
        public DateTime Date { get; set; }

        public int? ProductItemId { get; set; }
        public int? OrderId { get; set; }

        [ForeignKey("ProductItemId")]
        public virtual ProductItem ProductItem { get; set; } = null!;
        [ForeignKey("OrderId")]
        public virtual Order Order { get; set; } = null!;
    }
}
