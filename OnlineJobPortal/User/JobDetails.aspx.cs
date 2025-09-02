using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineJobPortal.User
{
    public partial class JobDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt, dt1;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public string jobTitle = string.Empty;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                showJobDetails();
                DataBind();
            }
            else
            {
                Response.Redirect("JobListing.aspx");
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private void showJobDetails()
        {
            con = new SqlConnection(str);
            string query = @"Select * from Jobs where JobId = @id";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            jobTitle = dt.Rows[0]["Title"].ToString();
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ApplyJob")
            {
                if (Session["user"] != null)
                {
                    try
                    {
                        using (SqlConnection con = new SqlConnection(str))
                        {
                            string query = "INSERT INTO AppliedJobs (JobId, UserId) VALUES (@JobId, @UserId)";
                            using (SqlCommand cmd = new SqlCommand(query, con))
                            {
                                cmd.Parameters.AddWithValue("@JobId", Request.QueryString["id"]);
                                cmd.Parameters.AddWithValue("@UserId", Session["userId"]);

                                con.Open();
                                int result = cmd.ExecuteNonQuery();

                                lblMeg.Visible = true;
                                lblMeg.Text = result > 0 ? "Job applied successfully!" : "Cannot apply for the job, please try again later.";
                                lblMeg.CssClass = result > 0 ? "alert alert-success" : "alert alert-danger";

                                if (result > 0) showJobDetails();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write($"<script>alert('{ex.Message}');</script>");
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["user"] != null)
            {
                LinkButton btnApplyJob = e.Item.FindControl("lbApplyJob") as LinkButton;
                if (btnApplyJob != null)
                {
                    if (IsApplied())
                    {
                        btnApplyJob.Enabled = false;
                        btnApplyJob.Text = "Applied";
                    }
                    else
                    {
                        btnApplyJob.Enabled = true;
                        btnApplyJob.Text = "Apply Now";
                    }
                }
            }
        }

        private bool IsApplied()
        {
            using (SqlConnection con = new SqlConnection(str))
            {
                string query = "SELECT 1 FROM AppliedJobs WHERE UserId = @UserId AND JobId = @JobId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                    cmd.Parameters.AddWithValue("@JobId", Request.QueryString["id"]);

                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        return reader.HasRows;
                    }
                }
            }
        }

        protected string GetImageUrl(Object url)
        {
            string url1 = "";
            if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "~/Images/No_image.png";
            }
            else
            {
                url1 = string.Format("~/{0}", url);
            }
            return ResolveUrl(url1);
        }
    }
}