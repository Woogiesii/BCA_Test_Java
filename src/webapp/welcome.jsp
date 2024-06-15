<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Welcome Page</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".userId").on("click", function () {
                    var studentName = $(this).data("name");
                    alert("Student Name: " + studentName);
                });
            });
        </script>
    </head>

    <body>
        <h1>Welcome ${sessionScope.userId}</h1>
        <table border="1">
            <tr>
                <th>Department</th>
                <th>Student ID</th>
                <th>Marks</th>
                <th>Pass %</th>
            </tr>
            <% int passCount=0; int totalCount=0; String currentDept="" ; for(Student student : (List<Student>
                )request.getAttribute("students")) {
                if (!student.getDepartment().equals(currentDept)) {
                if (totalCount > 0) {
                out.println("<tr>
                    <td colspan='4'>Pass %: " + (passCount * 100 / totalCount) + "%</td>
                </tr>");
                }
                currentDept = student.getDepartment();
                passCount = 0;
                totalCount = 0;
                }
                totalCount++;
                if (student.getMark() >= 40) {
                passCount++;
                }
                %>
                <tr>
                    <td>
                        <%= student.getDepartment() %>
                    </td>
                    <td><span class="userId" data-name="<%= student.getName() %>">
                            <%= student.getId() %>
                        </span></td>
                    <td>
                        <%= student.getMark() %>
                    </td>
                </tr>
                <% } if (totalCount> 0) {
                    out.println("<tr>
                        <td colspan='4'>Pass %: " + (passCount * 100 / totalCount) + "%</td>
                    </tr>");
                    }
                    %>
        </table>
    </body>

    </html>