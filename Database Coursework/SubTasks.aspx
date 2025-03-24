<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubTasks.aspx.cs" Inherits="Database_Coursework.SubTasks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SubTasks Management</title>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    
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
            position: sticky;
            top: 0;
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
        
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid #dee2e6;
        }
        .page-title {
            color: #212529;
            margin: 0;
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
        
        /* Status colors */
        .subtask-status-pending {
            background-color: #fff3cd;
        }
        .subtask-status-completed {
            background-color: #d4edda;
        }
        .subtask-status-inprogress {
            background-color: #cce5ff;
        }
        
        
        /* Modal styles */
        .modal-header {
            background-color: #3a506b;
            color: white;
        }
        .modal-body .form-group {
            margin-bottom: 1rem;
        }
                /* Edit Button (initial state) */
#GridView1 a[href*="Edit"], 
#GridView1 input[value="Edit"] {
    background-color: #6c757d; /* Grey */
    color: white;
    border-color: #6c757d;
}

/* Delete Button */
#GridView1 a[href*="Delete"], 
#GridView1 input[value="Delete"] {
    background-color: #dc3545; /* Red */
    color: white;
    border-color: #dc3545;
}

/* Update Button (appears during edit) */
#GridView1 a[href*="Update"], 
#GridView1 input[value="Update"] {
    background-color: #28a745; /* Green */
    color: white;
    border-color: #28a745;
}

/* Cancel Button (appears during edit) */
#GridView1 a[href*="Cancel"], 
#GridView1 input[value="Cancel"] {
    background-color: #7f7f7f; /* Yellow */
    color: #ffffff;
    border-color: #7f7f7f;
}

/* Hover states for all buttons */
#GridView1 a[href*="Edit"]:hover, 
#GridView1 input[value="Edit"]:hover,
#GridView1 a[href*="Delete"]:hover, 
#GridView1 input[value="Delete"]:hover,
#GridView1 a[href*="Update"]:hover, 
#GridView1 input[value="Update"]:hover,
#GridView1 a[href*="Cancel"]:hover, 
#GridView1 input[value="Cancel"]:hover {
    opacity: 0.85;
    color: white;
}

/* Button spacing and basic styles */
#GridView1 .btn-space {
    margin-right: 5px;
    padding: 0.25rem 0.5rem;
    font-size: 0.875rem;
    border-radius: 0.2rem;
}

