<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
    
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
        <span class="sr-only">...</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand{if $page=='front_page'} active{/if}" href="../">{$t['brand']}</a>
    </div>

    <div class="collapse navbar-collapse" id="navbar-collapse">
      <ul class="nav navbar-nav">
        <li {if $page=='ep'}class='active'{/if}><a href="{$app_url}ep">{$t['european_parliament']}</a></li>
        <li {if $page=='council'}class='active'{/if}><a href="{$app_url}council">{$t['council']}</a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li {if $page=='about'}class='active'{/if}><a href="{$app_url}about">{$t['about']}</a></li>
      </ul>
    </div>
  </div>
</nav>
