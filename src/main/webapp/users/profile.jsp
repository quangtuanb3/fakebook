<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Facebook</title>
    <link href="https:/cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="icon" href="../images/fb_icon.png">
    <link rel="stylesheet" href="https:/cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
          integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
          integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../assets/css/lineicons.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="../assets/css/materialdesignicons.min.css" rel="stylesheet"
          type="text/css"/>
    <link rel="stylesheet" href="../assets/css/fullcalendar.css"/>
    <link rel="stylesheet" href="../assets/css/fullcalendar.css"/>
    <link rel="stylesheet" href="../assets/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="https://unpkg.com/toastmaker/dist/toastmaker.min.css">
    <link rel="stylesheet" href="https:/cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
          integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        .status-link {
            display: inline-block;
            padding: 6px 12px;
            border: 1px solid #ccc;
            background-color: #f5f5f5;
            color: #333;
            text-decoration: none;
            border-radius: 4px;
        }

        .status-link:hover {
            background-color: #e5e5e5;
            border-color: #adadad;
        }

        .table-header {
            border: 1px solid #ddd;
        }

        /* Căn giữa nội dung các cột trong thead */
        .table-header th {
            text-align: center;
        }
    </style>
</head>

<body>
<nav class="navbar">
    <div class="nav-left">
        <%--        <img class="logo" src="../images/logo.png" alt="">--%>
        <a href="/users/home" style="text-decoration: none">
            <h2 style="color: white;font-size: 1.7rem; padding-right: 30px">Facebook</h2>
        </a>


    </div>
    <div class="nav-right">
        <div class="search-box">
            <img src="../images/search.png" alt="">
            <input type="text" placeholder="Search">
        </div>
        <div class="profile-image online" onclick="UserSettingToggle()">
            <img src="${selfProfile.avatar}" alt="" style="max-height: 45px;max-width: 45px">
        </div>

    </div>
    <div class="user-settings">
        <div class="profile-darkButton">
            <div class="user-profile">
                <img src="${selfProfile.avatar}" alt="avatar" style="max-width: 45px; max-height: 45px">
                <div>
                    <p> ${selfProfile.name}</p>
                    <a href="#">See your profile</a>
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
            <img src="../images/Display.png" alt="" class="settings-icon">
            <a href="#">Display & Accessibility <img src="../images/arrow.png" alt=""></a>
        </div>

        <div class="settings-links">
            <img src="../images/logout.png" alt="" class="settings-icon">
            <a href="/auths?action=logout">Logout <img src="../images/arrow.png" alt=""></a>
        </div>

    </div>
</nav>

<!-- profile-page-------------------------- -->

<form method="post" id="form">
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="formBody" class="row">

                    </div>
                    <div>
                        <label for="file">
                            <img src="../images/defaullt-avatar.jpg" alt="default" id="preview-image"
                                 style="max-height: 100px; max-width: 100px; border-radius: 50%; object-fit: contain"/>
                            <input id="file" type="file" class="d-none" onchange="previewImage(event)"/>
                            <input name="avatar" type="hidden" id="avatar"/>
                        </label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</form>


