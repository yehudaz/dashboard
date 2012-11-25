#= require highcharts/highcharts

#http://stackoverflow.com/questions/7101464/how-to-get-highcharts-dates-in-the-x-axis

chart = undefined
$(document).ready ->
  chart = new Highcharts.Chart(
    chart:
      renderTo: "chart"
      type: "spline"

    title:
      text: type_name

    xAxis:
      title:
        text: "Date"
      type: 'datetime'
      dateTimeLabelFormats:
        day: '%e %b'

    yAxis:
      plotLines: [
        color: "#FF0000"
        width: 2
        value: 0
      ]
      title:
        text: "Value"

    series: [
      name: "Value"
      data: record_values
    ]
  )