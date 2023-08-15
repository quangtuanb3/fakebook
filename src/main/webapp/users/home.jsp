<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    <link href="https:/cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>

    <link rel="stylesheet" href="https:/cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
          integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
          integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="icon" href="../images/fb_icon.png">
    <title>Fakebook</title>

    <link rel="stylesheet" href="style.css">
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
                    <textarea name="postContent" onclick="openPostPopup()" placeholder="What's on your mind, Alex?" id="post-text-area" cols="30"
                              rows="3" readonly></textarea>
                <div class="add-post-links">
                    <span onclick="openPostPopup()"><img src="../images/live-video.png" alt="">Live Video</span>
                    <span onclick="openPostPopup()"><img src="../images/photo.png" alt="">Photo/Video</span>
                    <span onclick="openPostPopup()"><img src="../images/feeling.png" alt="">Feeling Activity</span>
                </div>
            </div>
        </div>
        <%--        create status here --%>
        <div id="post-container">
            <form id="postForm" method="post" enctype="multipart/form-data">
                <div class="popup-overlay" id="popup-overlay">
                    <div class="popup">
                        <div class="popup-header">
                            <h2 style="text-align: center" id="modalTitle">Create Post</h2>
                            <button class="close-popup-button" type="button" onclick="closePostPopup()">Close</button>
                        </div>
                        <div class="user-info">
                            <div class="profile-picture" style="background-color: white;">
                                <img src="${profile.avatar}"
                                     style="background-color: white; width: 45px; border-radius: 50%; margin-right: 10px">
                                <!-- Add the user's profile picture here -->
                            </div>

                            <div class="user-details">
                                <!-- Add the user's name here -->
                                <span class="username">${profile.name}</span>
                                <!-- Privacy settings -->
                                <div class="privacy-settings">
                                    <span class="privacy-label">Privacy:</span>
                                    <select id="privacy-select">
                                        <option name="limit" value="PUBLIC">Public</option>
                                        <option name="limit" value="FRIEND">Friends</option>
                                        <option name="limit" value="PRIVATE">Private</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="post-content" style="display: block">
                            <textarea id="post-text" placeholder="What's on your mind?"></textarea>
                            <div class="post-actions">
                                <button class="action-button" type="button" onclick="showUploadFile()">
                                    <i class="icon fas fa-image"></i>
                                </button>
                                <label for="location">
                                    <button class="action-button" type="button">
                                        <i class="icon fas fa-map-marker-alt"></i>
                                        <input id="location" name="location"
                                               style="background-color: #f4f4f4;border: none;padding: 0px 5px"
                                               placeholder="Where are you now?">
                                    </button>
                                </label>

                            </div>
                            <div class="file-preview" id="file-preview" style="width: 100%;display: none">
                                <label for="post-media" class="upload-media-button">
                                    <input type="file" id="post-media" accept="image/*,video/*" style="display: none;">
                                    <img src="/images/file-upload-scripts.webp" style="max-width: 350px" id="fileUploadPreview" onchange="previewImage(event)">
                                </label>
                            </div>
                            <button id="post-button" type="submit">Post</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- Modal -->

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
                    <img <c:if test="${post.media}!=null">src="${post.media.data}" alt=""</c:if> >

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
<script src="https:/cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<%--<script src="https:/cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"--%>
<%--        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"--%>
<%--        crossorigin="anonymous"></script>--%>
<script src="https:/cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
        integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https:/cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
        integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
        integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    const posts = ${postsJSON};
    const profile = ${profileJSON};
    let inputs = [];
    const post_container = document.getElementById('post-container');
    const tileModal = document.getElementById("modalTitle");
    const filePreview = document.getElementById("fileUploadPreview");
    const form = document.getElementById("postForm")
    let data = "";

    function openPostPopup(id) {
        // centerPopup();
        document.getElementById("popup-overlay").style.display = "flex";
        let action = "create";
        let title = "Create";
        if (id) {
            action = "edit";
            title = "Edit";
        }
        tileModal.innerHTML = title + " Post";
        form.setAttribute('action', '/users/home?action=' + action);
        post = posts.find(post => post.id === id) || {};
        form.setAttribute('action', '/users/home?action=' + action);
        if (post?.media?.data) {
            filePreview.src = post.media.data;
        }
        // resetData();
        imgDiv.style.display = "none";
    }

    function resetData() {
        data =
            `
               <div class="popup-overlay" id="popup-overlay">
                <div class="popup">
                    <div class="popup-header">
                        <h2 style="text-align: center" id="modalTitle">Create Post</h2>
                        <button class="close-popup-button" onclick="closePostPopup()">Close</button>
                    </div>
                        <div class="user-info">
                            <div class="profile-picture" style="background-color: white;">
                                <img src="${profile.avatar}"
                                     style="background-color: white; width: 45px; border-radius: 50%; margin-right: 10px">
                                <!-- Add the user's profile picture here -->
                            </div>

                            <div class="user-details">
                                <!-- Add the user's name here -->
                                <span class="username">${profile.name}</span>
                                <!-- Privacy settings -->
                                <div class="privacy-settings">
                                    <span class="privacy-label">Privacy:</span>
                                    <select id="privacy-select">
                                        <option name="limit" value="PUBLIC">Public</option>
                                        <option name="limit" value="FRIEND">Friends</option>
                                        <option name="limit" value="PRIVATE">Private</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="post-content" style="display: block">
                            <textarea id="post-text" placeholder="What's on your mind?"></textarea>
                            <div class="post-actions">
                                <button class="action-button" onclick="showUploadFile()">
                                    <i class="icon fas fa-image"></i>
                                </button>
                                <label for="location">
                                    <button class="action-button">
                                        <i class="icon fas fa-map-marker-alt"></i>
                                        <input id="location" name="location"
                                               style="background-color: #f4f4f4;border: none;padding: 0px 5px"
                                               placeholder="Where are you now?">
                                    </button>
                                </label>

                            </div>
                            <div class="file-preview" id="file-preview" style="width: 100%;display: none">
                                <label for="post-media" class="upload-media-button">
                                    <input type="file" id="post-media" accept="image/*,video/*" style="display: none;">
                                    <img src="/images/file-upload-scripts.webp" style="max-width: 350px" id="fileUploadPreview">
                                </label>
                            </div>
                            <button id="post-button" type="submit">Post</button>
                        </div>
                </div>
            </div>
            `
        form.innerHTML = '';
        form.innerHTML = data;
    }


    function centerPopup() {
        const popup = document.querySelector(".popup");
        popup.style.left = `${window.innerWidth / 2 - popup.offsetWidth / 2}px`;
        popup.style.top = `${window.innerHeight / 2 - popup.offsetHeight / 2}px`;
    }

    window.addEventListener("resize", centerPopup);

    function closePostPopup() {
        resetData();
        document.getElementById("popup-overlay").style.display = "none";
    }


    function previewImage(evt) {
        const reader = new FileReader();
        reader.onload = function () {
            let imgEle = document.getElementById("fileUploadPreview")
            imgEle.src = reader.result;
        };
        reader.readAsDataURL(evt.target.files[0]);
        const file = evt.target.files[0];
        if (file) {
            // Create a new FormData object and append the selected file
            const formData = new FormData();
            formData.append("media.data", file);
            formData.append("fileType", "image");
            console.log(formData.getAll('media.data'))
            console.log(formData.getAll('fileType'))
            // Use fetch to send the formData to the server
            fetch("/uploadImage", {
                method: "POST",
                body: formData,
            })
                .then((response) => response.json())
                .then((data) => {
                    // Handle the response from the server (assuming the server returns the image URL)
                    // Change this based on the actual response format
                    // Call a function to display the image preview
                    document.getElementById('post-media').value = data?.imageUrl || '';

                })
                .catch((error) => {
                    // Handle errors (if any)
                    console.error("Error uploading image:", error);
                });
        }
    }
</script>
<script>
   const imgDiv = document.getElementById("file-preview");
    function showUploadFile() {
        imgDiv.style.display = imgDiv.style.display === "none" ? "block" : "none";
    }
</script>
</body>
</html>