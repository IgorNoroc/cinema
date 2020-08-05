<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <title>TimeTest</title>
</head>
<body>
<script>
    function show() {
        $.ajax({
            type: "GET",
            url: 'http://localhost:8080/cinema/showTime',
        }).done(function (html) {
            $('#content').html(html)
        })
    }

    $(document).ready(function () {
        show();
        setInterval('show()', 1000);
    });

    function getCurrentFreePlaces() {
        $.ajax({
            type: 'GET',
            url: 'http://localhost:8080/cinema/hall',
            dataType: 'json'
        }).done(function (data) {
                console.log(data)
                for (let d in data) {
                    const sold = 'sold'.fontcolor('red');
                    if (data[d].id === "1.1") {
                        $('#1\\.1').replaceWith(sold);
                    } else if (data[d].id === "1.2") {
                        $('#1\\.2').replaceWith(sold);
                    } else if (data[d].id === "1.3") {
                        $('#1\\.3').replaceWith(sold);
                    } else if (data[d].id === "2.1") {
                        $('#2\\.1').replaceWith(sold);
                    } else if (data[d].id === "2.2") {
                        $('#2\\.2').replaceWith(sold);
                    } else if (data[d].id === "2.3") {
                        $('#2\\.3').replaceWith(sold);
                    } else if (data[d].id === "3.1") {
                        $('#3\\.1').replaceWith(sold);
                    } else if (data[d].id === "3.2") {
                        $('#3\\.2').replaceWith(sold);
                    } else if (data[d].id === "3.3") {
                        $('#3\\.3').replaceWith(sold);
                    }
                }
            }
        )
    }

    $(document).ready(function () {
        getCurrentFreePlaces();
        setInterval('getCurrentFreePlaces()', 5000)
    })

    function choosePlace() {
        if ($('input[name=place]:checked').length < 1) {
            alert("пожалуйста, выберите место")
            return false;
        }
        return true;
    }

</script>

<h2>Фильм: Аватар</h2>

<p id="content"></p><br/>


<div class="container">
    <form action="<%=request.getContextPath()%>/choose" method="post">
        <div class="row pt-3" >
            <h4>
                Бронирование месте на сеанс
            </h4>
            <table class="table table-bordered" style="background-color: azure">
                <thead>
                <tr>
                    <th style="width: 120px;">Ряд / Место</th>
                    <th>1</th>
                    <th>2</th>
                    <th>3</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>1</th>
                    <td><input id="1.1" type="radio" name="place" value="1.1"> Ряд 1, Место 1</td>
                    <td><input id="1.2" type="radio" name="place" value="1.2"> Ряд 1, Место 2</td>
                    <td><input id="1.3" type="radio" name="place" value="1.3"> Ряд 1, Место 3</td>
                </tr>
                <tr>
                    <th>2</th>
                    <td><input id="2.1" type="radio" name="place" value="2.1"> Ряд 2, Место 1</td>
                    <td><input id="2.2" type="radio" name="place" value="2.2"> Ряд 2, Место 2</td>
                    <td><input id="2.3" type="radio" name="place" value="2.3"> Ряд 2, Место 3</td>
                </tr>
                <tr>
                    <th>3</th>
                    <td><input id="3.1" type="radio" name="place" value="3.1"> Ряд 3, Место 1</td>
                    <td><input id="3.2" type="radio" name="place" value="3.2"> Ряд 3, Место 2</td>
                    <td><input id="3.3" type="radio" name="place" value="3.3"> Ряд 3, Место 3</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="row float-right">
            <button type="submit" class="btn btn-primary" onclick="return choosePlace()">Оплатить</button>
        </div>
    </form>
    <br/>
    <p id="da"></p>
</div>

</body>
</html>