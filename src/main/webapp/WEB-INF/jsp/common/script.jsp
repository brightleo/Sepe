<%@ page pageEncoding="UTF-8" %>

<script type="text/javascript" src="${BASE}/www/lib/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/jquery-form/jquery.form.min.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/jquery-cookie/jquery.cookie.js"></script>
<script type="text/javascript" src="${BASE}/www/i18n/i18n_${system_language}.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/flat-ui/dist/js/flat-ui.min.js"></script>
<script type="text/javascript" src="${BASE}/www/js/global.js"></script>

<script type="text/javascript">
$(function() {
    BASE = '${BASE}';
    function getNotices() {
    	$.ajax({
            type: 'get',
            url: BASE + "/un_read_notices",
            dataType: 'json',
            success: function(result) {
            	var notices = result.data;
                var noticeSize = notices.length;
                for(i=0; i<noticeSize; i++) {
                    var notice = notices[i];
                }
                $("span#noticemessage").append('<span>你有' + noticeSize + '条未处理事件</span>');
            }
        });
    }
});
</script>