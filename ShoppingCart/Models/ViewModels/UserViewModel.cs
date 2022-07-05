using System.ComponentModel.DataAnnotations;

namespace ShoppingCart.Models.ViewModels
{
    public class UserViewModel
    {
        [Key]
        [Display(Name = "Usuario")]
        public string Id { get; set; } = null!;

        [Display(Name = "Tipo de identificación")]
        [Required(ErrorMessage = "Debe seleccionar su tipo de identificación")]
        public int IdentificationTypeId { get; set; }

        [Display(Name = "Tipo de identificación")]
        public string IdentificationType { get; set; } = null!;

        [Display(Name = "Número de identificación")]
        [Required(ErrorMessage = "Debe ingresar su número de identificación")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Debes ingresar como mínimo {2} y máximo {1} caracteres")]
        public string Identification { get; set; } = null!;

        [Display(Name = "Primer nombre")]
        [Required(ErrorMessage = "Debe ingresar su primer nombre")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Debes ingresar como mínimo {2} y máximo {1} caracteres")]
        public string FirstName { get; set; } = null!;

        [Display(Name = "Primer apellido")]
        [Required(ErrorMessage = "Debe ingresar su primer apellido")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Debes ingresar como mínimo {2} y máximo {1} caracteres")]
        public string LastName { get; set; } = null!;

        [Display(Name = "Número de contacto")]
        [Required(ErrorMessage = "Debe ingresar su número de contacto")]
        [DataType(DataType.PhoneNumber)]
        [StringLength(50, MinimumLength = 6, ErrorMessage = "Debes ingresar como mínimo {2} y máximo {1} caracteres")]
        //[RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Número de contacto inválido")]
        public string PhoneNumber { get; set; } = null!;

        [Display(Name = "Correo electrónico")]
        [Required(ErrorMessage = "Debe ingresar su correo electrónico")]
        [DataType(DataType.EmailAddress)]
        [EmailAddress(ErrorMessage = "Correo electrónico inválido")]
        public string Email { get; set; } = null!;

        [Display(Name = "Provincia o departamento")]
        [Required(ErrorMessage = "Debe seleccionar una provincia o departamento")]
        public int UserAddressProvinceId { get; set; }

        [Display(Name = "Departamento o provincia")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string Province { get; set; } = null!;

        [Display(Name = "Ciudad")]
        [Required(ErrorMessage = "Debe seleccionar una ciudad escogiendo primero una provincia o departamento")]
        public int UserAddressCityId { get; set; }

        [Display(Name = "Ciudad")]
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string City { get; set; } = null!;

        [Display(Name = "Dirección")]
        [Required(ErrorMessage = "Debe ingresar su dirección")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Debes ingresar como mínimo {2} y máximo {1} caracteres")]
        public string Address { get; set; } = null!;

        [Display(Name = "Código postal")]
        [Required(ErrorMessage = "Debe ingresar su código postal")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Debes ingresar como mínimo {2} y máximo {1} caracteres")]
        public string PostalCode { get; set; } = null!;

        //Managed by AspNetCoreIdentity
        [Display(Name = "Rol")]
        public string RolName { get; set; } = null!;

        [Display(Name = "Fecha registro")]
        public DateTime CreationDate { get; set; }

        [Display(Name = "Fecha modificación")]
        public DateTime ModificationDate { get; set; }
    }
}
