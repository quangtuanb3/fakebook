<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="icon" href="../images/fb_icon.png">
    <title>Fakebook</title>
    <script src="https://kit.fontawesome.com/ef7e2b893b.js" crossorigin="anonymous"></script>
</head>

<body>
<nav class="navbar">
    <div class="nav-left">
        <%--        <img class="logo" src="../images/logo.png" alt="">--%>
        <h2 style="color: white;font-size: 1.7rem; padding-right: 30px">Facebook</h2>
        <div class="search-box">
            <img src="../images/search.png" alt="">
            <input type="text" placeholder="Search">
        </div>

    </div>
    <div class="nav-right">

        <div class="profile-image online" onclick="UserSettingToggle()">
            <img src="${profile.avatar}" alt="">
        </div>
        <ul class="navlogo" style="list-style: none; display: flex">
            <li><img src="../images/notification.png"></li>
            <li><img src="../images/inbox.png"></li>
            <li><img src="../images/video.png"></li>

        </ul>

    </div>
    <div class="user-settings">
        <div class="profile-darkButton">
            <div class="user-profile">
                <img src="${profile.avatar}" alt="avatar">
                <div>
                    <p>${profile.name}</p>
                    <a href="/users/profile">See your profile</a>
                </div>
            </div>
            <div id="dark-button" onclick="darkModeON()">
                <span></span>
            </div>
        </div>
        <hr>
        <div class="user-profile">
            <img src="../images/feedback.png" alt="">
            <div>
                <p> Give Feedback</p>
                <a href="#">Help us to improve</a>
            </div>
        </div>
        <hr>
        <div class="settings-links">
            <img src="../images/setting.png" alt="" class="settings-icon">
            <a href="#">Settings & Privary <img src="../images/arrow.png" alt=""></a>
        </div>

        <div class="settings-links">
            <img src="../images/help.png" alt="" class="settings-icon">
            <a href="#">Help & Support <img src="../images/arrow.png" alt=""></a>
        </div>
        <div class="settings-links">
            <img src="../images/logout.png" alt="" class="settings-icon">
            <a href="#">Logout <img src="../images/arrow.png" alt=""></a>
        </div>

    </div>
</nav>

<!-- content-area------------ -->

