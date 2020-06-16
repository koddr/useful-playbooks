#!/bin/bash

# Welcome and check for domain (first param)
if [ -n "$1" ]; then
    {
        echo ""
        echo "👋 Welcome! It's helpful tool for get new SSL for a domain"
        echo "→ Included: NGINX config, Certbot, CRON task for renew"
        echo "→ Result: SSL for $1 and www.$1 domains"
        echo ""
    }
else
    {
        echo ""
        echo "🤔 Ouch... Domain (first parameter) not supplied!"
        echo "→ Please run this script, like this:"
        echo "→   ./script_name.sh example.com"
        echo ""
    }
    exit 0
fi

# Skip install Certbot, if needed
if [ $2 != "--skip-install" ]; then
    # Install apt-add-repository package
    sudo apt install software-properties-common -y

    # Add repository for NGINX, Certbot
    sudo apt-add-repository -y ppa:certbot/certbot

    # Update (again)
    sudo apt update

    # Install needed packages
    sudo apt install python-certbot-nginx -y
fi

# Add website configuration for getting cert by Certbot
sudo cat > /etc/nginx/sites-available/$1.conf << EOL
server {
    listen 80;
    listen [::]:80;

    server_name $1 www.$1;
    root /var/www/$1/html;
    index index.html;
}
EOL

# Enable website
sudo ln -s /etc/nginx/sites-available/$1.conf /etc/nginx/sites-enabled/

# Restart NGINX
sudo nginx -t && sudo systemctl restart nginx

# Create website directory, set ownership
sudo chown -R $USER:$USER /var/www/
sudo mkdir -p /var/www/$1/html

# Get SSL cert by Certbot
# Script ask you for:
# – Enter email address (your email)
# - Agree the Terms of Service (A)
# - Subscribe to Let's Encrypt newsletter (N)
# - Names would you like to activate HTTPS (1 2)
sudo certbot --nginx certonly

# Add website configuration
sudo cat > /etc/nginx/sites-available/$1.conf << EOL
server {
    listen 80;
    listen [::]:80;

    server_name $1 www.$1;
    return 301 https://$1$request_uri;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    server_name www.$1;
    return 301 https://$1$request_uri;

    ssl_certificate /etc/letsencrypt/live/$1/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$1/privkey.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/$1/chain.pem;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    server_name $1;
    root /var/www/$1/html;
    index index.html;

    ssl_certificate /etc/letsencrypt/live/$1/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$1/privkey.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/$1/chain.pem;
    
    location ~* ^.+\.(rss|atom|xml|jpg|jpeg|gif|png|svg|ico|rtf|js|css|woff|woff2|ttf|otf)$ {
        expires 30d;
    }

    location / {
        try_files $uri $uri/ /index.html;
    }

    etag on;
}
EOL

# Restart NGINX (again)
sudo nginx -t && sudo systemctl restart nginx

# Clean
sudo apt autoremove -y

# Final message
{
    echo ""
    echo "🎉 There you go! It just works."
    echo ""
}
