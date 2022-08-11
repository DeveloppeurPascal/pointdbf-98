# Screen saver sous Windows 16 (magazine PointDBF n°98)

Sources liés à l'article "[Screen saver sous Windows 16](https://developpeur-pascal.fr/screen-saver-sous-windows-16-dans-le-magazine-pointdbf-98-mars-1999.html)" publié dans le magazine PointDBF 98 en mars 1999.

Dans cet article j'expliquais comment créer un économiseur d'écran avec Delphi pour windows.

L'exemple était un projet développé sous Windows 3.1 avec Delphi 1 en mai 1996 et distribué en freeware sous le nom "Ellipse Screen Saver".

Comme tout économiseur d'écran, il n'économisait rien mais affichait des ellipses sur l'écran pour titiller les pixels et éviter la persistance qui était l'un des fléaux des moniteurs informatiques de l'époque.

Si vous voulez voir ce que j'en disais, il vous suffit de [lire l'article publié à l'époque](https://developpeur-pascal.fr/screen-saver-sous-windows-16-dans-le-magazine-pointdbf-98-mars-1999.html).

## Codes sources dans le dossier /src

Codes sources du programme "Ellipse screen saver" en Delphi 1 datant du mois d'avril 1996 et mis à jour ensuite en janvier 1999 pour sa publication avec le magazine PointDBF.

## Programme de l'économiseur d'écran final dans le dossier /bin

### Version 16 bits d'origine

Si vous avez une version de Windows 3.x, Windows 95, Windows 98, Windows Me ou Windows XP vous devriez pouvoir exécuter le programme 16 bits SCRSAVER.EXE du dossier /bin

Si vous n'avez pas ces versions de Windows c'est cuit puisque les programmes 16 bits n'étaient plus pris en charge par Windows, mais vous pouvez toujours compiler le projet avec [Delphi](https://developpeur-pascal.fr/delphi.html) pour votre système d'exploitation actuel.

### Version 32 bits

Pour le fun une version 32 bits du projet a été compilée dans Delphi 11.2 Alexandria. C'est le fichier srcsaver-win32-20220811.exe qui est opérationnel sur les versions récentes de Windows.

Il a suffit :
* d'ouvrir le projet dans Delphi 11.2 Alexandria,
* de corriger les deux anomalies signalées ("word" à remplacer par "integer" sur deux variables utilisées en blockread() et blockwrite(), puis retirer la directive de compilation $D qui n'est plus accessible tel qu'elle).
* compiler le projet

Bien entendu les fonctionnalités d'origine ne sont pas fonctionnelles comme à l'époque :
* les ellipses sont dessinées avec un fond noir au lieu d'être transparentes. Il faudrait changer les caractéristiques par défaut de la fiche pour la rendre transparente (l'API Windows est en cause).
* le programme ne peut pas s'installer car il faisait une copie de lui-même dans c:\Windows ce que les versions récentes de l'OS interdisent sans basculer en administrateur pour des raisons de sécurité. Il faudrait juste jouer avec l'IAC. Faire l'opération à la main est faisable (changer l'extension .exe en .scr, copier le fichier dans c:\Windows le rend visible dans les paramétres de l'écran de veille à la rubrique "choix des économiseurs d'écran" de Windows 10).

## Captures d'écran dans le dossier /screen-captures

Ces captures d'écran ont été faites pour l'article en 1999. Elles pourraient vous rappeler quelques souvenir d'une époque où les interfaces utilisateurs étaient claires et sans devinette...

### Windows 3 et son paramétrage

![capture écran du gestionnaire de programmes de Windows 3](https://github.com/DeveloppeurPascal/pointdbf-98/raw/main/screen-captures/gse_prog.jpg)

Gestionnaire de programmes de Windows 3.x qui donnait notamment accès à son panneau de configuation.

![capture écran du panneau de configuration](https://github.com/DeveloppeurPascal/pointdbf-98/raw/main/screen-captures/pan_conf.jpg)

Panneau de configuration de Windows 3 qui donnait accès aux paramètres du système et drivers.

![capture écran au paramétrage de l'affichage et écran de veille](https://github.com/DeveloppeurPascal/pointdbf-98/raw/main/screen-captures/bureau.jpg)

Fenêtre de dialogue de configuration du bureau permettant de choisir et activer un écran de veille.

### Windows 10 et son paramétrage

![capture écran du paramétrage de l'écran de veille sous Windows 10](https://github.com/DeveloppeurPascal/pointdbf-98/raw/main/screen-captures/EcranDeVeilleWindows10.png)

Avec le programme compilé en Win32, copié dans C:\Windows puis renommé à la main, on peut activer cet écran de veille aussi sous Windows 10.

### Les écrans de "Ellips Screen Saver"

![capture écran du programme lancé en direct](https://github.com/DeveloppeurPascal/pointdbf-98/raw/main/screen-captures/ss_setup.jpg)

Quand on lance le programme on peut l'installer, le tester ou afficher l'écran de paramétrage (boite de dialogue "à propos").

![capture écran de l'écran "à propos"](https://github.com/DeveloppeurPascal/pointdbf-98/raw/main/screen-captures/ss_conf.jpg)

La boite de dialogue "à propos" classique et dont j'ai repris le look et le fonctionnement lors du développement de [ce composant Delphi pour projets VCL et FireMonkey](https://dialogueapropos.developpeur-pascal.fr/).

![capture écran de l'économiseur d'écran en action](https://github.com/DeveloppeurPascal/pointdbf-98/raw/main/screen-captures/result.jpg)

Et voici à quoi ressemblait cet économiseur d'écran lorsqu'il était lancé sur le bureau de Windows 3.1
