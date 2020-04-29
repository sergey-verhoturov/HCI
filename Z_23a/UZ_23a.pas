unit UZ_23a;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)    //Класс формы
    Button1: TButton;      //Начало поля класса
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    Load: TOpenDialog;
    MenuItem1: TMenuItem;
    Load2: TMenuItem;
    Save2: TMenuItem;
    SaveLog2: TMenuItem;
    Save: TSaveDialog;
    SaveLog: TSaveDialog;
    Reference: TMenuItem;
    ExitPrg: TMenuItem;
    StrCEdit: TEdit;        //Объект данного класса
    StrBEdit: TEdit;
    StrAEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;       //Конец поля класса
    procedure Button1Click(Sender: TObject);   //Методы класса
    procedure ExitPrgClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Load2Click(Sender: TObject);       //Если пользователь откажется от
    procedure ReferenceClick(Sender: TObject);    //выбора файлов, то выйдет ошибка 103
    procedure Save2Click(Sender: TObject);
    procedure SaveLog2Click(Sender: TObject);
    procedure StrAEditChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
    var A,B,C,p,HA,HB,HC:Real;
begin
     A:=StrToFloat(StrAEdit.Text);
     B:=StrToFloat(StrBEdit.Text);
     C:=StrToFloat(StrCEdit.Text);
     if A<0 then ShowMessage('Неправильно введена сторона A ');
     if B<0 then ShowMessage('Неправильно введена сторона B ');
     if C<0 then ShowMessage('Неправильно введена сторона C ');
     p:=1/2*(A+B+C);
     HA:=(2/A)*sqrt(p*(p-A)*(p-B)*(p-C));
     HB:=(2/B)*sqrt(p*(p-A)*(p-B)*(p-C));
     HC:=(2/C)*sqrt(p*(p-A)*(p-B)*(p-C));
     Memo1.Lines.Add('Сторона A');
     Memo1.Lines.Add( FloatToStr(A));
     Memo1.Lines.Add('Сторона B');
     Memo1.Lines.Add(FloatToStr(B));
     Memo1.Lines.Add('Сторона C');
     Memo1.Lines.Add( FloatToStr(C));
     Memo1.Lines.Add('Полупериметр');
     Memo1.Lines.Add(FloatToStr(p));
     Memo1.Lines.Add('Высота A');
     Memo1.Lines.Add(FloatToStr(HA));
     Memo1.Lines.Add('Высота B');
     Memo1.Lines.Add(FloatToStr(HB));
     Memo1.Lines.Add('Высота C');
     Memo1.Lines.Add(FloatToStr(HC));
     Memo1.Lines.Add('-----------------------');
end;

procedure TForm1.ExitPrgClick(Sender: TObject);
begin
  if Form1.CloseQuery then Form1.Close;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;


procedure TForm1.Load2Click(Sender: TObject);
var f: textfile;
  FName, s1, s2, s3 : string;
begin
  if Load.Execute then
begin
FName := Load.FileName;
AssignFile(f,FName);
Reset(f);
readln(f,s1);
readln(f,s2);
readln(f,s3);
StrAEdit.Text:= s1;
StrBEdit.Text:= s2;
StrCEdit.Text:= s3;
end;
closeFile(f);
end;

procedure TForm1.ReferenceClick(Sender: TObject);
begin
  ShowMessage ('Автор программы: Сергей Верхотуров; Номер задачи: Z_23a; Условие задачи: "Треугольник задан длинами сторон. Найти: а) длины высот;"; Ссылка на задачу в задачнике: "http://bgu-chita.ru/zadachnik/Glava01/index01.htm#z23"');
end;

procedure TForm1.Save2Click(Sender: TObject);
     var
  f:text;
  begin
     If Save.Execute then
  AssignFile(f, Save.FileName);
  Rewrite(f);
   write(f, 'Сторона А: ');
  write(f, StrAEdit.Text);
  write(f, 'Сторона B: ');
  write(f, StrBEdit.Text);
  write(f, 'Сторона C: ');
  write(f, StrCEdit.Text);
  closefile(f);
end;


procedure TForm1.SaveLog2Click(Sender: TObject);
begin
       If SaveLog.Execute then
  Memo1.Lines.SaveToFile(Savelog.FileName);
end;

procedure TForm1.StrAEditChange(Sender: TObject);
begin

end;

end.

