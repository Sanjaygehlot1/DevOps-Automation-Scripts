 #!/bin/bash
 
 dpkg -l | grep -q nginx
 nginx=$?

 if [ "$nginx" -eq 0 ]; then
	 echo "Ngnix Already Installed!"
 else
	 echo "Nginx not found!"
	 echo "Installing Nginx..."
	 sudo apt update 
	 sudo apt install -y nginx
fi


echo "Starting nginx server..."

sudo systemctl start nginx

sudo systemctl enable nginx


echo "Creating basic html file..."

echo "<h1>Hello from nginx server - script by Sanjay Gehlot</h1>" | sudo tee /var/www/html/index.html


sudo systemctl status nginx | head -n 10

echo "Nginx is now running at port 80..."
