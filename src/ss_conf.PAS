unit Ss_conf;
{
But: Economiseur d'?cran auto-installable sous Windows 3

D?tail: affichage al?atoire d'ellipses sur l'?cran du bureau sans l'effacer au
        pr?alable.
        Cette unit? contient le code de la fen?tre de copyright et de
        configuration.

Langage: Borland Delphi v1
Auteur: Patrick Pr?martin (email: pprem@infonie.fr,
                           URL: http://perso.infonie.fr/pprem/)

Ces fichiers sources sont distribu?s en tant que freeware ? condition de ne pas
les modifier et de m'en laisser la propri?t?.

This code is freeware, use it if you want, but don't change anything before
distributing it.
}

interface

uses Messages, WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    OKButton: TBitBtn;
    ProgramIcon: TImage;
    Memo1: TMemo;
    Label1: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Installation : boolean;
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.DFM}

{ Un petit gadget pour le plaisir: le paneau peut bouger si l'on clique
dessus ! }
procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
  if installation
  then
    visible := false
  else
    application.terminate;
  {endif}
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
  Installation := false;
end;

end.

