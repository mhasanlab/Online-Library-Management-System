<%@ Page Title="View Book" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="OnlineLibraryManagement.viewbooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <center>
                                                <h4>Book Inventory List</h4>
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
                                            <asp:GridView ID="grdAdminBookInventoryList" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="Book_ID" DataSourceID="dsLoadAllBookInventory">
                                                <Columns>
                                                    <asp:BoundField DataField="Book_ID" HeaderText="ID" ReadOnly="True" SortExpression="Book_ID">
                                                        <ControlStyle Font-Bold="True" />
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>

                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="col-lg-10 text-justify">
                                                                        <div class="row">
                                                                            <div class="col-12">
                                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Book_Name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-12">
                                                                                <span>Author - </span>
                                                                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Book_Author") %>'></asp:Label>
                                                                                &nbsp;| <span><span>&nbsp;<span>Category - </span>
                                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Category_Name") %>'></asp:Label>&nbsp;|<span> Language -<span>&nbsp;</span>
                                                                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("Book_Language") %>'></asp:Label>
                                                                                    </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-lg-12">
                                                                                Publisher -
                                                   <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Book_Publisher") %>'></asp:Label>
                                                                                &nbsp;| Publish Date -
                                                   <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("Publish_Date") %>'></asp:Label>
                                                                                &nbsp;| Pages -
                                                   <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("Book_Pages") %>'></asp:Label>
                                                                                &nbsp;| Edition -
                                                   <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("Book_Edition") %>'></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    <%--    <div class="row">
                                                                            <div class="col-lg-12">
                                                                                Cost -
                                                   <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("Book_Cost") %>'></asp:Label>
                                                                                &nbsp;| Actual Stock -
                                                   <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("Actual_Stock") %>'></asp:Label>
                                                                                &nbsp;| Available Stock -
                                                   <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("Current_Stock") %>'></asp:Label>
                                                                            </div>
                                                                        </div>--%>
                                                                        <div class="row">
                                                                            <div class="col-12 text-justify">
                                                                                Description -
                                                   <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("Book_Description") %>'></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-2">
                                                                        <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("Book_Img") %>' />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="dsLoadAllBookInventory" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryManagementDBCon %>" SelectCommand="SELECT * FROM [tblBookDetails]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
