<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ToDo_List.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
       <section class="register">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 text-black">
                    <div class="form-container">
                        <h3 class="form-title">Register Here</h3>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="form-label">
                                            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                                        </div>
                                        <div class="form-input">
                                            <asp:TextBox ID="username" runat="server" width="295px" AutoPostBack="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="username"
                                        ErrorMessage="Username cannot be blank" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <div class="form-group">
                            <div class="form-row">
                                <div class="form-label">
                                    <asp:Label ID="Label3" runat="server" Text="EmailID"></asp:Label>
                                </div>
                                <div class="form-input">
                                    <asp:TextBox ID="email" runat="server" width="295px" AutoPostBack="true"></asp:TextBox>
                                </div>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="email"
                                ErrorMessage="Email field cannot be blank" Font-Bold="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ControlToValidate="email" ErrorMessage="Enter valid Email ID"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>

                        <div class="form-group">
                            <div class="form-row">
                                <div class="form-label">
                                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                </div>
                                <div class="form-input">
                                    <asp:TextBox ID="password" runat="server" width="295px" TextMode="Password" AutoPostBack="true"></asp:TextBox>
                                </div>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="password"
                                ErrorMessage="Password cannot be blank" Font-Bold="true" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-actions">
                            <asp:Button class="btn btn-info" ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
                            <asp:Label ID="error_msg" runat="server" Text="Label"></asp:Label>
                        </div>

                        <p class="login-link">Already Registered? <a href="/Login.aspx" class="link-info">Login here</a></p>
                    </div>
                </div>
                <div class="col-sm-6 d-none d-sm-block">
                    <img src="Content/todolist.jpg" alt="Login image" class="login-image">
                </div>
            </div>
        </div>
    </section>

    </main>
</asp:Content>
