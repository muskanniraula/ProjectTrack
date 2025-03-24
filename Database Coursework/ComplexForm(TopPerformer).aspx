﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComplexForm(TopPerformer).aspx.cs" Inherits="Database_Coursework.ComplexForm_TopPerformer_" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top Performers</title>
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
    transition: all 0.3s ease;
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
        .container {
            padding: 20px;
        }
        .page-title {
            color: #212529;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid #dee2e6;
        }
        .grid-container {
            overflow-x: auto;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
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
        .dropdown-container {
            margin-bottom: 20px;
        }
        .top-performer-badge {
            background-color: #28a745;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            margin-right: 10px;
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
            <h2 class="page-title">Top Performers</h2>
            
            <div class="dropdown-container">
                <label for="DropDownList1" class="form-label">Select Project:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" 
                    DataTextField="PROJECTNAME" 
                    DataValueField="PROJECTID" 
                    CssClass="form-control form-select">
                </asp:DropDownList>
            </div>

            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" 
                    DataSourceID="SqlDataSource1" 
                    AutoGenerateColumns="True" 
                    CssClass="table table-striped table-bordered table-hover">
                    <HeaderStyle CssClass="thead-dark" />
                </asp:GridView>
            </div>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;">
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM (SELECT u.UserID, u.UserName, COUNT(t.TaskID) AS CompletedTasks FROM Users u JOIN TasksProjectsUsers tpu ON u.UserID = tpu.UserID JOIN Tasks t ON tpu.TaskID = t.TaskID WHERE tpu.ProjectID = :projectID AND t.TaskStatus = 'Completed' GROUP BY u.UserID, u.UserName ORDER BY CompletedTasks DESC) WHERE ROWNUM &lt;= 3">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="projectID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
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