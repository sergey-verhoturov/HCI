unit UZ_5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Grids,
  logic;

type

  { TForm1 }

  TForm1 = class(TForm)    //Класс формы
    MainMenu1: TMainMenu;  //Начало поля класса
    Load: TOpenDialog;
    File1: TMenuItem;
    load1: TMenuItem;
    Memo1: TMemo;
    Save1: TMenuItem;
    SaveLog1: TMenuItem;
    Reference: TMenuItem;
    SaveLog: TSaveDialog;
    ClosePrg: TMenuItem;
    Result: TButton;
    Number1: TLabel;      //Объект данного класса
    Number2: TLabel;
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
    function DataFromForm:boolean;

  private

  public

  end;

var
  Form1: TForm1;
  A,B:real;
  var calcM: array[1..128] of Calculation;
  var calc: Calculation;
  row:integer;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.DataFromForm:boolean;
var err:string;
flag:boolean;
begin
  result:=false; flag:=false;
  if TryStrToFloat(Number1Edit.text,A) = false then
  begin
     err:=err+'Неверный ввод параметра A'+#10;
     Number1Edit.Color:=clRed; flag:=True;
  end
  else Number1Edit.Color:=clWhite;

  if TryStrToFloat(Number2Edit.text,B)=false then
    begin
    err:=err+'Неверный ввод параметра B'+#10;
    Number2Edit.Color:=clRed; flag:=True;
    end
  else Number2Edit.Color:=clWhite;

  if flag = true then
  begin
  ShowMessage(err);
  exit;
  end;
  result:=true;
end;

procedure TForm1.Number2EditChange(Sender: TObject);
begin

end;


procedure TForm1.SaveLog1Click(Sender: TObject);

begin
          If SaveLog.Execute then
  Memo1.Lines.SaveToFile(Savelog.FileName);

end;


procedure TForm1.Save1Click(Sender: TObject);
  var s1,s2: real;
   begin
   if DataFromForm = False then exit;
   if Savelog.Execute then
          if Savelog.FileName <> '' then
              begin
   s1:=StrToFloat(Form1.Number1Edit.Text);
   s2:=StrToFloat(Form1.Number2Edit.Text);
   save_params(s1,s2, Savelog.filename);
   end;
end;


procedure TForm1.Number1EditChange(Sender: TObject);
begin

end;

procedure TForm1.ResultClick(Sender: TObject);
begin
if DataFromForm = False then exit;
calcSR(A,B,calc);
Memo1.Lines.Add('Число 1:');
Memo1.Lines.Add(FloatToStr(calc.A));
Memo1.Lines.Add('Число 2:');
Memo1.Lines.Add(FloatToStr(calc.B));
Memo1.Lines.Add('Среднее арифметическое:');
Memo1.Lines.Add(FloatToStr(calc.SrA));
Memo1.Lines.Add('Среднее геометрическое:');
Memo1.Lines.Add(FloatToStr(calc.SrG));
Memo1.Lines.Add('-----------------------');
end;

procedure TForm1.Load1Click(Sender: TObject);
var s1, s2 : real;
  begin
    if Load.Execute then
  begin
  if load.FileName <> '' then
       begin
 load_params(s1,s2,load.filename);
 Number1Edit.Text:=FloatToStr(s1);
 Number2Edit.Text:=FloatToStr(s2);
       end;
  end;

  end;

//procedure TForm1.Memo1Change(Sender: TObject);
//begin
//
//end;

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

