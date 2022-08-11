unit Ss_setup;
{
But: Economiseur d'écran auto-installable sous Windows 3

Détail: affichage aléatoire d'ellipses sur l'écran du bureau sans l'effacer au
        préalable.
        Cette unité contient le code de la fenêtre d'installation.

Langage: Borland Delphi v1
Auteur: Patrick Prémartin (email: pprem@infonie.fr,
                           URL: http://perso.infonie.fr/pprem/)

Ces fichiers sources sont distribués en tant que freeware à condition de ne pas
les modifier et de m'en laisser la propriété.

This code is freeware, use it if you want, but don't change anything before
distributing it.
}

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, IniFiles,
  ss_conf, ss_code, Cpy_File;

type
  TStartScreen = class(TForm)
    Status1: TPanel;
    Bouton_Abandon: TBitBtn;
    Bouton_A_Propos: TBitBtn;
    Bouton_Installation: TBitBtn;
    Bouton_Tester: TBitBtn;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure Bouton_InstallationClick(Sender: TObject);
    procedure Bouton_A_ProposClick(Sender: TObject);
    procedure Bouton_AbandonClick(Sender: TObject);
    procedure Bouton_TesterClick(Sender: TObject);
  private
    { Déclarations private }
  public
    { Déclarations public }
  end;

var
  StartScreen: TStartScreen;

implementation

{$R *.DFM}

procedure TStartScreen.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (Sender is TBitBtn)
  then
    Status1.Caption := TBitBtn (Sender).Hint
  else
    Status1.Caption := '';
  {endif}
end;

procedure TStartScreen.FormActivate(Sender: TObject);
begin
  AboutBox.Installation := true;
  ScreenSaver.Installation := true;
end;

procedure TStartScreen.Bouton_InstallationClick(Sender: TObject);
var
   s1, s2 : string;
   WinDir : PChar;
   NBCopie, NBTotal : Longint;
   DejaCopie : Longint;
   ini : TIniFile;
begin
  Status1.Caption := 'Préparation de l''installation';
  Status1.Refresh;
  s1 := paramstr (0);
  s2 := copy (s1, length (s1)-11, 8);
  GetMem (WinDir, 255);
  GetWindowsDirectory (WinDir, 255);
  s2 := StrPas (WinDir)+'\'+s2+'.SCR';
  Freemem (Windir, 255);
  NBCopie := 0;
  NBTotal := Taille_Fichier (s1);
  DejaCopie := 0;
  repeat
    NBCopie := NBCopie + Copier_Fichier (s1, s2);
    DejaCopie := (NbCopie * 100) div NbTotal;
    Status1.Caption := 'Installation en cours: '+IntToStr (DejaCopie)+'%';
    Status1.Refresh;
  until (NBCopie >= NBTotal);
  Status1.Caption := 'Mise à jour de WIN.INI';
  Status1.Refresh;
  ini := TIniFile.Create ('WIN.INI');
  ini.WriteBool ('Windows', 'ScreenSaveActive', True);
  if (ini.ReadInteger ('Windows', 'ScreenSaveTimeOut', 0) < 60)
  then
    ini.WriteInteger ('Windows', 'ScreenSaveTimeOut', 300);
  {endif}
  ini.Free;
  Status1.Caption := 'Mise à jour de SYSTEM.INI';
  Status1.Refresh;
  ini := TIniFile.Create ('SYSTEM.INI');
  ini.WriteString ('Boot', 'SCRNSAVE.EXE', s2);
  ini.Free;
  Status1.Caption := 'Installation terminée...';
  Status1.Refresh;
end;

procedure TStartScreen.Bouton_A_ProposClick(Sender: TObject);
begin
  AboutBox.Show;
end;

procedure TStartScreen.Bouton_AbandonClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TStartScreen.Bouton_TesterClick(Sender: TObject);
begin
  ScreenSaver.Activer (Sender);
end;

end.

