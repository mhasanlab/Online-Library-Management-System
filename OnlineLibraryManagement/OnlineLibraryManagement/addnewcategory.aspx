<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addnewcategory.aspx.cs" Inherits="OnlineLibraryManagement.addnewcategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <h2>Category List</h2>
                <div class="d-flex justify-content-end mb-2">
                    <a href="adminbookcatagory.aspx" class="btn btn-primary">Add New Category</a>
                </div>
                <asp:GridView ID="ViewAllCategory" CssClass="table table-bordered table-striped" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Category_ID" DataSourceID="dsViewAllCategory">
                    <Columns>
                        <asp:BoundField DataField="Category_ID" HeaderText="Category_ID" ReadOnly="True" SortExpression="Category_ID" />
                        <asp:BoundField DataField="Category_Name" HeaderText="Category_Name" SortExpression="Category_Name" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsViewAllCategory" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryManagementDBCon %>" DeleteCommand="DELETE FROM [tblBookCategory] WHERE [Category_ID] = @Category_ID" InsertCommand="INSERT INTO [tblBookCategory] ([Category_ID], [Category_Name]) VALUES (@Category_ID, @Category_Name)" SelectCommand="SELECT [Category_ID], [Category_Name] FROM [tblBookCategory]" UpdateCommand="UPDATE [tblBookCategory] SET [Category_Name] = @Category_Name WHERE [Category_ID] = @Category_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="Category_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Category_ID" Type="Int32" />
                        <asp:Parameter Name="Category_Name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Category_Name" Type="String" />
                        <asp:Parameter Name="Category_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

        </div>

    </div>
</asp:Content>
