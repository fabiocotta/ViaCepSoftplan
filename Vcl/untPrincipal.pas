unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.CategoryButtons, Vcl.Buttons,
  Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList;

type
  TfrmPrincipal = class(TForm)
    ImageList: TImageList;
    pTela: TPanel;
    pNavbar: TPanel;
    Image2: TImage;
    Image3: TImage;
    pUsuario: TPanel;
    lblNome: TLabel;
    lblEmail: TLabel;
    pContainer: TPanel;
    sMenu: TSplitView;
    pLogo: TPanel;
    btnMenu: TSpeedButton;
    imgLogo: TImage;
    CategoryMenuButtons: TCategoryButtons;
    sSubMenu: TSplitView;
    Panel1: TPanel;
    Label1: TLabel;
    btnCloseSub: TSpeedButton;
    CategorySubmenuButtons: TCategoryButtons;
    procedure btnMenuClick(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items1Click(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items5Click(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items2Click(Sender: TObject);
    procedure CategorySubmenuButtonsCategories0Items0Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseSubClick(Sender: TObject);
  private
    procedure CloseSubMenu;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Vcl.Loading, Vcl.Navigation, Vcl.Session, untEnderecos;

procedure TFrmPrincipal.btnCloseSubClick(Sender: TObject);
begin
    CloseSubMenu;
end;

procedure TfrmPrincipal.btnMenuClick(Sender: TObject);
begin
  sMenu.Opened := NOT sMenu.Opened;
end;

procedure TfrmPrincipal.CategoryMenuButtonsCategories0Items1Click(
  Sender: TObject);
begin
 CloseSubMenu;
    TNavigation.Open(TFrmEnderecos, FrmEnderecos, pContainer);
end;

procedure TfrmPrincipal.CategoryMenuButtonsCategories0Items2Click(
  Sender: TObject);
begin
  sSubMenu.Opened := true;
end;

procedure TfrmPrincipal.CategoryMenuButtonsCategories0Items5Click(
  Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmPrincipal.CategorySubmenuButtonsCategories0Items0Click(
  Sender: TObject);
begin
  CloseSubMenu;
  TNavigation.Open(TFrmEnderecos, FrmEnderecos, pContainer);
end;

procedure TFrmPrincipal.CloseSubMenu;
begin
    if sSubMenu.Opened then
    begin
        sSubMenu.Opened := false;
        CategorySubmenuButtons.SelectedItem := nil;
        sMenu.SetFocus;
    end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    lblNome.Caption := TSession.NOME;
    lblEmail.Caption := TSession.EMAIL;
end;

end.
