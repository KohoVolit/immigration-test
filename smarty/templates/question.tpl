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
  
{*    <label class="btn btn-default btn-block btn-lg move button-answer" id="next-{$question['id']}-a" data-toggle="modal" data-target="#modal" data-answer="a">*}
{*      <input type="radio" name="q-{$question['id']}" id="q-{$question['id']}-a" value="a">*}
{*      <span class="">A) {$question['a']</span>*}
{*    </label>*}
{*    <label class="btn btn-default btn-block btn-lg move button-answer" id="next-{$question['id']}-b" data-toggle="modal" data-target="#modal" data-answer="b">*}
{*      <input type="radio" name="q-1" id="q-1-b" value="b">*}
{*      <span class="">B) It is about the same</span>*}
{*    </label>*}
{*    <label class="btn btn-default btn-block btn-lg move button-answer" id="next-1-a" data-to="2" data-toggle="modal" data-target="#modal-1" data-answer="c">*}
{*      <input type="radio" name="q-1" id="q-1-c" value="c">*}
{*      <span class="">C) There are three times more refugees in Turkey</span>*}
{*    </label>*}
    
  </div>
  <input type="hidden" name="correct-{$question['id']}" id="correct-{$question['id']}" value="0" class="correct-counter"></input>
</div> <!-- /cell -->
