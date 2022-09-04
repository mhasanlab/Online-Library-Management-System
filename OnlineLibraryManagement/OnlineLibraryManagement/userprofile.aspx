<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="OnlineLibraryManagement.userprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/generaluser.png" width="100" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Profile</h4>
                                    <span>Account Status- </span>
                                    <asp:Label ID="lblAccountsStatus" CssClass="badge rounded-pill bg-success" runat="server" Text="Your Status"></asp:Label>
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
                                    <asp:TextBox ID="txtFullNameProfile" CssClass="form-control" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtDOBProfile" CssClass="form-control" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtContactNumberProfile" CssClass="form-control" runat="server" placeholder="+8801xxxxxxxxx" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmailProfile" CssClass="form-control" runat="server" placeholder="example@domain.com" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>District</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="txtDistrictProfile" CssClass="form-control" runat="server">
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
                                    <asp:TextBox ID="txtCityProfile" CssClass="form-control" runat="server" placeholder="City" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtZipCodeProfile" CssClass="form-control" runat="server" placeholder="Zip Code"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAddressProfile" CssClass="form-control" runat="server" placeholder="Full Address" TextMode="MultiLine"></asp:TextBox>
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
                            <div class="col-md-4">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtUserIdProfile" CssClass="form-control" runat="server" placeholder="Set User ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtUserPasswordProfile" CssClass="form-control" runat="server" placeholder="Set Password" TextMode="Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtNewPasswordProfile" CssClass="form-control" runat="server" placeholder="Set Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">
                            <asp:Button ID="btnUpdateProfile" runat="server" CssClass="btn btn-primary btn-block btn-md" Text="Update Now" />
                        </div>

                    </div>
                </div>
                <a href="homepage.aspx"><i class="fa-solid fa-arrow-left"></i>Back to Home</a>
                <br />
                <br />
            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/books.png" width="100" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Issued Books</h4>
                                    <asp:Label ID="Label1" CssClass="badge rounded-pill bg-info" runat="server" Text="Your Borrowed Books Info"></asp:Label>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="grdUserBookIssueInfo" CssClass="table table-striped table-bordered" runat="server"></asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
