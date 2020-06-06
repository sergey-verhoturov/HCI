unit logic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
  Calculation = record
    A, B: Real;
    SrA, SrG: Real;
  end;

function calcSR(A:real; B: Real; var calc:Calculation):real;
procedure load_params(var s1, s2: real; filename: string);
procedure save_params(var s1, s2: real; filename: string);


implementation


function calcSR(A:real; B: Real; var calc:Calculation):real;
 begin
      calc.A:=A;
      calc.B:=B;
      calc.SrA:=sqrt(A*B);
      calc.SrG:=(A+B)/2;;
 end;

procedure save_params(var s1, s2:real; filename: string);
 var
   f: text;
 begin
      assign(f, filename);
      rewrite(f);
      writeln(f, s1);
      writeln(f, s2);
      close(f);
 end;

procedure load_params(var s1, s2: real; filename: string);
 var
   f: text;
 begin
     assign(f, filename);
     reset(f);
     readln(f, s1);
     readln(f, s2);
     close(f);
 end;

end.

