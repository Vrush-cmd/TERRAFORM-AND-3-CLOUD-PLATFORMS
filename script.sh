resource "null_resource"  "null1"  {
 connection {
    type     = "ssh" 
    user     = "ec2-user" 
    private_key = file("PRIVATE_KEY_PATH" )
    host     = aws_instance.linux-os.public_ip
  }

 provisioner "remote-exec"  {
    inline = [
      "sudo yum install http -y" ,
      "sudo yum install php -y" ,
      "sudo systemctl start httpd" ,
      "sudo systemctl start php" ,
      "cd /var/www/html"
  }
}
