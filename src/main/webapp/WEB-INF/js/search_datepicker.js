var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());	

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

	$('#startDate').datepicker({
		uiLibrary: 'bootstrap4',
		iconsLibrary: 'fontawesome',
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