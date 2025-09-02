<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMater.Master" AutoEventWireup="true" CodeBehind="Dashbord.aspx.cs" Inherits="OnlineJobPortal.Admin.Dashbord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" />
    <link rel="stylesheet" href="../assets/css/style.css">

    <style>
        .card {
            background-color: #fff;
            border-radius: 10px;
            border: none;
            position: relative;
            margin-bottom: 30px;
            box-shadow: 0 0.46875rem 2.1875rem rgba(90,97,105,0.1), 0 0.9375rem 1.40625rem rgba(90,97,105,0.1), 0 0.25rem 0.53125rem rgba(90,97,105,0.12), 0 0.125rem 0.1875rem rgba(90,97,105,0.1);
        }

        .l-bg-cherry {
            background: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%) !important;
            color: #fff;
        }

        .l-bg-blue-dark {
            background: linear-gradient(45deg, #FA8BFF 0%, #2BD2FF 52%, #2BFF88 90%) !important;
            color: #fff;
        }

        .l-bg-green-dark {
            background-image: linear-gradient( 177.5deg, rgba(255,200,42,1) 28.3%, rgba(202,32,132,1) 79.8% );
        }

        .l-bg-orange-dark {
            background-image: linear-gradient( 150.4deg, rgba(75,255,237,1) 11.7%, rgba(32,42,235,1) 82.4% );
        }

        .card .card-statistic-3 .card-icon-large .fas, .card .card-statistic-3 .card-icon-large .far, .card .card-statistic-3 .card-icon-large .fab, .card .card-statistic-3 .card-icon-large .fal {
            font-size: 110px;
        }

        .card .card-statistic-3 .card-icon {
            text-align: center;
            line-height: 50px;
            margin-left: 15px;
            color: #000;
            position: absolute;
            right: -5px;
            top: 20px;
            opacity: 0.1;
        }

        .l-bg-cyan {
            background: linear-gradient(135deg, #289cf5, #84c0ec) !important;
            color: #fff;
        }

        .l-bg-green {
            background: linear-gradient(135deg, #23bdb8 0%, #43e794 100%) !important;
            color: #fff;
        }

        .l-bg-orange {
            background: linear-gradient(to right, #f9900e, #ffba56) !important;
            color: #fff;
        }

        .l-bg-cyan {
            background: linear-gradient(135deg, #289cf5, #84c0ec) !important;
            color: #fff;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-4">
        <div class="row">
            <div class="col-12 pb-3">
                <h2 class="text-center">Dashbord</h2>
            </div>

            <div class="col-md-10 mx-auto">
                <div class="row">

                    <div class="col-xl-3 col-lg-6">
                        <a href="UserList.aspx">
                            <div class="card l-bg-cherry">
                                <div class="card-statistic-3 p-4">
                                    <div class="card-icon card-icon-large">
                                        <i class="fas fa-users pr-2"></i>
                                    </div>
                                    <div class="mb-4">
                                        <h6 class="card-title mb-0">Total Users</h6>
                                    </div>
                                    <div class="row-aling-items-center mb-2 d-flex">
                                        <div class="col-8">
                                            <h2 class="d-flex align-items-center mb-0">
                                                <%Response.Write(Session["Users"]); %> <%--users count--%>
                                            </h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>


                    <div class="col-xl-3 col-lg-6">
                        <a href="JobList.aspx">
                            <div class="card l-bg-blue-dark">
                                <div class="card-statistic-3 p-4">
                                    <div class="card-icon card-icon-large">
                                        <i class="fas fa-briefcase pr-2"></i>
                                    </div>
                                    <div class="mb-4">
                                        <h6 class="card-title mb-0">Total Jobs</h6>
                                    </div>
                                    <div class="row-aling-items-center mb-2 d-flex">
                                        <div class="col-8">
                                            <h2 class="d-flex align-items-center mb-0">
                                                <%Response.Write(Session["Jobs"]); %>  <%--users count--%>
                                            </h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-xl-3 col-lg-6">
                        <a href="ViewResume.aspx">
                            <div class="card l-bg-green-dark">
                                <div class="card-statistic-3 p-4">
                                    <div class="card-icon card-icon-large">
                                        <i class="fas fa-check-square pr-2"></i>
                                    </div>
                                    <div class="mb-4">
                                        <h6 class="card-title mb-0">Applied Jobs</h6>
                                    </div>
                                    <div class="row-aling-items-center mb-2 d-flex">
                                        <div class="col-8">
                                            <h2 class="d-flex align-items-center mb-0">
                                                <%Response.Write(Session["AppliedJobs"]); %> <%--users count--%>
                                            </h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-xl-3 col-lg-6">
                        <a href="ContactList.aspx">
                            <div class="card l-bg-orange-dark">
                                <div class="card-statistic-3 p-4">
                                    <div class="card-icon card-icon-large">
                                        <i class="fas fa-comments pr-2"></i>
                                    </div>
                                    <div class="mb-4">
                                        <h6 class="card-title mb-0">Contacted Users</h6>
                                    </div>
                                    <div class="row-aling-items-center mb-2 d-flex">
                                        <div class="col-8">
                                            <h2 class="d-flex align-items-center mb-0">
                                                <%Response.Write(Session["Contact"]); %> <%--users count--%>
                                            </h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                </div>
            </div>

        </div>
    </div>

</asp:Content>
