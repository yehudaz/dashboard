jQuery ->
  extractInsights = ->
    insights = ''
    $(".insight").each ->
      insights += this.textContent + ';'
    $('#version_code_review_insights')[0].value = insights

  extractPatches = ->
    patches = ''
    $(".patch").each ->
      patches += this.textContent + ';'
    $('#version_patches_deployed')[0].value = patches

  @addInsightToInsightsList = -> #Add new item to list
    table = $("#insights")
    item = document.getElementById("AddInsight")
    item.value = item.value.trim()
    if item.value
      table.append("<tr class=\"success\"><td><i class=\"icon-thumbs-up\"></i></td><td><span class='insight'>"+item.value+"</span></td><td><button class=\"btn btn-link\"onclick=\"removeInsightFromInsights(this)\"title=\"remove code review insight\"type=\"submit\">Remove</button></td></tr>newTd1 = newTr.createElement(\"td\")")
      item.value = ""
      extractInsights()
    else
      alert "Please Enter Insight"

  @addPatchToPatchesList = -> #Add new item to list
    table = $("#patches")
    item = document.getElementById("AddPatch")
    item.value = item.value.trim()
    if item.value
      table.append("<tr class=\"success\"><td><i class=\"icon-ok\"></i></td><td><span class='patch'>"+item.value+"</span></td><td><button class=\"btn btn-link\"onclick=\"removePatchFromPatches(this)\"title=\"remove patch deployed\"type=\"submit\">Remove</button></td></tr>newTd1 = newTr.createElement(\"td\")")
      item.value = ""
      extractPatches()
    else
      alert "Please Enter Patch"

  @removeInsightFromInsights = (listItem) ->
    i = listItem.parentNode.parentNode.rowIndex
    document.getElementById("insights").deleteRow i
    extractInsights()
    $('#edit_insights').submit()

  @removePatchFromPatches = (listItem) ->
    i = listItem.parentNode.parentNode.rowIndex
    document.getElementById("patches").deleteRow i
    extractPatches()
    $('#edit_patches').submit()

  $("#myCarousel").carousel()
