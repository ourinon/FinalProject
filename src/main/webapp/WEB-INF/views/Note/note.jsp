<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/Header.jsp"%>
<!DOCTYPE html>
<html>

<style>
.signup .login__form:after {
	height: 800px;
}

.col-lg-6 {
	padding-bottom: 600px;
}

.textalign {
	text-align: center;
}

.memostage {
	background: #efe4b0;
}

.memostage2 {
	background: #aaaaaa;
}

.memostage3 {
	width: 230px;
	height: 200px;
	background: #aaaaaa;
}

.login__form {
	color: navy;
}

/* .memo_window {
	position: relative;
	border: 3px solid #040c47;
	background: orange;
	height: 100px;
	width: 160px;
	float: left;
	margin: 5px;
	border-radius: 10px;
	box-shadow: 2px 2px 3px gray;
} */
.memo_window_child {
	position: relative;
	border: 3px solid #040c47;
	background: orange;
	height: 25px;
	width: 160px;
	float: left;
	margin: 5px;
	border-radius: 10px;
	box-shadow: 2px 2px 3px gray;
}
</style>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="normal-breadcrumb set-bg"
		data-setbg="<%=request.getContextPath()%>/resources/img/keyboardpost.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2 style="color: white;">{OOO} 편지 보관함</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 위에 사진 부분 끝 -->
	<!-- 메모 쓰기 -->
	<div style="text-align: center;">

		<input type="hidden" id="sendUser" value="로그인 정보" style="width: 300px; "><br>
		<br>
		

	</div>
	<!-- 메모 쓰기 끝 -->
	<section class="signup spad">
		<!-- 		<h3 style="color: white; float: left; position: relative; top: 300px">새로운
			쪽지</h3>

		<h3 style="color: white; float: right; position: relative; top: 300px">읽은
			쪽지</h3> -->
		<div style = "text-align: center;">
		<h5 style="color: white">받는 사람</h5>
		<input type="text" id="fromUser" value="" style="width: 300px"><br>
		<br>
		<h5 style="color: white">메시지</h5>
		<input type="text" id="content" value="" style="width: 300px"><br>
		<br>
		<button type="button" id="SendBtn" onclick="memoGOGO();">메모전송</button>
		<hr />
		</div>
		
		
		
		<div style = "text-align: center;">
		<h5 style="color: white;">검색(보낸사람)</h5>
		<input type="text" onkeyup="filter()" id="value"
			placeholder="검색어를 입력하시오." style="width: 300px" />
		</div>
		
		
		<div class="col-lg-6 memostage3"
			style="float: left; margin-left: 130px; ">
			<div>테스트</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 memostage">
					<div class="login__form"></div>
				</div>
				<div class="col-lg-6 memostage2">
					<div class="login__form"></div>
				</div>
			</div>
		</div>
	</section>




