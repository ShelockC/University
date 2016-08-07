option = {
		title:{
			text:'某站点用户访问来源',
			subtext:'纯属虚构',
			x:'center'
		},
    tooltip : {
        trigger: 'axis'
    },
    calculable : true,
    legend: {
        data:['蒸发量','降水量','平均温度'],
        x:'right'
    },
    xAxis : [
        {
            type : 'category',
            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
        }
    ],
    yAxis : [
        {
            type : 'value',
            name : '人数',
            axisLabel : {
                formatter: '{value} 人'
            }
        },
        {
            type : 'value',
            name : '班级数',
            axisLabel : {
                formatter: '{value} 个'
            }
        }
    ],
    series : [

        {
            name:'蒸发量',
            type:'bar',
            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
        },
        {
            name:'降水量',
            type:'bar',
            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
        },
        {
            name:'平均温度',
            type:'line',
            yAxisIndex: 1,
            data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
        }
    ]
};
                    
var mychart1=echarts.init(document.getElementById("chart1"),'macarons');
mychart1.setOption(option);

option = {
		title:{
			text:'某站点用户访问来源',
			subtext:'纯属虚构',
			x:'center'
		},
	    tooltip : {
	        trigger: 'item',
	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    },
	    calculable : true,
	    series : [
	        {
	            name:'访问来源',
	            type:'pie',
	            radius : ['40%', '70%'],
	            itemStyle : {
	                normal : {
	                	label : {
	                        show : false
	                    },
	                    labelLine : {
	                        show : false
	                    }
	                },
	                emphasis : {
	                    label : {
	                        show : true,
	                        position : 'center',
	                        textStyle : {
	                            fontSize : '30',
	                            fontWeight : 'bold'
	                        }
	                    }
	                }
	            },
	            data:[
		                {value:335, name:'直接访问'},
		                {value:310, name:'邮件营销'},
		                {value:234, name:'联盟广告'},
		                {value:135, name:'视频广告'},
		                {value:1548, name:'搜索引擎'}
		            ]
	        }
	    ]
	};

var mychart3=echarts.init(document.getElementById("chart3"),'macarons');
mychart3.setOption(option);
	                    