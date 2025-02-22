variable "type-storage" {
    description     = "storage_type"
    type            = string
    default         = ""
}
variable "username" {
    description     = "username"
    type            = string
    default         = ""
    
}
variable "password" {
    description     = "password"
    type            = string
    default         = ""
}
variable "database-name" {
  description     = "name-db"
    type            = string
    default         = ""
}
variable "parameter-gp" {
  description     = "parameter-group-name"
    type            = string
    default         = ""
}
variable "engine" {
  description     = "databse-mysql"
    type            = string
    default         = ""
}
variable "engine-version" {
  description     = "mysql-version"
    type            = string
    default         = ""
}