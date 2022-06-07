<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FactorioProject_sbandoli.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3>Contact Us</h3>
    <br />
    <section id="userInfo">
    <h2>User Information</h2>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <asp:Label ID="lbName" runat="server" Text="Name:"></asp:Label>
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblDate" runat="server" Text="Date: (ex. yyyy-mm-dd)"></asp:Label>
        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblSubject" runat="server" Text="Subject:"></asp:Label>
        <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblMessage" runat="server" Text="Message:"></asp:Label>
        <asp:TextBox ID="txtMessage" runat="server" Height="60px" Width="200"></asp:TextBox>
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
       
        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Missing Name" ControlToValidate="txtName" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="Missing Date" ControlToValidate="txtDate" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Missing Email" ControlToValidate="txtEmail" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Missing Subject" ControlToValidate="txtSubject" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="Missing Message" ControlToValidate="txtMessage" Display="None"></asp:RequiredFieldValidator>
        </section>


    <asp:SqlDataSource ID="UserMessageTable" runat="server" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:UserAccountCS %>' DeleteCommand="DELETE FROM [UserAccount] WHERE [Id] = @original_Id AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Subject] = @original_Subject) OR ([Subject] IS NULL AND @original_Subject IS NULL)) AND (([Message] = @original_Message) OR ([Message] IS NULL AND @original_Message IS NULL))" InsertCommand="INSERT INTO [UserAccount] ([Name], [Date], [Email], [Subject], [Message]) VALUES (@Name, @Date, @Email, @Subject, @Message)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UserAccount]" UpdateCommand="UPDATE [UserAccount] SET [Name] = @Name, [Date] = @Date, [Email] = @Email, [Subject] = @Subject, [Message] = @Message WHERE [Id] = @original_Id AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Subject] = @original_Subject) OR ([Subject] IS NULL AND @original_Subject IS NULL)) AND (([Message] = @original_Message) OR ([Message] IS NULL AND @original_Message IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="original_Date"></asp:Parameter>
            <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Subject" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Message" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Date"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="Subject" Type="String"></asp:Parameter>
            <asp:Parameter Name="Message" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Date"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="Subject" Type="String"></asp:Parameter>
            <asp:Parameter Name="Message" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="original_Date"></asp:Parameter>
            <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Subject" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Message" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
