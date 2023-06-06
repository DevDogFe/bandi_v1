let sidebar = document.querySelector(".sidebar");
let closeBtn = document.querySelector("#btn");
let searchBtn = document.querySelector(".bx-search");
closeBtn.addEventListener("click", () => {
	sidebar.classList.toggle("open");
	menuBtnChange();
});
searchBtn.addEventListener("click", () => {
	sidebar.classList.toggle("open");
	menuBtnChange();
});
function menuBtnChange() {
	if (sidebar.classList.contains("open")) {
		closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");
	} else {
		closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");
	}
}

function deleteGenre(id) {
	$.ajax({
		type: "DELETE",
		url: "/api/genre/" + id,
	}).done((response) => {
		location.href = "/admin/genre";
	}).fail((error) => {
		alert("요청 실패");
	});
}