$(document).ready(function() {
		    	   $(".qnaList--btn").on("click", function() {
		   	        $.ajax({
		                   type: "get",
		                   url: "/admin/api/qnaList?proceed=" + $(this).val(),
		                   contentType: "application/json; charset=utf-8"
			        }).done((response) => {
			        	$(".qna--table").remove();
			        	let qnaNode;	        	
			        	
			        	for(i=0; i < response.length; i++){ 	        		
			        		 let createdAt = response[i].createdAt;
			        		 let time = createdAt.replace('T', " ").substring(0, 16);
			        		 let proceed = response[i].proceed;
			        		 if(proceed == 0){
			        			 proceed = "미처리";
			        		 }else{
			        			 proceed = "처리";
			        		 }				        		 
			        		 
			        		 qnaNode += `<tr class="qna--table">
				        		 <td class="qna--table">\${response[i].categoryName}</td>
				        		 <td class="qna--table"><a href="/admin/question/\${response[i].id}">\${response[i].title}</td>
				        		 <td class="qna--table">\${response[i].userId}</td>
				        		 <td class="qna--table">\${time}</td>					       			 
				        		 <td class="qna--table">\${proceed}</td>		        		 
				        		 </tr>
				        		 `;	   
			        	}        		 
						 $("#qnaListBody").append(qnaNode);
						 
			        } ).fail((error) => {
			        	console.log(error);
			        });
		   	      });
		   	   });
