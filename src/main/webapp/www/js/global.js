var BASE; // Context Path（在 script.jsp 中初始化）

var Smart = {
    /* -------------------------------------------------- 函数 -------------------------------------------------- */
    Validator: {
        checkRequired: function(formId) {
            var result = true;
            $('#' + formId + ' .ext-required')
                .each(function() {
                    var value = $.trim($(this).val());
                    var tagName = this.tagName;
                    if (tagName == 'INPUT' || tagName == 'TEXTAREA') {
                        if (value == '') {
                            $(this).parent().addClass('has-error');
                            result = false;
                        } else {
                            $(this).parent().removeClass('has-error');
                        }
                    } else if (tagName == 'SELECT') {
                        if (value == '' || value == 0) {
                            $(this).parent().addClass('has-error');
                            result = false;
                        } else {
                            $(this).parent().removeClass('has-error');
                        }
                    }
                })
                .blur(function() {
                    var value = $.trim($(this).val());
                    var tagName = this.tagName;
                    if (tagName == 'INPUT' || tagName == 'TEXTAREA') {
                        if (value != '') {
                            $(this).parent().removeClass('has-error');
                        } else {
                            $(this).parent().addClass('has-error');
                        }
                    } else if (tagName == 'SELECT') {
                        if (value != '' && value != 0) {
                            $(this).parent().removeClass('has-error');
                        } else {
                            $(this).parent().addClass('has-error');
                        }
                    }
                });
            return result;
        },
        isExisted: function(filedId, validateUrl, formId) {
        	var isNotExisted = true;
        	var codeval = $('#' + formId).find('#' + filedId).val();
        	if (codeval === '') {
        		$("#isExisted").remove();
        	} else {
	        	$.ajax({
	                type: 'post',
	                url: BASE + validateUrl + codeval,
	                dataType: 'json',
	                success: function(result) {
	                	isNotExisted = result.success;
			            if (!isNotExisted) {
			            	if (!$("#isExisted").length){
			            		$("#" + filedId).parent().append("<span id='isExisted' class='css-color-red'> " + Smart.i18n('common.validate.isExisted') + "</span>");
			            	}
			            } else {
			            	$("#isExisted").remove();
			            }
			            return isNotExisted;
	                }
	            });
        	}

        }
    },
    Cookie: {
        put: function(key, value) {
            $.cookie(key, value, {path: '/', expires: 365});
        },
        get: function(key) {
            return $.cookie(key);
        }
    },
    render: function(template, data) {
        return template.replace(/\{([\w\.]*)\}/g, function(str, key) {
            var keys = key.split('.');
            var value = data[keys.shift()];
            for (var i = 0, l = keys.length; i < l; i++) {
                value = value[keys[i]];
            }
            return (typeof value !== 'undefined' && value !== null) ? value : '';
        });
    },
    i18n: function() {
        var args = arguments;
        var code = args[0];
        var text = window['I18N'][code];
        if (text) {
            if (args.length > 0) {
                text = text.replace(/\{(\d+)\}/g, function(m, i) {
                    return args[parseInt(i) + 1];
                });
            }
            return text;
        } else {
            return code;
        }
    },
    timestamp: function() {
        return new Date().getTime();
    },
    /* -------------------------------------------------- 组件 -------------------------------------------------- */
    Pager: function(pagerId, onChangePageNumber, onChangePageSize) {
        var $pager = $('#' + pagerId);
        // 初始化
        (function() {
            // 点击翻页按钮
            $(document).on('click', '#' + pagerId + ' .ext-pager-button button', function() {
                onChangePageNumber($(this).data('pn'));
            });
            // 点击并切换页面编号
            var pageNumberInput = '#' + pagerId + ' .ext-pager-pn';
            $(document)
                .on('click', pageNumberInput, function() {
                    $(this).select();
                })
                .on('keydown', pageNumberInput, function(event) {
                    if (event.keyCode == '13') {
                        var pageNumber = $(this).val();
                        var totalPage = parseInt($pager.find('.ext-pager-tp').text());
                        if (isNaN(pageNumber) || pageNumber <= 0 || pageNumber > totalPage) {
                            alert(Smart.i18n('common.pager.input_error'));
                            $(this).select();
                            return;
                        }
                        onChangePageNumber(pageNumber);
                    }
                });
            // 点击并切换每页条数
            var pageSizeInput = '#' + pagerId + ' .ext-pager-ps';
            $(document)
                .on('click', pageSizeInput, function() {
                    $(this).select();
                })
                .on('keydown', pageSizeInput, function(event) {
                    if (event.keyCode == '13') {
                        var pageSize = $(this).val();
                        if (isNaN(pageSize) || pageSize <= 0) {
                            alert(Smart.i18n('common.pager.input_error'));
                            $(this).select();
                            return;
                        }
                        onChangePageSize(pageSize);
                        Smart.Cookie.put('cookie_ps_' + pagerId, pageSize);
                    }
                });
        })();
        // 获取页面编号
        this.getPageNumber = function() {
            return $pager.find('.ext-pager-pn').val();
        };
        // 获取每页条数
        this.getPageSize = function() {
            return $pager.find('.ext-pager-ps').val();
        };
    }
};

$(function() {
    // 忽略空链接
    $('a[href="#"]').click(function() {
        return false;
    });

    // 设置 form 默认为 post 类型
    $('form').attr('method', 'post');

    // 全局 AJAX 设置
    $.ajaxSetup({
        cache: true,
        error: function(jqXHR, textStatus, errorThrown) {
            switch (jqXHR.status) {
                case 403:
                    document.write('');
                    location.href = BASE + '/';
                    break;
                case 500:
                    alert(Smart.i18n('error.page.500'));
                    break;
                case 503:
                    alert(errorThrown);
                    break;
            }
        }
    });

    // 切换系统语言
    $('#language').find('a').click(function() {
        var language = $(this).data('value');
        Smart.Cookie.put('cookie_language', language);
        location.reload();
    });

    // 绑定注销事件
    $('#logout').click(function() {
        if (confirm(Smart.i18n('common.logout_confirm'))) {
            $.ajax({
                type: 'get',
                url: BASE + '/logout',
                success: function(result) {
                    if (result.success) {
                        location.href = BASE + '/';
                    }
                }
            });
        }
    });
    //
    var href = location.href;
    $("ul#menu > li").each(function(){
        var id = $(this).attr("id");
        if(href.indexOf(id) > 0) {
            $(this).addClass("active");
        }
    });
    //
    var formFileds = $("form.form-horizontal div.form-group");
    formFileds.children("label").addClass("col-sm-2 control-label");
    formFileds.children("div").addClass("col-sm-10");
    formFileds.find("input,textarea").addClass("form-control");

    // Custom Selects
    if ($('[data-toggle="select"]').length) {
      $('[data-toggle="select"]').select2();
    }

    // Checkboxes and Radio buttons
    $('[data-toggle="checkbox"]').radiocheck();
    $('[data-toggle="radio"]').radiocheck();
});