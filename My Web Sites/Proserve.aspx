<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource2.FilterExpression = "";
    }
</script>


<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Professional Services Tracker</title>
<style type="text/css">
</style>
</head>

<body>

<form id="form1" runat="server" class="newStyle1">
	Customer Filter:<br />
	<asp:DropDownList id="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="customer" DataValueField="customer" Height="27px" Width="344px" AutoPostBack="True">
        <asp:ListItem Selected="True">all</asp:ListItem>
	</asp:DropDownList>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProServiceConnectionString %>" SelectCommand="SELECT DISTINCT [customer] FROM [jobs]">
	</asp:SqlDataSource>
	<br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Clear Filter" />
	<br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/default.aspx">Back to Portal</asp:HyperLink>
	<br />
    <br />
	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EnableModelValidation="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="customer" HeaderText="Customer" SortExpression="customer" />
            <asp:BoundField DataField="sales_order" HeaderText="Sales Order #" SortExpression="sales_order" />
            <asp:BoundField DataField="ship_date" HeaderText="Ship Date" SortExpression="ship_date" />
            <asp:BoundField DataField="sales_rep" HeaderText="Sales Rep" SortExpression="sales_rep" />
            <asp:BoundField DataField="days" HeaderText="Days Purchased" SortExpression="days" />
            <asp:BoundField DataField="days_complete" HeaderText="Days Completed" SortExpression="days_complete" />
            <asp:BoundField DataField="item_id" HeaderText="PS Type" SortExpression="item_id" />
            <asp:BoundField DataField="end_user" HeaderText="End Customer" SortExpression="end_user" />
            <asp:BoundField DataField="point_of_contact" HeaderText="Customer Point of Contact" SortExpression="point_of_contact" />
            <asp:BoundField DataField="ps_deliverer" HeaderText="RF Code PSE/SE" SortExpression="ps_deliverer" />
            <asp:BoundField DataField="date_of_delivery" HeaderText="Date Completed" SortExpression="date_of_delivery" />
            <asp:BoundField DataField="delivery_location" HeaderText="Location of PS" SortExpression="delivery_location" />
            <asp:CheckBoxField DataField="project_complete" HeaderText="Completed" SortExpression="project_complete" />
            <asp:CheckBoxField DataField="invoiced" HeaderText="Invoiced" SortExpression="invoiced" />
            <asp:BoundField DataField="comments" HeaderText="Comments" SortExpression="comments" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
	<br />
	<br />
	<br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProServiceConnectionString %>" SelectCommand="SELECT * FROM [jobs] " EnableCaching="True" FilterExpression="customer = '{0}'" UpdateCommand="UPDATE [jobs] SET [customer]=@customer, [sales_order]=@sales_order, [ship_date]=@ship_date, [sales_rep] = @sales_rep, [days] = @days, [item_id] = @item_id, [end_user] = @end_user, [point_of_contact] = @point_of_contact, [ps_deliverer] = @ps_deliverer, [date_of_delivery] = @date_of_delivery, [delivery_location] = @delivery_location, [project_complete] = @project_complete, [comments]=@comments,[invoiced]=@invoiced WHERE [sales_order]=@sales_order and [item_id]=@item_id">
        <FilterParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="CustomerFilter" PropertyName="SelectedValue" />
        </FilterParameters>
        <UpdateParameters>
            <asp:Parameter Name="customer" />
            <asp:Parameter Name="sales_order" />
            <asp:Parameter Name="ship_date" />
            <asp:Parameter Name="sales_rep" />
            <asp:Parameter Name="days" />
            <asp:Parameter Name="item_id" />
            <asp:Parameter Name="end_user" />
            <asp:Parameter Name="point_of_contact" />
            <asp:Parameter Name="ps_deliverer" />
            <asp:Parameter Name="date_of_delivery" />
            <asp:Parameter Name="delivery_location" />
            <asp:Parameter Name="project_complete" />
            <asp:Parameter Name="comments" />
            <asp:Parameter Name="invoiced" />
        </UpdateParameters>
    </asp:SqlDataSource>
	<br />
</form>

</body>

</html>
