resource "linode_instance" "neuralmagic-primary" {
  depends_on = [data.http.regions]  # Make sure that the Linode instances are created after the HTTP request

  count = length(jsondecode(data.http.regions.response_body).data)

  label      = "deepsparse-${jsondecode(data.http.regions.response_body).data[count.index].id}"
  image      = "linode/ubuntu22.04"
  region     = jsondecode(data.http.regions.response_body).data[count.index].id
  type       = "g6-dedicated-2"
  root_pass  = "Terr4form-test!" # Change this!
  tags       = ["app:sentimentanalysis"]

  metadata {
    user_data = base64encode(file("./linode.yaml"))
  }
}