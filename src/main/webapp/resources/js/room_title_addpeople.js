var room_title = $("#room_title").text();
if(room_title == '우드 파티룸') {
	for(var i=1; i<=2; i++){
		$("#addPeople").append('<option value="' + i + '">' + i + '명</option>');
	}
} else if(room_title == '레트로 파티룸') {
	for(var i=1; i<=4; i++){
		$("#addPeople").append('<option value="' + i + '">' + i + '명</option>');
	}
} else if(room_title == '다락방 파티룸') {
	for(var i=1; i<=4; i++){
		$("#addPeople").append('<option value="' + i + '">' + i + '명</option>');
	}
} else if(room_title == '루프탑 파티룸') {
	for(var i=1; i<=4; i++){
		$("#addPeople").append('<option value="' + i + '">' + i + '명</option>');
	}
} else if(room_title == '데일리핑크 파티룸') {
	for(var i=1; i<=6; i++){
		$("#addPeople").append('<option value="' + i + '">' + i + '명</option>');
	}
} else if(room_title == '달빛 파티룸') {
	for(var i=1; i<=6; i++){
		$("#addPeople").append('<option value="' + i + '">' + i + '명</option>');
	}
} else if(room_title == '블랙&화이트 파티룸') {
	for(var i=1; i<=8; i++){
		$("#addPeople").append('<option value="' + i + '">' + i + '명</option>');
	}
} else {
	for(var i=1; i<=15; i++){
		$("#addPeople").append('<option value="' + i + '">' + i + '명</option>');
	}
}