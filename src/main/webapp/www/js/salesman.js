$(function() {
    $("#add").click(function() {
        var tr = $("#forCopyTable tr").clone(true);
        var size = $("#salesmantable > tbody > tr").size();
        var index = 1;
        if (size > 0 ) {
        	index = parseInt($("#salesmantable > tbody > tr:last").attr("id")) + 1;
        }
        tr.attr("id",index);
        tr.find("input").each(function () {
        	var id = $(this).attr("id");
        	var name = $(this).attr("name");
        	$(this).attr("id", id + index);
        	$(this).attr("name", name + index);
        });
        tr.find("input[type='text']").addClass("ext-required");
        tr.find("td:first-child").append(index);
	    $("#salesmantable > tbody").append(tr);
    });
    $('#salesman_form').ajaxForm({
        type: 'put',
        url: BASE + '/salesman/save',
        dataType: 'json',
        beforeSubmit: function() {
            return Smart.Validator.checkRequired('salesman_form');
        },
        success: function(result) {
            if (result.success) {
            	alert(Smart.i18n('common.save.success'));
                location.href = BASE + '/salesman';
            }
        }
    });
  })