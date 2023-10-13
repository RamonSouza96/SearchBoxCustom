unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Controls.Presentation, FMX.Edit,
  FMX.SearchBox;

type
  TForm1 = class(TForm)
    ListView1: TListView;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Edit1ChangeTracking(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SearchItem(AList: TListView);
  end;

var
  Form1: TForm1;
  SearchBoxList: TSearchBox;

implementation

{$R *.fmx}


procedure TForm1.SearchItem(AList: TListView);
var
  I: Integer;
begin
  AList.SearchVisible := True;

  // Procurar o TSearchBox dentro dos controles do TListView
  for I := 0 to AList.Controls.Count - 1 do
  begin
    if AList.Controls[I] is TSearchBox then
    begin
      SearchBoxList := TSearchBox(AList.Controls[I]);
      Break;
    end;
  end;

  // Verificar se encontrou o TSearchBox e definir sua Opacity
  if Assigned(SearchBoxList) then
  begin
    SearchBoxList.Opacity := 0;
  end;
end;

procedure TForm1.Edit1ChangeTracking(Sender: TObject);
begin
  SearchBoxList.Text := Edit1.Text;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  LItem: TListViewItem;
begin
  ListView1.Items.Clear;

  for var I := 0 to 100 do
  begin
    LItem := ListView1.Items.Add;
    LItem.Tag :=  I;
    LItem.Text := 'Item Text' + I.ToString;
    LItem.Detail := 'Item Detail' + I.ToString;
    LItem.Objects.TextObject.Font.Family := 'Poppins';
    LItem.Objects.TextObject.Font.Size := 15;
  end;

 SearchItem(ListView1);
end;

end.
