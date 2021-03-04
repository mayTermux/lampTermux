        Require all granted
<p align="center">
  <a name="top" href="#">
     <img alt="xshin404/lampTermux" height="60%" width="100%" src="/img/banner/lamp2.png"/>
  </a>
  Image by : <a href="https://images.app.goo.gl/bQt3TQpQt5TN1J837">mvps.net</a>
</p> <img alt="" align="right" src="https://badges.pufler.dev/visits/xshin404/lampTermux?style=flat-square&label=Visits&color=fa74b2&logo=GitHub&logoColor=white&labelColor=373e4d"/> <img alt="" align="right" src="https://img.shields.io/github/repo-size/xshin404/lampTermux?style=flat-square&label=Size&color=fa74b2&labelColor=373e4d"/>


### Overview

  <details open>

  |PHP Info|MySQL Login|MySQL|
  |--|--|--|
  |![PHP Info](/img/overview/php_info.jpg)|![MySQL Login](/img/overview/mysql_login.jpg)|![MySQL](/img/overview/mysql.jpg)|

  </details>


### Installation

  <details open>
  <summary>Termux (Android)</summary>

  - ```bash
    $ pkg update && pkg upgrade
    ```

  - ```bash
    $ pkg install -y git
    ```

  - ```bash
    $ git clone https://github.com/xshin404/lampTermux
    ```

  - ```bash
    $ cd lampTermux && chmod +x install.sh
    ```

  - ```bash
    $ ./install.sh
    ```

  </details>

### Command
  
  <details open>
  <summary>Apache</summary>

  - Start Apache

    ```bash
    httpd
    ```

  - Kill Apache PID

    ```bash
    killall httpd
    ```

  - Restart Apache

    ```
    kilall httpd; httpd
    ```

  </details>

  <details open>
  <summary>MySQL</summary>

  - Start MySQL Daemon

    ```bash
    mysqld_safe
    ```

  - Login MySQL (CLI Mode)

    ```bash
    mysql -u root -p # After type this you got prompt password
    ```

  </details>

### User Configuration

  <details open>
  <summary>Apache & PHP</summary>

  - Custom PATH `htdocs`

    ```bash
    ...
    ...
    ...
    DocumentRoot "/data/data/com.termux/files/usr/share/apache2/default-site/htdocs"
    ...
    ...
    ...
    ```

  for example 

  ```bash
  ...
  ...
  ...
  DocumentRoot "/data/data/com.termux/files/home/apache"
  ...
  ...
  ...
  ```

  Make sure you create or have the directory.
  don't forget edit 

  ```bash
  DocumentRoot "/data/data/com.termux/files/custom/path"
  <Directory "/data/data/com.termux/files/custom/path">
  ```

  - Custom file + extensions to be loaded

    ```bash
    ...
    ...
    ...
    <IfModule dir_module>
        DirectoryIndex index.html # For example "index.php"
    </IfModule>
    ...
    ...
    ...
    ```

  </details>


### Troubleshooting

  <details open>
  <summary>Apache & PHP</summary>

  - PHP not loaded just show the code, like this

  |PHP File not loaded just show the code|
  |--|
  |![Not Loaded](/img/troubleshooting/php_not_loaded.png)|

  Open apache configuration on PATH `$PREFIX/etc/apache2/httpd.conf` 
  
  give comment (#) this text

  ```bash
  68 ...
  69 ...
  70 ...
  71 LoadModule mpm_worker_module libexec/apache2/mod_mpm_worker.so
  72 ...
  73 ...
  74 ...
  ```

  uncomment this text

  ```bash
  67 ...
  68 ...
  69 ...
  70 #LoadModule mpm_worker_module libexec/apache2/mod_mpm_worker.so
  71 ...
  72 ...
  73 ...
  ```

  add module on last configuration

  ```bash
  536 ...
  537 ...
  538 ...
  539 LoadModule php_module libexec/apache2/libphp.so
  540 AddHandler php-script .php
  ```

  This module for <strong>PHP Version 8</strong>

  now restart apache with `killall httpd; httpd`

  |TARAAA PHP loaded|
  |--|
  |![Solved](/img/troubleshooting/taraaa.jpg)|


  </details>

  <details open>
  <summary>MySQL</summary>

  - MySQL login but unknown password for the first time

  to fix this run MySQL daemon with 

  ```bash
  mysqld_safe
  ```
  and create new session with side bar Termux

  login to MySQL with

  ```bash
  mysql -u ${whoami}
  ```

  after login type this (on mysql)

  ```bash
  use mysql;
  ```

  to change mode on 

  ```bash
  MariaDB [(none)]>
  ```

  to 

  ```bash
  MariaDB [(mysql)]>
  ```

  now setting your root password MySQL you want with

  ```bash
  set password for 'root'@'localhost' = password('your_password_here');
  ```

  after setting password for root login

  type 

  ```bash
  flush privileges;
  ```

  now exit and relog with 

  ```bash
  mysql -u root -p
  ```

  the prompt password fill with your password changed

  |Picture|
  |--|
  |![Picture](/img/troubleshooting/mysql_root_password.jpg)|

  </details>

  <details open>
  <summary>phpmyadmin</summary>

  |Access Denied 403 Forbidden|
  |--|
  |![403 Forbidden](/img/troubleshooting/access_denied.jpg)|

  If you get this error, change this text on apache configuration `$PREFIX/etc/apache2/httpd.conf`

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

  to

  ```bash
  229 ...
  230 ...
  231 ...
  232 <Directory />
  233       AllowOverride none
  234       Require all granted
  235 </Directory>
  236 ...
  237 ...
  238 ...
  ```

  change "Require all `denied`" to "Require all `granted`"

  </details>

