<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="OnlineLibraryManagement.usersignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <%--Custom Message Box--%>
            <div class="col col-md-8 mx-auto">
                <div class="alert alert-success" id="signUpsuccessAlert" runat="server" visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4>Sign Up Successful.</h4>
                    <p>Please go to user login page to login.</p>
                </div>
            </div>
            <div class="col col-md-8 mx-auto">
                <div class="alert alert-danger" id="signUpNotValid" runat="server" visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4>User ID is not valid.</h4>
                    <p>A Member Already Exist with the User ID you entered, Please try to choose a Unique ID.</p>
                </div>
            </div>
            <div class="col col-md-8 mx-auto">
                <div class="alert alert-info" id="signUpServerProblemAlert" runat="server" visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4>A network or server related problem occurred.</h4>
                    <p>Please try again. If this error continues, please contact support.</p>
                </div>
            </div>
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="AppImage/generaluser.png" width="100" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member Sign Up</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtFullName" CssClass="form-control" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtDOB" CssClass="form-control" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtContactNumber" CssClass="form-control" runat="server" placeholder="+8801xxxxxxxxx" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="example@domain.com" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>District</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="txtDistrict" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select" Value="Select" />
                                        <asp:ListItem Text="Dhaka" Value="Dhaka" />
                                        <asp:ListItem Text="Faridpur" Value="Faridpur" />
                                        <asp:ListItem Text="Gazipur" Value="Gazipur" />
                                        <asp:ListItem Text="Gopalganj" Value="Gopalganj" />
                                        <asp:ListItem Text="Kishoreganj" Value="Kishoreganj" />
                                        <asp:ListItem Text="Madaripur" Value="Madaripur" />
                                        <asp:ListItem Text="Manikganj" Value="Manikganj" />
                                        <asp:ListItem Text="Munshiganj" Value="Munshiganj" />
                                        <asp:ListItem Text="Narayanganj" Value="Narayanganj" />
                                        <asp:ListItem Text="Narsingdi" Value="Narsingdi" />
                                        <asp:ListItem Text="Rajbari" Value="Rajbari" />
                                        <asp:ListItem Text="Shariatpur" Value="Shariatpur" />
                                        <asp:ListItem Text="Tangail" Value="Tangail" />

                                        <asp:ListItem Text="Chattogram" Value="Chattogram" />
                                        <asp:ListItem Text="Cumilla" Value="Cumilla" />
                                        <asp:ListItem Text="Chandpur" Value="Chandpur" />
                                        <asp:ListItem Text="Brahmanbaria" Value="Brahmanbaria" />
                                        <asp:ListItem Text="Bandarban" Value="Bandarban" />
                                        <asp:ListItem Text="Noakhali" Value="Noakhali" />
                                        <asp:ListItem Text="Lakshmipur" Value="Lakshmipur" />
                                        <asp:ListItem Text="Khagrachhari" Value="Khagrachhari" />
                                        <asp:ListItem Text="Feni" Value="Feni" />
                                        <asp:ListItem Text="Cox’s Bazar" Value="Cox’s Bazar" />
                                        <asp:ListItem Text="Rangamati" Value="Rangamati" />

                                        <asp:ListItem Text="Sylhet" Value="Sylhet" />
                                        <asp:ListItem Text="Sunamganj" Value="Sunamganj" />
                                        <asp:ListItem Text="Moulvibazar" Value="Moulvibazar" />
                                        <asp:ListItem Text="Habiganj" Value="Habiganj" />

                                        <asp:ListItem Text="Barishal" Value="Barishal" />
                                        <asp:ListItem Text="Barguna" Value="Barguna" />
                                        <asp:ListItem Text="Bhola" Value="Bhola" />
                                        <asp:ListItem Text="Jhalokati" Value="Jhalokati" />
                                        <asp:ListItem Text="Patuakhali" Value="Patuakhali" />
                                        <asp:ListItem Text="Pirojpur" Value="Pirojpur" />

                                        <asp:ListItem Text="Khulna" Value="Khulna" />
                                        <asp:ListItem Text="Bagerhat" Value="Bagerhat" />
                                        <asp:ListItem Text="Chuadanga" Value="Chuadanga" />
                                        <asp:ListItem Text="Jashore" Value="Jashore" />
                                        <asp:ListItem Text="Jhenaidah" Value="Jhenaidah" />
                                        <asp:ListItem Text="Khulna" Value="Khulna" />
                                        <asp:ListItem Text="Kushtia" Value="Kushtia" />
                                        <asp:ListItem Text="Magura" Value="Magura" />
                                        <asp:ListItem Text="Meherpur" Value="Meherpur" />
                                        <asp:ListItem Text="Narail" Value="Narail" />
                                        <asp:ListItem Text="Satkhira" Value="Satkhira" />

                                        <asp:ListItem Text="Rajshahi" Value="Rajshahi" />
                                        <asp:ListItem Text="Bogura" Value="Bogura" />
                                        <asp:ListItem Text="Joypurhat" Value="Joypurhat" />
                                        <asp:ListItem Text="Naogaon" Value="Naogaon" />
                                        <asp:ListItem Text="Natore" Value="Natore" />
                                        <asp:ListItem Text="Chapainawabganj" Value="Chapainawabganj" />
                                        <asp:ListItem Text="Pabna" Value="Pabna" />
                                        <asp:ListItem Text="Sirajganj" Value="Sirajganj" />

                                        <asp:ListItem Text="Rangpur" Value="Rangpur" />
                                        <asp:ListItem Text="Dinajpur" Value="Dinajpur" />
                                        <asp:ListItem Text="Gaibandha" Value="Gaibandha" />
                                        <asp:ListItem Text="Kurigram" Value="Kurigram" />
                                        <asp:ListItem Text="Lalmonirhat" Value="Lalmonirhat" />
                                        <asp:ListItem Text="Nilphamari" Value="Nilphamari" />
                                        <asp:ListItem Text="Panchagarh" Value="Panchagarh" />
                                        <asp:ListItem Text="Thakurgaon" Value="Thakurgaon" />

                                        <asp:ListItem Text="Mymensingh" Value="Mymensingh" />
                                        <asp:ListItem Text="Netrokona" Value="Netrokona" />
                                        <asp:ListItem Text="Sherpur" Value="Sherpur" />

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtCity" CssClass="form-control" runat="server" placeholder="City" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtZipCode" CssClass="form-control" runat="server" placeholder="Zip Code"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" placeholder="Full Address" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-xl-center">
                                <span class="badge rounded-pill bg-info text-white">Login Credentials</span>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-md-6">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtUserId" CssClass="form-control" runat="server" placeholder="Set User ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtSetUserPassword" CssClass="form-control" runat="server" placeholder="Set Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-primary btn-block btn-md" Text="Sign Up" OnClick="btnSignUp_Click" />
                        </div>

                    </div>
                </div>
                <a href="homepage.aspx"><i class="fa-solid fa-arrow-left"></i>Back to Home</a>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>
