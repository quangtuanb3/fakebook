<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facebook</title>
    <link href="https:/cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <link rel="icon" href="${pageContext.request.contextPath}/auths/login/images/fb_logo.svg">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/auths/login/CSS/style.css">
</head>

<body>
<div class="toast-body d-none" id="message_toastr">
    ${message}
</div>

<main>
    <div class="row">
        <div class="col-logo">
            <img src="${pageContext.request.contextPath}/auths/login/images/fb_logo.svg" alt="Logo">
            <h2>Facebook helps you connect and share with the people in your life.</h2>
        </div>
        <div class="col-form">
            <div class="form-container">
                <form method="post" action="${pageContext.request.contextPath}/auths?action=login">
                    <input type="text" name="email" placeholder="Email address or phone number" value="renyfugu@mailinator.com">
                    <input type="password" name="password" placeholder="Password" value="123123">
                    <button class="btn-login" type="submit">Login</button>
                    <a href="#">Forgotten password?</a>
                </form>
                <button onclick="onShowPopup()" type="button" class="btn btn-new" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                    Create new Account
                </button>
            </div>
            <p><a href="#"><b>Create a Page</b></a> for a celebrity, brand or business.</p>
        </div>
    </div>

    <form method="post" id="form" action="/auths?action=register">
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel">Sign Up
                            <br>
                            <span style="font-size: 15px">It's quick and easy.</span>
                        </h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <div id="formBodyOfRegister" class="row row-custom">
                        </div>
                    </div>
                    <div class="modal-footer d-flex" style="justify-content: center">
                        <p style="font-size: 13px; text-align: justify">People who use our service may have uploaded
                            your contact information
                            to Facebook.<span> Learn more.</span></p>
                        <p style="font-size: 13px; text-align: justify">By clicking Sign Up, you agree to our <span>Terms</span>,
                            Privacy Policy and
                            Cookies Policy. You may receive SMS notifications from us and can opt out at any time.</p>
                        <button type="submit" class="btn btn-primary" style=" padding: 8px 40px; margin-bottom: 20px">
                            Sign up
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>


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
<script src="../base.js"></script>
<script src="https:/cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https:/cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
<script src="https:/cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
        integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https:/cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
        integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https:/cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>
    const message = document.getElementById('message_toastr');
    const btnToast = document.getElementById('liveToastBtn');
    window.onload = () => {
        const messageContent = message.innerHTML.trim();
        if (messageContent === 'Something was wrong') {
            toastr.error(messageContent);
        } else if (messageContent === 'Id not found') {
            toastr.error(messageContent);
        } else if (messageContent !== '') {
            // Set toastr options for position
            toastr.options = {
                positionClass: 'toast-bottom-right', // Change this to your desired position
                timeOut: 2000 // Set the duration for the toastr message
            };
            toastr.success(messageContent);
        }
    };
</script>

<script>
    const genders = ${gendersJSON};
    let inputs = [];
    function onShowPopup() {
        const inputs = [
            {
                label: "Name",
                name: "name",
                pattern: "^[A-Za-z ]{6,20}",
                message: "Name must have minimun is 6 charaters and maximun is 20 charaters",
                require: true,
                classDiv: 'col-6',
                value: ''
            },
            {
                label: "Email",
                name: "email",
                pattern: "",
                message: "Invalid Email",
                require: true,
                classDiv: 'col-6',
                value: ''
            },
            {
                name: 'id',
                type: 'hidden',
                classDiv: 'd-none'
            },
            {
                label: "Date of birth",
                name: "dob",
                message: "Date of birth between 1970-01-01 to 2000-12-31",
                require: true,
                type: 'date',
                min: '1970-01-01',
                max: '2000-12-31',
                classDiv: 'col-6',
                id: '',
                value: '',
            },
            {
                label: "Password",
                name: "password",
                type: "password",
                pattern: "",
                message: "Hobie must have minimun is 6 charaters and maximun is 20 charaters",
                require: true,
                classDiv: 'col-6',
                value: ''
            },

            {
                label: "Gender",
                name: "gender",
                type: "radio-group", // New type for radio button groups
                message: "Please choose Gender",
                options: genders?.map(e => {
                    return {
                        name: e,
                        value: e
                    }
                }),
                require: true,
                value: '', // Set the default selected value here
                classDiv: 'col-12'
            }
        ];
        const formBody = document.getElementById('formBodyOfRegister');
        formBody.innerHTML = ''; // Clear the existing form content

        inputs.forEach((input, index) => {
            if (input.type === 'select') {
                formBody.innerHTML += formSelect(input, index);
            } else {
                // For avatar input, set the default value to the image path (props.value) if available
                const avatarValue = input.type === 'file' ? '' : input.value;
                formBody.innerHTML += formInput({...input, value: avatarValue}, index);
            }
        });
    }
</script>
</body>

</html>