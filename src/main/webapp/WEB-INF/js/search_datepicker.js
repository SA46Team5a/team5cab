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
		$('#endDate').val($('#startDate').val());
		if ($('#startDate').val() == '') 
			$('#submit').prop("disabled", true);		
		else
			$('#submit').prop("disabled", false);
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
	});	