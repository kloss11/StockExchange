<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="StockExchange.Main" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            width: 875px;
        }
        .auto-style3 {
            width: 798px;
        }
        .auto-style4 {
            width: 875px;
            height: 46px;
        }
        .auto-style5 {
            width: 798px;
            height: 46px;
        }
        .auto-style6 {
            height: 46px;
        }
        .auto-style7 {
            width: 875px;
            height: 57px;
        }
        .auto-style8 {
            width: 798px;
            height: 57px;
        }
        .auto-style9 {
            height: 57px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        INWESTEX<br />
        </div>
        <table style="width:100%;">
            <tr>
                <td rowspan="6">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" EnableSortingAndPagingCallbacks="True" Font-Names="Calibri" Font-Size="Smaller" ForeColor="Black" GridLines="Vertical" Height="561px" PageSize="15" Width="174px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                            <asp:BoundField DataField="value" HeaderText="value" SortExpression="value" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [date], [value] FROM [ImportedData] ORDER BY [date]"></asp:SqlDataSource>
                    <br />
                </td>
                <td colspan="3">
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="374px" style="margin-bottom: 0px" Width="1092px">
                        <series>
                            <asp:Series ChartType="Line" Name="Series1" XValueMember="date" YValueMembers="value">
                            </asp:Series>
                        </series>
                        <chartareas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </chartareas>
                        <Titles>
                            <asp:Title Font="Calibri, 14.25pt" Name="Title1" Text="Results review">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" Font-Names="Calibri" Font-Size="Medium" Text="Please choose start and end date for detail view"></asp:Label>
                    <br />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Year: <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Year" DataTextField="Column1" DataValueField="Column1">
                    </asp:DropDownList>
                    Month:
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Value="01">January</asp:ListItem>
                        <asp:ListItem Value="02">February</asp:ListItem>
                        <asp:ListItem Value="03">March</asp:ListItem>
                        <asp:ListItem Value="04">April</asp:ListItem>
                        <asp:ListItem Value="05">May</asp:ListItem>
                        <asp:ListItem Value="06">June</asp:ListItem>
                        <asp:ListItem Value="07">July</asp:ListItem>
                        <asp:ListItem Value="08">August</asp:ListItem>
                        <asp:ListItem Value="09">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="11">December</asp:ListItem>
                    </asp:DropDownList>
                    Day:
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    Year:
                    <asp:DropDownList ID="DropDownList4" runat="server" datasourceid="Year" DataTextField="Column1" DataValueField="Column1">
                    </asp:DropDownList>
                    Month:
                    <asp:DropDownList ID="DropDownList5" runat="server">
                        <asp:ListItem Value="01">January</asp:ListItem>
                        <asp:ListItem Value="02">February</asp:ListItem>
                        <asp:ListItem Value="03">March</asp:ListItem>
                        <asp:ListItem Value="04">April</asp:ListItem>
                        <asp:ListItem Value="05">May</asp:ListItem>
                        <asp:ListItem Value="06">June</asp:ListItem>
                        <asp:ListItem Value="07">July</asp:ListItem>
                        <asp:ListItem Value="08">August</asp:ListItem>
                        <asp:ListItem Value="09">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="11">December</asp:ListItem>
                    </asp:DropDownList>
                    Day:
                    <asp:DropDownList ID="DropDownList6" runat="server">
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style9">
                    </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Generate" />
                    <asp:SqlDataSource ID="Year" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT DATEPART(yy,[date]) 
FROM ImportedData 
ORDER BY DATEPART(yy,[date]) 
"></asp:SqlDataSource>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Calibri" NavigateUrl="~/compare.aspx">Click here to compare benefits </asp:HyperLink>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                    <br />
                    <br />
                    Import file:</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td style="font-family: Calibri; border: medium solid #0000FF; padding: inherit">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Import from file" />
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Delete old data" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td style="font-family: Calibri; border: medium solid #0000FF; padding: inherit">
                    <asp:Label ID="Label1" runat="server" Text="Msg:" Font-Names="Calibri"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
