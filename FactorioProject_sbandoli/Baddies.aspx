<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Baddies.aspx.cs" Inherits="FactorioProject_sbandoli.Baddies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <asp:GridView ID="BaddieGV" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="BaddieTable">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Baddie's Name" />
                <asp:BoundField DataField="Type" HeaderText="Type of Baddie" />
                <asp:BoundField DataField="Health" HeaderText="Amount of Health" />
                <asp:BoundField DataField="Damage" HeaderText="Amount of Damage" />
                <asp:BoundField DataField="Speed" HeaderText="Speed of Baddie" />
            </Columns>

            <RowStyle BorderColor="#FFBA75" BorderStyle="Groove" />

        </asp:GridView>

        <h2>Selected Baddie</h2>
        <p>
            <asp:DetailsView ID="SelectedBaddieDV" runat="server" Height="146px" Width="530px" AutoGenerateRows="False" DataSourceID="SelectedBaddie" DataKeyNames="Id" BorderColor="#FFBA75" BorderStyle="Groove">
                <Fields>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type"></asp:BoundField>
                    <asp:BoundField DataField="Health" HeaderText="Health" SortExpression="Health"></asp:BoundField>
                    <asp:BoundField DataField="Damage" HeaderText="Damage" SortExpression="Damage"></asp:BoundField>
                    <asp:BoundField DataField="Speed" HeaderText="Speed" SortExpression="Speed"></asp:BoundField>
                </Fields>
            </asp:DetailsView>
        </p>

        <br />
        <br />
        <h2>Baddie Table Interactions</h2>
        <p>
            <asp:FormView ID="BaddieFV" runat="server" DataKeyNames="Id" DataSourceID="BaddieTable" AllowPaging="True">
                <EditItemTemplate>
                    Id:
                    <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel1" /><br />
                    Name:
                    <asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" /><br />
                    Type:
                    <asp:TextBox Text='<%# Bind("Type") %>' runat="server" ID="TypeTextBox" /><br />
                    Health:
                    <asp:TextBox Text='<%# Bind("Health") %>' runat="server" ID="HealthTextBox" /><br />
                    Damage:
                    <asp:TextBox Text='<%# Bind("Damage") %>' runat="server" ID="DamageTextBox" /><br />
                    Speed:
                    <asp:TextBox Text='<%# Bind("Speed") %>' runat="server" ID="SpeedTextBox" /><br />
                    <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                </EditItemTemplate>
                <InsertItemTemplate>
                     Name:
                    <asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" /><br />
                    Type:
                    <asp:TextBox Text='<%# Bind("Type") %>' runat="server" ID="TypeTextBox" /><br />
                    Health:
                    <asp:TextBox Text='<%# Bind("Health") %>' runat="server" ID="HealthTextBox" /><br />
                    Damage:
                    <asp:TextBox Text='<%# Bind("Damage") %>' runat="server" ID="DamageTextBox" /><br />
                    Speed:
                    <asp:TextBox Text='<%# Bind("Speed") %>' runat="server" ID="SpeedTextBox" /><br />
                    <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                </InsertItemTemplate>
                <ItemTemplate>
                    Id:
                    <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" /><br />
                    Name:
                    <asp:Label Text='<%# Bind("Name") %>' runat="server" ID="NameLabel" /><br />
                    Type:
                    <asp:Label Text='<%# Bind("Type") %>' runat="server" ID="TypeLabel" /><br />
                    Health:
                    <asp:Label Text='<%# Bind("Health") %>' runat="server" ID="HealthLabel" /><br />
                    Damage:
                    <asp:Label Text='<%# Bind("Damage") %>' runat="server" ID="DamageLabel" /><br />
                    Speed:
                    <asp:Label Text='<%# Bind("Speed") %>' runat="server" ID="SpeedLabel" /><br />
                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                </ItemTemplate>
             </asp:FormView>
        </p>
    </section>



    <asp:SqlDataSource ID="BaddieTable" runat="server" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:UserAccountCS %>' DeleteCommand="DELETE FROM [Table] WHERE [Id] = @original_Id AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([Health] = @original_Health) OR ([Health] IS NULL AND @original_Health IS NULL)) AND (([Damage] = @original_Damage) OR ([Damage] IS NULL AND @original_Damage IS NULL)) AND (([Speed] = @original_Speed) OR ([Speed] IS NULL AND @original_Speed IS NULL))" InsertCommand="INSERT INTO [Table] ([Name], [Type], [Health], [Damage], [Speed]) VALUES (@Name, @Type, @Health, @Damage, @Speed)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Table]" UpdateCommand="UPDATE [Table] SET [Name] = @Name, [Type] = @Type, [Health] = @Health, [Damage] = @Damage, [Speed] = @Speed WHERE [Id] = @original_Id AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([Health] = @original_Health) OR ([Health] IS NULL AND @original_Health IS NULL)) AND (([Damage] = @original_Damage) OR ([Damage] IS NULL AND @original_Damage IS NULL)) AND (([Speed] = @original_Speed) OR ([Speed] IS NULL AND @original_Speed IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Type" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Health" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Damage" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Speed" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Type" Type="String"></asp:Parameter>
            <asp:Parameter Name="Health" Type="String"></asp:Parameter>
            <asp:Parameter Name="Damage" Type="String"></asp:Parameter>
            <asp:Parameter Name="Speed" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Type" Type="String"></asp:Parameter>
            <asp:Parameter Name="Health" Type="String"></asp:Parameter>
            <asp:Parameter Name="Damage" Type="String"></asp:Parameter>
            <asp:Parameter Name="Speed" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Type" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Health" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Damage" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Speed" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SelectedBaddie" runat="server" ConnectionString='<%$ ConnectionStrings:UserAccountCS %>' SelectCommand="SELECT * FROM [Table] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="BaddieGV" Name="Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
