# Screen saver sous Windows 16 (magazine PointDBF n°98)

Sources liés à l'article "[Screen saver sous Windows 16](https://developpeur-pascal.fr/screen-saver-sous-windows-16-dans-le-magazine-pointdbf-98-mars-1999.html)" publié dans le magazine PointDBF 98 en mars 1999.

Dans cet article j'expliquais comment créer un économiseur d'écran avec Delphi pour windows.

L'exemple était un projet développé sous Windows 3.1 avec Delphi 1 en mai 1996 et distribué en freeware sous le nom "Ellipse Screen Saver".

Comme tout économiseur d'écran, il n'économisait rien mais affichait des ellipses sur l'écran pour titiller les pixels et éviter la persistance qui était l'un des fléaux des moniteurs informatiques de l'époque.

Si vous voulez voir ce que j'en disais, il vous suffit de [lire l'article publié à l'époque](https://developpeur-pascal.fr/screen-saver-sous-windows-16-dans-le-magazine-pointdbf-98-mars-1999.html).

## Codes sources dans le dossier /src

Codes sources du programme "Ellipse screen saver" en Delphi 1 datant du mois d'avril 1996 et mis à jour ensuite en janvier 1999 pour sa publication avec le magazine PointDBF.

## Programme de l'économiseur d'écran final dans le dossier /bin

Si vous avez une version de Windows 3.x, Windows 95, Windows 98, Windows Me ou Windows XP vous devriez pouvoir exécuter le programme 16 bits SCRSAVER.EXE du dossier /bin

Si vous n'avez pas ces versions de Windows c'est cuit puisque les programmes 16 bits n'étaient plus pris en charge par Windows, mais vous pouvez toujours compiler le projet avec [Delphi](https://developpeur-pascal.fr/delphi.html) pour votre système d'exploitation actuel.

## Captures d'écran dans le dossier /screen-captures

Ces captures d'écran ont été faites pour l'article en 1999. Elles pourraient vous rappeler quelques souvenir d'une époque où les interfaces utilisateurs étaient claires et sans devinette...

### Windows 3 et son paramétrage

![capture écran du gestionnaire de programmes de Windows 3](https://github.com/DeveloppeurPascal/pointdbf-98/raw/main/screen-captures/gse_prog.jpg)

Gestionnaire de programmes de Windows 3.x qui donnait notamment accès à son panneau de configuation.

![capture écran du panneau de configuration](https://github.com/DeveloppeurPascal/pointdbf-98/raw/main/screen-captures/pan_conf.jpg)

Panneau de configuration de Windows 3 qui donnait accès aux paramètres du système et drivers.

![capture écran au paramétrage de l'affichage et écran de veille](https://github.com/DeveloppeurPascal/pointdbf-98/raw/main/screen-captures/bureau.jpg)

Fenêtre de dialogue de configuration du bureau permettant de choisir et activer un écran de veille.

### Les écrans de "Ellips Screen Saver"

![capture écran du programme lancé en direct](https://github.com/DeveloppeurPascal/pointdbf-98/raw/main/screen-captures/ss_setup.jpg)

Quand on lance le programme on peut l'installer, le tester ou afficher l'écran de paramétrage (boite de dialogue "à propos").

![capture écran de l'écran "à propos"](https://github.com/DeveloppeurPascal/pointdbf-98/raw/main/screen-captures/ss_conf.jpg)

La boite de dialogue "à propos" classique et dont j'ai repris le look et le fonctionnement lors du développement de [ce composant Delphi pour projets VCL et FireMonkey](https://dialogueapropos.developpeur-pascal.fr/).

![capture écran de l'économiseur d'écran en action](https://github.com/DeveloppeurPascal/pointdbf-98/raw/main/screen-captures/result.jpg)

Et voici à quoi ressemblait cet économiseur d'écran lorsqu'il était lancé sur le bureau de Windows 3.1
