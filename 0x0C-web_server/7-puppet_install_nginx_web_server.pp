# Install Nginx package
package { 'nginx':
  ensure => 'installed',
}

# Configure Nginx server
file { '/etc/nginx/sites-available/default':
  content => "
    server {
      listen 80;
      root /var/www/html;

      location / {
        add_header Cache-Control 'no-store';
        add_header Pragma 'no-cache';
        add_header Expires '-1';
        index index.html;
        try_files \$uri \$uri/ =404;
      }

      location /redirect_me {
        return 301 http://www.example.com;
      }
    }
  ",
}

# Remove the default Nginx homepage
file { '/var/www/html/index.nginx-debian.html':
  ensure => 'absent',
}

# Add a custom homepage with "Hello World!"
file { '/var/www/html/index.html':
  content => '<html><body><h1>Hello World!</h1></body></html>',
}
