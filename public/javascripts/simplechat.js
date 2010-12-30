$(document).ready(function(){
	$('#sendMessage').click(function(){
		sendMessage();
	});
	
	$('#message').keyup(function(e) {
		if(e.keyCode == 13) {
			sendMessage();
		}
	});
	
	setInterval('getAllMessages()',3000);
});

function sendMessage(){
	$.ajax({
		url: '/message/new/',
		type: 'POST',
		data:{
			text:$('#message').val(),
		},
		success: function(data){
			if (data!='error'){
				$('#allMessages').prepend(data);
			}
		}
	});
}

function getAllMessages(){
	if($('#allMessages').length!=0){
		$.ajax({
			url: '/message/all/',
			type: 'POST',
			data:{
			},
			success: function(data){
				$('#allMessages').html(data);
			}
		});
	}
};