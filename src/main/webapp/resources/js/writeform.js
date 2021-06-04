/* ===== 써머노트 세팅 ===== */
var fontSizes = [ '8', '9', '10', '11', '12', '14','16', '18', '20', '22', '24', '28', '30', '36', '50', '72','100' ];

var fontNames = [ 'Arial', 'Arial Black','Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '바탕체' ];

var toolbar = [
	[ 'fontname', [ 'fontname' ] ],
	[ 'fontsize', [ 'fontsize' ] ],
	[ 'style',    [ 'bold', 'italic', 'underline','strikethrough', 'clear' ] ],
	[ 'color', [ 'forecolor', 'color' ] ],
	[ 'table', [ 'table' ] ],
	[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
	[ 'height', [ 'height' ] ],
	['insert', [ 'picture', 'link', 'video']],
	[ 'view', [ 'codeview' ] ] ];

var toolbar_comment = [
	[ 'fontname', [ 'fontname' ] ],
	[ 'fontsize', [ 'fontsize' ] ],
	[ 'style',    [ 'bold', 'italic', 'underline','strikethrough', 'clear' ] ],
	[ 'color', [ 'forecolor', 'color' ] ],
	[ 'view', [ 'codeview' ] ] ];

var setting = {
	height: 500,
	minHeight: 500,
	maxHeight: 1000,
    focus : true,
    lang : 'ko-KR',
    toolbar : toolbar,
    fontSizes : fontSizes,
    fontNames : fontNames,
    placeholder : '내용을 입력해주세요.' };
    
var setting_comment = {
	height: 100,
	minHeight: 100,
	maxHeight: 500,
    focus : true,
    lang : 'ko-KR',
    toolbar : toolbar_comment,
    fontSizes : fontSizes,
    fontNames : fontNames,
    placeholder : '답글을 입력해주세요.' }; 
/* ===== 써머노트 세팅 end ===== */ 

   
/* === 수정폼 호출 === */
function UpdateForm() {			
	$('#updateDiv').attr('style', 'display:block');
	$('#viewDiv').attr('style', 'display:none');
	$('.content_update').summernote(setting);
};


/* === 수정 캔슬 === */
function updateCancle() {
	if(confirm('정말 수정을 취소하시겠습니까?')){
		$('.content_update').summernote('code');
		$('.content_update').summernote('destroy');
		$('#updateDiv').attr('style', 'display:none');
		$('#viewDiv').attr('style', 'display:block');
	} 
};