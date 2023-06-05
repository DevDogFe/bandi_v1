
// Load the Visualization API and the corechart package.
google.charts.load('current', { 'packages': ['corechart'] });

// Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawChart);
google.charts.setOnLoadCallback(drawChart2);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart() {
	let sales;
	let refund;

	$.ajax({
		type: "GET",
		url: "/api/monthSales",
	}).done((response) => {
		sales = response.data.sales;
		refund = response.data.refund;
		// Create the data table.
		makeBarChart(sales, refund);
	}).fail((error) => {
		console.log(error);
		alert("요청을 처리할 수 없습니다.");
	});

	// 바차트 만들기
	function makeBarChart(sales, refund) {
		let data = google.visualization.arrayToDataTable([
			['유형', '금액', { role: 'style' }],
			['매출', sales, 'blue'],
			['환불', refund, 'red'], // CSS-style declaration
		]);
		// Set chart options
		let now = new Date();
		let currentMonth = now.getMonth() + 1;
		let options = {
			'title': currentMonth + '월 매출현황',
			'width': 550,
			'height': 400
		};
		// Instantiate and draw our chart, passing in some options.
		let chart = new google.visualization.BarChart(document.getElementById('chart1'));
		chart.draw(data, options);
	}


}
function drawChart2() {

	$.ajax({
		type: "GET",
		url: "/api/genre",
	}).done((response) => {
		console.log(response);
		let arr = response.data;
		console.log(arr);
		let data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		let rowArr;
		for (let i = 0; i < arr.length; i++) {
			rowArr = [arr[i].name, arr[i].count];
			data.addRows([rowArr,]);
		}
		let options = {
			'title': '장르 점유',
			'width': 380,
			'height': 400,
			chartArea: {
				backgroundColor: {
					fill: '#FF0000',
					fillOpacity: 0.1
				},
			},
			// Colors the entire chart area, simple version
			// backgroundColor: '#FF0000',
			// Colors the entire chart area, with opacity
			backgroundColor: {
				fill: '#FF0000',
				fillOpacity: 0
			}
		};

		let chart = new google.visualization.PieChart(document.getElementById('chart2'));
		chart.draw(data, options);

	}).fail((error) => {
		console.log(error);
		alert("요청을 처리할 수 없습니다.");
	});

}
