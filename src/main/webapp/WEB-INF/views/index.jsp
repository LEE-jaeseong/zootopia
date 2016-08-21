<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>주정차문제없는 주토피아</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/resources/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${pageContext.request.contextPath}/resources/bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<!-- /#wrapper -->

    
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Zootopia Ver1.0</a>
            </div>
            <!-- /.navbar-header -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Zootopia Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 경기도 성남시<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <!--second-->
                                    <li>
                                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>주정차 단속현황<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                       <li>
                                             <a href="seongnam_page1_1.html">기능1</a>
                                        </li>
                                        <li>
                                            <a href="seongnam_page1_2.html">기능2</a>
                                        </li>
                                        <li>
                                            <a href="seongnam_page1_3.html">기능3</a>
                                        </li>

                                    </ul>
                                        <!-- /.nav-second-level -->
                                    </li>
                                </li>
                                <li>
                                    <!--second-->
                                    <li>
                                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>주정차 분석현황<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                             <a href="flot.html">기능1</a>
                                        </li>
                                        <li>
                                            <a href="morris.html">기능2</a>
                                        </li>
                                        <li>
                                            <a href="morris.html">기능3</a>
                                        </li>

                                    </ul>
                                        <!-- /.nav-second-level -->
                                    </li>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>결과화면<span class="fa arrow"></span></a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>

                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">경기도 성남시</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="panel panel-info ">
                        <div class="panel-heading">
                            소개
                        </div>
                        <div class="panel-body ">

                            <img class="col-lg-4 intro" src="${pageContext.request.contextPath}/resources/images/seongnam_logo.png">
                            <span>경기도 성남시입니다</span><br>
                            <span>행정구역<br>
                            수정구, 중원구, 분당구<br>
                            주요명소<br>
                            율동공원, 정자동카페골목, 신구대학식물원, 캐니빌리지, 책테마파크
                            </span>
                            <br>
                            <h3>바로가기</h3>
                            
                            <button type="button" class="btn btn-primary">주정차현황</button>
                            <button type="button" class="btn btn-primary">주정차정보분석</button>
                            <button type="button" class="btn btn-primary">결과화면</button>
                        </div>
                      
                    </div>
            </div>
            
            




    </div>
    </div>
    
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/bower_components/raphael/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bower_components/morrisjs/morris.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>

</body>

</html>