</body>
<script>
	// value = 검색창 내용
	// name = json 요소중 하나
	// item = json의 idx

	function filter() {
		let value = document.getElementById('value').value.toLowerCase();

		console.log(value);

		search_arr = [];

		for (var i = 0; i < arr_memo.length; i++) {
			/* 			console.log(arr_memo[i]['sendUser'].toLowerCase())
			 console.log(value); */
			var content = arr_memo[i]['content'].toLowerCase();
			if (content.indexOf(value) != -1) {
				search_arr.push(arr_memo[i]);
			}
		}

		console.log(search_arr);

		if (search_arr.length != 0) {
			drawMemoBtn(search_arr);
		}
	}

	/* 
	'idx'
	'sendUser'
	 'fromUser'
	 'content'
	 'state' */

	//arr_memo에 json정보 넣어주고
	//draowMemoBtn 실행 시켜준다.
	//var arr_memo = new Array();
	function memoGOGO() {
		event.stopPropagation();
		
		console.log($('#sendUser').val());

		var arr_memo_test = {
			'idx' : 0,
			'sendUser' : $('#sendUser').val(),
			'fromUser' : $('#fromUser').val(),
			'content' : $('#content').val(),
			'state' : 2
		}

		arr_memo.push(arr_memo_test);

		/* 		console.log(arr_memo.length);
		 console.log(arr_memo[arr_memo.length-1]); */
		drawMemoBtn(arr_memo);


		$('#fromUser').val(null);

		$('#content').val(null);

	}

	var arr_memo = [];

	/* 	function pop() {
	 console.log("pop 메소드 실행");
	
	 arr_memo.splice(0,0)

	 } */

	/* var arr_memo = [ {
		'idx' : 0,
		'sendUser' : "user01",
		'fromUser' : "user02",
		'content' : "hello world 0",
		'state' : 1
	},

	{
		'idx' : 1,
		'sendUser' : "user01",
		'fromUser' : "user02",
		'content' : "hello world 1",
		'state' : 0
	}, {
		'idx' : 2,
		'sendUser' : "user01",
		'fromUser' : "user02",
		'content' : "hello world 2",
		'state' : 1
	}, {
		'idx' : 3,
		'sendUser' : "user01",
		'fromUser' : "user02",
		'content' : "hello world 3",
		'state' : 0
	}, {
		'idx' : 4,
		'sendUser' : "user01",
		'fromUser' : "user02",
		'content' : "hello world 4",
		'state' : 1
	}, {
		'idx' : 5,
		'sendUser' : "user01",
		'fromUser' : "user02",
		'content' : "hello world 5",
		'state' : 0
	}, {
		'idx' : 6,
		'sendUser' : "user01",
		'fromUser' : "user02",
		'content' : "hello world 6",
		'state' : 0
	}, {
		'idx' : 7,
		'sendUser' : "user01",
		'fromUser' : "user02",
		'content' : "hello world 7",
		'state' : 0
	} ] */

	//들어가는 칸
	function MakeBox(cssValue) {
		this.div = document.createElement('div');
		$('div.memostage').append(this.div);
		$('div.memostage2').append(this.div);
		$('div.memostage3').append(this.div);
		this.div.style.position = "absolute";
		this.div.style.border = "1px solid orange";
		this.div.style.left = cssValue.left;
		this.div.style.top = cssValue.top;
		this.div.style.width = cssValue.width;
		this.div.style.height = cssValue.height;
		document.body.appendChild(this.div);
		if (window.boxArr == null) { // box가 생성될때마다 window.boxArr가 생성됨.
			window.boxArr = new Array();
		}
		//boxArr.push(this.div);
	};

	//window.boxArr.push($('div.memostage')[0]);
	//window.boxArr.push($('div.memostage')[1]);

	// 메모지
	function MakeBtn(values) {
		this.btn = document.createElement('div');

		//document.body.appendChild(this.btn);
		$(values['stage']).append(this.btn); //어떤 memostage에 넣을지 여기서 안다.

		//스타일 설정
		this.btn.innerHTML = values.text;

		this.btn.style.position = 'absolute';
		this.btn.style.boxSizing = 'borderBox';
		this.btn.style.backgroundColor = values.color;
		this.btn.style.left = values.left;
		this.btn.style.top = values.top;
		this.btn.style.width = values.width;
		this.btn.style.height = values.height;
		$(this.btn).css({
			'borderRadius' : '10px',
			'border' : '2px solid '
		});

		//이벤트 설정
		var thisTarget = null;
		window.zIndex = 1;
		function boxPoint(x1, y1, x2, y2) {
			this.x1 = x1;
			this.y1 = y1;
			this.x2 = x2;
			this.y2 = y2;
		}

		this.closeBtn = document.createElement('button');
		this.closeBtn.innerText = "close";
		this.closeBtn.idx = arr_memo[values['memo_index']].idx;
		this.btn.appendChild(this.closeBtn);

		if (values['stage'] === 'div.memostage') { // 메모스테이지1일땐 close버튼 안보이고 2로갈때 보임 
			this.closeBtn.style.display = "none";
		} else if (values['stage'] === 'div.memostage2') {
			this.closeBtn.style.display = "block";
		} else if (values['stage'] === 'div.memostage3') {
			this.closeBtn.style.display = "none";

		}

		this.closeBtn.onmouseup = function(event) { // 메모스테이지2로 이동후 close버튼 누르면 삭제
			event.stopPropagation();
			var del_idx = this.idx;
			for (var i = 0; i < arr_memo.length; i++) {
				if (arr_memo[i].idx == del_idx) {
					arr_memo.splice(i, 1);
					drawMemoBtn(arr_memo);
					break;
				}
			}
		}

		this.btn.onmousedown = function(evt) { // 메모지 마우스 누르고있을때
			event.stopPropagation();
			console.log(boxArr.length)
			//console.log(boxArr); // boxArr는 MakeBox할때마다 실행된다
			//console.dir(boxArr);
			/* alert('적용'); */
			var boxPointArr = new Array();
			for (var i = 0; i < boxArr.length; i++) {
				var x1 = boxArr[i].offsetLeft; // position 기준 +- 차
				var y1 = boxArr[i].offsetTop;
				var x2 = x1 + boxArr[i].offsetWidth;
				var y2 = y1 + boxArr[i].offsetHeight;
				//console.log(x1, y1, x2, y2);
				boxPointArr.push(new boxPoint(x1, y1, x2, y2));
			}

			thisTarget = this;
			thisTarget.x = thisTarget.offsetLeft;
			thisTarget.y = thisTarget.offsetTop;
			this.style.zIndex = window.zIndex;
			window.zIndex += 1;
			thisTarget.xGap = event.clientX - event.target.offsetLeft;
			thisTarget.yGap = event.clientY - event.target.offsetTop;

			document.onmousemove = function() {
				event.stopPropagation();
				thisTarget.style.left = event.clientX - thisTarget.xGap + "px";
				thisTarget.style.top = event.clientY - thisTarget.yGap + "px";
			};
			document.onmouseup = function() {

				event.stopPropagation();

				var x1 = thisTarget.offsetLeft + thisTarget.offsetWidth / 2;
				var y1 = thisTarget.offsetTop + thisTarget.offsetHeight / 2;
				//console.log(x1,y1,x2,y2); //x1 = x축, y1 = y축, x2 = 가로 길이, y1 = 세로넓이
				//console.log(x1, y1);
				var idx = -1;

				if (values['stage'] === 'div.memostage') {
					x1 += boxPointArr[0].x1;
					y1 += boxPointArr[0].y1;
				} else if (values['stage'] === 'div.memostage2') {
					x1 = x1 + boxPointArr[0].x1 + boxPointArr[0].x1
							+ thisTarget.offsetWidth;
					y1 += boxPointArr[0].y1;
				} else if (values['stage'] === 'div.memostage3') {
					x1 += boxPointArr[0].x1;
					y1 += boxPointArr[0].y1

				}

				//console.log(x1)
				for (var i = 0; i < boxPointArr.length; i++) {
					var p = boxPointArr[i];
					//console.log(p.x1, p.y1, p.x2, p.y2); 현재 계속 9번째로 생성된 메모지가 등록돰
					var b1 = (x1 >= p.x1 && x1 <= p.x2)
							&& (y1 >= p.y1 && y1 <= p.y2);
					//console.log(b1);
					if (b1) {
						idx = i;
					}
				}
				if (idx != -1) {
					//console.log(idx + "번째 box에 걸쳤습니다.");
					if (idx == 0) {
						arr_memo[values['memo_index']]['state'] = 0;
					} else if (idx == 1) {
						arr_memo[values['memo_index']]['state'] = 1;
					} else if (idx == 2) {
						arr_memo[values['memo_index']]['state'] = 2;
					}

					/* console.log(arr_memo[values['memo_index']]['state']); */

					// 이동 되었으면 list의 위치를 변경해 준다.
					var del_idx = values['memo_index'];
					var tmp = arr_memo[del_idx]
					arr_memo.push(tmp);
					arr_memo.splice(del_idx, 1);
				} else {
					//console.log("box안에 없습니다.")
				}
				document.onmousemove = null;

				// 다시 그리기
				drawMemoBtn(arr_memo);
				//console.log("drawMemoBtn .....")
			};
		};
	}; // end of class

	var btnObjArr;
	function drawMemoBtn(arr_memo) {
		btnObjArr = [];
		/* console.log("draowMemoBtn.... 호출"); */
		$('div.memostage').html(""); // 읽어야할쪽지
		$('div.memostage2').html(""); // 처리한 쪽지
		$('div.memostage3').html(""); // 보낸 쪽지
		var lStepLeft = 0;
		var tStepLeft = 0;
		var lStepRight = 0;
		var tStepRight = 0;

		var tStepDavid = 0;

		var btnObj = null;
		for (var i = 0; i < arr_memo.length; i++) {
			if (arr_memo[i]['state'] == 0 ) {
				if (lStepLeft != 0 && lStepLeft % 3 == 0 && $(values['div.memostage']).append()) {
					lStepLeft = 0;
					tStepLeft++;
				}
				btnObj = new MakeBtn({
					'memo_index' : i,
					'text' : `보낸 사람 : ` + arr_memo[i]['sendUser'] + `<br><hr>`
							+ `내용 : ` + arr_memo[i]['content'],
					'color' : '#ffff00',
					'width' : '180px',
					'height' : '160px',

					'left' : 200 * lStepLeft + 'px',
					'top' : 180 * tStepLeft + 'px',
					'stage' : 'div.memostage'
				});
				lStepLeft++;
				
			} else if (arr_memo[i]['state'] == 1) {
				if (lStepRight != 0 && lStepRight % 3 == 0 && $(values['div.memostage2']).append()) {
					lStepRight = 0;
					tStepRight++;
				}
				btnObj = new MakeBtn({
					'memo_index' : i,
					'text' : `보낸 사람 : ` + arr_memo[i]['sendUser'] + `<br><hr>`
							+ `내용 : ` + arr_memo[i]['content'],
					'color' : 'pink',
					'width' : '180px',
					'height' : '160px',

					'left' : 200 * lStepRight + 'px',
					'top' : 180 * tStepRight + 'px',
					'stage' : 'div.memostage2'
				});
				lStepRight++;
				/* console.log("l스탭 : " + lStepRight++); */
				/* }*/
				
			} else if (arr_memo[i]['state'] == 2) {
				//if(arr_memo[i]['stage'] != 2 ) {
				btnObj = new MakeBtn({
					'memo_index' : i,
					'text' : `보낸 사람 : ` + arr_memo[i]['sendUser'],
					'color' : 'pink',
					'width' : '180px',
					'height' : '40px',

					'left' : '40px',
					'top' : 40 * tStepDavid + 'px',
					'stage' : 'div.memostage3'
				});
				tStepDavid++;
				
		}
				btnObjArr.push(btnObj);
	} // for end
	
}

	window.onload = function() {
		if (window.boxArr == null) { // box가 생성될때마다 window.boxArr가 생성됨.
			window.boxArr = new Array();
		}
		window.boxArr.push($('div.memostage')[0]);
		window.boxArr.push($('div.memostage2')[0]);
		window.boxArr.push($('div.memostage3')[0]);

		/* 		new MakeBox({
		 'left' : '1370px',
		 'top' : '860px',
		 'width' : '180px',
		 'height' : '160px',

		 }); */

		/* 		new MakeBtn({
		 'text' : `보낸 사람 : ` + arr_memo[0]['sendUser'] + `<br><hr>`
		 + `내용 : ` + arr_memo[0]['content'],
		 'color' : '#ffff00',
		 'width' : '180px',
		 'height' : '160px',

		 'left' : '200px',
		 'top' : '180px'
		 }); */

		drawMemoBtn(arr_memo);
	};
</script>
</html>
<%@ include file="/inc/Foother.jsp"%>