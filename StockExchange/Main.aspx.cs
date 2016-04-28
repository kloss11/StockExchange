using FileHelpers;
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


        static void ReadCSVFile(Stream filePath)
        {
            DataTable tbl = new DataTable();
            using (StreamReader sr = new StreamReader(filePath))
            {
                for (int col = 0; col < 3; col++)
                    tbl.Columns.Add(new DataColumn("Column" + (col + 1).ToString()));
                string[] lines = sr.ReadLine().Split(',');

                foreach (string line in lines)
                {
                    DataRow dr = tbl.NewRow();
                    for (int cIndex = 0; sr.EndOfStream; cIndex++)
                    {
                        dr[cIndex] = line[cIndex];
                    }

                    tbl.Rows.Add(dr);
                }
            }


        }
    }
}