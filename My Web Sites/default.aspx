<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource4.InsertCommand = "INSERT INTO [comment_history] ([sales_order], [date_time], [comment]) VALUES (@sales_order, @date_time, @comment)";
        SqlDataSource4.InsertParameters["date_time"].DefaultValue = DateTime.Now.ToString();
        SqlDataSource4.Insert();
        GridView1.DataBind();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.DataBind();
        GridView1.DataBind();
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();

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
	Customer:<br />
	<asp:DropDownList id="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="customer" DataValueField="customer" Height="27px" Width="344px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
	</asp:DropDownList>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProServiceConnectionString %>" SelectCommand="SELECT DISTINCT [customer] FROM [jobs]">
	</asp:SqlDataSource>
	<br />
	Sales Order #:<br />
	<asp:DropDownList id="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="sales_order" DataValueField="sales_order" Height="27px" Width="269px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
	</asp:DropDownList>
	<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProServiceConnectionString %>" SelectCommand="SELECT [sales_order] FROM [jobs] WHERE ([customer] = @customer)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="customer" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
	</asp:SqlDataSource>
	<br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Export.aspx">Export to CSV</asp:HyperLink>
	<br />
	<br />
	<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ProServiceConnectionString %>" SelectCommand="SELECT * FROM [jobs] WHERE ([sales_order] = @sales_order)" UpdateCommand="UPDATE [jobs] SET [customer]=@customer, [sales_order]=@sales_order, [ship_date]=@ship_date, [sales_rep] = @sales_rep, [p201_days_purchased]=@p201_days_purchased, [p201_days_complete]=@p201_days_complete,[p202_days_purchased]=@p202_days_purchased,  [p202_days_complete]=@p202_days_complete, [ps_hours_purchased]=@ps_hours_purchased, [ps_hours_complete]=@ps_hours_complete, [end_user] = @end_user, [point_of_contact] = @point_of_contact, [pse] = @pse, [date_of_delivery] = @date_of_delivery, [delivery_location] = @delivery_location, [project_complete] = @project_complete, [comments]=@comments,[invoiced]=@invoiced WHERE [sales_order]=@sales_order">
		<SelectParameters>
			<asp:ControlParameter ControlID="DropDownList2" Name="sales_order" PropertyName="SelectedValue" Type="String" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="customer" />
			<asp:Parameter Name="sales_order" />
			<asp:Parameter Name="ship_date" />
			<asp:Parameter Name="sales_rep" />
			<asp:Parameter Name="p201_days_purchased" />
			<asp:Parameter Name="p201_days_complete" />
			<asp:Parameter Name="p202_days_purchased" />
            <asp:Parameter Name="p202_days_complete" />
            <asp:Parameter Name="ps_hours_purchased" />
            <asp:Parameter Name="ps_hours_complete" />
			<asp:Parameter Name="end_user" />
			<asp:Parameter Name="point_of_contact" />
			<asp:Parameter Name="pse" />
			<asp:Parameter Name="date_of_delivery" />
			<asp:Parameter Name="delivery_location" />
			<asp:Parameter Name="project_complete" />
			<asp:Parameter Name="comments" />
			<asp:Parameter Name="invoiced" />
		</UpdateParameters>
	</asp:SqlDataSource>
	<br />
	<asp:DetailsView id="DetailsView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Height="50px" Width="470px" AutoGenerateEditButton="True" EnableViewState="False" AutoGenerateRows="False" CssClass="proserve1" EnableModelValidation="True">
		<AlternatingRowStyle BackColor="White" />
		<CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
		<EditRowStyle BackColor="#2461BF" />
		<FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
		<Fields>
			<asp:BoundField DataField="customer" HeaderText="customer" SortExpression="customer">
			</asp:BoundField>
			<asp:BoundField DataField="sales_order" HeaderText="sales_order" SortExpression="sales_order">
			</asp:BoundField>
			<asp:BoundField DataField="ship_date" HeaderText="ship_date" SortExpression="ship_date">
			</asp:BoundField>
			<asp:BoundField DataField="sales_rep" HeaderText="sales_rep" SortExpression="sales_rep">
			</asp:BoundField>
			<asp:BoundField DataField="p201_days_purchased" HeaderText="p201_days_purchased" SortExpression="p201_days_purchased">
			</asp:BoundField>
			<asp:BoundField DataField="p201_days_complete" HeaderText="p201_days_complete" SortExpression="p201_days_complete">
			</asp:BoundField>
<asp:BoundField DataField="p202_days_purchased" HeaderText="p202_days_purchased" SortExpression="p202_days_purchased"></asp:BoundField>
			<asp:BoundField DataField="p202_days_complete" HeaderText="p202_days_complete" SortExpression="p202_days_complete">
			</asp:BoundField>
			<asp:BoundField DataField="ps_hours_purchased" HeaderText="ps_hours_purchased" SortExpression="ps_hours_purchased">
			</asp:BoundField>
<asp:BoundField DataField="ps_hours_complete" HeaderText="ps_hours_complete" SortExpression="ps_hours_complete"></asp:BoundField>
			<asp:BoundField DataField="end_user" HeaderText="end_user" SortExpression="end_user">
			</asp:BoundField>
			<asp:BoundField DataField="point_of_contact" HeaderText="point_of_contact" SortExpression="point_of_contact">
			</asp:BoundField>
			<asp:BoundField DataField="pse" HeaderText="pse" SortExpression="pse" />
			<asp:BoundField DataField="date_of_delivery" HeaderText="date_of_delivery" SortExpression="date_of_delivery">
			</asp:BoundField>
			<asp:BoundField DataField="delivery_location" HeaderText="delivery_location" SortExpression="delivery_location">
			</asp:BoundField>
			<asp:CheckBoxField DataField="project_complete" HeaderText="project_complete" SortExpression="project_complete">
			</asp:CheckBoxField>
			<asp:CheckBoxField DataField="invoiced" HeaderText="invoiced" SortExpression="invoiced" />
		</Fields>
		<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
		<RowStyle BackColor="#EFF3FB" />
	</asp:DetailsView>
	<br />
    Comment:<br />
&nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="54px" Width="489px" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit Comment" />
    <br />
    <br />
    <br />
	<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ProServiceConnectionString %>" SelectCommand="SELECT * FROM [comment_history] WHERE [sales_order] = @sales_order" InsertCommand="">
        <InsertParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="sales_order" PropertyName="SelectedValue" />
            <asp:Parameter  Name="date_time" Type="DateTime" />
            <asp:ControlParameter ControlID="TextBox1" Name="comment" PropertyName="Text" />
        </InsertParameters>
        
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="sales_order" PropertyName="SelectedValue" />
        </SelectParameters>
        
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None" AllowSorting="True" EmptyDataText="No Comments">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="sales_order" HeaderText="sales_order" SortExpression="sales_order" />
            <asp:BoundField DataField="date_time" HeaderText="date_time" SortExpression="date_time" />
            <asp:BoundField DataField="comment" HeaderText="comment" SortExpression="comment" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
	<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ProServiceConnectionString %>" SelectCommand="SELECT * FROM [comment_history] WHERE ([sales_order] = @sales_order)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="sales_order" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
	<br />
</form>

</body>

</html>
