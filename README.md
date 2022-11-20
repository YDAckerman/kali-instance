# What

Terraform a EC2 instance running Kali Linux.

# Why

Reproducibility.

# Notes

- change the server name in the setup.sh file before ssh

# Citations

- Used
  [this](https://medium.com/@hmalgewatta/setting-up-an-aws-ec2-instance-with-ssh-access-using-terraform-c336c812322f)
  as my template. The subnets.tf code in the original has an error at
  the time of writing this. "aws\_route\_table_association" requires a
  vpc id, not a subnet id. But Terraform itself will probably let you know.
