unit UZ_23a;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Logic;

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
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Load2Click(Sender: TObject);       //Если пользователь откажется от
    procedure Memo1Change(Sender: TObject);
    procedure ReferenceClick(Sender: TObject);    //выбора файлов, то выйдет ошибка 103
    procedure Save2Click(Sender: TObject);
    procedure SaveLog2Click(Sender: TObject);
    procedure StrAEditChange(Sender: TObject);
    procedure DataFromForm();
  private

  public

  end;

var
  Form1: TForm1;
  A,B,C:real;
  var calcM: array[1..128] of Calculation;
  var calc: Calculation;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.DataFromForm();
begin
  if TryStrToFloat(StrAEdit.Text, A) = false then
    begin
    StrAEdit.Color:= clGradientActiveCaption;
    ShowMessage('Неправильно введён параметр A');
    exit;
    end;

  if TryStrToFloat(StrBEdit.Text, B) = false then
      begin
      ShowMessage('Неправильно введён параметр B');
      exit;
      end;

    if TryStrToFloat(StrCEdit.Text, C) = false then
      begin
      ShowMessage('Неправильно введён параметр C');
      exit;
      end;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
    DataFromForm();
     calcHeight(A,B,C,calc);
     Memo1.Lines.Add('Сторона A');
     Memo1.Lines.Add(FloatToStr(calc.A));
     Memo1.Lines.Add('Сторона B');
     Memo1.Lines.Add(FloatToStr(calc.B));
     Memo1.Lines.Add('Сторона C');
     Memo1.Lines.Add( FloatToStr(calc.C));
     Memo1.Lines.Add('Высота A');
     Memo1.Lines.Add(FloatToStr(calc.HA));
     Memo1.Lines.Add('Высота B');
     Memo1.Lines.Add(FloatToStr(calc.HB));
     Memo1.Lines.Add('Высота C');
     Memo1.Lines.Add(FloatToStr(calc.HC));
     Memo1.Lines.Add('-----------------------');
end;

procedure TForm1.ExitPrgClick(Sender: TObject);
begin
  if Form1.CloseQuery then Form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;


procedure TForm1.Load2Click(Sender: TObject);
     var s1, s2, s3 : real;
       begin
         if Load.Execute then
       begin
       if load.FileName <> '' then
            begin
      load_params(s1,s2, s3, load.filename);
      StrAEdit.Text:=FloatToStr(s1);
      StrBEdit.Text:=FloatToStr(s2);
      StrCEdit.Text:=FloatToStr(s3);
            end;
       end;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.ReferenceClick(Sender: TObject);
begin
  ShowMessage ('Автор программы: Сергей Верхотуров; Номер задачи: Z_23a; Условие задачи: "Треугольник задан длинами сторон. Найти: а) длины высот;"; Ссылка на задачу в задачнике: "http://bgu-chita.ru/zadachnik/Glava01/index01.htm#z23"');
end;

procedure TForm1.Save2Click(Sender: TObject);
    var s1,s2, s3: real;
   begin
   if Savelog.Execute then
          if Savelog.FileName <> '' then
              begin
   s1:=StrToFloat(Form1.StrAEdit.Text);
   s2:=StrToFloat(Form1.StrBEdit.Text);
   s3:=StrToFloat(Form1.StrCEdit.Text);
   save_params(s1,s2, s3, Savelog.filename);
   end;
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

