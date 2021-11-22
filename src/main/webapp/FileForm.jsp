<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form action="">
        <input type="file" class="file" id="imageSelector" name="imageSelector"
            accept="image/jpeg, image/jpg, image/png" multiple />
    </form>
    <div id="preview-image"></div>
</body>

<script src="http://code.jquery.com/jquery.js"></script>
<script>
    // FileReader를 이용한 방식
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
                $(previewImageDiv).append('<img width="200" src="' + readFileURL + '"/>');
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0])
        }
    }

    // URL.createObjectURL을 이용하는 방식
    function readImagePreview(elem) {
        let readFileURL = URL.createObjectURL(elem.files[0]); //파일 객체에서 이미지 데이터 가져옴.
        console.log(readFileURL);

        const previewImageDiv = document.getElementById("preview-image");
        $(previewImageDiv).append('<img width="200" src="' + readFileURL + '"/>');

        //이미지 로딩 후 객체를 메모리에서 해제
        $('img', previewImageDiv).on('load', function () {
            URL.revokeObjectURL($(this).attr('src'));
        });
    }

    $('input.file').change((event) => {
        readImage(event.target);
        readImagePreview(event.target);
    });
</script>

</html>