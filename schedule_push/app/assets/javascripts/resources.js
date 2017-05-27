$(document).on('ready page:change page:load', function (){
	$('.validate_length').on('input', function(){
		if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);
	});

	$('#week_week_day').on('change', function(){
		switch(this.value){
			case 'Monday':
				$('#week_number_day').val(1);
			break;
			case 'Tuesday':
				$('#week_number_day').val(2);
			break;
			case 'Wednesday':
				$('#week_number_day').val(3);
			break;
			case 'Thursday':
				$('#week_number_day').val(4);
			break;
			case 'Friday':
				$('#week_number_day').val(5);
			break;
			case 'Saturday':
				$('#week_number_day').val(6);
			break;
			default:
				$('#week_number_day').val('');
		}

	});

	console.log('load resources')
});
