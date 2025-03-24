<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Comments.aspx.cs" Inherits="Database_Coursework.Comments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Comment Management</title>
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
        
        /* Modal styles */
        .modal-header {
            background-color: #3a506b;
            color: white;
        }
        .modal-body .form-group {
            margin-bottom: 1rem;
        }
        .comment-content {
            min-height: 100px;
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
                    <i class=" mr-2"></i>ProjectTrack
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
                            <a class="nav-link active" href="Comments.aspx">Comments</a>
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
                <h2 class="page-title">Comment Management</h2>
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#insertModal">
                    <i class="fas fa-plus"></i> Add New Comment
                </button>
            </div>
            
            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="COMMENTID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-sm btn-outline-primary btn-space" />
                        <asp:BoundField DataField="COMMENTID" HeaderText="ID" ReadOnly="True" SortExpression="COMMENTID" />
                        <asp:BoundField DataField="USERID" HeaderText="USER ID" SortExpression="USERID" />
                        <asp:BoundField DataField="TASKID" HeaderText="TASK ID" SortExpression="TASKID" />
                        <asp:BoundField DataField="COMMENTCONTENT" HeaderText="CONTENT" SortExpression="COMMENTCONTENT" />
                        <asp:BoundField DataField="COMMENTDATE" HeaderText="DATE" SortExpression="COMMENTDATE" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                    </Columns>
                </asp:GridView>
            </div>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM &quot;COMMENTS&quot; WHERE &quot;COMMENTID&quot; = :COMMENTID" 
                InsertCommand="INSERT INTO &quot;COMMENTS&quot; (&quot;COMMENTID&quot;, &quot;USERID&quot;, &quot;TASKID&quot;, &quot;COMMENTCONTENT&quot;, &quot;COMMENTDATE&quot;) VALUES (:COMMENTID, :USERID, :TASKID, :COMMENTCONTENT, :COMMENTDATE)" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;COMMENTID&quot;, &quot;USERID&quot;, &quot;TASKID&quot;, &quot;COMMENTCONTENT&quot;, &quot;COMMENTDATE&quot; FROM &quot;COMMENTS&quot;" 
                UpdateCommand="UPDATE &quot;COMMENTS&quot; SET &quot;USERID&quot; = :USERID, &quot;TASKID&quot; = :TASKID, &quot;COMMENTCONTENT&quot; = :COMMENTCONTENT, &quot;COMMENTDATE&quot; = :COMMENTDATE WHERE &quot;COMMENTID&quot; = :COMMENTID">
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
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="insertModalLabel">Add New Comment</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="form-label">COMMENTID:</label>
                                <asp:TextBox ID="txtCommentID" runat="server" CssClass="form-control" />
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
                                <label class="form-label">COMMENTCONTENT:</label>
                                <asp:TextBox ID="txtCommentContent" runat="server" CssClass="form-control comment-content" TextMode="MultiLine" Rows="5" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">COMMENTDATE:</label>
                                <asp:TextBox ID="txtCommentDate" runat="server" CssClass="form-control" TextMode="DateTimeLocal" />
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
                decimal commentId = decimal.Parse(txtCommentID.Text);
                decimal userId = decimal.Parse(ddlUserID.SelectedValue);
                decimal taskId = decimal.Parse(ddlTaskID.SelectedValue);
                string commentContent = txtCommentContent.Text;
                DateTime commentDate = DateTime.Parse(txtCommentDate.Text);

                // Create parameters
                SqlDataSource1.InsertParameters["COMMENTID"].DefaultValue = commentId.ToString();
                SqlDataSource1.InsertParameters["USERID"].DefaultValue = userId.ToString();
                SqlDataSource1.InsertParameters["TASKID"].DefaultValue = taskId.ToString();
                SqlDataSource1.InsertParameters["COMMENTCONTENT"].DefaultValue = commentContent;
                SqlDataSource1.InsertParameters["COMMENTDATE"].DefaultValue = commentDate.ToString("yyyy-MM-dd HH:mm:ss");

                // Execute the insert
                SqlDataSource1.Insert();

                // Refresh the GridView
                GridView1.DataBind();

                // Clear the form
                txtCommentID.Text = "";
                txtCommentContent.Text = "";
                txtCommentDate.Text = "";
                ddlUserID.SelectedIndex = 0;
                ddlTaskID.SelectedIndex = 0;

                // Close the modal
                ScriptManager.RegisterStartupScript(this, this.GetType(), "closeModal", "closeModal();", true);
            }
            catch (Exception ex)
            {
                // Handle errors
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", 
                    $"alert('Error inserting comment: {ex.Message}');", true);
            }
        }
    </script>
</body>
</html>