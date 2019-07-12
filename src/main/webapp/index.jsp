<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/8 0008
  Time: 下午 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>

    <script>
        $(function () {

            //发送ajax请求，加载所有省份数据
            $.get("provinceServlet",null,function (data) {
                //[{"id":1,"name":"北京"},{"id":2,"name":"上海"},{"id":3,"name":"广州"},{"id":4,"name":"陕西"}]

                //1.获取select
                var province = $("#province");
                //2.遍历json数组
                $(data).each(function () {
                    //3.创建<option>
                    var option = "<option value='"+this.id+"'>"+this.name+"</option>";

                    //4.调用select的append追加option
                    province.append(option);
                });
            });

            $("#province").change(function () {
                $.get("getCity",{id:$(this).val()},function (data) {
                    //[{"id":1,"name":"北京"},{"id":2,"name":"上海"},{"id":3,"name":"广州"},{"id":4,"name":"陕西"}]

                    //1.获取select
                    var city = $("#city");
                    city.empty();
                    city.append("<option >--请选择城市--</option>")
                    //2.遍历json数组
                    $(data).each(function () {
                        //3.创建<option>
                        var option = "<option value='"+this.id+"'>"+this.name+"</option>";

                        //4.调用select的append追加option
                        city.append(option);
                    });
                });
            });

            $("#city").change(function () {
                $.get("getCountry",{id:$(this).val()},function (data) {
                    //[{"id":1,"name":"北京"},{"id":2,"name":"上海"},{"id":3,"name":"广州"},{"id":4,"name":"陕西"}]

                    //1.获取select
                    var country = $("#country");
                    country.empty();
                    country.append("<option>--请选择区县--</option>")
                    //2.遍历json数组
                    $(data).each(function () {
                        //3.创建<option>
                        var option = "<option value='"+this.id+"'>"+this.name+"</option>";

                        //4.调用select的append追加option
                        country.append(option);
                    });
                });
            });

        });



    </script>


</head>
<body>



<select id="province" >
    <option>--请选择省份--</option>

</select>

<select id="city" >
    <option >--请选择城市--</option>
</select>

<select id="country" >
    <option>--请选择区县--</option>
</select>

</body>
</html>
