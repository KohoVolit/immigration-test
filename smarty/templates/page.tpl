{extends file='main.tpl'}
{block name=body}

    {include "modal.tpl"}

    <form  method="POST" action="store.php" id="myform">
        <div class="gallery">
            {include "front-page.tpl"}
            {foreach $questions as $question}
                {include "question.tpl"}
            {/foreach}
            {include "demographic.tpl"}
            {include "result.tpl"}
        </div>
    </form>
    {include "js.tpl"}
    
    

{/block}
