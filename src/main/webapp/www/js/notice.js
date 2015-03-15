$(function() {
    var pager = new Smart.Pager(
    	'notice_pager',
    	function (pageNumber) {
        	searchFormData.pageNumber = pageNumber;
            	$('#notice_search_form').submit();
        },
        function(pageSize) {
            searchFormData.pageNumber = 1;
            searchFormData.pageSize = pageSize;
            $('#notice_search_form').submit();
        }
    );

    var searchFormData = {
        'pageNumber': pager.getPageNumber(),
        'pageSize': pager.getPageSize()
    };

    $('#notice_search_form').ajaxForm({
        type: 'post',
        url: BASE + '/notice/search',
        data: searchFormData,
        dataType: 'html',
        success: function(html) {
            $('#notice_list').html(html);
        }
    });

    $('.ext-notice-delete').click(function() {
        var $tr = $(this).closest('tr');
        var name = $tr.data('name');
        if (confirm(Smart.i18n('notice.delete_confirm', name))) {
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