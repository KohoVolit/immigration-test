http://www.facebook.com/dialog/feed?
    app_id={$t.result_fb_appid}&
    link={$t.result_fb_redirect_link|escape:'url'}&
    picture={$t['result_fb_picture_link']}&
    name={$t.result_fb_name|escape:'url'}&
    caption={$t['result_fb_caption']|escape:'url'}&
    actions={$t.result_fb_action|escape:'url'}&
    description={$t.result_fb_description}&
    redirect_uri={$t.result_fb_redirect_link|escape:'url'}
