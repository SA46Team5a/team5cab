	var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
	var maxDate = new Date();
	maxDate.setDate(today.getDate() + 7);
	var dateList = $('#dateList').val().split(",");
	
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
	
	$('#startDate').datepicker({
		uiLibrary: 'bootstrap4',
		iconsLibrary: 'fontawesome',
		minDate: today,
		maxDate: maxDate,
		disableDates:
			dateList
	});
	
	$('#startDate').change( function () {
		$('#endDate').val($('#startDate').val());
		if ($('#startDate').val() == '') 
			$('#submit').prop("disabled", true);		
		else
			$('#submit').prop("disabled", false);
	});

	$('#endDate').datepicker({
		uiLibrary: 'bootstrap4',
		iconsLibrary: 'fontawesome',
		minDate: today,
		maxDate: maxDate,
		disableDates: dateList
	});
	

	$('#startDate').prop("disabled", true);
	$('#endDate').prop("disabled", true);