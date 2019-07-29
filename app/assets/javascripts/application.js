// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require jquery
//= require bootstrap
// Modal Image Gallery

function onClick(element) {
    document.getElementById("img01").src = element.src;
    document.getElementById("modal01").style.display = "block";
    var captionText = document.getElementById("caption");
    captionText.innerHTML = element.alt;
}

// Change style of navbar on scroll
window.onscroll = function() { myFunction() };

function myFunction() {
    var navbar = document.getElementById("myNavbar");
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-black";
    } else {
        navbar.className = navbar.className.replace(" w3-card w3-animate-top w3-black", "");
    }
}

// Used to toggle the menu on small screens when clicking on the menu button
function toggleFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}
// $(document).ready(function() {
//     console.log("hhhhh");
//     $(".muon").click(function() {
//         indentify_id = $(this).val();
//         user_id = $(this).attr('data-user-id');
//         book_id = $(this).attr('data-book-id');
//         mydata = {
//             borrow: {
//                 user_id: user_id,
//                 soluongmuon: 1,
//                 indentify_id: indentify_id,
//                 book_id: book_id,
//             }
//         };

//         $.ajax({
//             type: 'POST',
//             url: "/borrows",
//             data: mydata,
//             success: function(repsonse) {
//                 alert("Mượn thành công");
//                 location.reload();
//                 // $("#tam").html(repsonse);
//             },
//             error: function(repsonse) {
//                 alert("Sách này đã được mượn");
//             }
//         })
//     });
//     $("#active").click(function() {
//         indentify_id = $(this).val();
//         book_id = $(this).attr('data-book-id');
//         mode = $(this).attr('data-active');
//         user_id = $(this).attr('data-user-id');
//         id = $(this).attr('data-borrow-id');

//         mydata = {
//             borrow: {
//                 user_id: user_id,
//                 soluongmuon: 1,
//                 indentify_id: indentify_id,
//                 book_id: book_id,
//                 mode: mode,
//                 mode1: 0
//             }
//         };
//         mydata1 = {
//             history: {
//                 user_id: user_id,
//                 indentify_id: indentify_id,
//                 book_id: book_id,
//                 mode: 0,
//             }
//         };
//         $.ajax({
//             type: 'PATCH',
//             url: "/borrows/" + id,
//             data: mydata,
//             success: function(repsonse) {
//                 alert("Đã cho phép mượn");
//                 location.reload();
//                 // $("#tam").html(repsonse);
//             },
//             error: function(repsonse) {
//                 console.log(response);
//             }
//         })
//         $.ajax({
//             type: 'POST',
//             url: "/histories",
//             data: mydata1,
//             success: function(repsonse) {
//                 location.reload();
//                 // $("#tam").html(repsonse);
//             },
//             error: function(repsonse) {
//                 console.log(response);
//             }
//         })
//     });
//     $("#notactive").click(function() {
//         indentify_id = $(this).val();
//         book_id = $(this).attr('data-book-id');
//         mode = $(this).attr('data-active');
//         user_id = $(this).attr('data-user-id');
//         id = $(this).attr('data-borrow-id');

//         mydata = {
//             borrow: {
//                 user_id: user_id,
//                 soluongmuon: 1,
//                 indentify_id: indentify_id,
//                 book_id: book_id,
//                 mode: mode,
//                 mode1: 1
//             }
//         };
//         $.ajax({
//             type: 'PATCH',
//             url: "/borrows/" + id,
//             data: mydata,
//             success: function(repsonse) {
//                 location.reload();
//                 // $("#tam").html(repsonse);
//             },
//             error: function(repsonse) {}
//         })
//     });
//     $(".trasach").click(function() {
//         // :user_id, :indentify_id, :book_id, :mode
//         user_id = $(this).attr('data-user-id');
//         indentify_id = $(this).attr('data-indentify-id');
//         book_id = $(this).attr('data-book-id');
//         id = $(this).attr('data-id');
//         id_delete = $(this).attr('data-delete');
//         console.log(id);
//         mydata = {
//             history: {
//                 user_id: user_id,
//                 indentify_id: indentify_id,
//                 book_id: book_id,
//                 mode: 1

//             }
//         };
//         $.ajax({
//             type: 'PATCH',
//             url: "/histories/" + id,
//             data: mydata,
//             success: function(repsonse) {
//                 alert("Trả sách thành công.");
//                 window.location.reload();
//                 // $("#tam").html(repsonse);
//             },
//             error: function(repsonse) {
//                 window.location.reload();
//             }
//         })
//         $.ajax({
//             type: 'DELETE',
//             url: "/borrows/" + id_delete,
//             success: function(repsonse) {
//                 // location.reload();
//                 // $("#tam").html(repsonse);
//             },
//             error: function(repsonse) {}
//         })
//     });

// });

