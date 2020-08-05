
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ошибка</title>
    <style>
        #e {align-items: center}
        #a {align-content: center}
    </style>
</head>
<body>
<div id="e" style="color: brown">К сожалению выбранное вами место уже куплено...</div>
<br />
<a id="a" href="<%=request.getContextPath()%>/index.jsp">Выбрать другое место...</a>
</body>
</html>
