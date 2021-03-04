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

    |Start Apache|
    |--|
    |![Start Apache](/img/command/apache/start.jpg)|

  - Kill Apache PID

    ```bash
    killall httpd
    ```

    |Stop Apache|
    |--|
    |![Stop Apache](/img/command/apache/stop.jpg)|

  - Restart Apache

    ```
    kilall httpd; httpd
    ```

    |Restart Apache|
    |--|
    |![Restart Apache](/img/command/apache/restart.jpg)|

  </details>

  <details open>
  <summary>MySQL</summary>

  - Start MySQL Daemon

    Before you run 'mysql -u root -p' you need run MySQL daemon fisrt.

    ```bash
    mysqld_safe
    ```

    |Start MySQL Daemon|
    |--|
    |![Start Apache](/img/command/mysql/daemon.jpg)|

    to Login you need new session on side bar

    |New Session|
    |--|
    |![New Apache](/img/command/mysql/new_session.jpg)|

  - Login MySQL (CLI Mode)

    ```bash
    mysql -u root -p # After type this you get column password
    ```

    |Login MySQL|
    |--|
    |![Login Apache](/img/command/mysql/login.jpg)|

  </details>

### User Configuration

  <details open>
  <summary>Apache & PHP</summary>

  - Custom PATH `htdocs` on `$PREFIX/etc/apache2/httpd.conf`

    |Custom PATH 'htdocs'|
    |--|
    |![Login Apache](/img/userconfigure/htdocs.png)|

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

    for example 

    ```bash
    246 ...
    247 ...
    248 ...
    249 DocumentRoot "/data/data/com.termux/files/home/apache"
    250 <Directory "/data/data/com.termux/files/home/apache">
    251 ...
    252 ...
    ```

    Make sure you create or already exists the directory.

  - Custom file & extension that will be at loaded first

    |Custom PATH 'htdocs'|
    |--|
    |![Login Apache](/img/userconfigure/file.png)|


    ```bash
    279 ...
    280 ...
    281 ...
    282 <IfModule dir_module>
    283     DirectoryIndex index.html # For example "index.php"
    284 </IfModule>
    285 ...
    286 ...
    287 ...
    ```

  </details>


### Troubleshooting

  <details open>
  <summary>Apache & PHP</summary>

  - PHP isn't loaded, just showing the code

    |Like This|
    |--|
    |![Not Loaded](/img/troubleshooting/php_not_loaded.png)|

    Open apache configuration on PATH `$PREFIX/etc/apache2/httpd.conf` 
  
    Give comment (#) this text

    |Comment this text|
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

    |Uncomment this text|
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

    |Add Module PHP 8|
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

    Now restart apache with `killall httpd; httpd`

    |TARAAA PHP success loaded|
    |--|
    |![Solved](/img/troubleshooting/taraaa.jpg)|


  </details>

  <details open>
  <summary>MySQL</summary>

  - MySQL login but unknown password for the first time

    To fix this run MySQL daemon, with 

    ```bash
    mysqld_safe
    ```
    After run MySQL Daemon, create new session on side bar Termux

    Login to MySQL, with

    ```bash
    mysql -u ${whoami}
    ```

    After login type this (on MySQL)

    ```bash
    use mysql;
    ```

    To change mode on 

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

    After setting password for root login

    Type 

    ```bash
    flush privileges;
    ```

    Now exit and relog with 

    ```bash
    mysql -u root -p
    ```

    The password column filled with the newest password

    |Picture|
    |--|
    |![Picture](/img/troubleshooting/mysql_root_password.jpg)|

  </details>

  <details open>
  <summary>phpmyadmin</summary>

  - Access Denied 403 Forbidden

    If you get this error, change this text on apache configuration `$PREFIX/etc/apache2/httpd.conf`

    |Access Denied 403 Forbidden|
    |--|
    |![403 Forbidden](/img/troubleshooting/access_denied.jpg)|

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

    Change Require all `denied` to Require all `granted`

  </details>

