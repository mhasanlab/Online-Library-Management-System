<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="OnlineLibraryManagement.adminmembermanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="Bootstrap/JS/jquery-3.6.0.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
                  <%--Custom Message Box--%>
            <div class="col col-md-8 mx-auto">
                <div class="alert alert-success" id="MemberStatusUpdated" runat="server" visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4>Member Status Updated Successfully</h4>
                    <%--<p>The status of member is updated successfully.</p>--%>
                </div>
            </div>
              <div class="col col-md-8 mx-auto">
                <div class="alert alert-success" id="MemberDeleted" runat="server" visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4>Member Deleted Successfully</h4>
                    <%--<p>The status of member is updated successfully.</p>--%>
                </div>
            </div>
             <div class="col col-md-8 mx-auto">
                <div class="alert alert-success" id="MemberIdNotValid" runat="server" visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4>Invalid Member ID</h4>
                    <p>The Id you entered is not valid please enter a valid Member Id.</p>
                </div>
            </div>

            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/generaluser.png" width="100" />
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
                                <label>Member ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtViewBookId" CssClass="form-control" runat="server" placeholder="Member ID"></asp:TextBox>
                                        <asp:LinkButton ID="linkbtnSearchBookMemberId" CssClass="btn btn-secondary" runat="server" OnClick="linkbtnSearchBookMemberId_Click"><i class="fa-solid fa-arrow-right-from-bracket"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtAdminAccountStatus" CssClass="form-control" runat="server" placeholder="Status" ReadOnly="True"></asp:TextBox>
                                        &nbsp;
                                       <asp:LinkButton ID="linkbtnAdminAccountActive" CssClass="btn btn-success btn-sm mr-1" runat="server" OnClick="linkbtnAdminAccountActive_Click"><i class="fa-regular fa-circle-check"></i></asp:LinkButton>
                                        <asp:LinkButton ID="linkbtnAdminAccountPending" CssClass="btn btn-warning btn-sm mr-1" runat="server" OnClick="linkbtnAdminAccountPending_Click"><i class="fa-regular fa-circle-pause"></i></asp:LinkButton>
                                        <asp:LinkButton ID="linkbtnAdminAccountDactive" CssClass="btn btn-danger btn-sm mr-1" runat="server" OnClick="linkbtnAdminAccountDactive_Click"><i class="fa-regular fa-circle-xmark"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAminMamberFullName" CssClass="form-control" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminMemberDOB" CssClass="form-control" runat="server" placeholder="Date of Birth" ReadOnly="True" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminMemberContact" CssClass="form-control" runat="server" placeholder="+8801xxxxxxxxx" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminMemberEmail" CssClass="form-control" runat="server" placeholder="EX: example@domain.com" ReadOnly="True" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>District</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminMemberDistrict" CssClass="form-control" runat="server" placeholder="District" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminMemberCity" CssClass="form-control" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminMemberZipCode" CssClass="form-control" runat="server" placeholder="Zip Code" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col-12">
                                <label>Full Postal Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminMemberAddress" CssClass="form-control" runat="server" placeholder="Address" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 mx-auto">
                                <asp:Button ID="btnAdminMemberPermanentDelete" runat="server" CssClass="btn btn-danger btn-block btn-md" Text="Permanently Delete Member" OnClick="btnAdminMemberPermanentDelete_Click" />
                            </div>
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
                                    <h4>Member List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlMemberDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryManagementDBCon %>" SelectCommand="SELECT * FROM [tblLibraryMember]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView ID="grdAdminManageMemberList" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="Member_ID" DataSourceID="SqlMemberDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="Member_ID" HeaderText="ID" SortExpression="Member_ID" ReadOnly="True" />
                                        <asp:BoundField DataField="Full_Name" HeaderText="Full Name" SortExpression="Full_Name" />
                                        <asp:BoundField DataField="Member_Contact" HeaderText="Contact No." SortExpression="Member_Contact" />
                                        <asp:BoundField DataField="Member_Email" HeaderText="Email Address" SortExpression="Member_Email" />
                                        <asp:BoundField DataField="Account_Status" HeaderText="Account Status" SortExpression="Account_Status" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
