<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Database_Coursework.Dashboard" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management Dashboard</title>
    <link href="/Content/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
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
        .dashboard-container {
            padding: 20px 30px;
        }
        .dashboard-header {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 20px;
            margin-bottom: 24px;
        }
        .dashboard-header h2 {
            color: #333;
            font-weight: 600;
            margin-bottom: 8px;
        }
        .dashboard-header p {
            color: #6c757d;
            margin-bottom: 0;
        }
        .stats-card {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.07);
            padding: 24px;
            margin-bottom: 24px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
        }
        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.1);
        }
        .stats-card .card-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
            opacity: 0.8;
        }
        .stats-card .card-value {
            font-size: 2.4rem;
            font-weight: 300;
            color: #2c3e50;
        }
        .stats-card .card-label {
            color: #6c757d;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 1px;
            font-weight: 500;
        }
        .chart-card {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.07);
            padding: 24px;
            margin-bottom: 24px;
            height: 100%;
        }
        .chart-card h5 {
            color: #343a40;
            font-weight: 600;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 1px solid #e9ecef;
        }
        .milestone-table {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.07);
            padding: 24px;
            margin-bottom: 24px;
        }
        .table-title {
            color: #343a40;
            font-weight: 600;
            padding-bottom: 12px;
            margin-bottom: 20px;
            border-bottom: 1px solid #e9ecef;
        }
        .table {
            margin-bottom: 0;
        }
        .table th {
            background-color: #f8f9fa;
            color: #495057;
            font-weight: 600;
            border-top: none;
        }
        .text-primary {
            color: #4e73df !important;
        }
        .text-success {
            color: #1cc88a !important;
        }
        .text-warning {
            color: #f6c23e !important;
        }
        .text-info {
            color: #36b9cc !important;
        }
        #GridView1, #GridView2 {
            width: 100%;
        }
        #GridView1 th, #GridView2 th {
            background-color: #f8f9fa;
            color: #495057;
            padding: 12px;
            font-weight: 600;
            border-bottom: 2px solid #e9ecef;
        }
        #GridView1 td, #GridView2 td {
            padding: 12px;
            vertical-align: middle;
        }
        #GridView1 tr:hover, #GridView2 tr:hover {
            background-color: #f1f3f5;
        }
        /* Task Status Chart Styling */
        #Chart3 {
            margin: 10px auto;
            display: block;
        }
        #Chart3 .Series1 {
            font-weight: 500;
        }
        /* Milestone Status Chart Styling */
        #Chart4 {
            margin: 10px auto;
            display: block;
        }
        /* Consistent chart colors across the dashboard */
        .chart-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            padding: 15px 0;
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
<body >
                       
    <div class="container">
    <form id="form1" runat="server">
        <div class="container-fluid dashboard-container">
            <div class="dashboard-header">
                <div class="row align-items-center">
                    <div class="col-md-9">
                        <h2>Dashboard</h2>
                        <p>Welcome back! Here's your project overview.</p>
                    </div>
                    <div class="col-md-3 text-end">
                        <asp:Label ID="DateTimeLabel" runat="server" Text="" CssClass="h6 text-muted"></asp:Label>
                        <script>
                            // Update date/time
                            function updateDateTime() {
                                var now = new Date();
                                var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
                                document.getElementById('<%= DateTimeLabel.ClientID %>').innerHTML = now.toLocaleDateString('en-US', options);
                            }
                            updateDateTime();
                        </script>
                    </div>
                </div>
            </div>
            
            <div class="row mb-4">
                <div class="col-md-3">
                    <div class="stats-card text-center">
                        <div class="card-icon text-primary">
                            <i class="bi bi-people"></i>
                        </div>
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="card-value">
                                    <asp:Label ID="TOTALUSERSLabel" runat="server" Text='<%# Bind("TOTALUSERS") %>' />
                                </div>
                                <div class="card-label">Total Users</div>
                            </ItemTemplate>
                        </asp:FormView>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="stats-card text-center">
                        <div class="card-icon text-success">
                            <i class="bi bi-layers"></i>
                        </div>
                        <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <div class="card-value">
                                    <asp:Label ID="INPROGRESSPROJECTSLabel" runat="server" Text='<%# Bind("INPROGRESSPROJECTS") %>' />
                                </div>
                                <div class="card-label">Active Projects</div>
                            </ItemTemplate>
                        </asp:FormView>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="stats-card text-center">
                        <div class="card-icon text-warning">
                            <i class="bi bi-list-task"></i>
                        </div>
                        <asp:FormView ID="FormView4" runat="server" DataSourceID="SqlDataSource4">
                            <ItemTemplate>
                                <div class="card-value">
                                    <asp:Label ID="INPROGRESSORNOTSTARTEDTASKSLabel" runat="server" Text='<%# Bind("INPROGRESSORNOTSTARTEDTASKS") %>' />
                                </div>
                                <div class="card-label">Open Tasks</div>
                            </ItemTemplate>
                        </asp:FormView>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="stats-card text-center">
                        <div class="card-icon text-info">
                            <i class="bi bi-flag"></i>
                        </div>
                        <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlDataSource3">
                            <ItemTemplate>
                                <div class="card-value">
                                    <asp:Label ID="UPCOMINGMILESTONESLabel" runat="server" Text='<%# Bind("UPCOMINGMILESTONES") %>' />
                                </div>
                                <div class="card-label">Upcoming Milestones</div>
                            </ItemTemplate>
                        </asp:FormView>
                    </div>
                </div>
            </div>
            
            <!-- First row with User Role Distribution Pie Chart and Task Status Bar Chart -->
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="chart-card">
                        <h5>User Roles Distribution</h5>
                        <div class="chart-container">
                            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource6" Width="400px" Height="300px">
                                <Series>
                                    <asp:Series ChartType="Pie" Name="Series1" XValueMember="USERROLE" YValueMembers="ROLECOUNT" 
                                        IsValueShownAsLabel="true" LabelFormat="{0}%" BorderColor="White" BorderWidth="2">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                        <AxisX LineColor="#e9ecef"></AxisX>
                                        <AxisY LineColor="#e9ecef"></AxisY>
                                    </asp:ChartArea>
                                </ChartAreas>
                                <Legends>
                                    <asp:Legend Alignment="Center" Docking="Bottom" IsDockedInsideChartArea="false" BackColor="Transparent"></asp:Legend>
                                </Legends>
                            </asp:Chart>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="chart-card">
                        <h5>Task Status Distribution</h5>
                        <div class="chart-container">
                            <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource9" Width="400px" Height="300px">
                                <Series>
                                    <asp:Series Name="Series1" XValueMember="TASKSTATUS" YValueMembers="STATUSCOUNT" 
                                        ChartType="Column" IsValueShownAsLabel="true" BorderWidth="2" BorderColor="White"
                                        Palette="BrightPastel">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
  <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
    <AxisX LineColor="#e9ecef">
        
    </AxisX>
