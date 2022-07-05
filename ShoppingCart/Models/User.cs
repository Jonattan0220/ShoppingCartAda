using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingCart.Models
{
    public partial class User : IdentityUser
    {
        public User()
        {
            OrderItems = new HashSet<OrderItem>();
        }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; } = null!;
        [Required]
        [StringLength(50)]
        public string LastName { get; set; } = null!;
        [Required]
        [StringLength(50)]
        public string Identification { get; set; } = null!;
        [Required]
        [StringLength(50)]
        public string Address { get; set; } = null!;
        [Required]
        [StringLength(50)]
        public string PostalCode { get; set; } = null!;

        public int? IdentificationTypeId { get; set; }
        public int? UserAddressProvinceId { get; set; }
        public int? UserAddressCityId { get; set; }

        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }

        [ForeignKey("IdentificationTypeId")]
        public virtual IdentificationType IdentificationType { get; set; } = null!;
        [ForeignKey("UserAddressProvinceId")]
        public virtual UserAddressProvince UserAddressProvince { get; set; } = null!;
        [ForeignKey("UserAddressCityId")]
        public virtual UserAddressCity UserAddressCity { get; set; } = null!;
        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }
}