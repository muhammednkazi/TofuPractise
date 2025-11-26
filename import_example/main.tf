
resource "aws_instance" "example" {
  ami                                  = "ami-02d26659fd82cf299"
  associate_public_ip_address          = false
  availability_zone                    = "ap-south-1b"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  enable_primary_ipv6                  = null
  force_destroy                        = false
  get_password_data                    = false
  hibernation                          = false
  host_id                              = ""
  host_resource_group_arn              = null
  iam_instance_profile                 = ""
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  key_name                             = "TofuPractise"
  monitoring                           = false
  placement_partition_number           = 0
  private_ip                           = "172.31.9.73"
  region                               = "ap-south-1"
  secondary_private_ips                = []
  security_groups                      = ["launch-wizard-7"]
  source_dest_check                    = true
  subnet_id                            = "subnet-0dc73b52aae47958f"
  tags = {
    Name = "TofuPractise"
  }
  tags_all = {
    Name = "TofuPractise"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_base64            = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-0f37977eca82c08fc"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    core_count       = 1
    threads_per_core = 1
  }
  credit_specification {
    cpu_credits = "standard"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    kms_key_id            = ""
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}


/*
import {
  id = "i-01f2bfcb6ba605ab5"
  to = aws_instance.example
}
*/