<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>${author.id == null ? 'Add' : 'Edit'} Author</title>
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f4f4f9; padding: 20px; }
        h1 { color: #333; }
        .form-container { background-color: white; padding: 20px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); max-width: 500px; margin: 0 auto; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        textarea { resize: vertical; min-height: 100px; }
        .btn { padding: 10px 15px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; }
        .btn-cancel { background-color: #f44336; margin-left: 10px; }
        .nav { margin-bottom: 20px; }
        .nav a { margin-right: 10px; color: #333; text-decoration: none; }
    </style>
</head>
<body>
    <div class="nav">
        <a href="/authors">Authors</a> |
        <a href="/books">Books</a>
    </div>
    <div class="form-container">
        <h1>${author.id == null ? 'Add New' : 'Edit'} Author</h1>
        <form:form action="${author.id == null ? '/authors' : '/authors/' += author.id}" method="post" modelAttribute="author">
            <div class="form-group">
                <label for="name">Name</label>
                <form:input path="name" id="name" required="true" />
            </div>
            <div class="form-group">
                <label for="bio">Bio</label>
                <form:textarea path="bio" id="bio" />
            </div>
            <button type="submit" class="btn">Save</button>
            <a href="/authors" class="btn btn-cancel">Cancel</a>
        </form:form>
    </div>
</body>
</html>