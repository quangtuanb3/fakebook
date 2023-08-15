var userSettings = document.querySelector(".user-settings");
var darkBtn = document.getElementById("dark-button");
var LoadMoreBackground =document.querySelector(".btn-LoadMore");
function UserSettingToggle(){
    userSettings.classList.toggle("user-setting-showup-toggle");
}
// darkBtn.onclick = function(){
//     darkBtn.classList.toggle("dark-mode-on");
// }

function darkModeON(){
    darkBtn.classList.toggle("dark-mode-on");
   document.body.classList.toggle("dark-theme");
}

function LoadMoreToggle(){
    LoadMoreBackground.classList.toggle("loadMoreToggle");
}


// Customize here

// function openPostPopup() {
//     centerPopup();
//     document.getElementById("popup-overlay").style.display = "flex";
// }
//
// function centerPopup() {
//     const popup = document.querySelector(".popup");
//     popup.style.left = `${window.innerWidth / 2 - popup.offsetWidth / 2}px`;
//     popup.style.top = `${window.innerHeight / 2 - popup.offsetHeight / 2}px`;
// }
//
// window.addEventListener("resize", centerPopup);
//
// function closePostPopup() {
//     document.getElementById("popup-overlay").style.display = "none";
// }
//
// // document.getElementById("post-image")
// //     .addEventListener("change", function(event) {
// //     // ... Same JS for image preview as before ...
// // });
//
// function submitPost() {
//     const postText = document.getElementById("post-text").value;
//     const postImage = document.getElementById("post-image").files[0];
//     const privacySetting = document.getElementById("privacy-select").value;
//
//     // Here, you can implement the logic to post the content (text, image, and privacy) to the server.
//     // For this example, we'll just log the content to the console.
//     console.log("Post Text:", postText);
//     console.log("Post Image:", postImage);
//     console.log("Privacy Setting:", privacySetting);
//
//     closePostPopup();
// }
//
// document.querySelector(".upload-media-button").addEventListener("click", function () {
//     document.getElementById("post-media").click();
// });
//
// document.getElementById("post-media").addEventListener("change", function (event) {
//     const file = event.target.files[0];
//     // Add your logic to handle the selected file here
// });

