var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());

function padLeft(num, size) {
	var s = num+"";
	while (s.length < size) s = "0" + s;
	return s;
}

function stringToDate(str) {
	var dateArray = new Array();
	str.split("/").forEach(function (s) {
		dateArray.push(parseInt(s));	
	});
	// Date in MM/dd/yyyy format
	var x = new Date(
		dateArray[2],
		dateArray[0] - 1,
		dateArray[1],
		0,0,0,0
	);
	return x;
}

function dateToString(date) {
	return padLeft(date.getMonth() + 1,2) + "/" + padLeft(date.getDate() ,2) + "/" + date.getFullYear();
}
	
$('#birthday').datepicker({
	uiLibrary: 'bootstrap4',
	iconsLibrary: 'fontawesome',
	maxDate: new Date()
});
	
$('#birthday').change(function () {
	var birthday = $('#birthday').val();
	if (birthday != '' && stringToDate(birthday).getTime() > today.getTime())
		$('#birthday').val(dateToString(today));
});