</asp:ChartArea>

</ChartAreas>
                                
                            </asp:Chart>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Second row with Milestone Status Pie Chart and Upcoming Tasks -->
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="chart-card">
                        <h5>Milestone Status Distribution</h5>
                        <div class="chart-container">
                            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource10" Width="400px" Height="300px">
                                <Series>
                                    <asp:Series ChartType="Pie" Name="Series1" XValueMember="MILESTONESTATUS" YValueMembers="MILESTONECOUNT"
                                        IsValueShownAsLabel="true" LabelFormat="{0}%" BorderColor="White" BorderWidth="2"
                                        Palette="BrightPastel">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                        <AxisX LineColor="#e9ecef"></AxisX>
                                        <AxisY LineColor="#e9ecef"></AxisY>
                                    </asp:ChartArea>
                                </ChartAreas>
                                <Legends>
                                    <asp:Legend Alignment="Center" Docking="Bottom" IsDockedInsideChartArea="false" BackColor="Transparent"></asp:Legend>
                                </Legends>
                            </asp:Chart>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="chart-card">
                        <h5>Upcoming Tasks</h5>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource8" CssClass="table table-borderless">
    <Columns>
        <asp:BoundField DataField="TaskName" HeaderText="Task Name" />
        <asp:BoundField DataField="ProjectName" HeaderText="Project" />
        <asp:BoundField DataField="TaskStartDate" HeaderText="Start Date" DataFormatString="{0:d}" />
        <asp:BoundField DataField="TaskDueDate" HeaderText="Due Date" DataFormatString="{0:d}" />
    </Columns>
