variable "resourcegroupName" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "mssqlServerName" {
  type = string
}

variable "adminLogin" {
  type = string
}

variable "adminPassword" {
   type = string
}

variable "msSqlDatabase" {
   type = string
}