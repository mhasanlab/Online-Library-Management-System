<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="OnlineLibraryManagement.adminauthormanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<script src="Bootstrap/JS/jquery-3.6.0.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
     </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/writer.png" width="100" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Author ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtAuthorId" CssClass="form-control" runat="server" placeholder="Author ID"></asp:TextBox>
                                        <asp:Button ID="btnSearchAuthor" runat="server" CssClass="btn btn-secondary" Text="GO" OnClick="btnSearchAuthor_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAuthorName" CssClass="form-control" runat="server" placeholder="Author Full Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnInsertAuthor" runat="server" CssClass="btn btn-success btn-lg btn-block btn-md" Text="INSERT" OnClick="btnInsertAuthor_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnUpdateAuthor" runat="server" CssClass="btn btn-primary btn-lg btn-block btn-md" Text="UPDATE" OnClick="btnUpdateAuthor_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnDeleteAuthor" runat="server" CssClass="btn btn-danger btn-lg btn-block btn-md" Text="DELETE" OnClick="btnDeleteAuthor_Click" />
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
                                    <h4>Author List</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlAuthorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryManagementDBCon %>" SelectCommand="SELECT * FROM [tblBookAuthor]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:ListView ID="AuthorListView" Class="table table-striped table-bordered" runat="server" DataKeyNames="Author_ID" DataSourceID="SqlAuthorDataSource">
                                    <AlternatingItemTemplate>
                                        <tr style="">
                                            <td>
                                                <asp:Label ID="Author_IDLabel" runat="server" Text='<%# Eval("Author_ID") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="Author_NameLabel" runat="server" Text='<%# Eval("Author_Name") %>' />
                                            </td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                    <EditItemTemplate>
                                        <tr style="">
                                            <td>
                                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Author_IDLabel1" runat="server" Text='<%# Eval("Author_ID") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Author_NameTextBox" runat="server" Text='<%# Bind("Author_Name") %>' />
                                            </td>
                                        </tr>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <table runat="server" style="">
                                            <tr>
                                                <td>No data was returned.</td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                        <tr style="">
                                            <td>
                                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Author_IDTextBox" runat="server" Text='<%# Bind("Author_ID") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Author_NameTextBox" runat="server" Text='<%# Bind("Author_Name") %>' />
                                            </td>
                                        </tr>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <tr style="">
                                            <td>
                                                <asp:Label ID="Author_IDLabel" runat="server" Text='<%# Eval("Author_ID") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="Author_NameLabel" runat="server" Text='<%# Eval("Author_Name") %>' />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table runat="server" Class="table table-striped table-bordered" >
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table id="itemPlaceholderContainer" runat="server" border="0" style="width:100%">
                                                        <tr runat="server" style="">
                                                            <th runat="server">ID</th>
                                                            <th runat="server">Name</th>
                                                        </tr>
                                                        <tr id="itemPlaceholder" runat="server">
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr runat="server">
                                                <td runat="server" style="">
                                                    <asp:DataPager ID="DataPager1" runat="server">
                                                        <Fields>
                                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                                        </Fields>
                                                    </asp:DataPager>
                                                </td>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                    <SelectedItemTemplate>
                                        <tr style="">
                                            <td>
                                                <asp:Label ID="Author_IDLabel" runat="server" Text='<%# Eval("Author_ID") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="Author_NameLabel" runat="server" Text='<%# Eval("Author_Name") %>' />
                                            </td>
                                        </tr>
                                    </SelectedItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
