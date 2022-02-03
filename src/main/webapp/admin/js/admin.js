$( function() {

	/* Datepicker Script Start { */
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		yearSuffix: '년', 
		changeMonth: true,		// 월선택가능하게, 불필요시 삭제
		changeYear: true,		// 연도 선택가능하게, 불필요시 삭제
		yearRange: "-70:+0"
	});
	$(".datepicker").datepicker();
	/* } Datepicker Script End */
	
} );