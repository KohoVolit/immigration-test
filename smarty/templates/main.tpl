<!DOCTYPE html>
<html lang="{$t['iso_lang']}">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="{$t['website_description']}">
    <meta name="keywords" content="{$t['website_keywords']}">
    <meta name="author" content="{$t['website_author']}">
    <link type="image/x-icon" href="{$cdn_url}/images/favicon.ico" rel="shortcut icon">
    
    <meta property="og:image" content="{$t['og:image']}"/>
	<meta property="og:title" content="{$t['og:title']}"/>
	<meta property="og:url" content="{$t['og:url']}"/>
	<meta property="og:site_name" content="{$t['og:site_name']}"/>
	<meta property="og:type" content="website"/>

    <link href="{$cdn_url}libs/bootstrap.min.css" rel="stylesheet">
    <link href="{$cdn_url}libs/flickity.css" rel="stylesheet">
    <link href="{$cdn_url}libs/font-awesome.min.css" rel="stylesheet">  
{*   <link href="//cdn.bootcss.com/bootswatch/3.3.5/flatly/bootstrap.min.css" rel="stylesheet">*}
    <link href="{$cdn_url}project.css" rel="stylesheet">
{*    <script src="{$cdn_url}libs/jquery-1.11.3.min.js"></script>*}
	<script src="{$cdn_url}libs/jquery.min.js"></script>
    <script src="{$cdn_url}libs/bootstrap.min.js"></script>
    <script src="{$cdn_url}libs/flickity.pkgd.min.js"></script>
{*	<script src="{$cdn_url}libs/bootstrap.min.js"></script>*}
{*    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>*}
{*    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>*}
{*    <script src="../jquery.stickytableheaders.min.js"></script>*}
    <title>{$t['title']}</title>
    
    {block name=additionalHead}{/block} 
    
    {block name=lastHead}{/block}
  </head>
  <body>
{*    {include "header.tpl"}*}
    

        <!-- Page Content -->
        {block name=body}{/block}
        <!-- /Page Content -->
{*        {include "footer.tpl"}*}

    
    
    {block name=js}{/block}
    <!-- google analytics -->
    <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', "{$t['google_tracking_id']}"]);
      _gaq.push(['_trackPageview']);
      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    </script>
    <!-- /google analytics -->
    
    <!-- Yandex.Metrika counter -->
    <script type="text/javascript">
        (function (d, w, c) {
            (w[c] = w[c] || []).push(function() {
                try {
                    w.yaCounter{$t['yandex_metrica_id']} = new Ya.Metrika({
                        id:{$t['yandex_metrica_id']},
                        clickmap:true,
                        trackLinks:true,
                        accurateTrackBounce:true
                    });
                } catch(e) { }
            });

            var n = d.getElementsByTagName("script")[0],
                s = d.createElement("script"),
                f = function () { n.parentNode.insertBefore(s, n); };
            s.type = "text/javascript";
            s.async = true;
            s.src = "https://mc.yandex.ru/metrika/watch.js";

            if (w.opera == "[object Opera]") {
                d.addEventListener("DOMContentLoaded", f, false);
            } else { f(); }
        })(document, window, "yandex_metrika_callbacks");
    </script>
    <noscript><div><img src="https://mc.yandex.ru/watch/{$t['yandex_metrica_id']}" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
    <!-- /Yandex.Metrika counter -->
        
  </body>
</html>
