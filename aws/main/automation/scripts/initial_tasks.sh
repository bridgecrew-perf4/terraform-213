sudo yum install -y docker httpd
sudo su

systemctl enable docker
systemctl enable httpd

systemctl start docker
systemctl start httpd


vi index.html
vi console/a.html