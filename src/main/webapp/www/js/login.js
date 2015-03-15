$(function() {
    var mainURL = BASE + '/orders';
    
    $("#loginBtn").click(function(){
    	$('#login_form').submit();
    });

    $('#login_form').ajaxForm({
        type: 'post',
        url: BASE + '/login',
        dataType: 'json',
        beforeSubmit: function() {
            var result = false;
            if (Smart.Validator.checkRequired('login_form')) {
                $('#login_form').find(':input').prop('disabled', true);
                result = true;
            }
            return result;
        },
        success: function(result) {
            if (result.success) {
                location.href = mainURL;
            } else {
                alert(Smart.i18n('login.failure'));
                $('#login_form').find(':input').prop('disabled', false);
            }
        }
    });
});