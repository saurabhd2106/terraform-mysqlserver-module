resource "azurerm_mssql_server" "mysql-server" {
  name                         = var.mysqlServerName
  resource_group_name          = azurerm_resource_group.myterraformgroup.name
  location                     = azurerm_resource_group.myterraformgroup.location
  version                      = "12.0"
  administrator_login          = var.adminLogin
  administrator_login_password = var.adminPassword
}

resource "azurerm_mssql_database" "mysql-db" {
  name           = var.mySqlDatabase
  server_id      = azurerm_mssql_server.mysql-server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "BC_Gen5_2"
  zone_redundant = true

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.mystorageaccount.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }


  tags = var.tags

}