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

$('#startDate').prop("disabled", true);
$('#endDate').prop("disabled", true);