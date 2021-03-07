<p align="center">
  <a name="top" href="#">
     <img alt="xshin404/lampTermux" height="60%" width="100%" src="/img/banner/ascii.png"/>
  </a>
</p> <img alt="" align="right" src="https://badges.pufler.dev/visits/xshin404/lampTermux?style=flat-square&label=Visits&color=fa74b2&logo=GitHub&logoColor=white&labelColor=373e4d"/> <img alt="" align="right" src="https://img.shields.io/github/repo-size/xshin404/lampTermux?style=flat-square&label=Size&color=fa74b2&labelColor=373e4d"/>

##  
### :octocat: Hi, i hope this repository useful for web developer but using android

Here are some details about last version i use
- **PHP**                        `8.0.2`
- **MariaDB**                    `15.1 Distrib 10.5.8-MariaDB, for Android (armv7-a)`
- **Apache**                     `2.4.46 (Unix)`
- **phpMyAdmin**                 `5.0.4`

|PHP|MariaDB|Apache|phpMyAdmin|
|--|--|--|--|
|![PHP Version](/img/version/flameshot/php.png)|![MariaDB Version](/img/version/flameshot/mariadb.png)|![Apache](/img/version/flameshot/apache.png)|![phpMyAdmin](/img/version/flameshot/phpMyAdmin.png)|

### Size

  If you want to see size package installation, run `./package.sh`

  |Package Size|
  |--|
  |![Package Size](/img/package/package.png)|

### Information

- **URL Apache**                        `http://localhost:8080`
- **Default Port Apache**               `8080`
- **Default MariaDB User**              `mysql -u $(whoami)`
- **htdocs PATH**                       `$HOME/apache`
- **LAMP Script PATH**                  `$PREFIX/bin/lamp`
- **LAMP-Check Script PATH**            `$PREFIX/bin/lamp-check`

### Overview

  <details open>

  |Info|Login|Login|
  |--|--|--|
  |![PHP Info](/img/overview/php_info.jpg)|![phpMyAdmin Login](/img/overview/mysql_login.jpg)|![phpMyAdmin](/img/overview/mysql.jpg)|

  </details>

### Installation

  <details open>
  <summary>Termux (Android)</summary>

  - ```bash
    $ pkg update && pkg upgrade
    ```

  - ```bash
    $ pkg install ncurses-utils git
    ```

  - ```bash
    $ git clone https://github.com/xshin404/lampTermux
    ```

  - ```bash
    $ cd lampTermux
    ```

  - ```bash
    $ chmod +x install.sh
    ```

  - ```bash
    $ ./install.sh
    ```

  <strong>⚠️ After installation Restart Termux so that the service-daemon is started and then on first boot type 'lamp' to start service..</strong>

  </details>

### Run

  <details open>
  <summary><strong>Service</strong></summary>

  - Apache

  Script PATH on `/data/data/com.termux/files/usr/bin/lamp`

  |Enable Apache Service|Disable Apache Service|
  |--|--|
  |![Enable Apache Service](/img/shortcut/apache/enable.jpg)|![Disable Apache Service](/img/shortcut/apache/disable.jpg)|

  - MySQL

  |Enable MySQL Service|Disable MySQL Service|
  |--|--|
  |![Enable MySQL Service](/img/shortcut/mysql/enable.jpg)|![Disable MySQL Service](/img/shortcut/mysql/disable.jpg)|

  </details>

  <details open>
  <summary><strong>Web Server Status</strong></summary>

  - Index Apache & phpMyAdmin

  Script PATH on `/data/data/com.termux/files/usr/bin/lamp-check`

  |No Error|Error 403 Forbidden|
  |--|--|
  |![No Error](/img/shortcut/webserver/success.jpg)|![Error 403 Forbidden](/img/shortcut/webserver/denied.jpg)|

  </details>

