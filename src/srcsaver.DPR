program Srcsaver;
{
But: Economiseur d'écran sous Windows auto-installable

Détail: affichage aléatoire d'ellipses sur l'écran du bureau sans l'effacer au
        préalable.

Auteur: Patrick Prémartin
Langage: Borland Delphi v1
Date de création: Dimanche 7 Avril 1996
Date de modifications (DMY): 07/04/1996, 14/04/1996, 17/04/1996

Pour me contacter:
  CIS:101674,2645
  Internet: 101674.2645@compuserve.com

Ces fichiers sources sont distribués en tant que shareware, si vous les utilisez
ou adaptez, pensez à vous faire enregistrer via le forum SWREG de Compuserve
(référence 11084) pour le prix actuel de 10US$.

Those files are shareware, to register use GO SWREG on Compuserve (Registration
ID: 11084). It only costs 10US$, you will have support as far I'm able.
}

uses
  Forms,
  Ss_code in 'SS_CODE.PAS' {ScreenSaver},
  Ss_conf in 'SS_CONF.PAS' {AboutBox},
  Ss_setup in 'SS_SETUP.PAS' {StartScreen},
  Cpy_file in 'CPY_FILE.PAS';

{$R *.RES}
{$D SCRNSAVE Ellipse Screen Saver (OlfSoftware) }
{ Donne son nom à l'économiseur d'écran. }

begin
  if (hPrevInst = 0) { Empèche une mutli-exécution }
  then
    begin
      Application.Title := 'Ellipse Screen Saver (Olf Software)';
      if ((paramstr(1) = '/S') or (paramstr (1) = '/s'))
      then { Ecran du screen-saver }
        begin
          Application.CreateForm(TScreenSaver, ScreenSaver);
  end
      else
        if ((paramstr (1) = '/C') or (paramstr (1) = '/c'))
        then { Ecran de configuration et copyright }
          begin
            Application.CreateForm(TAboutBox, AboutBox);
          end
        else
          begin { Ecran d'installation }
            Application.CreateForm(TStartScreen, StartScreen);
            Application.CreateForm(TAboutBox, AboutBox);
            Application.CreateForm(TScreenSaver, ScreenSaver);
          end;
        {endif}
      {endif}
      Application.Run;
    end;
  {endif}
end.

