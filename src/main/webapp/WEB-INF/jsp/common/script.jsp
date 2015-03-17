<%@ page pageEncoding="UTF-8" %>

<script type="text/javascript" src="${BASE}/www/lib/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/jquery-form/jquery.form.min.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/jquery-cookie/jquery.cookie.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/jgrowl/jquery.jgrowl.min.js"></script>
<script type="text/javascript" src="${BASE}/www/i18n/i18n_zh_CN.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/flat-ui/dist/js/flat-ui.min.js"></script>
<script type="text/javascript" src="${BASE}/www/js/global.js"></script>
<script type="text/javascript">
    $(function() {
        BASE = '${BASE}';
    });
</script>
<security:user>
    <script type="text/javascript">
    $(function() {
        BASE = '${BASE}';
        function getNotices() {
            $.ajax({
                type: 'post',
                url: BASE + "/un_read_notices",
                dataType: 'json',
                success: function(result) {
                    var notices = result.data;
                    var noticeSize = notices.length;

                    if (noticeSize > 0 ) {
                        $("span#hasNotice").addClass("badge").text(noticeSize).before("<span class='fui-mail'>");
                        $("a#showNotice").click(function(){
                            if ($("div.jGrowl-closer").length === 0) {
                                for(i=0; i<noticeSize; i++) {
                                    var notice = notices[i];
                                    $.jGrowl(notice[1], {
                                        sticky: true ,
                                        theme:  'sepe',
                                        header: notice[0]
                                    });
                                }
                            }
                        });
                    }
                }
            });
        }
        getNotices();
    });
    </script>
</security:user>
