<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>澳猫商城</title>
<!--  CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style4.css">
<script src="${pageContext.request.contextPath}/assets/js/dashboard.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.1.min.js" type="text/javascript"></script>

<script>
        $(function(){
            var $table = $('table');
            var currentPage = 0;//当前页默认值为0
            var pageSize = 3;//每一页显示的数目
            $table.bind('paging',function(){
                $table.find('tbody tr').hide().slice(currentPage*pageSize,(currentPage+1)*pageSize).show();
            });
            var sumRows = $table.find('tbody tr').length;
            var sumPages = Math.ceil(sumRows/pageSize);//总页数

            var $pager = $('<div class="page"></div>');  //新建div，放入a标签,显示底部分页码
            for(var pageIndex = 0 ; pageIndex<sumPages ; pageIndex++){
                $('<a href="#" id="pageStyle" onclick="changCss(this)"><span>'+(pageIndex+1)+'</span></a>').bind("click",{"newPage":pageIndex},function(event){
                    currentPage = event.data["newPage"];
                    $table.trigger("paging");
                    //触发分页函数
                }).appendTo($pager);
                $pager.append(" ");
            }
            $pager.insertAfter($table);
            $table.trigger("paging");

            //默认第一页的a标签效果
            var $pagess = $('#pageStyle');
            $pagess[0].style.backgroundColor="#5eba00";
            $pagess[0].style.color="#ffffff";
        });

        //a链接点击变色，再点其他回复原色
        function changCss(obj){
            var arr = document.getElementsByTagName("a");
            for(var i=0;i<arr.length;i++){
                if(obj==arr[i]){       //当前页样式
                    obj.style.backgroundColor="#5eba00";
                    obj.style.color="#ffffff";
                }
                else
                {
                    arr[i].style.color="";
                    arr[i].style.backgroundColor="";
                }
            }
        }
    </script>
</head>
<!-- 获取从session中保存的message标记值，来弹出提示窗口 -->
<%
	Object message = request.getSession().getAttribute("message");
	if(message!=null && !"".equals(message)){
%>
	<script type="text/javascript">
		alert("<%=message%>");
	</script>
<%
	} 
%>
<!-- 将当前message标记值清空 -->
<%
	message = null;
	session.setAttribute("message", message); 
%>
<body>
	<script>
	function isBack(){
		if(confirm("是否退出登录？")){
			location.href = "/marketSSM/user/logout";
		}
	}
	</script>



<div class="container">
   
<div class="col-12">

    <div class="card">
        <div class="table-responsive">
            <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">


                <table class="table card-table table-vcenter text-nowrap datatable dataTable no-footer" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
                <thead>
                <tr role="row"><th class="w-1 sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 44.7px;" aria-sort="ascending" aria-label="No.: activate to sort column descending">商品ID</th>
                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 171.933px;" aria-label="Invoice Subject: activate to sort column ascending">商品名</th>
                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 131.2px;" aria-label="Client: activate to sort column ascending">商品价格</th>
                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 81.95px;" aria-label="VAT No.: activate to sort column ascending"></th>
                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 102.95px;" aria-label="Created: activate to sort column ascending"></th>
                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 146.467px;" aria-label="Status: activate to sort column ascending">图片</th>
                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 53.6167px;" aria-label="Price: activate to sort column ascending">商品类型</th>
                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 172.55px;" aria-label=": activate to sort column ascending"></th>
                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 28.6333px;" aria-label=": activate to sort column ascending">
				</th>
				</tr>
                </thead>
                <tbody>
                <c:forEach var="goods" items="${sessionScope.goodsList}">
                <tr role="row" class="odd">
                    <td class="sorting_1"><span class="text-muted"><a href="/WevaProjectSSM/homework/toHomeworkContent?assignmentId=${assignment.assignmentId}">${goods.goods_id}</a></span></td>
                    <td>
                    	<span  class="text-muted">${goods.goods_name}</span>
                    </td>
                    <td>
                    	<span  class="text-muted">${goods.goods_price}</span>
                    </td>
                    <td>

                    </td>
                    <td>

                    </td>

                    <td>
						<a href="/WevaProjectSSM/subject/toSubject?subjectId=${subject.subjectId}"
								class="mb-3"> <img
								src="${pageContext.request.contextPath}/assets/img/${goods.goods_img}"
								alt="Photo by Nathan Guerrero" class="rounded">
							</a>
                   	</td>
                    <td>
						<span  class="text-muted">${goods.goods_type}</span>
                    </td>
                    
                    <td class="text-right">
						
                    </td>
                    <td>

                    </td>
                </tr>
                </c:forEach>
                </tbody>
                
                </table>
        </div>
    </div>
    </div>
</div>
</div>

</body>
</html>