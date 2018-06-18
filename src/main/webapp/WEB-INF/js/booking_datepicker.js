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
		var startDate = $('#startDate').val();
		$('#endDate').val(startDate);
		if ($('#startDate').val() == '') 
			$('#submit').prop("disabled", true);		
		else if (stringToDate(startDate).getTime() < today.getTime()) {
			$('#startDate').val(dateToString(today));
			$('#endDate').val(dateToString(today));
			$('#submit').prop("disabled", false);
		}
		if (isNaN(stringToDate(startDate))){
			$('#startDate').val("");
			$('#endDate').val("");
			$('#submit').prop("disabled", true);
		}
	});

	$('#endDate').datepicker({
		uiLibrary: 'bootstrap4',
		iconsLibrary: 'fontawesome',
		minDate: today,
		maxDate: maxDate,
		disableDates: dateList
	});
	
	$('#endDate').change( function () {
		var endDate = $('#endDate').val();
		var startDate = $('#startDate').val();
		if (endDate != '' && stringToDate(endDate).getTime() < stringToDate(startDate).getTime())
			$('#endDate').val(startDate);
			$('#submit').prop("disabled", false);
		if (isNaN(stringToDate(endDate))){
			$('#endDate').val("");
			$('#submit').prop("disabled", true);
		}
	});
	
