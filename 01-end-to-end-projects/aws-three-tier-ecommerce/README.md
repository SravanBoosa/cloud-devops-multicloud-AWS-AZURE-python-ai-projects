# AWS Three-Tier E-Commerce Application

A hands-on cloud project demonstrating an e-commerce web application using
AWS networking, EC2, Apache, PHP, and MariaDB.

## Project Overview

The goal is to deploy a PHP-based e-commerce application on AWS, separate
the application and database tiers, configure network access, and verify
that product data is retrieved from MariaDB.

## Architecture

```text
                         Internet
                            |
                    Internet Gateway
                            |
                       Public Subnet
                            |
                  Application EC2
                  Apache + PHP
                  E-Commerce App
                            |
                  Private Network Access
                            |
                       Private Subnet
                            |
                     Database EC2
                        MariaDB
                        ecomdb
```

The application EC2 instance serves the website. The database EC2 instance
runs MariaDB in a private subnet and should not be directly accessible from
the public internet.

## AWS Components

- Amazon VPC
- Public and private subnets
- Internet Gateway
- NAT Gateway, where required for private-instance outbound access
- Public and private route tables
- EC2 application instance
- EC2 database instance
- Security groups
- Apache HTTP Server
- PHP and PHP MySQL extension
- MariaDB
- SSH for administration

## Application Stack

| Layer | Technology |
|---|---|
| Web and application | Apache, PHP |
| Database | MariaDB |
| Database client | PHP MySQLi |
| Operating system | Ubuntu |
| Cloud platform | AWS |

## Database Configuration

The application reads these settings from a `.env` file located beside
`index.php`:

```text
DB_HOST=<private-database-ip-or-private-dns>
DB_USER=<database-username>
DB_PASSWORD=<database-password>
DB_NAME=ecomdb
```

Use the private IP address or private DNS name of the database EC2 instance
for `DB_HOST`. Do not use `localhost` when the database is on a separate EC2
instance.

Create the `.env` file on the server; do not commit it to Git. Use a
least-privilege database user and a strong password.

## Network Security

Recommended security-group rules:

- Application EC2: allow HTTP/HTTPS from intended clients.
- SSH: restrict access to trusted administrator IP addresses.
- Database EC2: allow MariaDB TCP port 3306 only from the application
  EC2 security group.
- Do not assign a public IP to the database instance.
- Do not expose database ports directly to the internet.

Configure rules according to your actual deployment and operational needs.

## Deployment Workflow

1. Create a VPC and public/private subnets.
2. Configure route tables and internet connectivity.
3. Create application and database security groups.
4. Launch the application EC2 instance in the public subnet.
5. Launch the database EC2 instance in the private subnet.
6. Install and configure MariaDB on the database instance.
7. Create the `ecomdb` database and load the sample product data.
8. Install Apache, PHP, and the PHP MySQL extension on the application
   instance.
9. Deploy the application files and configure the `.env` file.
10. Test database connectivity and open the website over HTTP/HTTPS as
    configured.

The exact commands and network values depend on the environment. Never
publish private keys, real passwords, access tokens, or populated `.env`
files.

## Testing and Troubleshooting

Verify the following:

- Apache is running.
- PHP is enabled and the MySQLi extension is installed.
- The application can read its environment configuration.
- The application security group can reach the database on TCP port 3306.
- MariaDB is running and accepts connections from the application tier.
- The `ecomdb` database contains the `products` table.
- The website displays product records successfully.

Useful Linux commands include:

```bash
sudo systemctl status apache2
sudo systemctl status mariadb
php -m | grep -i mysqli
curl -I http://localhost
```

Run each command on the appropriate instance. MariaDB status checks apply
to the database host, while Apache and PHP checks apply to the application
host.

## Repository Contents

- `index.php` — PHP application entry point
- `assets/` — database initialization script
- `css/`, `js/`, `fonts/`, `img/`, `vendors/` — frontend resources
- `scss/` — stylesheet source files
- `Assignment Deploy the following 3-tier application architecture on AWS.docx`
  — project assignment/reference document

## Skills Demonstrated

AWS networking, EC2 deployment, Linux administration, Apache, PHP,
MariaDB, security-group design, SSH, environment configuration, and
troubleshooting.

## Source

The application source was originally obtained from:

https://gitlab.com/debjyotimt/e-commerce-app-3-tier

This portfolio copy documents the learning and deployment work. Refer to
the actual AWS configuration and test results when describing the final
deployment in a resume or interview.
