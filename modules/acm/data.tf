data "external" "list_pcas" {
  program = ["bash", "${path.module}/list_pcas.sh"]
}