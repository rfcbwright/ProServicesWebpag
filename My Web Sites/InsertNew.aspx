<%@ Page Language="C#" Debug="true"%>

<!DOCTYPE html>
<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
        CustomerTB.Text = String.Empty;
        Sales_Order_TB.Text = String.Empty;
        Ship_Date_TB.Text = String.Empty;
        Sales_Rep_TB.Text = String.Empty;
        P201_TB.Text = String.Empty;
        P202_TB.Text = String.Empty;
        PS_Hours_TB.Text = String.Empty;
        End_Customer_TB.Text = String.Empty;
        CustomerPOC_TB.Text = String.Empty;
        PSE_TB.Text = String.Empty;
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Input New Sales Order:<br />
        </div>
        Customer:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
        <asp:TextBox ID="CustomerTB" runat="server" BorderStyle="Solid"></asp:TextBox>
        <br />
        <br />
        Sales Order:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <asp:TextBox ID="Sales_Order_TB" runat="server" BorderStyle="Solid"></asp:TextBox>
        <br />
        <br />
        Ship Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
        <asp:TextBox ID="Ship_Date_TB" runat="server" BorderStyle="Solid"></asp:TextBox>
        <br />
        <br />
        Sales Rep:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
        <asp:TextBox ID="Sales_Rep_TB" runat="server" BorderStyle="Solid"></asp:TextBox>
        <br />
        <br />
        P201 Days Purchased:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
        <asp:TextBox ID="P201_TB" runat="server" BorderStyle="Solid"></asp:TextBox>
        <br />
        <br />
        P202 Days Purchased:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="P202_TB" runat="server" BorderStyle="Solid"></asp:TextBox>
        <br />
        <br />
        PS Hourse Purchased:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:TextBox ID="PS_Hours_TB" runat="server" BorderStyle="Solid"></asp:TextBox>
        <br />
        <br />
        End Customer:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <asp:TextBox ID="End_Customer_TB" runat="server" BorderStyle="Solid"></asp:TextBox>
        <br />
        <br />
        Customer Point of Contact:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
        <asp:TextBox ID="CustomerPOC_TB" runat="server" BorderStyle="Solid"></asp:TextBox>
        <br />
        <br />
        Professional Services Engineer:&nbsp;&nbsp;
        <asp:TextBox ID="PSE_TB" runat="server" BorderStyle="Solid"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit Sales Order" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProServiceConnectionString %>" InsertCommand="INSERT INTO [jobs] ([customer],[sales_order],[ship_date],[sales_rep],[p201_days_purchased],[p202_days_purchased],[ps_hours_purchased],[end_user],[point_of_contact],[pse],[project_complete],[invoiced]) VALUES (@customer,@sales_order,@ship_date,@sales_rep,@p201_days_purchased,@p202_days_purchased,@ps_hours_purchased,@end_user,@point_of_contact,@pse,@project_complete,@invoiced)" SelectCommand="select * from jobs">
            <InsertParameters>
                <asp:ControlParameter ControlID="CustomerTB" Name="customer" PropertyName="Text" />
                <asp:ControlParameter ControlID="Sales_Order_TB" Name="sales_order" PropertyName="Text" />
                <asp:ControlParameter ControlID="Ship_Date_TB" Name="ship_date" PropertyName="Text" />
                <asp:ControlParameter ControlID="Sales_Rep_TB" Name="sales_rep" PropertyName="Text" />
                <asp:ControlParameter ControlID="P201_TB" Name="p201_days_purchased" PropertyName="Text" />
                <asp:ControlParameter ControlID="P202_TB" Name="p202_days_purchased" PropertyName="Text" />
                <asp:ControlParameter ControlID="PS_Hours_TB" Name="ps_hours_purchased" PropertyName="Text" />
                <asp:ControlParameter ControlID="End_Customer_TB" Name="end_user" PropertyName="Text" />
                <asp:ControlParameter ControlID="CustomerPOC_TB" Name="point_of_contact" PropertyName="Text" />
                <asp:ControlParameter ControlID="PSE_TB" Name="pse" PropertyName="Text" />
                <asp:Parameter DefaultValue="False" Name="project_complete" />
                <asp:Parameter DefaultValue="False" Name="invoiced" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
