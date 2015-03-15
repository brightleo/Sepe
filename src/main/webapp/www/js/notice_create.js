$(function() {
    $("#noticeDate").datepicker({ dateFormat: 'yy-mm-dd' });
    $('#notice_create_form').ajaxForm({
        type: 'post',
        url: BASE + '/notice',
        dataType: 'json',
        beforeSubmit: function() {
            return Smart.Validator.checkRequired('notice_create_form');
        },
        success: function(result) {
            if (result.success) {
                location.href = BASE + '/notices';
            }
        }
    });

    $('#back').click(function() {
        history.back();
    });
});