variable "subgrp" {
    description     = "storage_type"
    type            = string
    default         = ""
}
variable "subnet-1a" {
    description     = "username"
    type            = string
    default         = ""
    
}
variable "subnet-1b" {
    description     = "username"
    type            = string
    default         = ""
}
variable "subgrp-tag" {
    description     = "password"
    type            = string
    default         = ""
}
variable "database-name" {
  description     = "name-db"
    type            = string
    default         = ""
}
variable "engine" {
  description     = "parameter-group-name"
    type            = string
    default         = ""
}

variable "engine-version" {
  description     = "mysql-version"
    type            = string
    default         = ""
}
variable "identifier" {
  type = string

}
variable "instance-type" {
  
}
variable "uname" {
  
}
variable "passwd" {
  
}
variable "sgdb" {
  
}
variable "delprotn" {
  type = bool
  
}
variable "skipsnp" {
  type = bool
  
}
variable "mw" {
  
}
