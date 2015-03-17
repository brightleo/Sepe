$(function() {
	function onDataReceived(result) {
		var type = $("#chartType").val();
		var time_type = $("input[name='chart_time'][type='radio']:checked").val();
		var series = result.data;
		if (time_type === '0') {
			var title = $("#chartTypeYear").val() + Smart.i18n('order.chart.year');
		} else {
			var title = $("#chartTypeYear").val() + Smart.i18n('order.chart.year') + $("#chartTypeM").val() + Smart.i18n('order.chart.month');
		}
		if (type === "1"){
			var data =series;
			var total = 0; $(data).map(function(){total += this[1];});
			var arrLabels = $.makeArray($(data).map(function() {
					return Math.round(this[1]/total * 100) + "%" + " (" + this[1]/10000  + Smart.i18n('order.chart.unit') + ")" ;
				}));
			var plot3 = jQuery.jqplot("orderChart", [data], {
				title: title + Smart.i18n('order.chart.type.pie'),
				seriesDefaults:{
				   renderer:$.jqplot.PieRenderer,
				   rendererOptions: {
				    dataLabels:arrLabels,
				    dataLabelThreshold:0,
				    showDataLabels: true
				   }
				}, 
			     legend: {
		            show: true,
		            placement: 'outsideGrid'
		        }
			});
		} else if (type === "2") {
			var amount_type = $("input[name='amount_type'][type='radio']:checked").val();
			if (amount_type === '0') {
				title = title + Smart.i18n('order.chart.type.bar.order');
			} else {
				title = title + Smart.i18n('order.chart.type.bar.billing');
			}
			title = title + Smart.i18n('order.chart.type.bar');
			var plot1 = $.jqplot('orderChart', [series], {
				title: title,
				seriesDefaults:{
			      renderer:$.jqplot.BarRenderer,
			      rendererOptions: {
			          barMargin: 30
			      },
			      pointLabels: {show: true}
			    },
				axes: {
				  xaxis: {
				    renderer: $.jqplot.CategoryAxisRenderer
				  },
				  yaxis: {
	                tickOptions: {formatString: '%.2f' + Smart.i18n('order.chart.unit')}
	              }
				}
			});

		} else {
			var plot2 = $.jqplot('orderChart', [series], {
				title: $("#chartTypeYear").val() + Smart.i18n('order.chart.type.line'),
				seriesDefaults: { 
			        showMarker:false,
			        pointLabels: { show:true } 
			    },
				series:[{xaxis:'xaxis', yaxis:'yaxis'}],
				axesDefaults: {
				    tickRenderer: $.jqplot.CanvasAxisTickRenderer ,
				    tickOptions: {
				      fontSize: '10pt'
				    }
				},
				axes: {
				 xaxis: {
			        renderer: $.jqplot.CategoryAxisRenderer
			      },
			      yaxis: {
			        tickOptions: {formatString: '%.2f'+ Smart.i18n('order.chart.unit')}
			      }
				}
			});
		}
	}
	//
	function loadChartTime() {
		var nowDate= new Date();
		var startYear=nowDate.getFullYear()-10;//起始年份
		var endYear=nowDate.getFullYear();//结束年份 
		var obj=document.getElementById('chartTypeYear');

		for (var i=endYear;i >= startYear;i--)
		{
		obj.options.add(new Option(i,i));
		}
		obj.options[0].selected=true;

		var objM=document.getElementById('chartTypeM');
		for (var i = 1; i <= 12; i++) {
			objM.options.add(new Option(i,i));
		}
		$("#chartTypeYear, #chartTypeM").attr("data-toggle","select").select2();
	}
	loadChartTime();

	$("#chartType").change(function(){
		var type = $(this).val();
		if(type === '1') {
			$("label[id^='c_month']").show();
			$("#c_amount").hide();
			$("#c_salesman").hide();
		} else if(type === '2') {
			$("#c_amount").show();
			$("label[id^='c_month']").show();
			$("#c_salesman").hide();
		} else {
			$("#chart_time_y").click();
			$("#c_salesman").show();
			$("label[id^='c_month']").hide();
			$("#c_amount").hide();
		}

	});
	$("#doChart").click(function(){
		$("#orderChart").html("");	
	});
    $('#order_chart_form').ajaxForm({
    	async:false,
        type: 'post',
        url: BASE + '/chart/json',
        dataType: "json",
        success: onDataReceived
    });
});