using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LatihanValidasi
{
    public partial class _default : System.Web.UI.Page
    {
        static DataTable data;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                inisialisasiData();
                loadData();
            }

            gridData.Width = Unit.Percentage(100);
        }

        protected void inisialisasiData()
        {
            data = new DataTable();
            data.Columns.Add("nomor");
            data.Columns.Add("nama");
            data.Columns.Add("email");
            data.Columns.Add("password");
            data.Columns.Add("jenisKelamin");
        }

        protected void loadData()
        {
            gridData.DataSource = data;
            gridData.DataBind();
        }

        protected void btnKirim_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnKirim_Click1(object sender, EventArgs e)
        {
            DataRow dr = data.NewRow();
            dr[0] = data.Rows.Count + 1;
            dr[1] = tbNama.Text;
            dr[2] = tbEmail.Text;
            dr[3] = tbPassword.Text;
            dr[4] = ddJenisKelamin.SelectedValue;

            data.Rows.Add(dr);
            data.AcceptChanges();

            loadData();
        }

        protected void gridData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {
                if (e.CommandName == "Hapus")
                {
                    string id = gridData.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
                    data.Rows.RemoveAt(data.Rows.IndexOf(data.Select("nomor = " + id)[0]));
                    data.AcceptChanges();
                    loadData();
                }
            }
        }

        protected void gridData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridData.PageIndex = e.NewPageIndex;
            loadData();
        }
    }
}