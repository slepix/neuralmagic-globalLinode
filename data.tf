data "http" "regions" {
  url = "https://api.linode.com/v4/regions"

  # request_headers = {
  #   Authorization = "Bearer ${var.linode_token}"
  #   Content-Type  = "application/json"
  # }
}