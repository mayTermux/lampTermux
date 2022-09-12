<p align="center">
  <a name="top" href="#">
     <img alt="xshin404/lampTermux" height="60%" width="100%" src="https://user-images.githubusercontent.com/64394320/189678375-06f48ebe-aa01-4f36-aafb-4530cb572adb.png"/>
  </a>
</p>

## Installation

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

<!-- | PHP Info                                                                                                          | phpmyadmin Login                                                                                                           | phpmyadmin                                                                                                           |
| ----------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| ![phpinfo](https://user-images.githubusercontent.com/64394320/189680781-aadcc7a2-f711-43d9-aa12-18fd52b4fc87.png) | ![phpmyadmin-login](https://user-images.githubusercontent.com/64394320/189680994-f903d183-b16c-4af9-93ef-c9cae5b5c557.png) | ![phpmyadmin](https://user-images.githubusercontent.com/64394320/189681142-37ec39dd-6f38-4890-8934-d05b3711ba79.png) | -->

- PHP Information

![phpinfo](https://user-images.githubusercontent.com/64394320/189680781-aadcc7a2-f711-43d9-aa12-18fd52b4fc87.png)

- phpmyadmin Login

![phpmyadmin-login](https://user-images.githubusercontent.com/64394320/189680994-f903d183-b16c-4af9-93ef-c9cae5b5c557.png)

- phpmyadmin

![phpmyadmin](https://user-images.githubusercontent.com/64394320/189681142-37ec39dd-6f38-4890-8934-d05b3711ba79.png)

  </details>

### User Configuration

  <details open>
  <summary><strong>Apache</strong></summary>

- htdocs

| Custom PATH 'htdocs'                                                                                            |
| --------------------------------------------------------------------------------------------------------------- |
| ![image](https://user-images.githubusercontent.com/64394320/189682430-0eb8b308-6d8d-41b2-ba8d-61e094e8c292.png) |

Default PATH htdocs on

```bash
246 ...
247 ...
248 ...
249 DocumentRoot "/data/data/com.termux/files/home/htdocs"
250 <Directory "/data/data/com.termux/files/home/htdocs">
251 ...
252 ...
253 ...
```

- Custom extension file that will be at loaded first

| Custom extension file                                                                                           |
| --------------------------------------------------------------------------------------------------------------- |
| ![image](https://user-images.githubusercontent.com/64394320/189683156-ebc48379-568f-45c8-bbf2-ca60e25337c8.png) |

Default extension file is

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

| Like This                                                                                                            |
| -------------------------------------------------------------------------------------------------------------------- |
| ![phpnotload](https://user-images.githubusercontent.com/64394320/189684471-88add997-c944-4be1-b750-1de23232a25a.png) |

Open apache configuration on PATH `/data/data/com.termux/files/usr/etc/apache2/httpd.conf`

Give comment (#) this text

| Comment Text                                                                                                                             |
| ---------------------------------------------------------------------------------------------------------------------------------------- |
| ![Screenshot_2022-09-12_21-49-06](https://user-images.githubusercontent.com/64394320/189685096-fc06698f-d685-4f32-ada0-08da528737a8.png) |

```bash
64 ...
65 ...
66 ...
67 LoadModule mpm_worker_module libexec/apache2/mod_mpm_worker.so
68 ...
69 ...
70 ...
```

Uncomment this text

| Uncomment Text                                                                                                  |
| --------------------------------------------------------------------------------------------------------------- |
| ![image](https://user-images.githubusercontent.com/64394320/189685398-b301d3d9-39e5-4640-a6f5-41ac20622015.png) |

```bash
63 ...
64 ...
65 ...
66 #LoadModule mpm_prefork_module libexec/apache2/mod_mpm_prefork.so
67 ...
68 ...
69 ...
```

Add module on last configuration

| Add Module                                                                                                      |
| --------------------------------------------------------------------------------------------------------------- |
| ![image](https://user-images.githubusercontent.com/64394320/189686772-dce1af9d-3c82-4a9b-a5d5-ec8223ea2d83.png) |

```bash
536 ...
537 Include etc/apache2/conf.d/*.conf
538 ...
539 # Add module for PHP 8
540 LoadModule php_module libexec/apache2/libphp.so
541 AddHandler php-script .php
```

This module for <strong>PHP Version 8</strong>

Now restart apache with `killall httpd`

| PHP success loaded                                                                                                |
| ----------------------------------------------------------------------------------------------------------------- |
| ![phpload](https://user-images.githubusercontent.com/64394320/189687316-552a4aa9-4653-4d4f-8a81-7d211932afcc.png) |

  </details>

  <details open>
  <summary>MySQL</summary>

- Can't login root user because the password didn't know

to fix this, Enable MySQL service

| Enable MySQL Service                                                                                                  |
| --------------------------------------------------------------------------------------------------------------------- |
| ![mysql-start](https://user-images.githubusercontent.com/64394320/189687778-3fc46931-85e4-4bd1-a32d-46f3ddeabc8a.png) |

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

| Picture                                                                                                               |
| --------------------------------------------------------------------------------------------------------------------- |
| ![setpassword](https://user-images.githubusercontent.com/64394320/189687944-ddb1909b-8586-47e2-b20a-f6ef239952c7.png) |

  </details>

  <details open>
  <summary>phpMyAdmin</summary>

- Access Denied 403 Forbidden

| 403 Forbidden                                                                                                                  | lamp-check                                                                                                                 |
| ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------- |
| ![phpmyadmin-forbidden](https://user-images.githubusercontent.com/64394320/189688664-2e5f4097-c527-45d5-a998-49dbabad00b5.png) | ![phpmyadmin-check](https://user-images.githubusercontent.com/64394320/189688675-09880c5a-99e6-443a-abee-5774312a2299.png) |

If you get this error, change this text on apache configuration `/data/data/com.termux/files/usr/etc/apache2/httpd.conf`

| Require all denied                                                                                              |
| --------------------------------------------------------------------------------------------------------------- |
| ![image](https://user-images.githubusercontent.com/64394320/189689231-1169246d-4349-4d2d-b612-619d9a6e836d.png) |

```bash
225 ...
226 ...
227 ...
228 <Directory />
229       AllowOverride none
230       Require all denied
231 </Directory>
232 ...
233 ...
234 ...
```

To

| Require all granted                                                                                             |
| --------------------------------------------------------------------------------------------------------------- |
| ![image](https://user-images.githubusercontent.com/64394320/189689357-ecb8e216-24bb-400b-b708-811d7455464d.png) |

```bash
225 ...
226 ...
227 ...
228 <Directory />
229       AllowOverride none
230       Require all granted
231 </Directory>
232 ...
233 ...
234 ...
```

Change Require all `denied` to Require all `granted`

<strong>Don't forget to restart apache with</strong> `killall httpd`

  </details>