### User Configuration

  <details open>
  <summary><strong>Apache</strong></summary>

  - htdocs

  |Custom PATH 'htdocs'|
  |--|
  |![Login Apache](/img/userconfigure/apache/htdocs.png)|

  Default PATH htdocs on

  ```bash
  246 ...
  247 ...
  248 ...
  249 DocumentRoot "/data/data/com.termux/files/usr/share/apache2/default-site/htdocs"
  250 <Directory "/data/data/com.termux/files/usr/share/apache2/default-site/htdocs">
  251 ...
  252 ...
  253 ...
  ```

  but i change to

  ```bash
  246 ...
  247 ...
  248 ...
  249 DocumentRoot "/data/data/com.termux/files/home/apache"
  250 <Directory "/data/data/com.termux/files/home/apache">
  251 ...
  252 ...
  253 ...
  ```

  - Custom extension file that will be at loaded first

  |Custom extension file|
  |--|
  |![Login Apache](/img/userconfigure/apache/file.png)|

  Default extension file is

  ```bash
  279 ...
  280 ...
  281 ...
  282 <IfModule dir_module>
  283     DirectoryIndex index.html
  284 </IfModule>
  285 ...
  286 ...
  287 ...
  ```

  but i change to

  ```bash
  279 ...
  280 ...
  281 ...
  282 <IfModule dir_module>
  283     DirectoryIndex index.php
  284 </IfModule>
  285 ...
  286 ...
  287 ...
  ```

  If you want custom htdocs or extension file that will be at loaded first, change the configuration on file `/data/data/com.termux/files/usr/etc/apache2/httpd.conf`

  </details>

### Troubleshooting

  <details open>
  <summary>Apache & PHP</summary>

  - PHP isn't loaded, just showing the code

  |Like This|
  |--|
  |![Not Loaded](/img/troubleshooting/php_not_loaded.png)|

  Open apache configuration on PATH `/data/data/com.termux/files/usr/etc/apache2/httpd.conf` 
  
  Give comment (#) this text

  |Comment Text|
  |--|
  |![Login Apache](/img/troubleshooting/php/70.png)|

  ```bash
  67 ...
  68 ...
  69 ...
  70 LoadModule mpm_worker_module libexec/apache2/mod_mpm_worker.so
  71 ...
  72 ...
  73 ...
  ```

  Uncomment this text

  |Uncomment Text|
  |--|
  |![Login Apache](/img/troubleshooting/php/69.png)|

  ```bash
  66 ...
  67 ...
  68 ...
  69 #LoadModule mpm_worker_module libexec/apache2/mod_mpm_worker.so
  70 ...
  71 ...
  72 ...
  ```

  Add module on last configuration

  |Add Module|
  |--|
  |![Login Apache](/img/troubleshooting/php/540.png)|

  ```bash
  536 ...
  537 ...
  538 ...
  539 LoadModule php_module libexec/apache2/libphp.so
  540 AddHandler php-script .php
  ```

  This module for <strong>PHP Version 8</strong>

  Now restart apache with `killall httpd`

  |PHP success loaded|
  |--|
  |![Solved](/img/troubleshooting/taraaa.jpg)|

  </details>

  <details open>
  <summary>MySQL</summary>

  - Can't login root user because the password didn't know

  to fix this, Enable MySQL service

  |Enable MySQL Service|
  |--|
  |![Enable MySQL Service](/img/shortcut/mysql/enable.jpg)|

  After enable MySQL Service, now login mysql with root user.

  ```bash
  mysql -u $(whoami)
  ```

  After login, type this on MySQL (To use database mysql)

  ```bash
  use mysql;
  ```

  Database changed

  ```bash
  MariaDB [(none)]>
  ```

  To 

  ```bash
  MariaDB [(mysql)]>
  ```

  Now setting your root password MySQL you want, with

  ```bash
  set password for 'root'@'localhost' = password('your_password_here');
  ```

  After setting password for root login, type

  ```bash
  flush privileges;
  ```

  Now exit, type

  ```bash
  exit; or quit;
  ```

  Now your root password has benn changed, to login type

  ```bash
  $ mysql -u root -p
  ```

  The password column filled with the newest password

  |Picture|
  |--|
  |![Picture](/img/troubleshooting/mysql_root_password.jpg)|

  </details>

  <details open>
  <summary>phpMyAdmin</summary>

  - Access Denied 403 Forbidden

  |403 Forbidden|lamp-check|
  |--|--|
  |![403 Forbidden](/img/troubleshooting/myadmin/access_denied.jpg)|![403 Forbidden](/img/troubleshooting/myadmin/webserver.jpg)|

  If you get this error, change this text on apache configuration `/data/data/com.termux/files/usr/etc/apache2/httpd.conf`

  |Require all denied|
  |--|
  |![Require all denied](/img/troubleshooting/myadmin/denied.png)|

  ```bash
  229 ...
  230 ...
  231 ...
  232 <Directory />
  233       AllowOverride none
  234       Require all denied
  235 </Directory>
  236 ...
  237 ...
  238 ...
  ```

  To

  |Require all granted|
  |--|
  |![Require all denied](/img/troubleshooting/myadmin/granted.png)|

  Change Require all `denied` to Require all `granted`

  <strong>Don't forget to restart apache with</strong> `killall httpd`

  </details>
