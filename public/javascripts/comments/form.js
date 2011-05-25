setupCommentForm = function(){
  $("form[id$='CommentForm']").submit(function(){
    $(this).children().removeClass("field_error");
    $.post($(this).attr("action"),$(this).serialize())
      .statusCode({ 500: onInternalServerError })
      .success(onSucess);
    return false;
  });
}

function onInternalServerError (xmlHttpRequest) {
  var responseText = xmlHttpRequest.responseText;
  var attributesWithError = responseText.split(';;');
  var fieldsWithError = fieldsOf(attributesWithError);
  fieldsWithError.addClass("field_error");
}

function onSucess(responseText){
  resetForm();
  updateCommentsWith(responseText);
  $("div#commentForm div.content form").replaceWith(i18n.dont_do_double_comment);
}

function fieldsOf(attributes) {
  var fields = $();
  attributes.forEach(function(attribute){
    var fieldName = "comment[" + attribute + "]";
    fields = fields.add("form[id$='CommentForm'] [name='"+fieldName+"']");
  });
  return fields;
}

function resetForm() {
  $("form[id$='CommentForm'] [name^='comment[']").val("");
}

function updateCommentsWith(commentsDivs) {
  $("div#comments div.content").html(commentsDivs);
}
