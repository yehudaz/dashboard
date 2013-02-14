#= require highcharts/highcharts

#http://stackoverflow.com/questions/7101464/how-to-get-highcharts-dates-in-the-x-axis

@addInsightToInsightsList = -> #Add new item to list
  table = $("#insights")
  item = document.getElementById("AddInsight")
  item.value = item.value.trim()
  if item.value
    table.append("<tr class=\"success\"><td><i class=\"icon-thumbs-up\"></i></td><td>"+item.value+"</td><td><button class=\"btn btn-link\"onclick=\"removeInsightFromInsights(this)\"title=\"remove patch deployed\"type=\"button\">Remove</button></td></tr>newTd1 = newTr.createElement(\"td\")")
    item.value = ""
  else
    alert "Please Enter Insight"

@addPatchToPatchedList = -> #Add new item to list
  table = $("#patches")
  item = document.getElementById("AddPatch")
  item.value = item.value.trim()
  if item.value
    table.append("<tr class=\"success\"><td><i class=\"icon-ok\"></i></td><td>"+item.value+"</td><td><button class=\"btn btn-link\"onclick=\"removePatchFromPatches(this)\"title=\"remove patch deployed\"type=\"button\">Remove</button></td></tr>newTd1 = newTr.createElement(\"td\")")
    item.value = ""
  else
    alert "Please Enter Patch"

@removeInsightFromInsights = (listItem) ->
  i = listItem.parentNode.parentNode.rowIndex
  document.getElementById("insights").deleteRow i

@removePatchFromPatches = (listItem) ->
  i = listItem.parentNode.parentNode.rowIndex
  document.getElementById("patches").deleteRow i