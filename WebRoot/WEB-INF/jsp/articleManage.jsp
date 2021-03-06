<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="ck" uri="http://ckeditor.com"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="frame/Header.jsp"></jsp:include>
<div class="container">
    <div style="height: 3%"></div>
    <div class="row">
        <div class="col-sm-9 table-responsive">
        	 <c:choose>
					<c:when test="${user!=null&& user.userpermission==0 && articles!=null && fn:length(articles)>0}">
						<table class="table table-hover"> 
						<caption>我的文章列表</caption>
						<c:forEach items="${articles}" var="art">
							<tr>
							<td><input type="hidden" name="article_id" id="article_id" value="${art.articleid}"></td>
							<td><a href="${pageContext.request.contextPath}/article?id=${art.articleid}">${art.title }</a></td>
							<td>${art.publish_time }</td>
							<td><a href="${pageContext.request.contextPath}/articleBySc?id=${art.sys_category_id}">${art.category_name }</a></td>
							<td><a href="${pageContext.request.contextPath}/userinfo?id=${art.user_id}">${art.username}</a></td>
							<td><a href="${pageContext.request.contextPath}/toUpdateArticle?id=${art.articleid}">修改</a></td>
							<td><input class="btn btn-warning" type="button" value="删除" onclick="delArt($(this));"></td>
							</tr>
						</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
						<p>还没有写过文章哦，赶紧写吧~</p>
					</c:otherwise>
			</c:choose>
	       <ul class="pager">
	            <c:if test="${page.pageNo >1}">
	                <div class="col-sm-6"><li><a  href="${pageContext.request.contextPath}/ArticleManage?pageNo=${page.pageNo-1}">上一页</a></li></div>
	            </c:if>
	            <c:if test="${page.pageNo <(totalPage/page.pageSize)}">
	                <div class="col-sm-6"><li><a href="${pageContext.request.contextPath}/ArticleManage?pageNo=${page.pageNo+1}">下一页 </a></li></div>
	            </c:if>
           </ul> 						
								
        </div>
        <div class="col-sm-3 hidden-xs panel-group" id="accordion">
            <div class="easyui-fullCalendar" style="height:400%;width: 400%" ></div>
		
            <div class="panel">
                <h3 class="page-header"  data-toggle="collapse" data-parent="#accordion"  href="#collapse2">文章Top5</h3>
                <ul id="collapse2" class="nav nav-tabs nav-stacked panel-collapse collapse">
                    <c:choose>
                		<c:when test="${articleTop!=null && fn:length(articleTop)>0}">
                			<c:forEach items="${articleTop}" var="artT">
		                    	<li><a style="color:gray" href="${pageContext.request.contextPath}/article?id=${artT.articleid}">${artT.title}</a></li>
		                    </c:forEach>
		                </c:when>
		                <c:otherwise>
	                		<li><a style="color:gray" href="">暂无文章</a></li> 
		                </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>	
</div>
<jsp:include page="frame/Footer.jsp"></jsp:include>

<script type="text/javascript">

</script>