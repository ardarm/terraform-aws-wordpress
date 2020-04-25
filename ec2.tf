##Lookup AMI

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

  owners = ["099720109477"] # Canonical
}

data "template_file" "bootstrap" {
    template = "${file("bootstrap.tpl")}"
      vars {
        dbhost = "${aws_db_instance.wpdb.address}"
        efsid = "${aws_efs_file_system.wordpressfs.id}"
  }
}

resource "aws_key_pair" "wordpress" {
  key_name   = "wordpress"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCYpQzI4ptEd2xu2FNS7FWiPq92FjINUHDnpgKrxsZntITrm3XSYvSpLjN1Nn/9pTpi85brV+qjj5UnSgAdzCbuLRCGv85Q+rGMRQJ0HRslvjaVZz+EmwEjo3itUh+vP5gEP4ehASDvEodPCMdSQOoVETo+UYoUN2vxA1U1U7icdb7Xiq93DYtUXlppBn1U3t5Yhi2P+S9qZBNYv6C7fB2qM3qTIF6Kch2WMiWNs3A1Zvs5qgdp6MkBDgKc7/9T468/jqyH9MdVF2OqKVmF20t/tySOa0liFN2vy9aBF/7vTjAUjdLjFI1DS8+GbWE3Wi7SDXyKI6jZkdcO3fa+Iq0r aris@Ariss-MacBook-Pro.local"
}
