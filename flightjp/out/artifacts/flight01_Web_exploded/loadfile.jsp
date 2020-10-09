<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/12/20
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>文件上传</h3>
<!--mvc方式-->
<form action="filetransfor/fileupload" method="post" enctype="multipart/form-data" ncy>
    选择文件：<input type="file" name="upload"/><br>
    <input type="submit" value="上传">
</form>

</body>
</html>
