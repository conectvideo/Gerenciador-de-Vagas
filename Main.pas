unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus,
  FireDAC.Phys.CDataLinkedInDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.CDataLinkedIn, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.StdCtrls, FireDAC.Phys.CDataYouTube,
  FireDAC.Phys.CDataYouTubeDef;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Novo1: TMenuItem;
    PostnoLinkedin1: TMenuItem;
    Relatrios1: TMenuItem;
    Config1: TMenuItem;
    Vaga1: TMenuItem;
    StatusBar1: TStatusBar;
    Competncia1: TMenuItem;
    NveldeExperincia1: TMenuItem;
    Setor1: TMenuItem;
    ipodeemprego1: TMenuItem;
    Funodetrabalho1: TMenuItem;
    FDPhysCDataLinkedInDriverLink1: TFDPhysCDataLinkedInDriverLink;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDManager1: TFDManager;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    DBMemo1: TDBMemo;
    Button3: TButton;
    DBGrid1: TDBGrid;
    FDQuery2: TFDQuery;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    FDQuery3: TFDQuery;
    DataSource3: TDataSource;
    TabSheet4: TTabSheet;
    DBGrid4: TDBGrid;
    FDQuery4: TFDQuery;
    DataSource4: TDataSource;
    TabSheet5: TTabSheet;
    DBGrid5: TDBGrid;
    FDQuery5: TFDQuery;
    DataSource5: TDataSource;
    TabSheet6: TTabSheet;
    FDQuery6: TFDQuery;
    DataSource6: TDataSource;
    DBGrid6: TDBGrid;
    TabSheet7: TTabSheet;
    FDQuery7: TFDQuery;
    DataSource7: TDataSource;
    DBGrid7: TDBGrid;
    TabSheet8: TTabSheet;
    DBGrid8: TDBGrid;
    FDQuery8: TFDQuery;
    DataSource8: TDataSource;
    TabSheet9: TTabSheet;
    DBGrid9: TDBGrid;
    FDQuery9: TFDQuery;
    DataSource9: TDataSource;
    TabSheet10: TTabSheet;
    DBGrid10: TDBGrid;
    FDQuery10: TFDQuery;
    DataSource10: TDataSource;
    TabSheet11: TTabSheet;
    DBGrid11: TDBGrid;
    FDQuery11: TFDQuery;
    DataSource11: TDataSource;
    FDConnection2: TFDConnection;
    Button4: TButton;
    Memo1: TMemo;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FDConnection1.connected := True;
  FDQuery1.Active := True;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  FDQuery2: TFDQuery;
  str_Sql: string;
begin
  // FDQuery2 := TFDQuery.Create(Self);
  // FDQuery2.Connection := FDConnection1;
  try
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Text :=
      'update CompanyStatusUpdates set Comment=:Comment where Id = :Id';

    FDQuery1.ParamByName('Comment').AsString :=
      FDQuery1.FieldByName('Comment').AsString;
    FDQuery1.ParamByName('Id').AsString := DBGrid1.Columns.Items[0]
      .Field.AsString;
    FDQuery1.ExecSQL;
    FDQuery1.Active := False;
    FDQuery1.Open;
    // RowsAffected := FDQuery1.RowsAffected;
  finally
    // FDQuery2.Disconnect(True);
    // FDQuery2.Free;
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  FDQuery1.Edit;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i: integer;
begin
  try
    FDQuery1.Open();

    while not FDQuery1.Eof do
    begin
      for i := 0 to FDQuery1.Fields.Count - 1 do
      begin
        Memo1.Lines.Add(FDQuery1.Fields[i].FieldName);
        Memo1.Lines.Add(FDQuery1.Fields[i].AsString);
        Memo1.Lines.Add(IntToStr(FDQuery1.Fields[i].DataSize));
      end;
      FDQuery1.Next;
    end;
  finally
    FDQuery1.Close;
    FDQuery1.Free;
  end;

end;

procedure TForm1.Button5Click(Sender: TObject);
var
  RowsAffected: integer;
  qry_insert: TFDQuery;
  str_Sql: string;

begin
  RowsAffected := FDConnection1.ExecSQL('insert into CompanyStatusUpdates (Comment,CompanyId) values (:Comment,:CompanyId)', ['Check out developer.linkedin.com!','2217644']);
//  qry_insert := TFDQuery.Create(Self);
//  qry_insert.Connection := FDConnection1;
//  try
//    str_Sql := ' Insert into  CompanyStatusUpdates ';
//    str_Sql := str_Sql + ' (CompanyId,Comment)';
//    str_Sql := str_Sql + ' values (:pCompanyId, :pComment)';
//    //str_Sql := str_Sql + ' Where CompanyId = ' + QuotedStr('2217644');
//    qry_insert.SQL.Text := str_Sql;
//
//    qry_insert.ParamByName('pCompanyId').AsString := '2217644';
//    qry_insert.ParamByName('pComment').AsString := 'TESTE de POST';
//
//    ShowMessage('SQL foi: ' + qry_insert.SQL.Text);
//    qry_insert.ExecSQL;
//
//  finally
//    qry_insert.Disconnect(True);
//    qry_insert.Free;
//  end;
end;

end.
