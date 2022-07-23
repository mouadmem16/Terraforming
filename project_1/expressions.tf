/*variable "var-map" {
  type = map(string)
  description = "describe your variable"
  default = {
    tag1 = "value-1"
    tag2 = "value-2"
    tag3 = "value-3"
    tag4 = "value-4"
    tag5 = "tag5"
  }
}

variable "var-list" {
  type = list(string)
  description = "describe your variable"
  default = [
    "valeur-1",
    "valeur-2",
    "valeur-3",
    "valeur-4",
  ]
}

variable "var-list2" {
  type = list(string)
  description = "describe your variable"
  default = [
    "value-1",
    "value-2",
    "value-3",
    "value-4",
  ]
}

output "expression-map" {
  value = <<EOF
    ${ join( ",", [for x,y in zipmap(var.var-list, var.var-list2): "${lower(x)}, ${upper(y)} "] ) }
  EOF
}

output "if-list" {
  value = element(var.var-list2, 1) == "value-2" ? "true" : "false"
}

output "if-map" {
  value = <<-EFF
    ${ join(",", [for k,v in var.var-map : "%{ if k == v } true %{ else } false %{ endif }"]) }
  EFF
}

output "loop-map" {
  value = <<EOF
    %{ for v , k in var.var-map }
      ${ v }, ${ k }
    %{ endfor }
  EOF
}*/