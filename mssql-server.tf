resource "azurerm_mssql_server" "mssql-server" {
  name                         = var.mssqlServerName
  resource_group_name          = azurerm_resource_group.myterraformgroup.name
  location                     = azurerm_resource_group.myterraformgroup.location
  version                      = "12.0"
  administrator_login          = var.adminLogin
  administrator_login_password = var.adminPassword
}

resource "azurerm_mssql_database" "mssql-db" {
  name           = var.mySqlDatabase
  server_id      = azurerm_mssql_server.mssql-server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "BC_Gen5_2"
  zone_redundant = true

  tags = var.tags

}