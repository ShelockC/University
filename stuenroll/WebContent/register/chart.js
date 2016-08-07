$(document).ready(function(){
	$.ajax({
		url:"/stuenroll/chart/chartmonth",
		success:function(response){
			var list1=response.list1;
			var data1=[list1.Jan,list1.Feb,list1.Mar,list1.Apr,list1.May,list1.Jun,
			           list1.Jul,list1.Aug,list1.Sep,list1.Oct,list1.Nov,list1.Dec];
			
			var list2=response.list2;
			var data2=[list2.Jan,list2.Feb,list2.Mar,list2.Apr,list2.May,list2.Jun,
				       list2.Jul,list2.Aug,list2.Sep,list2.Oct,list2.Nov,list2.Dec];
			
			var list3=response.list3;
			var data3=[list3.Jan,list3.Feb,list3.Mar,list3.Apr,list3.May,list3.Jun,
				       list3.Jul,list3.Aug,list3.Sep,list3.Oct,list3.Nov,list3.Dec];
			
			option1 = {
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
				        data:['报名量','学员量','开班量'],
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
				            name:'报名量',
				            type:'bar',
				            data:data1
				        },
				        {
				            name:'学员量',
				            type:'bar',
				            data:data2
				        },
				        {
				            name:'开班量',
				            type:'line',
				            yAxisIndex: 1,
				            data:data3
				        }
				    ]
				};
				var mychart1=echarts.init(document.getElementById("chart"),'macarons');
				mychart1.setOption(option1);
		}
	});
	$.ajax({
		
		url:"/stuenroll/chart/chartpie",
		success:function(response){
			
			var list=response.list;
			var d1=[];
			for(var i=0; i<list.length; i++){
				var one=list[i]
				var name=one.name;
				var count=one.specialty_count;
				var item={
						value:count,
						name:name
				};
				d1.push(item);
			}
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
			            radius : ['30%', '60%'],
			            center:['50%','60%'],
			            itemStyle : {
			                normal : {
			                    label : {
			                        show : true
			                    },
			                    labelLine : {
			                        show : true
			                    }
			                },
			                emphasis : {
			                    label : {
			                        show : true,
			                        position : 'center',
			                        textStyle : {
			                            fontSize : '20',
			                            fontWeight : 'bold'
			                        }
			                    }
			                }
			            },
			         
			            data:d1
			        }
			    ]
			};
			        
		var mychart=echarts.init(document.getElementById("chart1"),'macarons');
		mychart.setOption(option);
		}
	
	});
	$.ajax({
			
			url:"/stuenroll/chart/chartrate",
			success:function(response){
				var a=response.list.COUNT0;
				var b = (a/4500)*100;
				var num = Math.round(b*100)/100;
				option3 = {
						title:{
							text:'某站点用户访问来源',
							subtext:'纯属虚构',
							x:'center',
						},
						
					    tooltip : {
					        formatter: "{a} <br/>{b} : {c}%"
					    },
					    series : [
					        {
					            name:'业务指标',
					            type:'gauge',
					            center:['50%','60%'],
					            splitNumber: 10,       // 分割段数，默认为5
					            axisLine: {            // 坐标轴线
					                lineStyle: {       // 属性lineStyle控制线条样式
					                    color: [[0.2, '#228b22'],[0.8, '#48b'],[1, '#ff4500']], 
					                    width: 8
					                }
					            },
					            axisTick: {            // 坐标轴小标记
					                splitNumber: 10,   // 每份split细分多少段
					                length :12,        // 属性length控制线长
					                lineStyle: {       // 属性lineStyle控制线条样式
					                    color: 'auto'
					                }
					            },
					            axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
					                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					                    color: 'auto'
					                }
					            },
					            splitLine: {           // 分隔线
					                show: true,        // 默认显示，属性show控制显示与否
					                length :30,         // 属性length控制线长
					                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
					                    color: 'auto'
					                }
					            },
					            pointer : {
					                width : 5
					            },
					            title : {
					                show : true,
					                offsetCenter: [0, '-40%'],       // x, y，单位px
					                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					                    fontWeight: 'bolder'
					                }
					            },
					            detail : {
					                formatter:'{value}%',
					                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					                    color: 'auto',
					                    fontWeight: 'bolder'
					                }
					            },
					            data:[{value: num, name: '完成率'}]
					        }
					    ]
					};
				var mychart3=echarts.init(document.getElementById("chart2"),'macarons');
				mychart3.setOption(option3);
			}
	});
	
	$.ajax({
		
		url:"/stuenroll/chart/charttable1",
		success:function(response){
			var list=response.list;
			$("#a10").append(list.tendays1);
			$("#a1").append(list.one_month1);
			$("#a3").append(list.three_month1);
			$("#a6").append(list.six_month1);
			$("#a0").append(list.more_month1);
			$("#all").append(list.more_month1+list.six_month1);	
		}
	});
	
	$.ajax({
			
			url:"/stuenroll/chart/charttable2",
			success:function(response){
				var list=response.list;
				$("#b10").append(list.tendays2);
				$("#b1").append(list.one_month2);
				$("#b3").append(list.three_month2);
				$("#b6").append(list.six_month2);
				$("#b0").append(list.more_month2);
				$("#ball").append(list.more_month2+list.six_month2);	
			}
		});
	
	
});
 




  	                    