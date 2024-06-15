<!DOCTYPE html>
<html>

<head>
    <title>Login Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#loginForm").on("submit", function () {
                var userId = $("#userId").val();
                var password = $("#password").val();
                if (userId === "" || password === "") {
                    alert("User ID dan Password harus diisi.");
                    return false;
                }
                return true;
            });
        });
    </script>
</head>

<body>
    <form id="loginForm" action="login" method="post">
        <div>
            <label for="userId">User ID:</label>
            <input type="text" id="userId" name="userId">
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password">
        </div>
        <div>
            <button type="submit">Login</button>
        </div>
        <div>
            <c:if test="${param.error == 1}">
                <span style="color:red;">Invalid User ID or Password</span>
            </c:if>
        </div>
    </form>
</body>

</html>