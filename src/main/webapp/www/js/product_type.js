$(function() {
	$("#html").jstree({
	     "core" : {
	       "check_callback" : true
	     },
	    "plugins" : [ "contextmenu" ]
	  });
	function getTreeInfo(id){
		var value = "";
		$("li[aria-level='2']").each(function(){
			var text2 = $(this).children(".jstree-anchor").text();
			text2 = text2.replace(/\n|\t/g,'').trim();
			$(this).find("li[aria-level='3']").each(function(){
				var text3 = $(this).children(".jstree-anchor").text();
				text3 = text3.replace(/\n|\t/g,'').trim();
				text2 = text2 + "@@" + text3
			});
			if (value === '') {
				value = text2;
			} else {
				value = value + ',' + text2;
			}
		});
		$("#" + id).val(value);
	}
	$("button#save").click(function(e){
		getTreeInfo('producttype_value');
	});
    $('#producttype_form').ajaxForm({
        type: 'put',
        url: BASE + '/productType/save',
        dataType: 'json',
        success: function(result) {
            if (result.success) {
            	alert(Smart.i18n('common.save.success'));
            } else {
            	alert(Smart.i18n('common.save.failed'));
            	location.href = BASE + '/productTypes';
            }
        }
    });
})