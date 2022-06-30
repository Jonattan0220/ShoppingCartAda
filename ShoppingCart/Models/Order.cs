using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingCart.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderItems = new HashSet<OrderItem>();
        }

        [Key]
        public int OrderId { get; set; }

        [DataType(DataType.Currency)]
        public long TotalPrice { get; set; }

        [DataType(DataType.Date)]
        public DateTime Date { get; set; }
        public string? UserId { get; set; }


        [ForeignKey("UserId")]
        public virtual User User { get; set; } = null!;
        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }
}
