<p align="center">
  <a name="top" href="#">
     <img alt="xshin404/lampTermux" height="60%" width="100%" src="/img/lamp2.png"/>
  </a>
</p> <img alt="" align="right" src="https://badges.pufler.dev/visits/xshin404/lampTermux?style=flat-square&label=Visits&color=fa74b2&logo=GitHub&logoColor=white&labelColor=373e4d"/> <img alt="" align="right" src="https://img.shields.io/github/repo-size/xshin404/lampTermux?style=flat-square&label=Size&color=fa74b2&labelColor=373e4d"/>

##
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

### Troubleshooting

  <details open>
  <summary>phpmyadmin</summary>

  |Access Denied 403 Forbidden|
  |![Access Denied](/img/access_denied.jpg)|

  If you got this in phpmyadmin, change configuration on "$PREFIX/etc/apache2/httpd.conf" edit
    
  - ```bash
    <Directory />
        AllowOverride none
        Require all denied
    </Directory>
    ```

  to

  - ```bash
    <Directory />
        AllowOverride none
        Require all granted
    </Directory>
    ```

  </details>
