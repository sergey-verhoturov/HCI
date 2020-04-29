unit UZ_5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)    //Класс формы
    MainMenu1: TMainMenu;  //Начало поля класса
    Load: TOpenDialog;
    File1: TMenuItem;
    load1: TMenuItem;
    Save1: TMenuItem;
    SaveLog1: TMenuItem;
    Reference: TMenuItem;
    SaveLog: TSaveDialog;
    ClosePrg: TMenuItem;
    Result: TButton;
    Number1: TLabel;      //Объект данного класса
    Number2: TLabel;
    Memo1: TMemo;
    Number2Edit: TEdit;
    Number1Edit: TEdit;
    Save: TSaveDialog;       //Конец поля класса
    procedure ClosePrgClick(Sender: TObject);  //Методы класса
    procedure load1Click(Sender: TObject);     //Если пользователь откажется от
    procedure ReferenceClick(Sender: TObject); //выбора файлов, то выйдет ошибка 103
    procedure ResultClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Number1Click(Sender: TObject);
    procedure Number1EditChange(Sender: TObject);
    procedure Number2EditChange(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure SaveLog1Click(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;
  A,B:real;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Number2EditChange(Sender: TObject);
begin

end;


procedure TForm1.SaveLog1Click(Sender: TObject);
begin
        If SaveLog.Execute then
  Memo1.Lines.SaveToFile(Savelog.FileName);
end;

procedure TForm1.Save1Click(Sender: TObject);
var
 f:text;
begin
   If Save.Execute then
AssignFile(f, Save.FileName);
Rewrite(f);
 write(f, 'Число 1:');
write(f, Number1Edit.Text);
write(f, 'Число 2:');
write(f, Number2Edit.Text);
closefile(f);
end;


procedure TForm1.Number1EditChange(Sender: TObject);
begin

end;

procedure TForm1.ResultClick(Sender: TObject);
  var A,B,SrA,SrG:Real;
begin
     A:=StrToFloat(Number1Edit.Text);
     B:=StrToFloat(Number2Edit.Text);
     if A<0 then ShowMessage('Неправильно введёна 1 переменная ');
     if B<0 then ShowMessage('Неправильно введёна 2 переменная ');
     SrA:=sqrt(A*B);
     SrG:=(A+B)/2;
     Memo1.Lines.Add('Число 1:');
     Memo1.Lines.Add(FloatToStr(A));
     Memo1.Lines.Add('Число 2:');
     Memo1.Lines.Add(FloatToStr(B));
     Memo1.Lines.Add('Среднее арифметическое:');
     Memo1.Lines.Add(FloatToStr(SrA));
     Memo1.Lines.Add('Среднее геометрическое:');
     Memo1.Lines.Add(FloatToStr(SrG));
     Memo1.Lines.Add('-----------------------');
end;

procedure TForm1.Load1Click(Sender: TObject);
  var f: textfile;
    FName, s1, s2 : string;
  begin
    if Load.Execute then
  begin
  FName := Load.FileName;
  AssignFile(f,FName);
  Reset(f);
  readln(f,s1);
  readln(f,s2);
  Number1Edit.Text:= s1;
  Number2Edit.Text:= s2;
  end;
  closeFile(f);
  end;

procedure TForm1.ReferenceClick(Sender: TObject);
begin
  ShowMessage ('Автор программы: Сергей Верхотуров; Номер задачи: Z_5; Условие задачи: "Даны два действительных числа. Найти среднее арифметическое этих чисел и среднее геометрическое их модулей."; Ссылка на задачу в задачнике: "http://bgu-chita.ru/zadachnik/Glava01/index01.htm#z5"');
end;

procedure TForm1.ClosePrgClick(Sender: TObject);
begin
if Form1.CloseQuery then Form1.Close;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Number1Click(Sender: TObject);
begin

end;


end.

