$(function() {
    var pager = new Smart.Pager(
    	'customer_pager',
    	function (pageNumber) {
        	searchFormData.pageNumber = pageNumber;
            	$('#customer_search_form').submit();
        },
        function(pageSize) {
            searchFormData.pageNumber = 1;
            searchFormData.pageSize = pageSize;
            $('#customer_search_form').submit();
        }
    );

    var searchFormData = {
        'pageNumber': pager.getPageNumber(),
        'pageSize': pager.getPageSize()
    };

    $('#customer_search_form').ajaxForm({
        type: 'post',
        url: BASE + '/customer/search',
        data: searchFormData,
        dataType: 'html',
        success: function(html) {
            $('#customer_list').html(html);
        }
    });

    $('.ext-customer-delete').click(function() {
        var $tr = $(this).closest('tr');
        var name = $tr.data('name');
        if (confirm(Smart.i18n('customer.delete_confirm', name))) {
            var url = $(this).attr('href');
            $.ajax({
                type: 'delete',
                url: url,
                dataType: 'json',
                success: function(result) {
                    if (result.success) {
                        location.reload();
                    }
                }
            });
        }
        return false;
    });
});