unit Scrsaver;
{
But: Economiseur d'?cran auto-installable sous Windows 3

D?tail: affichage al?atoire d'ellipses sur l'?cran du bureau sans l'effacer au
        pr?alable.
        Cette unit? contient le code du screen-saver.

Langage: Borland Delphi v1
Auteur: Patrick Pr?martin (email: pprem@infonie.fr,
                           URL: http://perso.infonie.fr/pprem/)

Ces fichiers sources sont distribu?s en tant que freeware ? condition de ne pas
les modifier et de m'en laisser la propri?t?.

This code is freeware, use it if you want, but don't change anything before
distributing it.
}

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TScreenSaver = class(TForm)
    Timer1: TTimer;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { D?clarations private }
    LastMouse : TPoint;
    actif : boolean;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure fin;
  public
    { D?clarations public }
    Installation: boolean;
    procedure activer (Sender: TObject);
  end;

var
  ScreenSaver: TScreenSaver;

implementation

{$R *.DFM}

{ Arr?t de l'?conomiseur par mouvement de la souris }
procedure TScreenSaver.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
   CurrMouse : TPoint;
begin
  GetCursorPos (CurrMouse);
  if ((CurrMouse.x <> LastMouse.x)
     or (CurrMouse.Y <> LastMouse.y))
  then
    fin;
  {endif}
end;

{ Arr?t de l'?conomiseur par appuit sur une touche }
procedure TScreenSaver.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  fin;
end;

{ Arr?t de l'?conomiseur par appuit sur un bouton de la souris }
procedure TScreenSaver.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  fin;
end;

{ L'?conomiseur dessine des ellipses toutes les 10 millisecondes }
procedure TScreenSaver.Timer1Timer(Sender: TObject);
begin
  Canvas.Pen.Color := $2000000 + (random (256)) shl 16 + random (256) shl 8 +
                      random (256);
  Canvas.Ellipse (random (clientwidth), random(clientheight),
                 random(ClientWidth), random(ClientHeight));
end;

{ Param?trage de l'?conomiseur d'?cran }
procedure TScreenSaver.FormCreate(Sender: TObject);
begin
  randomize;
  BorderIcons := [];
  BorderStyle := bsNone;
  Ctl3D := False;
  FormStyle := fsStayOnTop;
  KeyPreview := True;
  WindowState := wsMaximized;
  Left := 0;
  Top := 0;
  Width := GetSystemMetrics (SM_CXSCREEN);
  Height := GetSystemMetrics (SM_CYSCREEN);
  Timer1.Interval := 50;
  Canvas.Brush.Style := bsClear;
  Installation := false;
  Actif := false;
end;

{ On emp?che l'effacement de l'?cran par la suppression de cette fonction... }
procedure TScreenSaver.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  if not actif
  then
    inherited;
  {endif}
end;

{ Sortie de l'?conomiseur en r?activant ce qui a ?t? court-circuit? }
procedure TScreenSaver.fin;
begin
  actif := false;
  ShowCursor (TRUE);
  if (installation)
  then
    visible := false
  else
    application.terminate;
  {endif}
end;

procedure TScreenSaver.FormActivate(Sender: TObject);
begin
  actif := true;
  ShowCursor (FALSE);
  GetCursorPos (LastMouse);
end;

procedure TScreenSaver.Activer(Sender: TObject);
begin
  Actif := true;
  Show;
end;

end.

