<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="compare.aspx.cs" Inherits="StockExchange.compare" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            width: 156px;
        }
        .auto-style3 {
            width: 156px;
            height: 29px;
        }
        .auto-style4 {
            height: 29px;
        }
        .auto-style5 {
            width: 440px;
        }
        .auto-style6 {
            height: 29px;
            width: 440px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        INWESTEX</div>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Font-Names="Calibri" Text="Amount to invest"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox1" runat="server" Font-Names="Calibri"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Double precission separated by comma" Font-Names="Calibri" ValidationExpression="[+]?[0-9]*\,?[0-9]*"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Interest rate</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox4" runat="server" Font-Names="Calibri"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Double precission separated by comma" Font-Names="Calibri" ValidationExpression="[+]?[0-9]*\,?[0-9]*"></asp:RegularExpressionValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Font-Names="Calibri" Text="Investment start date"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox2" runat="server" Font-Names="Calibri"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Insert date in correct format  ex. 2016-04-01" Font-Names="Calibri" ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$"></asp:RegularExpressionValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label3" runat="server" Font-Names="Calibri" Text="Investment end date"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox3" runat="server" Font-Names="Calibri"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Insert date in correct format  ex. 2016-04-01" Font-Names="Calibri" ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Compare" />
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Main.aspx">Go back to main page</asp:HyperLink>
                </td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="Label6" runat="server"></asp:Label>
                    <asp:Label ID="Label7" runat="server"></asp:Label>
                </td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
