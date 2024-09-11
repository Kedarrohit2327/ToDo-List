<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ToDo_List._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
    </main>
    <div class="name">
        <div class="profile-icon">
            <i class="fas fa-user"></i>
        </div>

        <asp:Button ID="LogoutButton" runat="server" Text="Logout"  CssClass="button1 logout-btn" OnClick="LogoutButton_Click" />

        <h2 class="Username">
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </h2>
    </div>
    <div class="container4">

        <div id="taskForm">

            <input type="text" id="Description" name="Description" placeholder="Enter a new task" required>
            <button type="submit" On="btn_Task"></button>
            <asp:Button ID="Button1" CssClass="Button1" runat="server" Text="Add Task" OnClick="Button1_Click" />


        </div>
        <asp:Label ID="error_msg" runat="server" Text="Label"></asp:Label>

    </div>
    <asp:GridView ID="TaskGridView" runat="server" AutoGenerateColumns="False" CssClass="grid-view" OnRowCommand="TaskGridView_RowCommand">
                <Columns>
                    <asp:BoundField DataField="TaskDescr" HeaderText="Task" SortExpression="Description" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("IsCompleted", "{0:Completed}") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="CompleteButton" runat="server" CommandName="Complete" CommandArgument='<%# Eval("ID") %>' Text='<%# Eval("IsCompleted", "{0:Undo}") %>' CssClass="button complete-btn" />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" CommandArgument='<%# Eval("ID") %>' Text="Delete" CssClass="button delete-btn" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>



    <%--<div class="task">
        <table id="taskTable">
     <thead>
         <tr>
             <th>Sr. No.</th>
             <th>Task</th>
             
             <th>Actions</th>
         </tr>
     </thead>
     <tbody id="taskList">
         <!-- Tasks will be injected here -->
     </tbody>
 </table>
    </div>--%>
</asp:Content>
