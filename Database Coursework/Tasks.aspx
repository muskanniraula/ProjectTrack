﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="Database_Coursework.Tasks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Management</title>
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
        .task-status-pending {
            background-color: #fff3cd;
        }
        .task-status-completed {
            background-color: #d4edda;
        }
        .task-status-inprogress {
            background-color: #cce5ff;
        }
        .task-status-delayed {
            background-color: #f8d7da;
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
            <h2 class="page-title">Task Management</h2>
            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASKID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-sm btn-outline-primary btn-space" />
                        <asp:BoundField DataField="TASKID" HeaderText="TASKID" ReadOnly="True" SortExpression="TASKID" />
                        <asp:BoundField DataField="TASKNAME" HeaderText="TASKNAME" SortExpression="TASKNAME" />
                        <asp:BoundField DataField="TASKSTARTDATE" HeaderText="TASKSTARTDATE" SortExpression="TASKSTARTDATE" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="TASKDUEDATE" HeaderText="TASKDUEDATE" SortExpression="TASKDUEDATE" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="TASKSTATUS" HeaderText="TASKSTATUS" SortExpression="TASKSTATUS" />
                        <asp:BoundField DataField="MILESTONEID" HeaderText="MILESTONEID" SortExpression="MILESTONEID" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TASKS&quot; WHERE &quot;TASKID&quot; = :TASKID" InsertCommand="INSERT INTO &quot;TASKS&quot; (&quot;TASKID&quot;, &quot;TASKNAME&quot;, &quot;TASKSTARTDATE&quot;, &quot;TASKDUEDATE&quot;, &quot;TASKSTATUS&quot;, &quot;MILESTONEID&quot;) VALUES (:TASKID, :TASKNAME, :TASKSTARTDATE, :TASKDUEDATE, :TASKSTATUS, :MILESTONEID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot;, &quot;TASKSTARTDATE&quot;, &quot;TASKDUEDATE&quot;, &quot;TASKSTATUS&quot;, &quot;MILESTONEID&quot; FROM &quot;TASKS&quot;" UpdateCommand="UPDATE &quot;TASKS&quot; SET &quot;TASKNAME&quot; = :TASKNAME, &quot;TASKSTARTDATE&quot; = :TASKSTARTDATE, &quot;TASKDUEDATE&quot; = :TASKDUEDATE, &quot;TASKSTATUS&quot; = :TASKSTATUS, &quot;MILESTONEID&quot; = :MILESTONEID WHERE &quot;TASKID&quot; = :TASKID">
                <DeleteParameters>
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="TASKNAME" Type="String" />
                    <asp:Parameter Name="TASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="TASKDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="TASKSTATUS" Type="String" />
                    <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TASKNAME" Type="String" />
                    <asp:Parameter Name="TASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="TASKDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="TASKSTATUS" Type="String" />
                    <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <div class="form-view-container">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASKID" DataSourceID="SqlDataSource1" Width="100%">
                    <EditItemTemplate>
                        <div class="form-group">
                            <span class="form-label">TASKID:</span>
                            <asp:Label ID="TASKIDLabel1" runat="server" Text='<%# Eval("TASKID") %>' CssClass="form-control-plaintext" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKNAME:</span>
                            <asp:TextBox ID="TASKNAMETextBox" runat="server" Text='<%# Bind("TASKNAME") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKSTARTDATE:</span>
                            <asp:TextBox ID="TASKSTARTDATETextBox" runat="server" Text='<%# Bind("TASKSTARTDATE") %>' CssClass="form-control" TextMode="Date" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKDUEDATE:</span>
                            <asp:TextBox ID="TASKDUEDATETextBox" runat="server" Text='<%# Bind("TASKDUEDATE") %>' CssClass="form-control" TextMode="Date" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKSTATUS:</span>
                            <asp:TextBox ID="TASKSTATUSTextBox" runat="server" Text='<%# Bind("TASKSTATUS") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">MILESTONEID:</span>
                            <asp:TextBox ID="MILESTONEIDTextBox" runat="server" Text='<%# Bind("MILESTONEID") %>' CssClass="form-control" />
                        </div>
                        <div class="mt-3">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-success" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                        </div>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="form-group">
                            <span class="form-label">TASKID:</span>
                            <asp:TextBox ID="TASKIDTextBox" runat="server" Text='<%# Bind("TASKID") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKNAME:</span>
                            <asp:TextBox ID="TASKNAMETextBox" runat="server" Text='<%# Bind("TASKNAME") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKSTARTDATE:</span>
                            <asp:TextBox ID="TASKSTARTDATETextBox" runat="server" Text='<%# Bind("TASKSTARTDATE") %>' CssClass="form-control" TextMode="Date" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKDUEDATE:</span>
                            <asp:TextBox ID="TASKDUEDATETextBox" runat="server" Text='<%# Bind("TASKDUEDATE") %>' CssClass="form-control" TextMode="Date" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKSTATUS:</span>
                            <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("TASKSTATUS") %>' CssClass="form-control">
                                <asp:ListItem>Not Started</asp:ListItem>
                                <asp:ListItem>In Progress</asp:ListItem>
                                <asp:ListItem>Completed</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <span class="form-label">MILESTONEID:</span>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="MILESTONENAME" DataValueField="MILESTONEID" SelectedValue='<%# Bind("MILESTONEID") %>' CssClass="form-control">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot; FROM &quot;MILESTONES&quot;"></asp:SqlDataSource>
                        </div>
                        <div class="mt-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div class="form-group">
                            <span class="form-label">TASKID:</span>
                            <asp:Label ID="TASKIDLabel" runat="server" Text='<%# Eval("TASKID") %>' CssClass="form-control-plaintext" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKNAME:</span>
                            <asp:Label ID="TASKNAMELabel" runat="server" Text='<%# Bind("TASKNAME") %>' CssClass="form-control-plaintext" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKSTARTDATE:</span>
                            <asp:Label ID="TASKSTARTDATELabel" runat="server" Text='<%# Bind("TASKSTARTDATE", "{0:d}") %>' CssClass="form-control-plaintext" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKDUEDATE:</span>
                            <asp:Label ID="TASKDUEDATELabel" runat="server" Text='<%# Bind("TASKDUEDATE", "{0:d}") %>' CssClass="form-control-plaintext" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">TASKSTATUS:</span>
                            <asp:Label ID="TASKSTATUSLabel" runat="server" Text='<%# Bind("TASKSTATUS") %>' CssClass="form-control-plaintext" />
                        </div>
                        <div class="form-group">
                            <span class="form-label">MILESTONEID:</span>
                            <asp:Label ID="MILESTONEIDLabel" runat="server" Text='<%# Bind("MILESTONEID") %>' CssClass="form-control-plaintext" />
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