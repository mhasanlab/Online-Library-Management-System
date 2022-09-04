<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="OnlineLibraryManagement.adminbookissuing" %>

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
                                    <h4>Book Issuing</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/books.png" width="100" />
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
                                    <asp:TextBox ID="txtBookIssueMemberId" CssClass="form-control" runat="server" placeholder="Enter Member ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtBookissueBookId" CssClass="form-control" runat="server" placeholder="Enter Book ID"></asp:TextBox>
                                        <asp:Button ID="btnSearchBookMemberId" runat="server" CssClass="btn btn-secondary" Text="GO" OnClick="btnSearchBookMemberId_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col-md-6">
                                <label>Member Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtBookissueMemberName" CssClass="form-control" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                               <div class="col-md-6">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtBookissueBookName" CssClass="form-control" runat="server" placeholder="Book Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Issue Date</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtBookIssueStartDate" CssClass="form-control" runat="server" placeholder="Book Issue Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                               <div class="col-md-6">
                                <label>Return Date</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtBookIssueReturnDate" CssClass="form-control" runat="server" placeholder="Book Return Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <asp:Button ID="btnIssueBook" runat="server" CssClass="btn btn-success btn-lg btn-block btn-md" Text="Issue Book" OnClick="btnIssueBook_Click" />
                            </div>
                            <div class="col-6">
                                <asp:Button ID="btnReturnBook" runat="server" CssClass="btn btn-warning btn-lg text-white btn-block btn-md" Text="Return Book" OnClick="btnReturnBook_Click" />
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
                                    <h4>Issued Book List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="DsBookIssuing" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryManagementDBCon %>" SelectCommand="SELECT * FROM [tblBookIssue]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView ID="grdIssuedBookList" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="DsBookIssuing" OnSelectedIndexChanged="grdIssuedBookList_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="Member_ID" HeaderText="Member ID" SortExpression="Member_ID" />
                                        <asp:BoundField DataField="Member_Name" HeaderText="Member Name" SortExpression="Member_Name" />
                                        <asp:BoundField DataField="Book_ID" HeaderText="Book ID" SortExpression="Book_ID" />
                                        <asp:BoundField DataField="Book_Name" HeaderText="Book Name" SortExpression="Book_Name" />
                                        <asp:BoundField DataField="Issue_Date" HeaderText="Issue Date" SortExpression="Issue_Date" />
                                        <asp:BoundField DataField="Return_Date" HeaderText="Return Date" SortExpression="Return_Date" />
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
