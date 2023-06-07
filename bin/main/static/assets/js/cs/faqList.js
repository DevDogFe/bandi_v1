
	 let items = document.querySelectorAll('.question');
	
	 function openCloseAnswer(id) {
	   let answerId = document.getElementById('que-' + id).id.replace('que', 'ans');
	
	   if(document.getElementById(answerId).style.display === 'block') {
	     document.getElementById(answerId).style.display = 'none';
	     document.getElementById('toggle-'+id ).innerText = 'expand_more';
	   } else {
	     document.getElementById(answerId).style.display = 'block';
	     document.getElementById('toggle-'+id).innerText = 'expand_less';
	   }
	 }
	
 