<script type="text/javascript" src="{{ static_url() }}public/js/tiny_mce.js"></script>
<div class="box_container">
    <div style="margin: 20px auto 10px;width:665px;">
    </div>
    <div id="input_data_new" class="register" >
        <h3>{{ lang._('input_news') }}</h3>
        {% if error['message'] is defined %}
        {{ '<span  style="color: red;">' ~ error['message'] ~ '</span>' }}
        {% endif %}
        <form action="" method="post" enctype="multipart/form-data">
            <table id="tb_news">
                <tr>
                    <td> 
                        <label>{{ lang._('cate_title') }}: <span class="error_put">(*)</span></label>
                    <td>
                </tr>
                
                <tr>
                    <td>
                        {% set err = this.utils.getMessageError('id_category', error)?'error_input':'' %}
                        {{ form.render('id_category', ['onchange':'selectCate("id_category")', 'name':'id_category', 'class':err]) }}
                        {{ '<span class="error_put">' ~ this.utils.getMessageError('id_category', error) ~ '</span>' }}
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label>{{ lang._('title_news') }}: <span class="error_put">(*)</span></label>
                    <td>
                </tr>
                <tr>
                    <td>
                        {% set err = this.utils.getMessageError('title', error)?'error_input':'' %}
                        {{ form.render('title', ['class':err]) }}
                        {{ '<span class="error_put">' ~ this.utils.getMessageError('title', error) ~ '</span>' }}
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label>{{ lang._('content_news') }}:</label>
                    <td>
                </tr>
                <tr>
                    <td>
                        {{ form.render('content') }}
                    </td>
                </tr>
                
                <tr><td></td></tr>
                
                <tr>
                    <td><label>{{ lang._('select_img') }}: <span style="font-size: 11px;">({{ lang._('max_select') }}.)</span></label></td>
                </tr>
                <?php
                $img = explode(',',$content_data->img); 
                if(isset($img[0]) && $img[0]!='')
                {
                    $j=1;
                    foreach($img as $i)
                    {
                ?>
                <tr id="div_choise_img-<?php echo $j; ?>-tr">
                    <td class="borderB">
                    <div style="max-width: 585px; overflow: auto;">
                        <img src="<?php echo $i; ?>" height="60px" />
                        <input style="display: none;" class="div_choise_img" id="div_choise_img-<?php echo $j; ?>" type="text" name="img_old[]" value="<?php echo $i; ?>" />
                        
                    </div>
                    <div  style="float: right;"><a onclick="deleteImg('<?php echo $j; ?>');">Xóa ảnh</a></div>
                    <div class="clear"></div>
                    </td>
                </tr>
                <?php $j++;}}
                ?>
                <tr class="tr_choise_img"  id="div_choise_img-<?php echo count($img)+1; ?>-tr">
                    <td>
                        <div><input class="div_choise_img" id="div_choise_img-<?php echo count($img)+1; ?>" onchange="abc(this);" type="file" name="img[]" id="file" /></div>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label>{{ lang._('select_city') }}:</label>
                    <td>
                </tr>
                
                <tr>
                    <td>
                         {{ form.render('city') }}
                    </td>
                </tr>
                
                <tr><td><h3 class="padT10 padB5" style="border-top: 1px solid #DCDCDC;">{{ lang._('lang_extend') }}</h3></td></tr>
                
            </table>
            
            <table id="tb_news">
                <tr class="tr_gia_tien"><td><label>{{ lang._('giatien_placeholder') }}</label></td></tr>
                <tr class="tr_gia_tien"><td>
                    {{ form.render('gia_tien') }}
                    <span>VNĐ</span>
                </td></tr>
                
                <tr><td>
                    <div class="fillter_box rebor" id="news_nav_filter">
                        <ul>
                            <li class="li_cung_cau">
                                  {{ form.render('cung_cau') }}
                            </li>
                            <li class="nguoi_dang">
                                {{ form.render('nguoi_dang') }}
                            </li>
                            <li class="muc_luong">
                                {{ form.render('muc_luong') }}
                            </li>
                            <li class="kinh_nghiem">
                                {{ form.render('kinh_nghiem') }}
                            </li>
                            
                            <li class="tinh_trang">
                                {{ form.render('tinh_trang') }}
                            </li>
                            
                            <li class="dien_tich">
                                {{ form.render('dien_tich') }}
                            </li>
                            
                            <li class="kieu_dang">
                                {{ form.render('kieu_dang') }}
                            </li>
                            
                            <li class="xuat_xu">
                                {{ form.render('xuat_xu') }}
                            </li>
                            <li class="hang_san_xuat">
                                {{ form.render('hang_san_xuat') }}
                            </li>
                        </ul>
                    </div>
                </td></tr>
                <tr><td><h3 class="padT10 padB5" style="border-top: 1px solid #DCDCDC;">Thông tin liên hệ</h3></td></tr>
            </table>
            
            <table  id="tb_lienhe">
                 <tr>
                    <td><label>SĐT liên hệ:</label></td><td style="padding-left:26px !important;"><label>Email liên hệ:</label></td>
                </tr>
                
                <tr>
                    <td>{{ form.render('sdt') }}</td><td style="padding-left:26px !important;">{{ form.render('email') }}</td>
                </tr>
                
                
                <tr>
                    <td><label>Yahoo liên hệ:</label></td><td style="padding-left:26px !important;"><label>Skype liên hệ:</label></td>
                </tr>
                
                <tr>
                    <td>{{ form.render('yahoo') }}</td><td style="padding-left:26px !important;">{{ form.render('skype') }}</td>
                </tr>
                <tr>
                    <td class="alignLeft" style="padding-bottom: 0 !important; margin-bottom: 0 !important;"><label><span class="ver_top">{{ lang._('input_code') }}: </span>
                    <?php foreach($data['code'] as $item){ ?>
                        <img width="15" src="<?php echo $this->url->get('').'public/xacnhancp/'.md5($this->utils->getRealIPAddress()).'/'.$item.'.png'; ?>" />
                    <?php } ?>
                    <span class="error_put ver_top">(*)</span>
                    </label></td>
                </tr>
                <tr>
                    <td class="alignLeft">
                        {% set err = this.utils.getMessageError('incode', error)?'error_input':'', key = data['key'] %}
                        {{ form.render('incode', ['class':err]) }}
                        {{ '<span class="error_put">' ~ this.utils.getMessageError('incode', error) ~ '</span>' }}
                        <input hidden="" name="namecode" value="{{ data['key'] }}" />
                    </td>
                </tr>
                
            </table>
            
            <input type="submit" name="submit" value="Đăng tin" class="submit_dangtin" />
        </form>
    </div>
    <div id="danhgia">
        <h3>Chào mừng bạn đã tham gia chợ rao vặt của chúng tôi.</h3>
        <h4>Website của chúng tôi đang trong quá trình phát triển.</h4>
        <h4>Rất mong được sự giúp đỡ ủng hộ của các bạn.</h4>
        <h4>Xin bớt chút thời gian gửi ý kiến đóng góp tới thamhut@gmail.com để website phát triển tốt hơn.</h4>
        <h4>Chúng tôi xin chân thành cảm ơn!</h4>
        
  			<br>
  			<h3>Giúp tin đăng được nhiều người tìm thấy trên google</h3>
        <h4>1. Tiêu đề: Không quá dài hoặc quá ngắn loại bỏ những ký tự đặc biệt, chọn những cụm từ hay được tìm kiếm.</h4>
        <h4>2. Nội dung: Nội dung đăng không được quá ngắn, tránh viết không dấu, nên hướng tới những từ khóa chính</h4>
        <h4>3. Hãy chia sẻ tin đăng của bạn lên các mạng xã hội như <b>facebook</b> hoặc <b>google+</b></h4>
        <h4>4. <b>Chú ý: </b>Tránh đăng tin trùng nội dung, hãy sử dụng chức năng lên top ở cuối bài đăng để làm mới lại tin đăng.</h4>
        <h4>Chúc các bạn thành công.</h4>
    </div>
</div>

<script>
    selectCate('id_category');
    $("#content").css('width','620px');
    tinyMCE.init({
		// General options
        selector:"textarea#content",
		theme : "advanced",
		skin : "default",
		//plugins : "lists,pagebreak,style,layer,table,advhr,emotions,iespell,preview,contextmenu,paste,directionality,noneditable,visualchars,nonbreaking,xhtmlxtras,template,inlinepopups",

		// Theme options
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontselect",
		theme_advanced_buttons2 : "bullist,numlist,|,,,,,,,forecolor,backcolor,fontsizeselect",

		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
        width:580,
        height:300,
	});
    tinyMCE.remove('div');
</script>