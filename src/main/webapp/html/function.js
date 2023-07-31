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
};

function LoadMoreToggle(){
    LoadMoreBackground.classList.toggle("loadMoreToggle");
};

// Function to open the popup
document.getElementById("openPopupBtn").addEventListener("click", function() {
    document.getElementById("popupOverlay").style.display = "block";
});

// Function to close the popup
document.getElementById("closePopupBtn").addEventListener("click", function() {
    document.getElementById("popupOverlay").style.display = "none";
});

// Function to handle the post button click
document.getElementById("postBtn").addEventListener("click", function() {
    const status = document.getElementById("status").value;
    const privacy = document.getElementById("privacy").value;

    // Perform your post logic here with the 'status' and 'privacy' data
    console.log("Status posted:", status, "Privacy:", privacy);
    document.getElementById("popupOverlay").style.display = "none";
});

// Function to handle the cancel button click
document.getElementById("cancelBtn").addEventListener("click", function() {
    document.getElementById("popupOverlay").style.display = "none";
});
//
// //API here
//
//

