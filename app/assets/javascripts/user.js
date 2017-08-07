$(document).ready(function(){
	var preview = $('.upload-preview img');

	$('.file-image').change(function(event){
		var input = $(event.currentTarget);
		var file = input[0].files[0];
		var reader = new FileReader();
		reader.onload = function(e){
			image_base64 = e.target.result;
			preview.attr('src', image_base64).width(300).height(250);
		};
		reader.readAsDataURL(file);
	});
});
