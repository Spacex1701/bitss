<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Authors Directory</title>
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f4f4f9; padding: 20px; }
        h1 { color: #333; }
        .btn { display: inline-block; padding: 10px 15px; margin-bottom: 20px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 5px; }
        .btn-edit { background-color: #2196F3; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; background-color: white; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #f2f2f2; color: #333; }
        tr:nth-child(even) { background-color: #fafafa; }
        .nav { margin-bottom: 20px; }
        .nav a { margin-right: 10px; }
    </style>
</head>
<body>
    <div class="nav">
        <a href="/authors" class="btn">Authors</a>
        <a href="/books" class="btn">Books</a>
    </div>
    <h1>Authors Directory</h1>
    <a href="/authors/new" class="btn">Add New Author</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Bio</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="author" items="${authors}">
                <tr>
                    <td>${author.id}</td>
                    <td>${author.name}</td>
                    <td>${author.bio}</td>
                    <td>
                        <a href="/authors/${author.id}/edit" class="btn btn-edit" style="margin-bottom: 0;">Edit</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>