<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectsUsers.aspx.cs" Inherits="Database_Coursework.ProjectsUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PRODUCTID,USERID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="PRODUCTID" HeaderText="PRODUCTID" ReadOnly="True" SortExpression="PRODUCTID" />
                <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECTSUSERS&quot; WHERE &quot;PRODUCTID&quot; = :PRODUCTID AND &quot;USERID&quot; = :USERID" InsertCommand="INSERT INTO &quot;PROJECTSUSERS&quot; (&quot;PRODUCTID&quot;, &quot;USERID&quot;) VALUES (:PRODUCTID, :USERID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;PROJECTSUSERS&quot;">
            <DeleteParameters>
                <asp:Parameter Name="PRODUCTID" Type="Decimal" />
                <asp:Parameter Name="USERID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PRODUCTID" Type="Decimal" />
                <asp:Parameter Name="USERID" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="PRODUCTID,USERID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                PRODUCTID:
                <asp:Label ID="PRODUCTIDLabel1" runat="server" Text='<%# Eval("PRODUCTID") %>' />
                <br />
                USERID:
                <asp:Label ID="USERIDLabel1" runat="server" Text='<%# Eval("USERID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                PRODUCTID:
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="PROJECTNAME" DataValueField="PROJECTID" SelectedValue='<%# Bind("PRODUCTID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                <br />
                USERID:
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="USERNAME" DataValueField="USERID" SelectedValue='<%# Bind("USERID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                PRODUCTID:
                <asp:Label ID="PRODUCTIDLabel" runat="server" Text='<%# Eval("PRODUCTID") %>' />
                <br />
                USERID:
                <asp:Label ID="USERIDLabel" runat="server" Text='<%# Eval("USERID") %>' />
                <br />
                
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
