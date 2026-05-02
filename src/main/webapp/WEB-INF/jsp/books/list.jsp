<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Books Directory</title>
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f4f4f9; padding: 20px; }
        h1 { color: #333; }
        .btn { display: inline-block; padding: 10px 15px; margin-bottom: 20px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 5px; }
        .btn-edit { background-color: #2196F3; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; background-color: white; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #f2f2f2; color: #333; }
        tr:nth-child(even) { background-color: #fafafa; }
    </style>
</head>
<body>
    <h1>Books Directory</h1>
    <a href="/books/new" class="btn">Add New Book</a>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Publication Year</th>
                <th>Author</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.title}</td>
                    <td>${book.publicationYear}</td>
                    <td>${book.author.name}</td>
                    <td>
                        <a href="/books/${book.id}/edit" class="btn btn-edit" style="margin-bottom: 0;">Edit</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
