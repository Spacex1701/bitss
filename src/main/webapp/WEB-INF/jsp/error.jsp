<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #fce4e4; padding: 50px; text-align: center; }
        .error-container { background-color: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); max-width: 600px; margin: 0 auto; border: 1px solid #fcc2c3; }
        h1 { color: #cc0033; }
        p { font-size: 1.2rem; color: #555; }
        .btn { display: inline-block; margin-top: 20px; padding: 10px 20px; background-color: #cc0033; color: white; border-radius: 5px; text-decoration: none; }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Oops! Something went wrong.</h1>
        <p>${errorMessage != null ? errorMessage : 'An unexpected error occurred.'}</p>
        <a href="/books" class="btn">Return to Home</a>
    </div>
</body>
</html>
