

let id=document.getElementById("id").value;
	function getMyAdo() {
		$.ajax({
			url: "adoAjax",
			data: id,
			success: function(data){
				alert('성공');
			},
			error: function(){
				alert('fail');
			}
		});
 	}