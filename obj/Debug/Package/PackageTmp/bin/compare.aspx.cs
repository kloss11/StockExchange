using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockExchange
{
    public partial class compare : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            double amount = double.Parse(TextBox1.Text);
            double interestRate = double.Parse(TextBox4.Text);
            DateTime startDate = DateTime.Parse(TextBox2.Text);
            DateTime endDate = DateTime.Parse(TextBox3.Text);
            TimeSpan days = endDate - startDate;

            double profitFromBank = ((amount * (interestRate / 36500)) * int.Parse(days.Days.ToString()));
            Label4.Text = "Selected period = " + int.Parse(days.Days.ToString()) + " day(s), invested amount = " + amount.ToString() + 
                        ", interest rate = " + interestRate.ToString() + "%. Profit from bank: " + double.Parse(profitFromBank.ToString());
            try
            {
                calculate(amount, startDate, endDate);
            }
            catch (Exception exception)
            {

                throw exception;
            }
            
        }

        protected void calculate(double amount, DateTime startDate, DateTime endDate)
        {
            string startD = startDate.ToString();
            string endD = endDate.ToString();

            double result = 0;
            double startValue = 0;
            double endValue = 0;
            string firstSelectQuery = "SELECT top 1 [value] FROM dbo.ImportedData WHERE [date] = CAST('" + startD + "' as date)";
            string seccondSelectQuery = "SELECT top 1 [value] FROM dbo.ImportedData WHERE [date] = CAST('" + endD + "' as date)";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand first = new SqlCommand(firstSelectQuery, conn);
            SqlCommand last = new SqlCommand(seccondSelectQuery, conn);
                try
                {
                    conn.Open();
                    SqlDataReader readFirst = first.ExecuteReader();
                        while (readFirst.Read())
                        {
                            startValue = double.Parse(readFirst[0].ToString());
                        }

                readFirst.Close();
                SqlDataReader readSeccond = last.ExecuteReader();
                        while (readSeccond.Read())
                        {
                            endValue = double.Parse(readSeccond[0].ToString());
                        }
                    conn.Close();
                }
                catch (Exception exception)
                {

                    Label5.Text = "Error while comparing data. Check your connection. Error log: " + exception.ToString();
                }
            if (startValue == 0 || endValue == 0)
            {
                result = 0;
                Label5.Text = "Couldn't find specified date in database- please check again. ";
            }
            else
            {
                result = (amount / startValue) * endValue;
                Label5.Text = "Total benefit for selected parameters when investing in fund: " + result.ToString();
            }
        }
    }
}