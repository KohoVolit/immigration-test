<div class="gallery-cell text-center" id="cell-{$question['id']}" data-cell="{$question['id']}">
    <div class="container">
      <div class="well">
        <h3>{$question['question']}</h3>
        {if $question['hint'] != ''}
            <p>{$t['hint']}: {$question['hint']}
        {/if}
      </div>
    </div>
  <div class="btn-group-vertical" role="group" data-toggle="buttons">
    {foreach ['a','b','c'] as $abc}
        {include "question-button.tpl"}
    {/foreach}
  </div>
  <input type="hidden" name="correct-{$question['id']}" id="correct-{$question['id']}" value="0" class="correct-counter"></input>
  <input type="hidden" name="answer-{$question['id']}" id="answer-{$question['id']}" value=""></input>
</div> <!-- /cell -->