<div class="container">
    <div class="left-sidebar">
        <div class="important-links">
            <a href="#"><img src="../images/news.png" alt="">Latest News</a>
            <a href="#"><img src="../images/friends.png" alt="">Friends</a>
            <a href="#"><img src="../images/group.png" alt="">Groups</a>
            <a href="#"><img src="../images/marketplace.png" alt="">marketplace</a>
            <a href="#"><img src="../images/watch.png" alt="">Watch</a>
            <a href="#">See More</a>
        </div>

        <div class="shortcut-links">
            <p>Your Shortcuts</p>
            <a href="#"> <img src="../images/shortcut-1.png" alt="">Web Developers</a>
            <a href="#"> <img src="../images/shortcut-2.png" alt="">Web Design Course</a>
            <a href="#"> <img src="../images/shortcut-3.png" alt="">Full Stack Development</a>
            <a href="#"> <img src="../images/shortcut-4.png" alt="">Website Experts</a>
        </div>
    </div>

    <!-- main-content------- -->

    <div class="content-area">
        <div class="story-gallery">
            <div class="story story1">
                <img src="../images/upload.png" alt="">
                <p>Post Story</p>
            </div>
            <div class="story story2">
                <img src="../images/member-1.png" alt="">
                <p>Alison</p>
            </div>
            <div class="story story3">
                <img src="../images/member-2.png" alt="">
                <p>Jackson</p>
            </div>
            <div class="story story4">
                <img src="../images/member-3.png" alt="">
                <p>Samona</p>
            </div>
            <div class="story story5">
                <img src="../images/member-4.png" alt="">
                <p>John</p>
            </div>
        </div>

        <div class="write-post-container">
            <div class="user-profile">
                <img src="${profile.avatar}" alt="">
                <div>
                    <p> ${profile.name}</p>
                    <small>Public <i class="fas fa-caret-down"></i></small>
                </div>
            </div>

            <div class="post-upload-textarea" id="openPopupBtn">

                    <textarea name="postContent" placeholder="What's on your mind, Alex?" id="post-text-area" cols="30"
                              rows="3" readonly onclick="openPostPopup()"></textarea>
                <div class="add-post-links">
                    <span onclick="openPostPopup()"><img src="../images/live-video.png" alt="">Live Video</span>
                    <span onclick="openPostPopup()"><img src="../images/photo.png" alt="">Photo/Video</span>
                    <span onclick="openPostPopup()"><img src="../images/feeling.png" alt="">Feeling Activity</span>
                </div>
            </div>
        </div>
        <%--        create status here --%>
        <div class="popup-overlay" id="popup-overlay">
            <div class="popup">
                <div class="popup-header">
                    <h2 style="text-align: center">Create Post</h2>
                    <button class="close-popup-button" onclick="closePostPopup()">Close</button>
                </div>
                <div class="user-info">
                    <div class="profile-picture" style="background-color: white;">
                        <img src="${profile.avatar}" style="background-color: white; width: 45px; border-radius: 50%; margin-right: 10px">
                        <!-- Add the user's profile picture here -->
                    </div>
                    <div class="user-details">
                        <!-- Add the user's name here -->
                        <span class="username">${profile.name}</span>
                        <!-- Privacy settings -->
                        <div class="privacy-settings">
                            <span class="privacy-label">Privacy:</span>
                            <select id="privacy-select">
                                <option value="public">Public</option>
                                <option value="friends">Friends</option>
                                <option value="private">Private</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="post-content">
                    <label for="post-text"></label>
                    <textarea id="post-text" placeholder="What's on your mind?">
                    </textarea>
                    <div class="image-preview" id="image-preview"></div>
                    <div class="post-actions">
                        <label for="post-media" class="upload-media-button">
                            <button class="action-button">
                                <i class="icon fas fa-image"></i>
                                <input type="file" id="post-media" accept="image/*,video/*" style="display: none;">
                            </button>
                        </label>

                        <button class="action-button">
                            <i class="icon fas fa-map-marker-alt"></i>
                        </button>
<%--                        <button class="action-button">--%>
<%--                            <i class="icon fas fa-smile"></i>--%>
<%--                        </button>--%>
<%--                        <button class="action-button">--%>
<%--                            <i class="icon fas fa-user-tag"></i>--%>
<%--                        </button>--%>
                    </div>
                    <button id="post-button" onclick="submitPost()">Post</button>
                </div>
            </div>
        </div>

        <c:forEach items="${matchesPosts}" var="post" varStatus="loop">
            <div class="status-field-container write-post-container">
                <div class="user-profile-box">
                    <div class="user-profile">
                        <img src="${post.profile.avatar}" alt="">
                        <div>
                            <p> ${post.profile.name}</p>
                            <small>${post.time}</small>
                        </div>
                    </div>
                    <div>
                        <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                    </div>
                </div>
                <div class="status-field">
                    <p>${post.content.data}
                        <c:forEach items="${post.hashTag}" var="hashtag">
                            <a href="#">${hashtag} </a>
                        </c:forEach>
                    </p>
                    <img src="${post.media.data}" alt="">

                </div>
                <div class="post-reaction">
                    <div class="activity-icons">
                        <div><img src="../images/like-blue.png" alt="">120</div>
                        <div><img src="../images/comments.png" alt="">52</div>
                        <div><img src="../images/share.png" alt="">35</div>
                    </div>

                </div>
            </div>
        </c:forEach>

        <button type="button" class="btn-LoadMore" onclick="LoadMoreToggle()">Load More</button>
    </div>

    <!-- sidebar------------ -->
    <div class="right-sidebar">
        <div class="heading-link">
            <h4>Events</h4>
            <a href="">See All</a>
        </div>

        <div class="events">
            <div class="left-event">
                <h4>13</h4>
                <span>august</span>
            </div>
            <div class="right-event">
                <h4>Social Media</h4>
                <p><i class="fas fa-map-marker-alt"></i> wisdom em Park</p>
                <a href="#">More Info</a>
            </div>
        </div>
        <div class="events">
            <div class="left-event">
                <h4>18</h4>
                <span>January</span>
            </div>
            <div class="right-event">
                <h4>Mobile Marketing</h4>
                <p><i class="fas fa-map-marker-alt"></i> wisdom em Park</p>
                <a href="#">More Info</a>
            </div>
        </div>

        <div class="heading-link">
            <h4>Advertisement</h4>
            <a href="">Close</a>
        </div>
        <div class="advertisement">
            <img src="../images/advertisement.png" class="advertisement-image" alt="">
        </div>

        <div class="heading-link">
            <h4>Conversation</h4>
            <a href="">Hide Chat</a>
        </div>

        <div class="online-list">
            <div class="online">
                <img src="../images/member-1.png" alt="">
            </div>
            <p>Alison Mina</p>
        </div>

        <div class="online-list">
            <div class="online">
                <img src="../images/member-2.png" alt="">
            </div>
            <p>Jackson Aston</p>
        </div>
        <div class="online-list">
            <div class="online">
                <img src="../images/member-3.png" alt="">
            </div>
            <p>Samona Rose</p>
        </div>
    </div>
