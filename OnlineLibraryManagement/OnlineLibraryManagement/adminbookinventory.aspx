<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="OnlineLibraryManagement.adminbookinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>

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
                                    <h4>Book Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/books.png" id="imgview" height="150" width="100" />
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
                                <asp:FileUpload ID="adminBookInventoryFileUpload" onchange="readURL(this);" CssClass="form-control" runat="server" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtAdminBookInventoryBookId" CssClass="form-control" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:LinkButton ID="linkbtnSearchBookMemberId" CssClass="btn btn-secondary" runat="server" OnClick="linkbtnSearchBookMemberId_Click"><i class="fa-solid fa-arrow-right-from-bracket"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtBookInventoryBookName" CssClass="form-control" runat="server" placeholder="Book Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlAdminBookInventoryLanguage" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select" Value="Select" />
                                        <asp:ListItem Text="Bangla" Value="Bangla" />
                                        <asp:ListItem Text="English" Value="English" />
                                    </asp:DropDownList>
                                </div>
                                <label>Publisher</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlAdminBookInventoryPublisher" CssClass="form-control" runat="server" DataSourceID="DsLoadPublisherToinventory" DataTextField="Publisher_Name" DataValueField="Publisher_Name">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="DsLoadPublisherToinventory" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryManagementDBCon %>" SelectCommand="SELECT [Publisher_Name] FROM [tblBookPublisher]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Author</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlAdminBookInventoryAuthor" CssClass="form-control" runat="server" DataSourceID="LoadAuthorToBookInventory" DataTextField="Author_Name" DataValueField="Author_Name">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="LoadAuthorToBookInventory" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryManagementDBCon %>" SelectCommand="SELECT [Author_Name] FROM [tblBookAuthor]"></asp:SqlDataSource>
                                </div>

                                <label>Publish Date</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminBookInventoryBookPublishDate" CssClass="form-control" runat="server" placeholder="Publish Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Category</label>
                                <div class="form-group">
                                    <asp:ListBox ID="libAdminBookInventoryBookGenre" runat="server" CssClass="form-control" SelectionMode="Multiple" Rows="5" DataSourceID="dsLoadCatagoryIntoListbox" DataTextField="Category_Name" DataValueField="Category_Name"></asp:ListBox>
                                    <asp:SqlDataSource ID="dsLoadCatagoryIntoListbox" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryManagementDBCon %>" SelectCommand="SELECT [Category_Name] FROM [tblBookCategory]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Edition</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminBookInventoryBookEdition" CssClass="form-control" runat="server" placeholder="Edition"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Book Cost(Per Unit)</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminBookInventoryBookCost" CssClass="form-control" runat="server" placeholder="Book Cost(Per Unit)" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pages</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminBookInventoryBookPages" CssClass="form-control" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Actual Stock</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminBookInventoryActualStock" CssClass="form-control" runat="server" placeholder="20" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Current Stock</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminBookInventoryCurrentStock" CssClass="form-control" runat="server" placeholder="15" ReadOnly="True" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Issued Books</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminBookInventoryIssuedBooks" CssClass="form-control" runat="server" placeholder="5" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <label>Book Description</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAdminBookInventoryBookDescription" CssClass="form-control" runat="server" placeholder="Address" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnAdminInsertBookInventry" runat="server" CssClass="btn btn-success btn-lg btn-block btn-md" Text="INSERT" OnClick="btnAdminInsertBookInventry_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnAdminUpdateBookInventry" runat="server" CssClass="btn btn-primary btn-lg btn-block btn-md" Text="UPDATE" OnClick="btnAdminUpdateBookInventry_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnAdminDeleteBookInventry" runat="server" CssClass="btn btn-danger btn-lg btn-block btn-md" Text="DELETE" OnClick="btnAdminDeleteBookInventry_Click" />
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
                                <asp:GridView ID="grdAdminBookInventoryList" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="Book_ID" DataSourceID="dsLoadAllBookInventory" OnSelectedIndexChanged="grdAdminBookInventoryList_SelectedIndexChanged">
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
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Book_Author") %>'></asp:Label> &nbsp;| <span><span>&nbsp;<span>Category - </span> <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Category_Name") %>'></asp:Label>&nbsp;|<span> Language -<span>&nbsp;</span>
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
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Cost -
                                                   <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("Book_Cost") %>'></asp:Label>
                                                                    &nbsp;| Actual Stock -
                                                   <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("Actual_Stock") %>'></asp:Label>
                                                                    &nbsp;| Available Stock -
                                                   <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("Current_Stock") %>'></asp:Label>
                                                                </div>
                                                            </div>
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
</asp:Content>