/* Delete button confirmation dialog */
#GridView1 a[href*="Delete"], 
#GridView1 input[value="Delete"] {
    cursor: pointer;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="Home.aspx">
                    <i class="mr-2"></i>ProjectTrack
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
                            <a class="nav-link active" href="SubTasks.aspx">SubTasks</a>
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

        <div class="container">
            <!-- Modified header with insert button -->
            <div class="page-header">
                <h2 class="page-title">SubTasks Management</h2>
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#insertModal">
                    <i class="fas fa-plus"></i> Add New SubTask
                </button>
            </div>
            
            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-sm btn-outline-primary btn-space" />
                        <asp:BoundField DataField="SUBTASKID" HeaderText="ID" ReadOnly="True" SortExpression="SUBTASKID" />
                        <asp:BoundField DataField="USERID" HeaderText="USER ID" SortExpression="USERID" />
                        <asp:BoundField DataField="TASKID" HeaderText="TASK ID" SortExpression="TASKID" />
                        <asp:BoundField DataField="SUBTASKNAME" HeaderText="NAME" SortExpression="SUBTASKNAME" />
                        <asp:BoundField DataField="SUBTASKSTARTDATE" HeaderText="START DATE" SortExpression="SUBTASKSTARTDATE" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="SUBTASKDUEDATE" HeaderText="DUE DATE" SortExpression="SUBTASKDUEDATE" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="SUBTASKSTATUS" HeaderText="STATUS" SortExpression="SUBTASKSTATUS" />
                    </Columns>
                </asp:GridView>
            </div>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM &quot;SUBTASKS&quot; WHERE &quot;SUBTASKID&quot; = :SUBTASKID" 
                InsertCommand="INSERT INTO &quot;SUBTASKS&quot; (&quot;SUBTASKID&quot;, &quot;USERID&quot;, &quot;TASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKSTARTDATE&quot;, &quot;SUBTASKDUEDATE&quot;, &quot;SUBTASKSTATUS&quot;) VALUES (:SUBTASKID, :USERID, :TASKID, :SUBTASKNAME, :SUBTASKSTARTDATE, :SUBTASKDUEDATE, :SUBTASKSTATUS)" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;SUBTASKID&quot;, &quot;USERID&quot;, &quot;TASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKSTARTDATE&quot;, &quot;SUBTASKDUEDATE&quot;, &quot;SUBTASKSTATUS&quot; FROM &quot;SUBTASKS&quot;" 
                UpdateCommand="UPDATE &quot;SUBTASKS&quot; SET &quot;USERID&quot; = :USERID, &quot;TASKID&quot; = :TASKID, &quot;SUBTASKNAME&quot; = :SUBTASKNAME, &quot;SUBTASKSTARTDATE&quot; = :SUBTASKSTARTDATE, &quot;SUBTASKDUEDATE&quot; = :SUBTASKDUEDATE, &quot;SUBTASKSTATUS&quot; = :SUBTASKSTATUS WHERE &quot;SUBTASKID&quot; = :SUBTASKID">
                <DeleteParameters>
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASKNAME" Type="String" />
                    <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASKNAME" Type="String" />
                    <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <!-- User dropdown datasource -->
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot; FROM &quot;USERS&quot;">
            </asp:SqlDataSource>
            
            <!-- Task dropdown datasource -->
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot; FROM &quot;TASKS&quot;">
            </asp:SqlDataSource>
            
            <!-- Insert Modal -->
            <div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="insertModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="insertModalLabel">Add New SubTask</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="form-label">SUBTASKID:</label>
                                <asp:TextBox ID="txtSubTaskID" runat="server" CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">USERID:</label>
                                <asp:DropDownList ID="ddlUserID" runat="server" DataSourceID="SqlDataSource2" 
                                    DataTextField="USERNAME" DataValueField="USERID" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="form-label">TASKID:</label>
                                <asp:DropDownList ID="ddlTaskID" runat="server" DataSourceID="SqlDataSource3" 
                                    DataTextField="TASKNAME" DataValueField="TASKID" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="form-label">SUBTASKNAME:</label>
                                <asp:TextBox ID="txtSubTaskName" runat="server" CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">SUBTASKSTARTDATE:</label>
                                <asp:TextBox ID="txtSubTaskStartDate" runat="server" CssClass="form-control" TextMode="Date" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">SUBTASKDUEDATE:</label>
                                <asp:TextBox ID="txtSubTaskDueDate" runat="server" CssClass="form-control" TextMode="Date" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">SUBTASKSTATUS:</label>
                                <asp:DropDownList ID="ddlSubTaskStatus" runat="server" CssClass="form-control">
                                    <asp:ListItem>Not Started</asp:ListItem>
                                    <asp:ListItem>In Progress</asp:ListItem>
                                    <asp:ListItem>Completed</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="btn btn-primary" OnClick="btnInsert_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    
    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
        function closeModal() {
            var modal = new bootstrap.Modal(document.getElementById('insertModal'));
            modal.hide();
        }
    </script>

    <script runat="server">
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                // Get values from the form
                decimal subTaskId = decimal.Parse(txtSubTaskID.Text);
                decimal userId = decimal.Parse(ddlUserID.SelectedValue);
                decimal taskId = decimal.Parse(ddlTaskID.SelectedValue);
                string subTaskName = txtSubTaskName.Text;
                DateTime subTaskStartDate = DateTime.Parse(txtSubTaskStartDate.Text);
                DateTime subTaskDueDate = DateTime.Parse(txtSubTaskDueDate.Text);
                string subTaskStatus = ddlSubTaskStatus.SelectedValue;

                // Create parameters
                SqlDataSource1.InsertParameters["SUBTASKID"].DefaultValue = subTaskId.ToString();
                SqlDataSource1.InsertParameters["USERID"].DefaultValue = userId.ToString();
                SqlDataSource1.InsertParameters["TASKID"].DefaultValue = taskId.ToString();
                SqlDataSource1.InsertParameters["SUBTASKNAME"].DefaultValue = subTaskName;
                SqlDataSource1.InsertParameters["SUBTASKSTARTDATE"].DefaultValue = subTaskStartDate.ToString("yyyy-MM-dd");
                SqlDataSource1.InsertParameters["SUBTASKDUEDATE"].DefaultValue = subTaskDueDate.ToString("yyyy-MM-dd");
                SqlDataSource1.InsertParameters["SUBTASKSTATUS"].DefaultValue = subTaskStatus;

                // Execute the insert
                SqlDataSource1.Insert();

                // Refresh the GridView
                GridView1.DataBind();

                // Clear the form
                txtSubTaskID.Text = "";
                txtSubTaskName.Text = "";
                txtSubTaskStartDate.Text = "";
                txtSubTaskDueDate.Text = "";
                ddlSubTaskStatus.SelectedIndex = 0;
                ddlUserID.SelectedIndex = 0;
                ddlTaskID.SelectedIndex = 0;

                // Close the modal
                ScriptManager.RegisterStartupScript(this, this.GetType(), "closeModal", "closeModal();", true);
            }
            catch (Exception ex)
            {
                // Handle errors
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", 
                    $"alert('Error inserting subtask: {ex.Message}');", true);
            }
        }
    </script>
</body>
</html>