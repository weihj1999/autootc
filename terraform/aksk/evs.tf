resource "opentelekomcloud_blockstorage_volume_v2" "volume_1" { 
    region = "${var.region_name}" 
    name =  "${var.volume_name}" 
    description = "first test volume" 
    size = "${var.volume_size}"
 } 

