window.onload = function() {
	var check1 = document.getElementsByClassName('role1')[0];
	var check2 = document.getElementsByClassName('role2')[0];
	var check3 = document.getElementsByClassName('role3')[0];
	var img1 = document.getElementById('dps-front');
	var img2 = document.getElementById('tank-front');
	var img3 = document.getElementById('support-front');

	img1.onclick = function () {
		if (!check1.checked) {
			check1.checked = true;
			img1.style.visibility = 'hidden';
			img2.style.visibility = 'visible';
			img3.style.visibility = 'visible';
		}
	};
	img2.onclick = function () {
		if (!check2.checked) {
			check2.checked = true;
			img1.style.visibility = 'visible';
			img2.style.visibility = 'hidden';
			img3.style.visibility = 'visible';
		}
	};
	img3.onclick = function () {
		if (!check3.checked) {
			check3.checked = true;
			img1.style.visibility = 'visible';
			img2.style.visibility = 'visible';
			img3.style.visibility = 'hidden';
		}
	};
};

function openMatching(e) {
	const typeValue = document.getElementById('data-type').getAttribute('value');
	const senderValue = e.cells[0].innerText;
	$.ajax({
		  method: "GET",
		  url: "/get",
		  data: {
			type : typeValue,
			pot : senderValue
		  },
		  dataType : 'json',
		  success: function(data) {
			//do Something
		  },
		  error: function() {
			alert("새로고침 도중 오류가 발생하였습니다. 해당 상태가 지속된다면 관리자에게 문의하시기 바랍니다.");
		  }
	  });
// 	swal({
//   title: '매칭 정보',
//   type: 'info',
//   html:
//     'You can use <b>bold text</b>, ' +
//     '<a href="//github.com">links</a> ' +
//     'and other HTML tags'
// 	,
//   showCloseButton: true,
//   showCancelButton: true,
//   focusConfirm: false,
//   confirmButtonText:
//     '참가',
//   //cancelButtonColor: '#d33',
//   cancelButtonText:
//     '취소',
// });
}

function refresh() {
	const typeValue = document.getElementById('data-type').getAttribute('value');
	$.ajax({
		  method: "GET",
		  url: "/get",
		  data: {
			type : typeValue
		  },
		  dataType : 'json',
		  success: function(data) {
			  var row = document.getElementsByTagName('tbody')[typeValue];
			  var table = $(document.getElementsByClassName('matching-table')[typeValue]);
			  row.parentNode.removeChild(row);
			  table.append('<tbody class="matching-tbody animated bounceInUp">');
			  for (var i = data.length - 1; i >= 0; i--) {
			  	table.append('<tr data-toggle="modal" data-target="#matchingModal"><th scope="row" style="width: 20%">'+ data[i].id +'</th><td style="width: 60%">'+ data[i].title +'<br><span class="content-info">'+ data[i].game_mode +' - 마이크 '+ data[i].use_mic +' - '+ data[i].play_date.split('T')[0].replace('/-/gi', '/') +'</span></td><td style="width: 20%">'+ data[i].now_member +'/'+ data[i].all_member +'</td></tr>');
			  }
			 table.append("</tbody>");
		  },
		  error: function() {
			alert("새로고침 도중 오류가 발생하였습니다. 해당 상태가 지속된다면 관리자에게 문의하시기 바랍니다.");
		  }
	  });
}