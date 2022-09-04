<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="OnlineLibraryManagement.adminpublishermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Bootstrap/JS/jquery-3.6.0.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
    </script>
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
                                    <h4>Publisher Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/publisher.png" width="100" />
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
                                <label>Publisher ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtPublisherId" CssClass="form-control" runat="server" placeholder="Author ID"></asp:TextBox>
                                        <asp:Button ID="btnSearchPublisher" runat="server" CssClass="btn btn-secondary" Text="GO" OnClick="btnSearchPublisher_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Publisher Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPublisherName" CssClass="form-control" runat="server" placeholder="Author Full Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnInsertPublisher" runat="server" CssClass="btn btn-success btn-lg btn-block btn-md" Text="INSERT" OnClick="btnInsertPublisher_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnUpdatePublisher" runat="server" CssClass="btn btn-primary btn-lg btn-block btn-md" Text="UPDATE" OnClick="btnUpdatePublisher_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnDeletePublisher" runat="server" CssClass="btn btn-danger btn-lg btn-block btn-md" Text="DELETE" OnClick="btnDeletePublisher_Click" />
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
                                    <h4>Publisher List</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlPublisherDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryManagementDBCon %>" SelectCommand="SELECT * FROM [tblBookPublisher]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView ID="grdPublisherList" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="Publisher_ID" DataSourceID="SqlPublisherDataSource">
                                    <Columns>
                                        <asp:BoundField DataField="Publisher_ID" HeaderText="ID" ReadOnly="True" SortExpression="Publisher_ID" />
                                        <asp:BoundField DataField="Publisher_Name" HeaderText="Name" SortExpression="Publisher_Name" />
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
