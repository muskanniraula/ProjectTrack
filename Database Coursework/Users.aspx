﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Database_Coursework.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
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
                            <a class="nav-link active" href="Users.aspx">Users</a>
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

        <div class="container">
            <!-- Modified header with insert button -->
            <div class="page-header">
                <h2 class="page-title">User Management</h2>
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#insertModal">
                    <i class="fas fa-plus"></i> Add New User
                </button>
            </div>
            
            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-sm btn-outline-primary btn-space" />
                        <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                        <asp:BoundField DataField="USEREMAIL" HeaderText="USEREMAIL" SortExpression="USEREMAIL" />
                        <asp:BoundField DataField="USERCONTACT" HeaderText="USERCONTACT" SortExpression="USERCONTACT" />
                        <asp:BoundField DataField="USERROLE" HeaderText="USERROLE" SortExpression="USERROLE" />
                    </Columns>
                </asp:GridView>
            </div>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USERID&quot; = :USERID" 
                InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USERID&quot;, &quot;USERNAME&quot;, &quot;USEREMAIL&quot;, &quot;USERCONTACT&quot;, &quot;USERROLE&quot;) VALUES (:USERID, :USERNAME, :USEREMAIL, :USERCONTACT, :USERROLE)" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot;, &quot;USEREMAIL&quot;, &quot;USERCONTACT&quot;, &quot;USERROLE&quot; FROM &quot;USERS&quot;" 
                UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;USEREMAIL&quot; = :USEREMAIL, &quot;USERCONTACT&quot; = :USERCONTACT, &quot;USERROLE&quot; = :USERROLE WHERE &quot;USERID&quot; = :USERID">
                <DeleteParameters>
                    <asp:Parameter Name="USERID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="USERNAME" Type="String" />
                    <asp:Parameter Name="USEREMAIL" Type="String" />
                    <asp:Parameter Name="USERCONTACT" Type="Decimal" />
                    <asp:Parameter Name="USERROLE" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="USERNAME" Type="String" />
                    <asp:Parameter Name="USEREMAIL" Type="String" />
                    <asp:Parameter Name="USERCONTACT" Type="Decimal" />
                    <asp:Parameter Name="USERROLE" Type="String" />
                    <asp:Parameter Name="USERID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <!-- Insert Modal -->
            <div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="insertModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="insertModalLabel">Add New User</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="form-label">USERID:</label>
                                <asp:TextBox ID="txtUserID" runat="server" CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">USERNAME:</label>
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">USEREMAIL:</label>
                                <asp:TextBox ID="txtUserEmail" runat="server" CssClass="form-control" TextMode="Email" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">USERCONTACT:</label>
                                <asp:TextBox ID="txtUserContact" runat="server" CssClass="form-control" TextMode="Number" />
                            </div>
                            <div class="form-group">
                                <label class="form-label">USERROLE:</label>
                                <asp:DropDownList ID="ddlUserRole" runat="server" CssClass="form-control">
                                    <asp:ListItem>Project Manager</asp:ListItem>
                                    <asp:ListItem>Developer</asp:ListItem>
                                    <asp:ListItem>Designer</asp:ListItem>
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
            decimal userId = decimal.Parse(txtUserID.Text);
            string userName = txtUserName.Text;
            string userEmail = txtUserEmail.Text;
            decimal userContact = decimal.Parse(txtUserContact.Text);
            string userRole = ddlUserRole.SelectedValue;

            // Create parameters
            SqlDataSource1.InsertParameters["USERID"].DefaultValue = userId.ToString();
            SqlDataSource1.InsertParameters["USERNAME"].DefaultValue = userName;
            SqlDataSource1.InsertParameters["USEREMAIL"].DefaultValue = userEmail;
            SqlDataSource1.InsertParameters["USERCONTACT"].DefaultValue = userContact.ToString();
            SqlDataSource1.InsertParameters["USERROLE"].DefaultValue = userRole;

            // Execute the insert
            SqlDataSource1.Insert();

            // Refresh the GridView
            GridView1.DataBind();

            // Clear the form
            txtUserID.Text = "";
            txtUserName.Text = "";
            txtUserEmail.Text = "";
            txtUserContact.Text = "";
            ddlUserRole.SelectedIndex = 0;

            // Close the modal
            ScriptManager.RegisterStartupScript(this, this.GetType(), "closeModal", "closeModal();", true);
        }
        catch (Exception ex)
        {
            // Handle errors
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", 
                $"alert('Error inserting user: {ex.Message}');", true);
        }
    }
</script>
</body>
  
</html>