<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="/security" %>
<style>
  body {
      padding-bottom: 20px;
      padding-top: 20px;
  }
  .navbar {
      margin-bottom: 20px;
  }
</style>
<nav role="navigation" class="navbar navbar-inverse navbar-embossed">
  <div class="navbar-header">
    <button data-target="#bs-example-navbar-collapse-15" data-toggle="collapse" class="navbar-toggle" type="button">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#"><f:message key="common.title"/></a>
  </div>
  <div id="bs-example-navbar-collapse-15" class="collapse navbar-collapse">
    <p class="navbar-text navbar-right"><f:message key="common.user"/>: <security:principal/></p>
    <button class="btn btn-default navbar-btn btn-xs" type="button" id="logout"><f:message key="common.logout"/></button>
</nav>
<div class="row">
  <div class="col-md-12">
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
           <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-01">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse navbar-collapse-01">
              <ul id="menu" class="nav navbar-nav navbar-left">
                <li id="orde"><a href="${BASE}/orders"><f:message key="order"/></a></li>
                <li id="chart"><a href="${BASE}/charts"><f:message key="order.chart"/></a></li>
                <li id="custome"><a href="${BASE}/customers"><f:message key="customer"/></a></li>
                <li id="notic"><a href="${BASE}/notices"><f:message key="notice"/></a></li>
                <security:hasRole name="admin">
                  <li id="use"><a href="${BASE}/users"><f:message key="user"/></a></li>
                  <li id="sal"><a href="${BASE}/salesman"><f:message key="salesman"/></a></li>
                  <li id="produc"><a href="${BASE}/productTypes"><f:message key="producttype"/></a></li>
                </security:hasRole>
              </ul>
       </div><!--/.nav -->
    </nav>
  </div>
</div>