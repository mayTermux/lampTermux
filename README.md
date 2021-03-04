<p align="center">
  <a name="top" href="#">
     <img alt="xshin404/lampTermux" height="60%" width="100%" src="/img/lamp2.png"/>
  </a>
  Image by : <a href="https://images.app.goo.gl/bQt3TQpQt5TN1J837">mvps.net</a>
</p> <img alt="" align="right" src="https://badges.pufler.dev/visits/xshin404/lampTermux?style=flat-square&label=Visits&color=fa74b2&logo=GitHub&logoColor=white&labelColor=373e4d"/> <img alt="" align="right" src="https://img.shields.io/github/repo-size/xshin404/lampTermux?style=flat-square&label=Size&color=fa74b2&labelColor=373e4d"/>

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

  - ```bash
    httpd
    ```

  - Kill Apache PID

  - ```bash
    killall httpd
    ```

  - Restart Apache

  - ```
    kilall httpd; httpd
    ```

  </details>

  <details open>
  <summary>MySQL</summary>

  - Start MySQL Daemon

  - ```bash
    mysqld_safe
    ```

  - Login MySQL (CLI Mode)

  - ```bash
    mysql -u root -p # After type this you got prompt password
    ```

  </details>

### User Configuration

  <details open>
  <summary>Apache & PHP</summary>

  If you want to custom PATH `htdocs` edit this text

  - ```bash
    DocumentRoot "/data/data/com.termux/files/usr/share/apache2/default-site/htdocs"
    ```

  for example `DocumentRoot "/data/data/com.termux/files/home/apache` Make sure you create or have the directory.
  don't forget edit `<Directory "/data/data/com.termux/files/same/path">`

  Custom exstension file to be loaded

  - ```bash
    <IfModule dir_module>
        DirectoryIndex index.html # For example "index.php"
    </IfModule>
    ```

  </details>


### Troubleshooting

  <details open>
  <summary>Apache & PHP</summary>

  - PHP not loaded just show the code

  add this text on last configuration

  `LoadModule php_module libexec/apache2/libphp.so"`
  `AddHandler php-script .php"`

  <strong>This module for PHP Version 8</strong>

  Open apache configuration on PATH `$PREFIX/etc/apache2/httpd.conf` 
  
  give comment (#) this text

  - ```bash
    LoadModule mpm_worker_module libexec/apache2/mod_mpm_worker.so"
    ```

  uncomment this text

  - ```bash
    LoadModule mpm_worker_module libexec/apache2/mod_mpm_worker.so"
    ```

  </details>

  <details open>
  <summary>MySQL</summary>

  - MySQL login but unknown password for the first time

  to fix this run MySQL daemon with `mysqld_safe` and create new session with side bar Termux

  login to MySQL with command `mysql -u ${whoami}`

  after login type `use mysql;` to change mode on `MariaDB [(none)]` to `MariaDB [(mysql)]`

  now setting your root password MySQL you want with command

  `set password for 'root'@'localhost' = password('your_password_here');"`

  after setting password for root login

  type `flush privileges;`

  now exit and relog with `mysql -u root -p` the prompt password fill with your password changed

  </details>
