$(function() {
	$("#noticeDate").datepicker({ dateFormat: 'yy-mm-dd' });
    $('#notice_edit_form').ajaxForm({
        type: 'put',
        url: BASE + '/notice/' + $('#id').val(),
        dataType: 'json',
        beforeSubmit: function() {
            return Smart.Validator.checkRequired('notice_edit_form');
        },
        success: function(result) {
            if (result.success) {
                location.href = BASE + '/notices';
            }
        }
    });

    $('#save').click(function() {
        $('#notice_edit_form').submit();
    });

    $('#back').click(function() {
        location.href = BASE + '/notices';
    });
});