unit StartUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TTest = class
    Data: array [0 .. 10] of Char;
    Caption: string;
    Description: string;
    procedure ShowCaption;
    procedure ShowDescription;
    procedure ShowData;
  end;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    FT: TTest;
    procedure InitData(Value: PChar);
  end;

type
  TMyEnum1 = (en1, en2, en3, en4, en5);
  TMyEnum2 = en1 .. en3;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TTest.ShowCaption;
begin
  ShowMessage(Caption);
end;

procedure TTest.ShowData;
begin
  ShowMessage(PChar(@Data[0]));
end;

procedure TTest.ShowDescription;
begin
  ShowMessage(Description);
end;

{ TForm1 }
procedure TForm1.FormCreate(Sender: TObject);
begin
  FT := TTest.Create;
  try
    FT.Caption := 'Test caption';
    FT.Description := 'Test Description';
    InitData(@FT.Data[0]);
    FT.ShowCaption;
    FT.ShowDescription;
    FT.ShowData;
  finally
    FT.Free;
  end;
end;

procedure TForm1.InitData(Value: PChar);
const
  ValueData = 'Test data value';
var
  I: Integer;
begin
  for I := 1 to Length(ValueData) do
  begin
    Value^ := ValueData[I];
    Inc(Value);
  end;
end;

end.
