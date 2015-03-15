$(function() {
    $('#customer_edit_form').ajaxForm({
        type: 'put',
        url: BASE + '/customer/' + $('#id').val(),
        dataType: 'json',
        beforeSubmit: function() {
            return Smart.Validator.checkRequired('customer_edit_form');
        },
        success: function(result) {
            if (result.success) {
                location.href = BASE + '/customers';
            }
        }
    });

    $('#save').click(function() {
        $('#customer_edit_form').submit();
    });

    $('#back').click(function() {
        location.href = BASE + '/customers';
    });
});