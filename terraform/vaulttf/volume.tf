#create a volume on OTC for testing
resource "opentelekomcloud_blockstorage_volume_v2" "testing-vol" {
  region      = "eu-de"
  name        = "testing-vol"
  description = "testing"
  size        = 33
}
