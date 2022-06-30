using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingCart.Models
{
    public partial class UserAddressCity
    {
        public UserAddressCity()
        {
            Users = new HashSet<User>();
        }

        [Key]
        public int UserAddressCityId { get; set; }

        [Display(Name = "Ciudad")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string City { get; set; } = null!;
        public int? UserAddressProvinceId { get; set; }

        [ForeignKey("UserAddressProvinceId")]
        public virtual UserAddressProvince UserAddressProvince { get; set; } = null!;
        public virtual ICollection<User> Users { get; set; }
    }
}
