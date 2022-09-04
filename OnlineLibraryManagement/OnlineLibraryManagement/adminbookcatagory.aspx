<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminbookcatagory.aspx.cs" Inherits="OnlineLibraryManagement.adminbookcatagory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col justify-content-center">
                <h2 class="mb-4">Add New Category</h2>
                <div class="d-flex justify-content-end mb-2">
                    <a href="addnewcategory.aspx" class="btn btn-info">View All Category</a>
                </div>
                <asp:FormView ID="frmAddnewCategory" DefaultMode="Insert" CssClass="table table-bordered" runat="server" DataSourceID="ObjectDataSource1" OnPageIndexChanging="frmAddnewCategory_PageIndexChanging">
                    <EditItemTemplate>
                        CategoryId:
                        <asp:TextBox ID="CategoryIdTextBox" runat="server" Text='<%# Bind("CategoryId") %>' />
                        <br />
                        CategoryName:
                        <asp:TextBox ID="CategoryNameTextBox" runat="server" Text='<%# Bind("CategoryName") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CssClass="btn btn-success" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" CssClass="btn btn-info" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <h5>Category Id:</h5>
                        <asp:TextBox ID="CategoryIdTextBox" runat="server" CssClass="form-control" Text='<%# Bind("CategoryId") %>' />
                        <br />
                        <h5>Category Name:</h5>
                        <asp:TextBox ID="CategoryNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CategoryName") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" CssClass="btn btn-success" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-info" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        CategoryId:&nbsp;&nbsp;
                        <asp:Label ID="CategoryIdLabel" runat="server" Text='<%# Bind("CategoryId") %>' />
                        <br />
                        CategoryName:&nbsp;&nbsp;
                        <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Bind("CategoryName") %>' />
                        <br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CssClass="btn btn-primary" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="OnlineLibraryManagement.Models.BookCategory" DeleteMethod="DeleteCategory" InsertMethod="InsertCategory" SelectMethod="Get" TypeName="OnlineLibraryManagement.DAL.CategoryGetWay" UpdateMethod="UpdateCategory">
                    <DeleteParameters>
                        <asp:Parameter Name="categoryId" Type="Int32" />
                    </DeleteParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
