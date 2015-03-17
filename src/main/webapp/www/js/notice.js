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
            if ($('#notice_list [data-toggle="select"]').length) {
              $('#notice_list [data-toggle="select"]').select2();
            }
        }
    });

    $('.ext-notice-delete').click(function() {
        var $tr = $(this).closest('tr');
        var name = $tr.data('name');
        var noticeId = $tr.data('id');
        if (confirm(Smart.i18n('notice.delete_confirm', name))) {
            var url = $(this).attr('href');
            $.ajax({
                type: 'delete',
                url: BASE + '/notice/delete/' + noticeId,
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