<div class="profile-container">
    <img src="${searchProfile.cover}" class="coverImage" alt="" style="max-height: 400px">
    <div class="dashboard">
        <div class="left-dashboard">
            <img src="${searchProfile.avatar}" class="dashboard-img" alt="" style="max-height: 100px; max-width: 100px">
            <div class="left-dashboard-info">
                <button
                        <c:if test="${selfProfile.id == searchProfile.id}">onclick="onShowProfileUser()"  </c:if>
                        type="button" class="btn" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                    <h3>${searchProfile.name}</h3>
                </button>
            </div>
        </div>
        <div class="right-dashboard-info">
            <div class="right-dashboard-info-top">
                <c:if test="${selfProfile.id != searchProfile.id}">
                    <button type="button"><i class="fas fa-user-plus"></i> Friends</button>
                    <button type="button"><i class="far fa-envelope"></i> messages</button>
                </c:if>
            </div>
            <div class="right-div-single-logo"><a href="#"> <i class="fas fa-ellipsis-h"></i></a></div>
        </div>
    </div>


    <div class="container content-profile-container">
        <div class="left-sidebar profile-left-sidebar">
            <div class="left-profile-sidebar-top">
                <div class="intro-bio">
                    <h4>intro</h4>
                    <p>Belive in yourself and you do unbelievable things <i class="far fa-smile-beam"></i></p>
                    <hr>
                </div>
                <div class="background-details">
                    <a href="#"><i class="fas fa-briefcase"></i>
                        <p>Freelancer on Fiverr</p>
                    </a>
                    <a href="#"><i class="fas fa-graduation-cap"></i>
                        <p>Studied bsc at Choumuhoni Collage</p>
                    </a>
                    <a href="#"><i class="fas fa-user-graduate"></i>
                        <p>Went to Technical School & Collage</p>
                    </a>
                    <a href="#"><i class="fas fa-home"></i>
                        <p>Lives in Noakhali, Chittagong</p>
                    </a>
                    <a href="#"><i class="fas fa-map-marker-alt"></i>
                        <p>From Chittagong, Bangladesh</p>
                    </a>
                </div>
            </div>

            <div class="left-profile-sidebar-top gallery">
                <div class="heading-link profile-heading-link">
                    <h4>Photos</h4>
                    <a href="">All Photos</a>
                </div>

                <div class="gallery-photos">
                    <div class="gallery-photos-rowFirst">
                        <img src="../images/photo1.png" alt="">
                        <img src="../images/photo2.png" alt="">
                        <img src="../images/photo3.png" alt="">

                        <img src="../images/photo4.png" alt="">
                        <img src="../images/photo5.png" alt="">
                        <img src="../images/photo6.png" alt="">
                    </div>
                </div>
            </div>

            <div class="left-profile-sidebar-top gallery">
                <div class="heading-link profile-heading-link">
                    <h4>Friends</h4>
                    <a href="">All Friends</a>
                </div>

                <div class="gallery-photos">
                    <div class="gallery-photos-rowFirst">
                        <div class="first-friend">
                            <img src="../images/member-1.png" alt="">
                            <p>Nathan M</p>
                        </div>
                        <div class="second-friend">
                            <img src="../images/member-2.png" alt="">
                            <p>Joseph N</p>
                        </div>
                        <div class="third-friend">
                            <img src="../images/member-3.png" alt="">
                            <p>Blondie K</p>
                        </div>
                        <div class="forth-friend">
                            <img src="../images/member-4.png" alt="">
                            <p>Jonathon J</p>
                        </div>
                        <div class="fifth-friend">
                            <img src="../images/member-5.png" alt="">
                            <p>Mark K</p>
                        </div>
                        <div class="sixth-friend">
                            <img src="../images/member-6.png" alt="">
                            <p>Emilia M</p>
                        </div>
                        <div class="seventh-friend">
                            <img src="../images/member-7.png" alt="">
                            <p>Max P</p>
                        </div>
                        <div class="eighth-friend">
                            <img src="../images/member-8.png" alt="">
                            <p>Layla M</p>
                        </div>
                        <div class="ninth-friend">
                            <img src="../images/member-9.png" alt="">
                            <p>Edward M</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- main-content------- -->

        <div class="content-area profile-content-area">
            <c:if test="${selfProfile.id == searchProfile.id}">
                <div class="write-post-container">
                    <div class="user-profile">
                        <img src="${selfProfile.avatar}" alt="" style="max-height: 45px;max-width: 45px">
                        <div>
                            <p> ${selfProfile.name}</p>
                            <small>Public <i class="fas fa-caret-down"></i></small>
                        </div>
                    </div>
                        <%--            em da viet them 1 dong hay tim --%>
                    <div class="post-upload-textarea" id="openPopupBtn">
                    <textarea name="postContent" onclick="openPostPopup()" placeholder="What's on your mind, Alex?"
                              id="post-text-area" cols="30"
                              rows="3" readonly></textarea>
                        <div class="add-post-links">
                            <span onclick="openPostPopup()"><img src="../images/live-video.png" alt="">Live Video</span>
                            <span onclick="openPostPopup()"><img src="../images/photo.png" alt="">Photo/Video</span>
                            <span onclick="openPostPopup()"><img src="../images/feeling.png"
                                                                 alt="">Feeling Activity</span>
                        </div>
                    </div>
                </div>
                <div id="post-container">
                    <div class="popup-overlay" id="popup-overlay">
                        <div class="popup">
                            <form id="postForm" method="post">
                                <div class="popup-header">
                                    <h2 style="text-align: center" id="modalTitle">Create Post</h2>
                                    <button class="close-popup-button" type="button" onclick="closePostPopup()">Close
                                    </button>
                                </div>
                                <div class="user-info">
                                    <div class="profile-picture" style="background-color: white;">
                                        <img src="${selfProfile.avatar} "
                                             style="background-color: white; max-width: 45px; max-height: 45px;border-radius: 50%; margin-right: 10px">
                                        <!-- Add the user's profile picture here -->
                                    </div>

                                    <div class="user-details">
                                        <!-- Add the user's name here -->
                                        <span class="username">${selfProfile.name}</span>
                                        <!-- Privacy settings -->
                                        <div class="privacy-settings">
                                            <span class="privacy-label">Privacy:</span>
                                            <select id="privacy-select" name="limit">
                                                <option name="limit" value="PUBLIC">Public</option>
                                                <option name="limit" value="FRIEND">Friends</option>
                                                <option name="limit" value="PRIVATE">Private</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="post-content" style="display: block">
                                    <textarea id="post-text" name="content.data"
                                              placeholder="What's on your mind?"></textarea>
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
                                            <input type="file" id="post-media" accept="image/*,video/*"
                                                   style="display: none;"
                                                   onchange="previewImage2(event)">
                                            <img src="/images/file-upload-scripts.webp"
                                                 style="object-fit: contain" id="fileUploadPreview">
                                            <input name="media.data" type="hidden" id="fileUploadEle"/>
                                        </label>
                                    </div>
                                    <button id="post-button" type="submit">Post</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </c:if>

            <c:forEach items="${matchesPosts}" var="post" varStatus="loop">
                <div class="status-field-container write-post-container">
                    <div class="user-profile-box">
                        <div class="user-profile">
                            <img src="${post.profile.avatar}" alt="" style="max-width: 45px;max-height: 45px">
                            <div>
                                <p> ${post.profile.name}</p>
                                <small>${post.formattedTime}</small>
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
                        <img
                                <c:if test="${post.media !=null}">src="${post.media.data}" alt="" style="object-fit: contain"</c:if> >

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
        </div>
    </div>
