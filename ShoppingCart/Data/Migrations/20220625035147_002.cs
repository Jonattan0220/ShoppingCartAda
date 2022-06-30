using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ShoppingCart.Data.Migrations
{
    public partial class _002 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_UserAddressProvinces_IdUserAddressProvinceId",
                table: "AspNetUsers");

            migrationBuilder.RenameColumn(
                name: "IdUserAddressProvinceId",
                table: "AspNetUsers",
                newName: "UserAddressProvinceId");

            migrationBuilder.RenameIndex(
                name: "IX_AspNetUsers_IdUserAddressProvinceId",
                table: "AspNetUsers",
                newName: "IX_AspNetUsers_UserAddressProvinceId");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_UserAddressProvinces_UserAddressProvinceId",
                table: "AspNetUsers",
                column: "UserAddressProvinceId",
                principalTable: "UserAddressProvinces",
                principalColumn: "UserAddressProvinceId",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_UserAddressProvinces_UserAddressProvinceId",
                table: "AspNetUsers");

            migrationBuilder.RenameColumn(
                name: "UserAddressProvinceId",
                table: "AspNetUsers",
                newName: "IdUserAddressProvinceId");

            migrationBuilder.RenameIndex(
                name: "IX_AspNetUsers_UserAddressProvinceId",
                table: "AspNetUsers",
                newName: "IX_AspNetUsers_IdUserAddressProvinceId");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_UserAddressProvinces_IdUserAddressProvinceId",
                table: "AspNetUsers",
                column: "IdUserAddressProvinceId",
                principalTable: "UserAddressProvinces",
                principalColumn: "UserAddressProvinceId",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
