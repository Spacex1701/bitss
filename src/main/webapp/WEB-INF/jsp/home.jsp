<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Library Management System</title>
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f4f4f9; padding: 50px; text-align: center; }
        .container { background-color: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); max-width: 600px; margin: 0 auto; }
        h1 { color: #333; margin-bottom: 30px; }
        .btn { display: inline-block; padding: 15px 30px; margin: 10px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 5px; font-size: 18px; }
        .btn:hover { background-color: #45a049; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Library Management System</h1>
        <p>Manage your books and authors efficiently.</p>
        <a href="/authors" class="btn">Manage Authors</a>
        <a href="/books" class="btn">Manage Books</a>
    </div>
</body>
</html>