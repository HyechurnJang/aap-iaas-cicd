cd /home/devops/aap-iaas-cicd && git pull
sudo rm -rf /var/www/html/index.html
sudo cp /home/devops/aap-iaas-cicd/src/html/index.html /var/www/html/index.html
sudo sed -i "s/__HOSTNAME__/$(hostname)/g" /var/www/html/index.html
