using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ShoppingCart.Models
{
    public partial class IdentificationType
    {
        public IdentificationType()
        {
            Users = new HashSet<User>();
        }
        [Key]
        public int IdentificationTypeId { get; set; }

        [Display(Name = "Tipo de identificación")]
        [Required(ErrorMessage = "Debe ingresar el tipo de identificación")]
        [StringLength(50, ErrorMessage="La longitud del tipo de identificación está entre 1 y 50 caracteres")]
        public string Type { get; set; } = null!;

        public virtual ICollection<User> Users { get; set; }
    }
}
