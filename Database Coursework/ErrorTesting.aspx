<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorTesting.aspx.cs" Inherits="Database_Coursework.ErrorTesting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONES&quot; WHERE &quot;MILESTONEID&quot; = :MILESTONEID" InsertCommand="INSERT INTO &quot;MILESTONES&quot; (&quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;MILESTONESTARTDATE&quot;, &quot;MILESTONEDUEDATE&quot;, &quot;MILESTONESTATUS&quot;, &quot;PROJECTID&quot;) VALUES (:MILESTONEID, :MILESTONENAME, :MILESTONESTARTDATE, :MILESTONEDUEDATE, :MILESTONESTATUS, :PROJECTID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;MILESTONESTARTDATE&quot;, &quot;MILESTONEDUEDATE&quot;, &quot;MILESTONESTATUS&quot;, &quot;PROJECTID&quot; FROM &quot;MILESTONES&quot;" UpdateCommand="UPDATE &quot;MILESTONES&quot; SET &quot;MILESTONENAME&quot; = :MILESTONENAME, &quot;MILESTONESTARTDATE&quot; = :MILESTONESTARTDATE, &quot;MILESTONEDUEDATE&quot; = :MILESTONEDUEDATE, &quot;MILESTONESTATUS&quot; = :MILESTONESTATUS, &quot;PROJECTID&quot; = :PROJECTID WHERE &quot;MILESTONEID&quot; = :MILESTONEID">
            <DeleteParameters>
                <asp:Parameter Name="MILESTONEID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                <asp:Parameter Name="MILESTONENAME" Type="String" />
                <asp:Parameter Name="MILESTONESTARTDATE" Type="DateTime" />
                <asp:Parameter Name="MILESTONEDUEDATE" Type="DateTime" />
                <asp:Parameter Name="MILESTONESTATUS" Type="String" />
                <asp:Parameter Name="PROJECTID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MILESTONENAME" Type="String" />
                <asp:Parameter Name="MILESTONESTARTDATE" Type="DateTime" />
                <asp:Parameter Name="MILESTONEDUEDATE" Type="DateTime" />
                <asp:Parameter Name="MILESTONESTATUS" Type="String" />
                <asp:Parameter Name="PROJECTID" Type="Decimal" />
                <asp:Parameter Name="MILESTONEID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="MILESTONEID" HeaderText="MILESTONEID" ReadOnly="True" SortExpression="MILESTONEID" />
                <asp:BoundField DataField="MILESTONENAME" HeaderText="MILESTONENAME" SortExpression="MILESTONENAME" />
                <asp:BoundField DataField="MILESTONESTARTDATE" HeaderText="MILESTONESTARTDATE" SortExpression="MILESTONESTARTDATE" />
                <asp:BoundField DataField="MILESTONEDUEDATE" HeaderText="MILESTONEDUEDATE" SortExpression="MILESTONEDUEDATE" />
                <asp:BoundField DataField="MILESTONESTATUS" HeaderText="MILESTONESTATUS" SortExpression="MILESTONESTATUS" />
                <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" SortExpression="PROJECTID" />
            </Columns>
        </asp:GridView>
        <asp:FormView ID="FormView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource1" GridLines="Both">
            <EditItemTemplate>
                MILESTONEID:
                <asp:Label ID="MILESTONEIDLabel1" runat="server" Text='<%# Eval("MILESTONEID") %>' />
                <br />
                MILESTONENAME:
                <asp:TextBox ID="MILESTONENAMETextBox" runat="server" Text='<%# Bind("MILESTONENAME") %>' />
                <br />
                MILESTONESTARTDATE:
                <asp:TextBox ID="MILESTONESTARTDATETextBox" runat="server" Text='<%# Bind("MILESTONESTARTDATE") %>' />
                <br />
                MILESTONEDUEDATE:
                <asp:TextBox ID="MILESTONEDUEDATETextBox" runat="server" Text='<%# Bind("MILESTONEDUEDATE") %>' />
                <br />
                MILESTONESTATUS:
                <asp:TextBox ID="MILESTONESTATUSTextBox" runat="server" Text='<%# Bind("MILESTONESTATUS") %>' />
                <br />
                PROJECTID:
                <asp:TextBox ID="PROJECTIDTextBox" runat="server" Text='<%# Bind("PROJECTID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                MILESTONEID:
                <asp:TextBox ID="MILESTONEIDTextBox" runat="server" Text='<%# Bind("MILESTONEID") %>' />
                <br />
                MILESTONENAME:
                <asp:TextBox ID="MILESTONENAMETextBox" runat="server" Text='<%# Bind("MILESTONENAME") %>' />
                <br />
                MILESTONESTARTDATE:
                <asp:TextBox ID="MILESTONESTARTDATETextBox" runat="server" Text='<%# Bind("MILESTONESTARTDATE") %>' />
                <br />
                MILESTONEDUEDATE:
                <asp:TextBox ID="MILESTONEDUEDATETextBox" runat="server" Text='<%# Bind("MILESTONEDUEDATE") %>' />
                <br />
                MILESTONESTATUS:
                <asp:TextBox ID="MILESTONESTATUSTextBox" runat="server" Text='<%# Bind("MILESTONESTATUS") %>' />
                <br />
                PROJECTID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" DataValueField="PROJECTID" SelectedValue='<%# Bind("PROJECTID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                MILESTONEID:
                <asp:Label ID="MILESTONEIDLabel" runat="server" Text='<%# Eval("MILESTONEID") %>' />
                <br />
                MILESTONENAME:
                <asp:Label ID="MILESTONENAMELabel" runat="server" Text='<%# Bind("MILESTONENAME") %>' />
                <br />
                MILESTONESTARTDATE:
                <asp:Label ID="MILESTONESTARTDATELabel" runat="server" Text='<%# Bind("MILESTONESTARTDATE") %>' />
                <br />
                MILESTONEDUEDATE:
                <asp:Label ID="MILESTONEDUEDATELabel" runat="server" Text='<%# Bind("MILESTONEDUEDATE") %>' />
                <br />
                MILESTONESTATUS:
                <asp:Label ID="MILESTONESTATUSLabel" runat="server" Text='<%# Bind("MILESTONESTATUS") %>' />
                <br />
                PROJECTID:
                <asp:Label ID="PROJECTIDLabel" runat="server" Text='<%# Bind("PROJECTID") %>' />
                <br />

                
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        </asp:FormView>
    </form>
</body>
</html>
