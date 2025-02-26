variable "inbound" {
  type    = list(number)
  default = [80, 443, 22, 3306, 8080, 8095]
}