<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>

<script runat="server">
    public static string ScrubHtml(string value)
    {
        var step1 = Regex.Replace(value, @"<[^>]+>|&nbsp;", "").Trim();
        var step2 = Regex.Replace(step1, @"\s{}", " ");
        return step2;
    }
    protected void export_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=PSexport " +
        DateTime.Now.ToString() + ".csv");
        Response.Charset = "";
        Response.ContentType = "application/text";
        StringBuilder sBuilder = new System.Text.StringBuilder();
        for (int index = 0; index < GridView1.Columns.Count; index++)
        {
            sBuilder.Append(GridView1.Columns[index].HeaderText + ',');
        }
        sBuilder.Append("\r\n");
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            for (int k = 0; k < GridView1.HeaderRow.Cells.Count; k++)
            {
                sBuilder.Append(GridView1.Rows[i].Cells[k].Text.Replace(",", "") + ",");
            }
            sBuilder.Append("\r\n");
        }
        string csvout = sBuilder.ToString();
        csvout = ScrubHtml(csvout);
        Response.Output.Write(csvout);
        Response.Flush();
        Response.End();
    }

   
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if (DropDownList1.Text == "Completed")
        {
            SqlDataSource1.FilterExpression = "project_complete = '{0}'";
        }
        if (DropDownList1.Text == "Invoiced")
        {
            SqlDataSource1.FilterExpression = "invoiced = '{0}'";
        }
        if (DropDownList1.Text == "Neither Invoiced nor Completed")
        {
            SqlDataSource1.FilterExpression = "project_complete = {1}";
        }
        if (DropDownList1.Text == "All")
        {
            SqlDataSource1.FilterExpression = "";
        }
        
    }
</script>

<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Import_Export</title>
</head>
<body>

<form id="form1" runat="server">
	&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/default.aspx">Return to Pro Services Portal</asp:HyperLink>
	


	<br />
    <br />
	<asp:Button id="export" runat="server" Text="Export to CSV" OnClick="export_Click" />
	


	<br />
    <br />
    Show: <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
        <asp:ListItem>All</asp:ListItem>
        <asp:ListItem>Completed</asp:ListItem>
        <asp:ListItem>Invoiced</asp:ListItem>
        <asp:ListItem>Neither Invoiced nor Completed</asp:ListItem>
    </asp:DropDownList>
	<br />
	<asp:GridView id="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" AllowSorting="True">
		<AlternatingRowStyle BackColor="White" />
		<Columns>
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
			<asp:BoundField DataField="p202_days_purchased" HeaderText="p202_days_purchased" SortExpression="p202_days_purchased">
			</asp:BoundField>
			<asp:BoundField DataField="p202_days_complete" HeaderText="p202_days_complete" SortExpression="p202_days_complete">
			</asp:BoundField>
			<asp:BoundField DataField="ps_hours_purchased" HeaderText="ps_hours_purchased" SortExpression="ps_hours_purchased">
			</asp:BoundField>
			<asp:BoundField DataField="ps_hours_complete" HeaderText="ps_hours_complete" SortExpression="ps_hours_complete">
			</asp:BoundField>
			<asp:BoundField DataField="end_user" HeaderText="end_user" SortExpression="end_user">
			</asp:BoundField>
			<asp:BoundField DataField="point_of_contact" HeaderText="point_of_contact" SortExpression="point_of_contact">
			</asp:BoundField>
			<asp:BoundField DataField="pse" HeaderText="pse" SortExpression="pse">
			</asp:BoundField>
			<asp:BoundField DataField="date_of_delivery" HeaderText="date_of_delivery" SortExpression="date_of_delivery">
			</asp:BoundField>
		    <asp:BoundField DataField="delivery_location" HeaderText="delivery_location" SortExpression="delivery_location" />
            <asp:CheckBoxField DataField="project_complete" HeaderText="project_complete" SortExpression="project_complete" />
            <asp:CheckBoxField DataField="invoiced" HeaderText="invoiced" SortExpression="invoiced" />
            <asp:BoundField DataField="comments" HeaderText="comments" SortExpression="comments" />
		</Columns>
	    <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
	</asp:GridView>
	
	
	
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProServiceConnectionString %>" SelectCommand="SELECT * FROM [jobs]">
        <FilterParameters>
            <asp:Parameter DefaultValue="True" Name="True" />
            <asp:Parameter DefaultValue="False" Name="False" />
        </FilterParameters>
	</asp:SqlDataSource>
		
	
	<p>
	    &nbsp;</p>
		
</form>
</body>

</html>
