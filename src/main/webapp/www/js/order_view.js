$(function() {
    $('#edit').click(function() {
        var orderId = $('#id').val();
        location.href = BASE + '/order/edit/' + orderId;
    });

    $('#back').click(function() {
        location.href = BASE + '/orders';
    });
});