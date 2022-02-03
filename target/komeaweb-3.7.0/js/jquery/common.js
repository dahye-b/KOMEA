//숫자 검증 체크
function invalidNumChk(obj) {
   if (!IsNumberCheck(obj.value)) {
	  alert("숫자만 입력하세요!");
      obj.value = "";
	  obj.focus();
   }
}
//숫자 체크
function IsNumberCheck(arg) {
	var len = arg.length;
	var chk = true;

	for (var i=0; i<len; i++) {
		if (! IsNumber(arg.charAt(i))) {
			chk = false;
			break;
		}
	}
	return chk;
}

//숫자만 허용
function IsNumber ( arg_ch )
{
    if ('0' <= arg_ch && arg_ch <= '9')  return  true
    else return  false;
}
/*---------------------------------------------------------
* 날짜포맷 변경 $('#fondDe').val($('#fondDe').val().replace(/-/g,""));
*---------------------------------------------------------*/
function formatDate(objName){
	$("#" + objName + "").val($("#" + objName + "").val().replace(/-/g,""));
}