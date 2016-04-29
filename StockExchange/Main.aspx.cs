using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockExchange
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Boolean fileOK = false;
            if (FileUpload1.HasFile)
            {
                String fileExtension =
                    System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                String[] allowedExtensions = { ".csv" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
            }

            if (fileOK)
            {
                try
                {
                    Stream importFile = FileUpload1.PostedFile.InputStream;
                    ReadCSVFile(importFile);
                    Label1.Text = "File uploaded!";

                }
                catch (Exception ex)
                {
                    Label1.Text = "File could not be uploaded. Error msg: " + ex.ToString();
                }
            }
            else
            {
                Label1.Text = "Cannot accept files of this type.";
            }
        }

        protected void ReadCSVFile(Stream filePath)
        {
            try
            {
                DataTable tbl = new DataTable();
                using (StreamReader sr = new StreamReader(filePath))
                {
                    while (!sr.EndOfStream)
                    {
                        string line = sr.ReadLine();
                        string[] fields = line.Split(',');
                        if (tbl.Columns.Count == 0)
                        {
                            foreach (string field in fields)
                            {
                                tbl.Columns.Add();
                            }
                        }
                        tbl.Rows.Add(fields);
                    }

                    String InsertQuery = string.Empty;
                    for (int i = 0; i < tbl.Rows.Count; i++)
                    {
                        InsertQuery = "INSERT INTO dbo.ImportedData " +
                                  "(extID,[date],[value]) " +
                                  "VALUES ('" + tbl.Rows[i][0].ToString() + "', CONVERT(date, '" + tbl.Rows[i][1].ToString() + "',103),'" + tbl.Rows[i][2].ToString() + "')";
                        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Agata\Documents\Visual Studio 2015\Projects\StockExchange\StockExchange\App_Data\Database1.mdf;Integrated Security=True";
                        SqlConnection conn = new SqlConnection(connString);
                        SqlCommand dbcm = new SqlCommand(InsertQuery, conn);
                        conn.Open();
                        dbcm.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception exception)
            {
                Label1.Text = "Error occured while importing data to database. Error log: " + exception.ToString();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String dateStart = DropDownList1.SelectedValue.ToString() + "-" + DropDownList2.SelectedValue.ToString() + "-" + DropDownList3.SelectedValue.ToString();
            String dateEnd = DropDownList4.SelectedValue.ToString() + "-" + DropDownList5.SelectedValue.ToString() + "-" + DropDownList6.SelectedValue.ToString();
            SqlDataSource1.SelectCommand = "SELECT * FROM dbo.ImportedData WHERE [date] between CAST('" + dateStart + "' as date) AND CAST('" + dateEnd +"' as date) ORDER BY [date]";
            SqlDataSource1.DataBind();
            GridView1.DataBind();
            Chart1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string deleteQuery = "DELETE FROM dbo.ImportedData";
            string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Agata\Documents\Visual Studio 2015\Projects\StockExchange\StockExchange\App_Data\Database1.mdf;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand comm = new SqlCommand(deleteQuery, conn);
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
        }
    }
}
