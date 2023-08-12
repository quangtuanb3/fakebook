<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Profle - Socialbook</title>
    <script src="https://kit.fontawesome.com/ef7e2b893b.js" crossorigin="anonymous"></script>
</head>

<body>
<nav class="navbar">
    <div class="nav-left"><img class="logo" src="../images/logo.png" alt="">
        <ul class="navlogo">
            <li><img src="../images/notification.png"></li>
            <li><img src="../images/inbox.png"></li>
            <li><img src="../images/video.png"></li>
        </ul>
    </div>
    <div class="nav-right">
        <div class="search-box">
            <img src="../images/search.png" alt="">
            <input type="text" placeholder="Search">
        </div>
        <div class="profile-image online" onclick="UserSettingToggle()">
            <img src="../images/profile-pic.png" alt="">
        </div>

    </div>
    <div class="user-settings">
        <div class="profile-darkButton">
            <div class="user-profile">
                <img src="../images/profile-pic.png" alt="">
                <div>
                    <p> Alex Carry</p>
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
            <a href="#">Logout <img src="../images/arrow.png" alt=""></a>
        </div>

    </div>
</nav>

<!-- profile-page-------------------------- -->


<div class="profile-container">
    <img src="../images/cover.png" class="coverImage" alt="">
    <div class="dashboard">
        <div class="left-dashboard">
            <img src="../images/profile.png" class="dashboard-img" alt="">
            <div class="left-dashboard-info">
                <h3>Jack Nichoson</h3>
                <p>120 Friends - 20 mutuals</p>
                <div class="mutual-friend-images">
                    <img src="../images/member-1.png" alt="">
                    <img src="../images/member-2.png" alt="">
                    <img src="../images/member-3.png" alt="">
                    <img src="../images/member-5.png" alt="">
                </div>
            </div>
        </div>
        <div class="right-dashboard-info">
            <div class="right-dashboard-info-top">

                <button type="button"><i class="fas fa-user-plus"></i> Friends</button>
                <button type="button"><i class="far fa-envelope"></i> messages</button>
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
            <div class="write-post-container">
                <div class="user-profile">
                    <img src="../images/profile-pic.png" alt="">
                    <div>
                        <p> Alex Carry</p>
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
                        <div class="profile-picture">
                            <!-- Add the user's profile picture here -->
                        </div>
                        <div class="user-details">
                            <!-- Add the user's name here -->
                            <span class="username">John Doe</span>
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
                        <textarea id="post-text" placeholder="What's on your mind?"></textarea>
                        <div class="image-preview" id="image-preview"></div>
                        <div class="post-actions">

                            <button class="action-button">
                                <label for="post-media" class="upload-media-button">
                                    <i class="icon fas fa-image"></i>
                                </label>
                                <input type="file" id="post-media" accept="image/*,video/*" style="display: none;">
                            </button>


                            <button class="action-button">
                                <i class="icon fas fa-map-marker-alt"></i>
                            </button>
                            <button class="action-button">
                                <i class="icon fas fa-smile"></i>
                            </button>
                            <button class="action-button">
                                <i class="icon fas fa-user-tag"></i>
                            </button>
                        </div>
                        <button id="post-button" onclick="submitPost()">Post</button>
                    </div>
                </div>
            </div>

            <%--           >>>>>>>>>>>>>> Render post--%>
            <%--            private User user;--%>
            <%--            private String data;--%>
            <%--            Timestamp timestamp;--%>
            <%--            String location;--%>
            <%--            Share share;--%>
            <%--            private ELimit eLimit;--%>
            <%--            List<Like> likes;--%>
            <%--            List<User> tags;--%>
            <%--                List<String> hashTag;--%>
            <c:forEach items="${postList}" var="post">

                <div class="status-field-container write-post-container">
                    <div class="user-profile-box">
                        <div class="user-profile">
                            <img src=${post.user.avatar} alt="avatar">
                            <div>
                                <p>${post.user.name}</p>
                                <small>${post.timestamp}</small>
                            </div>
                        </div>
                        <div>
                                <%--                            popup to edit --%>
                            <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                        </div>
                    </div>
                    <div class="status-field"> ${post.content.data}
                        <p>
                            <a href="#">${post.hashTag}</a>
                        </p>
                        <c:forEach items="${post.media}" var="media">
                            <c:if test="${media.type == 'IMAGE'}">
                                <img src=${media.data} alt="${media.title}">
                            </c:if>
                            <c:if test="${media.type == 'VIDEO'}">
                                <video width="320" height="240" controls>
                                    <source src=${media.data} type="video/mp4">
                                </video
                            </c:if>
                            <c:if test="${media.type != 'VIDEO'} || ${media.type == 'IMAGE'} ">
                             <a href="${media.data}" download>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="post-reaction">
                        <div class="activity-icons">
                            <div><img src="../images/like-blue.png" alt="">${post.likeNumber.total}</div>
                            <div><img src="../images/comments.png" alt="">${post.commentNumber}</div>
                            <div><img src="../images/share.png" alt="">${post.shareNumber}</div>
                        </div>
                    </div>
                </div>

            </c:forEach>
        </div>
    </div>
</div>
<footer id="footer">
    <p>&copy; Copyright 2023 - Fakebook All Rights Reserved</p>
</footer>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="function.js"></script>
</body>

</html>