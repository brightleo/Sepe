$(function() {
    $('#order_upload_form').ajaxForm({
        type: 'post',
        url: BASE + '/order/upload_picture/' + $('#id').val(),
        dataType: 'json',
        beforeSubmit: function() {
            return $('#picture').val().length > 0;
        },
        success: function(result) {
            if (result.success) {
                $('#picture_img').attr('src', BASE + '/www/upload/' + result.data);
            }
        }
    });

    $('#picture').change(function() {
        $('#order_upload_form').submit();
    });

    $('#back').click(function() {
        location.href = BASE + '/orders';
    });
});