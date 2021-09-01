<!doctype html>
<head>
	<title>FUNCEME - TESTE - MARCUS PAULO</title>
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<!-- Include fusioncharts core library -->
	<script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
	<!-- Include fusion theme -->
	<script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>

	<script type="text/javascript">

	 var chartData = [];

	 const chartConfig = {
	 	type: 'column2d',
	 	renderAt: 'chart-container',
	 	width: '100%',
	 	height: '400',
	 	dataFormat: 'json',
	 	dataSource: {
	        "chart": {
	        	"caption": "FUNCEME- TESTE - MARCUS PAULO  - VALORES POR DATA",
	        	"subCaption": "",
	        	"xAxisName": "Data",
	        	"yAxisName": "",
	        	"numberSuffix": "K",
	        	"theme": "fusion",
	        },
	        "data": chartData
	    }
	};


	var api = "http://apil5.funceme.br/rest/pcd/dado-sensor?estacao=375&sensor=22&orderby=data,desc&data-gte=2010-01-01";

	var button = $(this);      
	$.ajax({
		url:api,
		method:'GET',
	})
	.done(function(evt) {
		var result = evt.data.list;
		for(var i=0;i < result.length; i++) {

			chartData.push(
			{
				"label": result[i].data,
				"value": result[i].valor
			});
		}

		FusionCharts.ready(function(){
			var fusioncharts = new FusionCharts(chartConfig);
			fusioncharts.render();
		});

	})
	.fail(function() {
		alert('Erro : Falhou legal mas vai dar certo');
	});
</script>
</head>
<body>
	<div id="chart-container">

    </div>
    <br>VALORES CAPTURADOS DE : http://apil5.funceme.br/rest/pcd/dado-sensor?estacao=375&sensor=22&orderby=data,desc&data-gte=2010-01-01
</body>
</html>