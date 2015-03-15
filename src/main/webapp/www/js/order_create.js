$(function() {
    $( "#sepetabs" ).tabs();
    function countTab2(){
    	var allshipmentamount = 0;
    	$("input[id^='unitprice']").each(function(){
    		var amount = $(this).val();
    		if(amount !== '') {
    			allshipmentamount = (parseFloat(allshipmentamount) + parseFloat(amount)).toFixed(2);
    		}
    	});
    	$("#shipmentamount").val(allshipmentamount);
    	$("#countshipmentamount").text(allshipmentamount);
    	/////////

    	var countbillingamount = 0;
    	$("input[id^='billingUnitprice']").each(function(){
    		var amount = $(this).val();
    		if(amount !== '') {
    			countbillingamount = (parseFloat(countbillingamount) + parseFloat(amount)).toFixed(2);
    		}
    	});
    	$("#billingamount").val(countbillingamount);
    	$("#countbillingamount").text(countbillingamount);
    }
    
    function countTab3(){
    	var alltosectionamount = 0;
    	$("input[id^='tosectionAmount']").each(function(){
    		var amount = $(this).val();
    		if(amount !== '') {
    			alltosectionamount = (parseFloat(alltosectionamount) + parseFloat(amount)).toFixed(2);
    		}
    	});
    	$("#tosectionamount").val(alltosectionamount);
    	$("#counttosectionamount").text(alltosectionamount);
    }
    $("#add").click(function() {
        var tr = $("#forCopyTable tr").clone(true);
        var size = $("#subordertable > tbody > tr").size();
        var index = 0;
        if (size > 0 ) {
        	index = parseInt($("#subordertable > tbody > tr:last").attr("id")) + 1;
        }
        tr.attr("id",index);
        tr.find("input").each(function () {
        	var id = $(this).attr("id");
        	var name = $(this).attr("name");
        	$(this).attr("id", id + index);
        	$(this).attr("name", name + index);
        });
        tr.find("input[readonly='true']").datepicker({ dateFormat: 'yy-mm-dd' });
		tr.find("input").blur(function(){
			countTab2();
	    });
	    $("#subordertable > tbody").append(tr);
    });
    $("#addfortab3").click(function() {
        var tr = $("#forCopyTableFortab3 tr").clone(true);
        var size = $("#tosectiontable > tbody > tr").size();
        var index = 0;
        if (size > 0 ) {
        	index = parseInt($("#tosectiontable > tbody > tr:last").attr("id")) + 1;
        }
        tr.attr("id",index);
        tr.find("input").each(function () {
        	var id = $(this).attr("id");
        	var name = $(this).attr("name");
        	$(this).attr("id", id + index);
        	$(this).attr("name", name + index);
        });
        tr.find("input[readonly='true']").datepicker({ dateFormat: 'yy-mm-dd' });
		tr.find("input").blur(function(){
			countTab3();
	    });
	    $("#tosectiontable > tbody").append(tr);
    });
    $("button[id^=delete]").click(function() {
    	var isTabs2 = $(this).closest("div#tabs2");
    	$(this).closest("tr").remove();
    	if(isTabs2.length > 0){
    		countTab2();
    	} else {
    		countTab3();
    	}
    });
    $(".form-group input[id$='date']").datepicker({ dateFormat: 'yy-mm-dd' });
    $('#order_create_form').ajaxForm({
        type: 'post',
        url: BASE + '/order/create',
        dataType: 'json',
        beforeSubmit: function() {
            var relsult = $("#isExisted").length === 0;
            if(relsult){
                relsult = Smart.Validator.checkRequired('order_create_form');
            }
            return relsult;

        },
        success: function(result) {
            if (result.success) {
                location.href = BASE + '/orders';
            }
        }
    });
    $("div#tabs1 #code").blur(function(){
       Smart.Validator.isExisted('code', '/order/validate/', 'order_create_form');
    });
    ///get customer's info
	var customers = $("#customerNames").val();
	function split(val) {
	    return val.split(/&&&\s*/);
	}
	var customerNames =split(customers);
	var availableTags = [];
	for(i=0;i<customerNames.length;i++){
		var item = {};
		var customerName = customerNames[i].split(/,\s*/);
		item['label'] = customerName[0];
		item['value'] = customerName[1];
		availableTags.push(item);
	}
	$( "#customer" ).autocomplete({
		source: availableTags
	});
    $('#back').click(function() {
        history.back();
    });
});