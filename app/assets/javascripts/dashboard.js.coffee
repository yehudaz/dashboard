jQuery ->
  @addInsightToInsightsList = -> #Add new item to list
    table = $("#insights")
    item = document.getElementById("AddInsight")
    item.value = item.value.trim()
    if item.value
      table.append("<tr class=\"success\"><td><i class=\"icon-thumbs-up\"></i></td><td><span>"+item.value+"</span></td><td><button class=\"btn btn-link\"onclick=\"removeInsightFromInsights(this)\"title=\"remove code review insight\"type=\"button\">Remove</button></td></tr>newTd1 = newTr.createElement(\"td\")")
      item.value = ""
    else
      alert "Please Enter Insight"

  @addPatchToPatchedList = -> #Add new item to list
    table = $("#patches")
    item = document.getElementById("AddPatch")
    item.value = item.value.trim()
    if item.value
      table.append("<tr class=\"success\"><td><i class=\"icon-ok\"></i></td><td><span>"+item.value+"</span></td><td><button class=\"btn btn-link\"onclick=\"removePatchFromPatches(this)\"title=\"remove patch deployed\"type=\"button\">Remove</button></td></tr>newTd1 = newTr.createElement(\"td\")")
      item.value = ""
    else
      alert "Please Enter Patch"

  @removeInsightFromInsights = (listItem) ->
    i = listItem.parentNode.parentNode.rowIndex
    document.getElementById("insights").deleteRow i

  @removePatchFromPatches = (listItem) ->
    i = listItem.parentNode.parentNode.rowIndex
    document.getElementById("patches").deleteRow i

  $("#myCarousel").carousel()

  @updateVersion = (versionId, testsCoverage, passedTests, rbpOpenIssues, gitHash) ->
    data = {}
    insights = ''
    $("#insights tr").each ->
      insights += this.textContent + ';'
    patches = ''
    $("#patches tr").each ->
      patches += this.textContent + ';'
    data.insights = insights
    data.patches = patches
    date.testsCoverage = testsCoverage
    data.passedTests = passedTests
    data.rbpOpenIssues = rbpOpenIssues
    data.gitHash = gitHash
    $.ajax "/versions/" + versionId,
      data: data
      type: "PUT"
      success: (response) ->
        $("#success").show()
      error: (response) ->
        $("#error").show()
    $("html, body").animate
      scrollTop: 0, "slow"
