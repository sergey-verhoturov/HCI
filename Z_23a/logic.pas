unit Logic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
  Calculation = record
    A, B, C: Real;
    HA, HB, HC: Real;
    p:real;
  end;

function calcHeight(A:real; B: Real; C:real; var calc:Calculation):real;
procedure load_params(var s1, s2, s3: string; filename: string);
procedure save_params(var s1, s2, s3: string; filename: string);

implementation

function calcHeight(A:real; B: Real; C:real;  var calc:Calculation):real;
var
p: real;
 begin
      calc.A:=A;
      calc.B:=B;
      calc.C:=C;
      p:=1/2*(A+B+C);
      calc.HA:=(2/A)*sqrt(p*(p-A)*(p-B)*(p-C));
      calc.HB:=(2/B)*sqrt(p*(p-A)*(p-B)*(p-C));
      calc.HC:=(2/C)*sqrt(p*(p-A)*(p-B)*(p-C));
 end;

procedure save_params(var s1, s2, s3: string; filename: string);
 var
   f: text;
 begin
      assign(f, filename);
      rewrite(f);
      writeln(f, s1);
      writeln(f, s2);
      writeln(f, s3);
      close(f);
 end;

procedure load_params(var s1, s2, s3: string; filename: string);
 var
   f: text;
 begin
     assign(f, filename);
     reset(f);
     readln(f, s1);
     readln(f, s2);
     readln(f, s3);
     close(f);
 end;


end.