</asp:GridView>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-12">
                    <div class="milestone-table">
                        <h5 class="table-title">Upcoming Milestones</h5>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource7" 
                            CssClass="table table-hover">
                            <Columns>
                               <asp:BoundField DataField="MILESTONEID" HeaderText="ID" ReadOnly="True" SortExpression="MILESTONEID" />
                                <asp:BoundField DataField="MILESTONENAME" HeaderText="Milestone Name" SortExpression="MILESTONENAME" />
                                <asp:BoundField DataField="MILESTONESTARTDATE" HeaderText="Start Date" SortExpression="MILESTONESTARTDATE" />
                                <asp:BoundField DataField="MILESTONEDUEDATE" HeaderText="Due Date" SortExpression="MILESTONEDUEDATE" />
                                <asp:BoundField DataField="PROJECTNAME" HeaderText="Project Name" SortExpression="PROJECTNAME" />
                                <asp:BoundField DataField="TASKCOUNT" HeaderText="Tasks" SortExpression="TASKCOUNT" />
                                <asp:BoundField DataField="MILESTONESTATUS" HeaderText="Status" SortExpression="MILESTONESTATUS" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <!-- Required data sources -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT COUNT(*) AS TotalUsers FROM Users"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT COUNT(*) AS InProgressProjects FROM Projects WHERE ProjectStatus = 'In Progress'"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT COUNT(*) AS UpcomingMilestones FROM Milestones WHERE MilestoneStartDate > SYSDATE"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT COUNT(*) AS InProgressOrNotStartedTasks FROM Tasks WHERE TaskStatus = 'In Progress' OR TaskStatus = 'Not Started'"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
    SelectCommand="SELECT TaskName, ProjectName, TaskStartDate, TaskDueDate FROM (SELECT T.TaskName, P.ProjectName, T.TaskStartDate, T.TaskDueDate FROM Tasks T JOIN Milestones M ON T.MilestoneID = M.MilestoneID JOIN Projects P ON M.ProjectID = P.ProjectID WHERE T.TaskStatus != 'Completed' AND T.TaskStartDate >= TRUNC(SYSDATE) ORDER BY TaskStartDate ASC) WHERE ROWNUM <= 5">
</asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT UserRole, COUNT(UserID) AS RoleCount FROM Users GROUP BY UserRole"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT MilestoneID, MilestoneName, MilestoneStartDate, MilestoneDueDate, ProjectName, TaskCount, MilestoneStatus FROM (SELECT m.MilestoneID, m.MilestoneName, m.MilestoneStartDate, m.MilestoneDueDate, p.ProjectName, COUNT(t.TaskID) AS TaskCount, m.MilestoneStatus FROM Milestones m JOIN Projects p ON m.ProjectID = p.ProjectID LEFT JOIN Tasks t ON m.MilestoneID = t.MilestoneID WHERE m.MilestoneStartDate >= TRUNC(SYSDATE) GROUP BY m.MilestoneID, m.MilestoneName, m.MilestoneStartDate, m.MilestoneDueDate, p.ProjectName, m.MilestoneStatus ORDER BY m.MilestoneStartDate ASC) WHERE ROWNUM <= 5"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT TASKSTATUS, COUNT(*) AS StatusCount FROM Tasks GROUP BY TASKSTATUS"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT MILESTONESTATUS, COUNT(*) AS MilestoneCount FROM Milestones GROUP BY MILESTONESTATUS"></asp:SqlDataSource>
    </form>
    </div>


    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT MILESTONESTATUS, COUNT(*) AS MilestoneCount FROM Milestones GROUP BY MILESTONESTATUS"></asp:SqlDataSource>
    </body>
</html>