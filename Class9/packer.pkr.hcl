packer {
  required_plugins {
    amazon = {
      version = " >= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}


source "amazon-ebs" "amazon" {
  ami_name      = "golden-image {{timestamp}}"
  instance_type = "t2.micro"
  region        = "us-east-2"
  source_ami    = "ami-09b90e09742640522"
  ssh_username  = "ec2-user"
  
  run_tags = {
    Name = "Golden Image"
  }

#   ami_regions = [
#     "us-east-1",
#     "us-west-1"
#   ]

    ami_users = [
        "922280720663",             # Provide AWS account number
        "590183750569",
        "992382824617",
        "211125299363",
        "905418373536",
        "533267103270",
        "905418434279",
        "471112902671",
        "637423598467",
        "381492243948",
        "992382578994",
        "654654551960",
        "471112564739",
        "381491897974"
    ]
}

build {
  name = "learn-packer"
  sources = [
    "source.amazon-ebs.amazon"
  ]

  provisioner "shell" {
    script = "kaizen.sh"
  }

  provisioner "breakpoint" {
    note = "Please verify"
  }
}