</div>
<footer id="footer">
    <p>&copy; Copyright 2021 - Socialbook All Rights Reserved</p>
</footer>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="function.js"></script>

<script>
    const onFocusImg = (index) => {
        const inputsForm = document.querySelectorAll('#formBody .input-custom');
        inputsForm[index].setAttribute('focused', 'true');
    };

    function onFileChange(event, index) {
        const fileInput = event.target;
        const file = fileInput.files[0];

        if (file) {
            // Create a new FormData object and append the selected file
            const formData = new FormData();
            formData.append("avatar", file);
            formData.append("fileType", "image");
            console.log(formData.getAll('avatar'))
            console.log(formData.getAll('fileType'))
            // Use fetch to send the formData to the server
            fetch("/uploadImage", {
                method: "POST",
                body: formData,
            })
                .then((response) => response.json())
                .then((data) => {
                    // Handle the response from the server (assuming the server returns the image URL)
                    const imageUrl = data.imageUrl; // Change this based on the actual response format
                    displayImagePreview(imageUrl, index); // Call a function to display the image preview
                })
                .catch((error) => {
                    // Handle errors (if any)
                    console.error("Error uploading image:", error);
                });
        }
    }

    function displayImagePreview(imageUrl, index)
{
        const previewImage = document.getElementById(`previewImage` + index);
        previewImage.src = imageUrl;
    }
</script>


<script>
    //fetch data
    // Function to fetch user data using Axios
    function fetchUserData(userId) {
        console.log(userId)
        if (userId == null) {
            return;
        }
        // Make an AJAX request using Axios to fetch user data from the server
        axios.get('/products?action=lazySearch&id=' + userId)
            .then(response => {
                const userData = response.data;
                console.log(userData);
                populateForm(userData); // Call a function to populate the form with the fetched user data
            })
            .catch(error => {
                // console.error('Error fetching user data:', error);
                // Handle error
            });
    }

    // Function to populate the form with user data
    function populateForm(userData) {
        const formInputs = document.querySelectorAll('#userManagerForm input, #userManagerForm select');
        formInputs.forEach(input => {
            const fieldName = input.name;

            if (fieldName in userData) {
                input.value = userData[fieldName];
            }
        });
    }
    // Function to show the popup with user data when the Edit button is clicked
    function showPopupWithUserData(userId) {
        fetchUserData(userId); // Fetch user data
        document.getElementById('popupOverlay').style.display = 'block'; // Show the popup
    }

</script>
</body>
</html>