</div>
<footer id="footer">
    <p>&copy; Copyright 2021 - Socialbook All Rights Reserved</p>
</footer>

<script src="function.js"></script>
</body>
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
<script src="../assets/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/Chart.min.js"></script>
<script src="../assets/js/dynamic-pie-chart.js"></script>
<script src="../assets/js/moment.min.js"></script>
<script src="../assets/js/fullcalendar.js"></script>
<script src="../assets/js/jvectormap.min.js"></script>
<script src="../assets/js/world-merc.js"></script>
<script src="../assets/js/polyfill.js"></script>
<%--<script src="../assets/js/main.js"></script>--%>
<script src="https:/cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
        integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    const profile = ${selfProfileJSON};
    const genders = ${gendersJSON};
    let inputs = [];
    const form = document.getElementById('form');
    const tileModal = document.getElementById("exampleModalLabel");
    const imagePreview = document.getElementById("preview-image");

    function onShowProfileUser(id) {
        let action = "edit";
        let title = "Edit";
        tileModal.innerHTML = title + " User";
        form.setAttribute('action', '/users/profile?action=' + action);
        if (profile.avatar) {
            imagePreview.src = profile.avatar;
        }
        resetData();
    }

    function resetData() {
        inputs = [
            {
                label: "Name",
                name: "name",
                pattern: "^[A-Za-z ]{6,20}",
                message: "Name must have minimun is 6 charaters and maximun is 20 charaters",
                require: true,
                classDiv: 'col-6',
                value: profile.name || ''
            },
            {
                label: "Phone",
                name: "phone",
                pattern: "^0[0-9]{9}",
                message: "Phone number must start with 0 and have 10 digits.",
                require: true,
                classDiv: 'col-6',
                value: profile.phone || ''
            },

            {
                name: 'id',
                value: profile.id,
                type: 'hidden',
                classDiv: 'd-none'
            },
            {
                label: "DOB",
                name: "dob",
                type: "date",
                message: "Invalid Date ",
                require: true,
                value: profile.dob || '',
                classDiv: 'col-6'
            },
            {
                label: "Gender",
                name: "gender",
                type: "select",
                message: "Please choose gender",
                options: genders?.map(e => {
                    return {
                        name: e,
                        value: e
                    }
                }),
                require: true,
                value: profile.gender || '',
                classDiv: 'col-6'
            },
            // {
            //     label: "Cover",
            //     name: "cover",
            //     pattern: "^[A-Za-z ]{6,20}",
            //     message: "Name must have minimun is 6 charaters and maximun is 20 charaters",
            //     require: true,
            //     classDiv: 'col-6',
            //     value: profile.cover || ''
            // },
            // {
            //     label: "Cover",
            //     name: "cover",
            //     message: "file cover error",
            //     disable: profile.cover,
            //     type: 'hidden',
            //     require: true,
            //     classDiv: 'col-6',
            //     value: profile.cover || ''
            // },
        ];
        const formBody = document.getElementById('formBody'); // DOM formBody theo id
        formBody.innerHTML = '';
        // loop qua inputs
        inputs.forEach((input, index) => {
            if (input.type === 'select') {
                formBody.innerHTML += formSelect(input, index);
            } else {
                // For avatar input, set the default value to the image path (props.value) if available
                const avatarValue = input.type === 'file' ? '' : input.value;
                formBody.innerHTML += formInput({...input, value: avatarValue}, index);
            }
        });
        document.getElementById('avatar').src = profile.avatar;

    }

    function previewImage(evt) {
        const img = document.getElementById('preview-image')
        const reader = new FileReader();
        reader.onload = function () {

            img.src = reader.result;
        };
        reader.readAsDataURL(evt.target.files[0]);
        const file = evt.target.files[0];
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
                    // Change this based on the actual response format
                    // Call a function to display the image preview
                    document.getElementById('avatar').value = data?.imageUrl || '';

                })
                .catch((error) => {
                    // Handle errors (if any)
                    toast
                    console.error("Error uploading image:", error);
                });
        }
    }
</script>
<script>
    const posts = ${matchesPostsJSON};
    const post_container = document.getElementById('post-container');
    const tileModal2 = document.getElementById("modalTitle");
    const filePreview = document.getElementById("fileUploadPreview");
    const form2 = document.getElementById("postForm")
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
        tileModal2.innerHTML = title + " Post";
        form2.setAttribute('action', '/users/home?action=' + action);
        post = posts.find(post => post.id === id) || {};
        form2.setAttribute('action', '/users/home?action=' + action);
        if (post?.media?.data) {
            filePreview.src = post.media.data;
        }
        // resetData();
        imgDiv.style.display = "none";
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


    function previewImage2(evt) {
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
            formData.append("avatar", file);
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
                    document.getElementById('fileUploadEle').value = data?.imageUrl || '';

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
</html>