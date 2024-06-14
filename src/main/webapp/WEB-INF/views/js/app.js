$(document).ready(function () {
    $('#toggle-password').on('click', function () {
        togglePassword('#password-input');
    });

    $('#toggle-password1').on('click', function () {
        togglePassword('#password-input1');
    });

    function togglePassword(inputId) {
        const passwordField = $(inputId);
        const passwordFieldType = passwordField.attr('type');
        if (passwordFieldType === 'password') {
            passwordField.attr('type', 'text');
            $(inputId + ' + .btn i').removeClass('far fa-eye').addClass('far fa-eye-slash');
        } else {
            passwordField.attr('type', 'password');
            $(inputId + ' + .btn i').removeClass('far fa-eye-slash').addClass('far fa-eye');
        }
    }
});


document.addEventListener('DOMContentLoaded', function () {
    const icon = document.getElementById('myicon').value;
    const title = document.getElementById('mytitle').value;
    const message = document.getElementById('mymessage').value;
    if (icon && title && message) {
        Swal.fire({
            title: title,
            text: message,
            icon: icon
        });
    }

});

function handleFileSelect() {
    var fileInput = document.getElementById('fileInput');
    var selectButton = document.getElementById('selectButton');
    var uploadButton = document.getElementById('uploadButton');

    if (fileInput.files.length > 0) {
        selectButton.style.display = 'none';
        uploadButton.style.display = 'inline-block';
    }
}

function addcategory() {
    var formaddcategory = document.getElementById("formaddcategory");
    if (formaddcategory.style.display === "none") {
        formaddcategory.style.display = "block";
    } else {
        formaddcategory.style.display = "none";
    }
}

function addauthor() {
    var formaddauthor = document.getElementById("formaddauthor");
    if (formaddauthor.style.display === "none") {
        formaddauthor.style.display = "block";
    } else {
        formaddauthor.style.display = "none";
    }
}

function addreview() {
    var frv = document.getElementById("formreview");
    if (frv.style.display === "none") {
        frv.style.display = "block";
    } else {
        frv.style.display = "none";
    }
}
