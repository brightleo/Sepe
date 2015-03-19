$(function() {
    var pager = new Smart.Pager(
        'order_pager',
        function (pageNumber) {
            searchFormData.pageNumber = pageNumber;
            $('#order_search_form').submit();
        },
        function(pageSize) {
            searchFormData.pageNumber = 1;
            searchFormData.pageSize = pageSize;
            $('#order_search_form').submit();
        }
    );

    var searchFormData = {
        'pageNumber': pager.getPageNumber(),
        'pageSize': pager.getPageSize()
    };

    $('#order_search_form').ajaxForm({
        type: 'post',
        url: BASE + '/order/search',
        data: searchFormData,
        dataType: 'html',
        success: function(html) {
            $('#order_list').html(html);
            // Custom Selects
            if ($('#order_list [data-toggle="select"]').length) {
              $('#order_list [data-toggle="select"]').select2();
            }
        }
    });

    var deleteFn = function() {
        var $tr = $(this).closest('tr');
        var orderId = $tr.data('id');
        var name = $tr.data('name');
        if (confirm(Smart.i18n('order.delete_confirm', name))) {
            $.ajax({
                type: 'delete',
                url: BASE + '/order/delete/' + orderId,
                dataType: 'json',
                success: function(result) {
                    if (result.success) {
                        location.reload();
                    }
                }
            });
        }
    };
    $('.ext-order-delete').click(deleteFn);
    $(document).on('click', '.ext-order-delete', deleteFn);
    $("#products").change(function() {
        $('#order_search_form').submit();
    });
});