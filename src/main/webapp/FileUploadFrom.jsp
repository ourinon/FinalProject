<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="container">

<h1>자유게시판 - 입력</h1>
<form action="crud/input.do" method="post" enctype="multipart/form-data">
	<table class="table table-bordered">
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" value="test board input"/></td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td><input type="text" name="writer" value="홍길동"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="50" name="content">게시글 입력 연습입니다.</textarea></td>
		</tr>
		<tr>
			<th>파일</th>
			<td><input type="file"  class="file" id="imageSelector"
            accept="image/jpeg, image/jpg, image/png" multiple name="uploadFile" /></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="저장" />
				<input type="reset" value="취소" />
			</th>
		</tr>
	</table>
</form>

<div id="preview-image"></div>

<a href="list.do">목록</a>
</div>


<script src="http://code.jquery.com/jquery.js"></script>
<script>
    // FileReader를 이용한 방식 - 버전 1
    function readImage(input) {
        // 인풋 태그에 파일이 있는 경우
        if (input.files && input.files[0]) {
            // 이미지 파일인지 검사 (생략)
            // FileReader 인스턴스 생성
            const reader = new FileReader()
            // 이미지가 로드가 된 경우
            reader.onload = e => {
                //console.log(e.target.result);
                let readFileURL = e.target.result;
                const previewImageDiv = document.getElementById("preview-image");
                $(previewImageDiv).html('<img width="200" src="' + readFileURL + '"/>');
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0])
        }
    }

    // URL.createObjectURL을 이용하는 방식 - 버전2
    function readImagePreview(elem) {
    	$("#preview-image").html("");
    	for(var i=0; i<elem.files.length; i++) {
	        let readFileURL = URL.createObjectURL(elem.files[i]); //파일 객체에서 이미지 데이터 가져옴.
	        console.log(readFileURL);
	
	        const previewImageDiv = document.getElementById("preview-image");
	        
	        $(previewImageDiv).append('<img width="200" src="' + readFileURL + '"/>');
	
	        //이미지 로딩 후 객체를 메모리에서 해제
	        $('img', previewImageDiv).on('load', function () {
	            URL.revokeObjectURL($(this).attr('src'));
	        });
    	}
    }

    $('input.file').change((event) => {
        //readImage(event.target);
        readImagePreview(event.target);
    });
</script>

</body>
</html>