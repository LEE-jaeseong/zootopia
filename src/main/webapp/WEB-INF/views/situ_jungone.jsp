<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>주정차문제없는 행복한도시-주토피아</title>

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
                <a class="navbar-brand" href="#">Zootopia - 성남시</a>
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
                            <a href="/zootopia/dashboard"><i class="fa fa-dashboard fa-fw"></i>고정형 CCTV Dashboard</a>
                        </li>
                        <li>
                         	<a href="#"><i class="glyphicon glyphicon-th-large logo-small"></i>불법주정차 단속현황</a>
                            <ul class="nav nav-second-level">
                            	<li>
                            		<a href="/zootopia/situation/sujeong">수정구 불법주정차 단속현황</a>
                            	</li>
                            	<li>
                            		<a href="/zootopia/situation/jungone">중원구 불법주정차 단속현황</a>
                            	</li>
                            	<li>
                            		<a href="/zootopia/situation/bundang">분당구 불법주정차 단속현황</a>
                            	</li>
                            </ul>
                            <a href="#"><i class="glyphicon glyphicon glyphicon-screenshot logo-small"></i>불법주정차 분석자료</a>
                            <ul class="nav nav-second-level">
                            	<li>
                            		<a href="/zootopia/analytics/cctv">CCTV 확충지역 분석</a>
                            	</li>
                            	<li>
                            		<a href="/zootopia/analytics/seriousArea">불법주정차 심각지수 분석</a>
                            	</li>
                            </ul>
                            <a href="/zootopia/result"><i class="glyphicon glyphicon glyphicon-file logo-small"></i>결과보고서 </a>
                           
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
                    <h1 class="page-header">중원구 불법 주정차 단속현황</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
               <iframe src="https://dashboards.ly/ua-HY5JpNTvkfs256CP2djr4Z" width="100%" height="1000px"
                scrolling="no style="border: none;"></iframe>


                  
                
            </div>
        </div>
            </div>

    <!-- /#wrapper -->

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
