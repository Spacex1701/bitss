<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>${book.id == null ? 'Add' : 'Edit'} Book</title>
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f4f4f9; padding: 20px; }
        h1 { color: #333; }
        .form-container { background-color: white; padding: 20px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); max-width: 500px; margin: 0 auto; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], input[type="number"], select { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .btn { padding: 10px 15px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; }
        .btn-cancel { background-color: #f44336; margin-left: 10px; }
    </style>
</head>
<body>
    <div class="nav">
        <a href="/authors">Authors</a> |
        <a href="/books">Books</a>
    </div>
    <div class="form-container">
        <h1>${book.id == null ? 'Add New' : 'Edit'} Book</h1>
        <form:form action="${book.id == null ? '/books' : '/books/' += book.id}" method="post" modelAttribute="book">
            <div class="form-group">
                <label for="title">Title</label>
                <form:input path="title" id="title" required="true" />
            </div>
            <div class="form-group">
                <label for="publicationYear">Publication Year</label>
                <form:input path="publicationYear" id="publicationYear" type="number" required="true" />
            </div>
            <div class="form-group">
                <label for="author">Author</label>
                <form:select path="author.id" id="author" required="true">
                    <option value="" disabled="true" selected="${book.author == null ? 'true' : 'false'}">Select an Author</option>
                    <c:forEach var="author" items="${authors}">
                        <option value="${author.id}" ${book.author != null && book.author.id == author.id ? 'selected' : ''}>${author.name}</option>
                    </c:forEach>
                </form:select>
            </div>
            <button type="submit" class="btn">Save</button>
            <a href="/books" class="btn btn-cancel">Cancel</a>
        </form:form>
    </div>
</body>
</html>
