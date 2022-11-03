<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="LatihanValidasi._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary runat="server" ID="valSummary" HeaderText="Daftar Error: " ForeColor="Red" DisplayMode="BulletList" ShowSummary="true" ValidationGroup="valKirim" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">Nama <span style="color: red">*</span></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tbNama" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="reqTbNama" ControlToValidate="tbNama" ErrorMessage=" Nama harus diisi!" ForeColor="Red" Display="None" ValidationGroup="valKirim"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">Email <span style="color: red">*</span></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="reqTbEmail" ControlToValidate="tbEmail" ErrorMessage=" Email harus diisi!" ForeColor="Red" Display="None" ValidationGroup="valKirim"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="regTbEmail" ControlToValidate="tbEmail" ErrorMessage=" Format email salah!" ForeColor="Red" Display="None" ValidationGroup="valKirim" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">Password <span style="color: red">*</span></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="reqTbPassword" ControlToValidate="tbPassword" ErrorMessage=" Password harus diisi!" ForeColor="Red" Display="None" ValidationGroup="valKirim"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">Konfirmasi Password <span style="color: red">*</span></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tbKonfirmasiPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="reqTbKonfirmasiPassword" ControlToValidate="tbKonfirmasiPassword" ErrorMessage=" Konfirmasi Password harus diisi!" ForeColor="Red" Display="None" ValidationGroup="valKirim"></asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" ID="comTxtPasswordKonfirmasi" ControlToValidate="tbKonfirmasiPassword" ControlToCompare="tbPassword" ErrorMessage="Password Konfirmasi tidak sama" ForeColor="Red" Display="None" ValidationGroup="valKirim"></asp:CompareValidator>

                    </td>
                </tr>

                <tr>
                    <td colspan="2">Jenis Kelamin <span style="color: red">*</span></td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="ddJenisKelamin" runat="server">
                            <asp:ListItem Text="-- Pilih Jenis Kelamin --" Value="" Selected Disabled></asp:ListItem>
                            <asp:ListItem Text="Laki-laki" Value="Laki-laki"></asp:ListItem>
                            <asp:ListItem Text="Perempuan" Value="Perempuan"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="reqDDJenisKelamin" ControlToValidate="ddJenisKelamin" ErrorMessage="Jenis Kelamin harus dipilih!" ForeColor="Red" Display="None" ValidationGroup="valKirim"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Button ID="btnKirim" runat="server" Text="Kirim" ValidationGroup="valKirim" OnClick="btnKirim_Click1" />
                    </td>
                </tr>
            </table>

            <br />

            <asp:GridView runat="server" ID="gridData" AllowPaging="true" PageSize="1" AllowSorting="false" ShowHeader="true" ShowHeaderWhenEmpty="true" EmptyDataText="Tidak Ada Data" AutoGenerateColumns="false" OnRowCommand="gridData_RowCommand" OnPageIndexChanging="gridData_PageIndexChanging" DataKeyNames="nomor">
                <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                <Columns>
                    <asp:BoundField HeaderText="No" DataField="nomor" />
                    <asp:BoundField HeaderText="Nama" DataField="nama" />
                    <asp:BoundField HeaderText="Email" DataField="email" />
                    <asp:BoundField HeaderText="Password" DataField="password" />
                    <asp:BoundField HeaderText="Jenis Kelamin" DataField="jenisKelamin" />
                    <asp:TemplateField HeaderText="Aksi">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="linkHapus" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex")%>'><i class="bi bi-trash"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
