<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TasksProjectsUsers.aspx.cs" Inherits="Database_Coursework.TasksProjectsUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASKID,USERID,PROJECTID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="TASKID" HeaderText="TASKID" ReadOnly="True" SortExpression="TASKID" />
                <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" ReadOnly="True" SortExpression="PROJECTID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TASKSPROJECTSUSERS&quot; WHERE &quot;TASKID&quot; = :TASKID AND &quot;USERID&quot; = :USERID AND &quot;PROJECTID&quot; = :PROJECTID" InsertCommand="INSERT INTO &quot;TASKSPROJECTSUSERS&quot; (&quot;TASKID&quot;, &quot;USERID&quot;, &quot;PROJECTID&quot;) VALUES (:TASKID, :USERID, :PROJECTID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;USERID&quot;, &quot;PROJECTID&quot; FROM &quot;TASKSPROJECTSUSERS&quot;">
            <DeleteParameters>
                <asp:Parameter Name="TASKID" Type="Decimal" />
                <asp:Parameter Name="USERID" Type="Decimal" />
                <asp:Parameter Name="PROJECTID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TASKID" Type="Decimal" />
                <asp:Parameter Name="USERID" Type="Decimal" />
                <asp:Parameter Name="PROJECTID" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASKID,USERID,PROJECTID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                TASKID:
                <asp:Label ID="TASKIDLabel1" runat="server" Text='<%# Eval("TASKID") %>' />
                <br />
                USERID:
                <asp:Label ID="USERIDLabel1" runat="server" Text='<%# Eval("USERID") %>' />
                <br />
                PROJECTID:
                <asp:Label ID="PROJECTIDLabel1" runat="server" Text='<%# Eval("PROJECTID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                TASKID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="TASKNAME" DataValueField="TASKID" SelectedValue='<%# Bind("TASKID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
                <br />
                USERID:
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="USERNAME" DataValueField="USERID" SelectedValue='<%# Bind("USERID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
                <br />
                PROJECTID:
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="PROJECTNAME" DataValueField="PROJECTID" SelectedValue='<%# Bind("PROJECTID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                TASKID:
                <asp:Label ID="TASKIDLabel" runat="server" Text='<%# Eval("TASKID") %>' />
                <br />
                USERID:
                <asp:Label ID="USERIDLabel" runat="server" Text='<%# Eval("USERID") %>' />
                <br />
                PROJECTID:
                <asp:Label ID="PROJECTIDLabel" runat="server" Text='<%# Eval("PROJECTID") %>' />
                <br />
               
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
