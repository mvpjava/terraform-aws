# Security Group allowing SSH from anywhere
resource "aws_security_group" "ssh_access" {
  name        = "allow-ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id  # !!! TODO, change to your default VPC ID !!!

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-ansible-allow-ssh"
  }
}


resource "aws_instance" "ec2" {
  ami               = "ami-0336cdd409ab5eec4"
  count             = 1
  availability_zone = "eu-west-2c"
  instance_type     = "t3.micro"
  key_name          = var.my_ssh_key # Needed by Ansible
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    description = "terraform_ansible_demo"
  }

  #Dynamically passes inventory inline via "${self.public_ip}," with a trailing comma tells Ansible it’s a host list, not a filename
  #No Ansible plugins needed this way  (plugin: ansible/ansible)

  #ANSIBLE_HOST_KEY_CHECKING=False --> disable SSH host key checking so Ansible won’t fail if it’s connecting to a new host for the first time 
  # (you’d otherwise see the ...Are you sure you want to continue connecting (yes/no)? prompt).
  provisioner "local-exec" {
    command = <<EOT
      echo "Waiting 60s for ec2 instance to be ready to ssh into ..."
      sleep 60
      export ANSIBLE_HOST_KEY_CHECKING=False \
      ansible-playbook \
        -i ${self.public_ip}, \
        --private-key ${var.path_my_ssh_key} \
        -u ${var.username} \
        ${path.module}/playbook.yml
    EOT
  }

}
