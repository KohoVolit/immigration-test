<label class="btn btn-default btn-block btn-lg move button-answer" id="next-{$question['id']}-{$abc}" data-toggle="modal" data-target="#modal" data-answer="{$abc}" data-id="{$question['id']}">
      <input type="radio" name="q-{$question['id']}" id="q-{$question['id']}-{$abc}" value="{$abc}">
      <span class="">{$abc|capitalize}) {$question[$abc]}</span>
    </label>
