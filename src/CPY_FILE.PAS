unit Cpy_File;
{
But: Copie de fichiers dans l'environnement de Windows

Langage: Borland Delphi v1
Auteur: Patrick Prémartin (email: pprem@infonie.fr,
                           URL: http://perso.infonie.fr/pprem/)
}

interface

function Taille_Fichier (s1 : string) : longint;
function Copier_Fichier (s1, s2 : string): longint;

implementation
var
   f1, f2 : file;
   lu , ecrit : integer;
   copie_en_cours : boolean;
   buffer : array [0..32767] of char;

function Copier_Fichier (s1, s2 : string): longint;
begin
  if not copie_en_cours
  then
    begin
      assign (f1, s1);
      try
        reset (f1, 1);
      except
        Copier_Fichier := 0;
        exit;
      end;
      assign (f2, s2);
      try
        rewrite (f2, 1);
      except
        Copier_Fichier := 0;
        exit;
      end;
      copie_en_cours := true;
    end;
  {endif}
  {$i-}
  blockread (f1, buffer, sizeof (buffer), lu);
  {$i+}
  if (lu > 0)
  then
    begin
      {$i-}
      blockwrite (f2, buffer, lu, ecrit);
      {$i+}
      if (ecrit <> lu)
      then
        halt(1);
      {endif}
    end
  else
    begin
      ecrit := 0;
      close (f2);
      close (f1);
      copie_en_cours := false;
    end;
  {endif}
  copier_fichier := ecrit;
end; { copie_fichier }

function Taille_Fichier (s1 : string) : longint;
var
   f : file;
   Res : longint;
begin
  assign (f, s1);
  try
    reset (f, 1);
    Res := filesize (f);
    close (f);
  except
    Res := 0;
  end;
  Taille_Fichier := Res;
end; { Taille_Fichier}

begin
  copie_en_cours := false;
end.
