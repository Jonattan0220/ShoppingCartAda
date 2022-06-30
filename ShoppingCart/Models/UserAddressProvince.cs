using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ShoppingCart.Models
{
    public partial class UserAddressProvince
    {
        public UserAddressProvince()
        {
            Users = new HashSet<User>();
            UserAddressCity = new HashSet<UserAddressCity>();
        }

        [Key]
        public int UserAddressProvinceId { get; set; }

        [Display(Name = "Departamento o provincia")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string Province { get; set; } = null!;

        public virtual ICollection<User> Users { get; set; }
        public virtual ICollection<UserAddressCity> UserAddressCity { get; set; }
    }
}
