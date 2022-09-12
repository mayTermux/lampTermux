<p align="center">
  <a name="top" href="#">
     <img alt="xshin404/lampTermux" height="60%" width="100%" src="https://user-images.githubusercontent.com/64394320/189678375-06f48ebe-aa01-4f36-aafb-4530cb572adb.png"/>
  </a>
</p> <img alt="" align="right" src="https://badges.pufler.dev/visits/xshin404/lampTermux?style=flat-square&label=Visits&color=fa74b2&logo=GitHub&logoColor=white&labelColor=373e4d"/> <img alt="" align="right" src="https://img.shields.io/github/repo-size/xshin404/lampTermux?style=flat-square&label=Size&color=fa74b2&labelColor=373e4d"/>

### Installation

- Download or clone the latest release.

```bash
git clone https://github.com/mayTermux/lampTermux
```

- Move to directory

```bash
cd lampTermux
```

- Run installer script

```bash
./install.sh
```

### Information

- **URL Apache** `http://localhost:8080`
- **Default Port Apache** `8080`
- **Default MariaDB User** `mysql -u $(whoami)`
- **htdocs PATH** `$HOME/htdocs`

### Overview

  <details open>

| Info                                    | Login                                              | Database                               |
| --------------------------------------- | -------------------------------------------------- | -------------------------------------- |
| ![PHP Info](/img/overview/php_info.jpg) | ![phpMyAdmin Login](/img/overview/mysql_login.jpg) | ![phpMyAdmin](/img/overview/mysql.jpg) |

  </details>

### User Configuration

  <details open>
  <summary><strong>Apache</strong></summary>

- htdocs

| Custom PATH 'htdocs'                                  |
| ----------------------------------------------------- |
| ![Login Apache](/img/userconfigure/apache/htdocs.png) |

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

my configuration

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

| Custom extension file                               |
| --------------------------------------------------- |
| ![Login Apache](/img/userconfigure/apache/file.png) |

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

my configuration

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

| Like This                                              |
| ------------------------------------------------------ |
| ![Not Loaded](/img/troubleshooting/php_not_loaded.png) |

Open apache configuration on PATH `/data/data/com.termux/files/usr/etc/apache2/httpd.conf`

Give comment (#) this text

| Comment Text                                     |
| ------------------------------------------------ |
| ![Login Apache](/img/troubleshooting/php/70.png) |

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

| Uncomment Text                                   |
| ------------------------------------------------ |
| ![Login Apache](/img/troubleshooting/php/69.png) |

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

| Add Module                                        |
| ------------------------------------------------- |
| ![Login Apache](/img/troubleshooting/php/540.png) |

```bash
536 ...
537 ...
538 ...
539 LoadModule php_module libexec/apache2/libphp.so
540 AddHandler php-script .php
```

This module for <strong>PHP Version 8</strong>

Now restart apache with `killall httpd`

| PHP success loaded                         |
| ------------------------------------------ |
| ![Solved](/img/troubleshooting/taraaa.jpg) |

  </details>

  <details open>
  <summary>MySQL</summary>

- Can't login root user because the password didn't know

to fix this, Enable MySQL service

| Enable MySQL Service                                    |
| ------------------------------------------------------- |
| ![Enable MySQL Service](/img/shortcut/mysql/enable.jpg) |

After enable MySQL Service, now login mysql with root user.

```bash
$ mysql -u $(whoami)
```

After login, type this on MySQL (To use database mysql)

```bash
MariaDB [(none)]> use mysql;
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
MariaDB [(mysql)]> set password for 'root'@'localhost' = password('your_password_here');
```

After setting password for root login, type

```bash
MariaDB [(mysql)]> flush privileges;
```

Exit MySQL, type

```bash
MariaDB [(mysql)]> exit; # or quit;
```

Now your root password has been changed, to login type

```bash
$ mysql -u root -p
```

The password column filled with the newest password

| Picture                                                  |
| -------------------------------------------------------- |
| ![Picture](/img/troubleshooting/mysql_root_password.jpg) |

  </details>

  <details open>
  <summary>phpMyAdmin</summary>

- Access Denied 403 Forbidden

| 403 Forbidden                                                    | lamp-check                                                   |
| ---------------------------------------------------------------- | ------------------------------------------------------------ |
| ![403 Forbidden](/img/troubleshooting/myadmin/access_denied.jpg) | ![403 Forbidden](/img/troubleshooting/myadmin/webserver.jpg) |

If you get this error, change this text on apache configuration `/data/data/com.termux/files/usr/etc/apache2/httpd.conf`

| Require all denied                                             |
| -------------------------------------------------------------- |
| ![Require all denied](/img/troubleshooting/myadmin/denied.png) |

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

| Require all granted                                             |
| --------------------------------------------------------------- |
| ![Require all denied](/img/troubleshooting/myadmin/granted.png) |

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

<strong>Don't forget to restart apache with</strong> `killall httpd`

  </details>
