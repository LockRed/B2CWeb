<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String context = request.getContextPath(); %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/themes/default/easyui.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/themes/icon.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>

	<H1 align=center>
		<a href="<%=context %>/find.jsp">搜索商品</a>&nbsp;&nbsp; <BR>
		本系统的所有商品列表如下： <BR> <BR>
		<TABLE width=800 border=1>
			<TBODY>
				<TR height=50>
					<TD>产品图片</TD>
					<TD>产品名称</TD>
					<TD>产品价格</TD>
					<TD>产品描述</TD>
					<TD>添加到购物车</TD>
				</TR>
				<%-- <c:forEach var="p" items="${requestScope.products}">
					<TR>
						<TD>
							${p.name}
						</TD>
						<TD>
							<A href="ListAction.do?method=addItem&productId=${p.id}">添加到购物车</A>
						</TD>
					</TR>
					</c:forEach> --%>

				<s:iterator value="productlist" var="p">
					<TR>
						<TD>

							<!--  修改浏览器显示不了图片bug  --> <!-- 	<img src="${p.imageSrc }" style="height:60px; width:80px" />  -->

							<!-- 配置server。xml  客户端使用相对地址 --> <img
							src="<%=context %>/UploadImages/${p.imageSrc }"
							style="height: 60px; width: 80px" />


						</TD>

						<TD><s:property value="#p.name" /> </TD>

						<TD><s:property value="#p.price" /> </TD>

						<TD><s:property value="#p.description" /> </TD>


						<TD><a
							href="<%=context %>/from/addaction!addItem?productId=<s:property value="#p.id"/>">添加到购物车</a>
							<%-- <a href="<%=context %>/admin/Category_updateinput?id=<s:property value="#c.id"/>">修改Category</a> --%>
						</TD>
					</TR>
				</s:iterator>
			</TBODY>
		</TABLE>

		<!-- 2014.8.29 分页功能 -->
		<BR>

		<s:set name="page" value="#request['page']" />

		<s:set name="maxpage" value="#request['maxpage']" />

		<s:if test="#page==1">首页</s:if>

		<s:if test="#page>1 ">
			<a href="<%=context %>/from/listaction!list?page=1"> 首页</a>
		</s:if>

		<s:if test="#page == 1 ">上一页</s:if>

		<s:if test="#page>1 ">
			<a href="<%=context %>/from/listaction!list?page=${page-1}"> 上一页</a>
		</s:if>

		<s:if test="#page ==#maxpage">下一页</s:if>

		<s:if test="#page< #maxpage ">
			<a href="<%=context %>/from/listaction!list?page=${page + 1}">
				下一页</a>
		</s:if>

		<s:if test="#page == #maxpage">末页</s:if>

		<s:if test="#page< #maxpage  ">
			<a href="<%=context %>/from/listaction!list?page=${maxpage}">末页</a>
		</s:if>

		<BR> <a href="<%=context %>/from/cart_inedx!CartIndex">查看购物车</a>&nbsp;&nbsp;
		<a href="<%=context %>/from/order_index!index">结帐</a>&nbsp;&nbsp; <a
			href="<%=context %>/from/listaction!list?page=1"> 返回首页</a>&nbsp;&nbsp;
		<a href="<%=context %>/from/loginaction">登录</a>&nbsp;&nbsp; <a
			href="<%=context %>/userregister.jsp">注册</a>&nbsp;&nbsp;
			<a id="LoginOut_btn" href="<%=context %>/from/loginoutaction">退出</a>

		<!-- <A href="CartAction.do?method=index">查看购物车</A>&nbsp;&nbsp;
			<A href="OrderAction.do?method=index">结账</A>&nbsp;&nbsp;
			<A href="login.jsp">登录</A> -->
	</H1>
	<table id="dg"></table> 
<script type="text/javascript">
		$("#dg").datagrid({   
			width:400, 
		    url:"${pageContext.request.contextPath}/from/listaction!list",    
		    fitColumns:true,
		    columns:[[    
		        {field:'imageSrc',title:'产品图片',width:100},    
		        {field:'name',title:'产品名称',width:100},    
		        {field:'price',title:'产品价格',width:100}, 
		        {field:'description',title:'产品描述',width:100},    
		        {field:'xxx',title:'添加到购物车',width:100}   
		    ]],
		    singleSelect:true,
		    pagination:true,
		    pageNumber:1,//查询的当前页码
		    pageSize:5,// 每页显示的记录数
		    pageList:[2]  // 记录数的集合  
		}); 	
	</script>
	