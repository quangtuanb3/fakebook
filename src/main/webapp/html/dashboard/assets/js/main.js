(function () {
    /* ========= Preloader ======== */
    const preloader = document.querySelectorAll('#preloader')

    window.addEventListener('load', function () {
        if (preloader.length) {
            this.document.getElementById('preloader').style.display = 'none'
        }
    })

    /* ========= Add Box Shadow in Header on Scroll ======== */
    window.addEventListener('scroll', function () {
        const header = document.querySelector('.header')
        if (window.scrollY > 0) {
            header.style.boxShadow = '0px 0px 30px 0px rgba(200, 208, 216, 0.30)'
        } else {
            header.style.boxShadow = 'none'
        }
    })

    /* ========= sidebar toggle ======== */
    const sidebarNavWrapper = document.querySelector(".sidebar-nav-wrapper");
    const mainWrapper = document.querySelector(".main-wrapper");
    const menuToggleButton = document.querySelector("#menu-toggle");
    const menuToggleButtonIcon = document.querySelector("#menu-toggle i");
    const overlay = document.querySelector(".overlay");

    menuToggleButton.addEventListener("click", () => {
        sidebarNavWrapper.classList.toggle("active");
        overlay.classList.add("active");
        mainWrapper.classList.toggle("active");

        if (document.body.clientWidth > 1200) {
            if (menuToggleButtonIcon.classList.contains("lni-chevron-left")) {
                menuToggleButtonIcon.classList.remove("lni-chevron-left");
                menuToggleButtonIcon.classList.add("lni-menu");
            } else {
                menuToggleButtonIcon.classList.remove("lni-menu");
                menuToggleButtonIcon.classList.add("lni-chevron-left");
            }
        } else {
            if (menuToggleButtonIcon.classList.contains("lni-chevron-left")) {
                menuToggleButtonIcon.classList.remove("lni-chevron-left");
                menuToggleButtonIcon.classList.add("lni-menu");
            }
        }
    });
    overlay.addEventListener("click", () => {
        sidebarNavWrapper.classList.remove("active");
        overlay.classList.remove("active");
        mainWrapper.classList.remove("active");
    });
})();


// Function to open the popup
document.getElementById("open-add-new-popup").addEventListener("click", function () {
    document.getElementById("popupOverlay").style.display = "block";
    document.getElementById("userManagerForm").setAttribute("action", "/users?action=create");
    document.getElementById("userFormSubmit").setAttribute("value", "Create user");

});

// Function to close the popup
document.getElementById("closePopupBtn").addEventListener("click", function () {
    document.getElementById("popupOverlay").style.display = "none";
});

function editUser(id) {
    document.getElementById("popupOverlay").style.display = "block";
    document.getElementById("userManagerForm").setAttribute("action", "/users?action=edit");
    document.getElementById("userFormSubmit").setAttribute("value", "Save change");
    showEditUser(id).then(user => {
        console.log(user)
    })
        .catch(error => {
            console.error('Error:', error);
        });
}


async function getUser(id) {
    try {
        // Make a GET request to the API endpoint with the specified id as a query parameter
        const response = await axios.get(`/api/users?id=${id}`);
        const user = response.data;
        // Now you have access to the user data
        console.log(user);
        return user;
    } catch (error) {
        console.error('Error fetching user:', error);
        throw error;
    }
}


// Call the function to fetch the user list when needed
async function showEditUser(id) {
    try {
        const user = await getUser(id);
        document.getElementById('usernameInput').value = user.name;
        document.getElementById('emailInput').value = user.email;
        console.log(user); // You can see the userList here as well
    } catch (error) {
        console.error('Error:', error);
    }
}

