<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Оплата билета</title>
</head>
<body>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

<script>
    function validate() {
        const msg = "Пожалуйста, заполните поле : ";
        if ($('#username').val() === '') {
            alert(msg + $('#username').attr('title'))
            return false;
        } else if ($('#phone').val() === '') {
            alert(msg + $('#phone').attr('title'))
            return false;
        }
        return true;
    }
</script>

<div class="container">
    <div class="row pt-3">
        <h3>
            Вы выбрали ряд <c:out value="${place[0]}"/> место <c:out value="${place[1]}"/>, Сумма :
            <c:choose>
                <c:when test="${place[0] == 1}">
                    <c:out value="300"/>
                </c:when>
                <c:when test="${place[0] == 2}">
                    <c:out value="400"/>
                </c:when>
                <c:when test="${place[0] == 3}">
                    <c:out value="500"/>
                </c:when>
            </c:choose> рублей.
        </h3>
    </div>
    <div class="row">
        <form action="<%=request.getContextPath()%>/buy" method="post">
            <div class="form-group">
                <label for="username">ФИО</label>
                <input type="text" class="form-control" id="username" title="ФИО" name="name" placeholder="ФИО">
            </div>
            <div class="form-group">
                <label for="phone">Номер телефона</label>
                <input type="text" class="form-control" id="phone" title="номер телефона" name="phone" placeholder="Номер телефона">
            </div>
            <button type="submit" class="btn btn-success" onclick="validate()">Оплатить</button>
        </form>
    </div>
</div>
</body>
</html>