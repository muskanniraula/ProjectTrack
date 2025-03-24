﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="Database_Coursework.Comments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Comment Management</title>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
    <style>
                body {
    background-color: #f8f9fa;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #495057;
    line-height: 1.6;
}
.navbar {
    background-color: #ffffff;
    box-shadow: 0 1px 6px rgba(0, 0, 0, 0.05);
    padding: 15px 0;
    margin-bottom: 24px;
    position: sticky; /* Make navbar sticky */
    top: 0; /* Stay at the top of the viewport */
    z-index: 1000;
}
.navbar-brand {
    font-weight: 500;
    font-size: 1.3rem;
    color: #3a506b;
    letter-spacing: 0.5px;
}
.nav-link {
    color: #5a6978;
    font-weight: 400;
    padding: 10px 16px;
    position: relative;
}
.nav-link:hover {
    color: #3a506b;
}
.active:after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 16px;
    right: 16px;
    height: 2px;
    background-color: #3a506b;
}
        .page-title {
            color: #212529;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid #dee2e6;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            margin-bottom: 10px;
        }
        .grid-container {
            overflow-x: auto;
            margin-bottom: 30px;
        }
        .btn-space {
            margin-right: 5px;
        }
        .form-view-container {
            background-color: #f1f3f5;
            padding: 20px;
            border-radius: 8px;
            margin-top: 25px;
        }
        #GridView1 {
            width: 100%;
        }
        #GridView1 th {
            background-color: #343a40;
            color: white;
            padding: 12px;
            font-weight: 500;
        }
        #GridView1 td {
            padding: 10px;
        }
        #GridView1 tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        #GridView1 tr:hover {
            background-color: #e9ecef;
        }
        .action-links a {
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 4px;
            display: inline-block;
            margin-right: 5px;
        }
        .form-label {
            font-weight: bold;
            margin-bottom: 5px;
            display: inline-block;
        }
    </style>
                                              <!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="Home.aspx">
            <i class="fas fa-tasks mr-2"></i>ProjectTrack
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Home.aspx">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Users.aspx">Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Projects.aspx">Projects</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Milestones.aspx">Milestones</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Tasks.aspx">Tasks</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="SubTasks.aspx">SubTasks</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Comments.aspx">Comments</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Resources.aspx">Resources</a>
                </li>
                <!-- Complex Forms Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="complexFormsDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Complex Forms
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="complexFormsDropdown">
                        <li><a class="dropdown-item" href="ComplexForm(TopPerformer).aspx">Top Performer</a></li>
                        <li><a class="dropdown-item" href="ComplexForm(UsersProjects).aspx">Users Projects</a></li>
                        <li><a class="dropdown-item" href="ComplexForm(projectsmilestones).aspx">Projects Milestones</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="page-title">Comment Management</h2>
            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="COMMENTID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-sm btn-outline-primary btn-space" />
                        <asp:BoundField DataField="COMMENTID" HeaderText="COMMENTID" ReadOnly="True" SortExpression="COMMENTID" />
                        <asp:BoundField DataField="USERID" HeaderText="USERID" SortExpression="USERID" />
                        <asp:BoundField DataField="TASKID" HeaderText="TASKID" SortExpression="TASKID" />
                        <asp:BoundField DataField="COMMENTCONTENT" HeaderText="COMMENTCONTENT" SortExpression="COMMENTCONTENT" />
                        <asp:BoundField DataField="COMMENTDATE" HeaderText="COMMENTDATE" SortExpression="COMMENTDATE" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;COMMENTS&quot; WHERE &quot;COMMENTID&quot; = :COMMENTID" InsertCommand="INSERT INTO &quot;COMMENTS&quot; (&quot;COMMENTID&quot;, &quot;USERID&quot;, &quot;TASKID&quot;, &quot;COMMENTCONTENT&quot;, &quot;COMMENTDATE&quot;) VALUES (:COMMENTID, :USERID, :TASKID, :COMMENTCONTENT, :COMMENTDATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COMMENTID&quot;, &quot;USERID&quot;, &quot;TASKID&quot;, &quot;COMMENTCONTENT&quot;, &quot;COMMENTDATE&quot; FROM &quot;COMMENTS&quot;" UpdateCommand="UPDATE &quot;COMMENTS&quot; SET &quot;USERID&quot; = :USERID, &quot;TASKID&quot; = :TASKID, &quot;COMMENTCONTENT&quot; = :COMMENTCONTENT, &quot;COMMENTDATE&quot; = :COMMENTDATE WHERE &quot;COMMENTID&quot; = :COMMENTID">
                <DeleteParameters>
                    <asp:Parameter Name="COMMENTID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="COMMENTID" Type="Decimal" />
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="COMMENTCONTENT" Type="String" />
                    <asp:Parameter Name="COMMENTDATE" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="COMMENTCONTENT" Type="String" />
                    <asp:Parameter Name="COMMENTDATE" Type="DateTime" />
                    <asp:Parameter Name="COMMENTID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <div class="form-view-container">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="COMMENTID" DataSourceID="SqlDataSource1" Width="100%">
                    <EditItemTemplate>
                        <div class="form-group">
                            <span class="form-label">COMMENTID:</span>
                            <asp:Label ID="COMMENTIDLabel1" runat="server" Text='<%# Eval("COMMENTID") %>' CssClass="form-control-plaintext" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">USERID:</span>
                            <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKID:</span>
                            <asp:TextBox ID="TASKIDTextBox" runat="server" Text='<%# Bind("TASKID") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">COMMENTCONTENT:</span>
                            <asp:TextBox ID="COMMENTCONTENTTextBox" runat="server" Text='<%# Bind("COMMENTCONTENT") %>' CssClass="form-control" TextMode="MultiLine" Rows="3" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">COMMENTDATE:</span>
                            <asp:TextBox ID="COMMENTDATETextBox" runat="server" Text='<%# Bind("COMMENTDATE") %>' CssClass="form-control" />
                        </div>
                        <div class="mt-3">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                        </div>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="form-group">
                            <span class="form-label">COMMENTID:</span>
                            <asp:TextBox ID="COMMENTIDTextBox" runat="server" Text='<%# Bind("COMMENTID") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">USERID:</span>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="USERNAME" DataValueField="USERID" SelectedValue='<%# Bind("USERID") %>' CssClass="form-control">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKID:</span>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASKNAME" DataValueField="TASKID" SelectedValue='<%# Bind("TASKID") %>' CssClass="form-control">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
                        </div>
                        <div class="form-group">
                            <span class="form-label">COMMENTCONTENT:</span>
                            <asp:TextBox ID="COMMENTCONTENTTextBox" runat="server" Text='<%# Bind("COMMENTCONTENT") %>' CssClass="form-control" TextMode="MultiLine" Rows="3" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">COMMENTDATE:</span>
                            <asp:TextBox ID="COMMENTDATETextBox" runat="server" Text='<%# Bind("COMMENTDATE") %>' CssClass="form-control" />
                        </div>
                        <div class="mt-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div class="form-group">
                            <span class="form-label">COMMENTID:</span>
                            <asp:Label ID="COMMENTIDLabel" runat="server" Text='<%# Eval("COMMENTID") %>' CssClass="form-control-plaintext" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">USERID:</span>
                            <asp:Label ID="USERIDLabel" runat="server" Text='<%# Bind("USERID") %>' CssClass="form-control-plaintext" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKID:</span>
                            <asp:Label ID="TASKIDLabel" runat="server" Text='<%# Bind("TASKID") %>' CssClass="form-control-plaintext" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">COMMENTCONTENT:</span>
                            <asp:Label ID="COMMENTCONTENTLabel" runat="server" Text='<%# Bind("COMMENTCONTENT") %>' CssClass="form-control-plaintext" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">COMMENTDATE:</span>
                            <asp:Label ID="COMMENTDATELabel" runat="server" Text='<%# Bind("COMMENTDATE") %>' CssClass="form-control-plaintext" />
                        </div>
                        <div class="mt-3">
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-success" />
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </form>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

       <!-- Bootstrap JS and Popper.js -->
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
</body>
</html>