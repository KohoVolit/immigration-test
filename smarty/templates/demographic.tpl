<div class="gallery-cell text-center alert alert-info" id="cell-{$questions_count+1}" data-cell="{$questions_count+1}">
    <div class="container">
        <div class="well">
            {$t['demographics_well']}
        </div>
        
        
        <div class="row text-left">
          <div class="col-xs-2">
            <label> {$t['demographics_age']}:</label>
          </div>
          <div class="col-xs-10">
            <div class="btn-group" role="group" data-toggle="buttons">
                <label class="btn btn-default btn-lg" id="age" data-to="2">
                  <input type="radio" name="age" id="age-1" value="0-19"> - 19  
                </label>
                <label class="btn btn-default btn-lg" id="age" data-to="2">
                  <input type="radio" name="age" id="age-2" value="20-29">20 - 29  
                </label>
                <label class="btn btn-default btn-lg" id="age" data-to="2">
                  <input type="radio" name="age" id="age-3" value="30-39">30 - 39  
                </label>
                <label class="btn btn-default btn-lg" id="age" data-to="2">
                  <input type="radio" name="age" id="age-4" value="40-49">40 - 49  
                </label>
                <label class="btn btn-default btn-lg" id="age" data-to="2">
                  <input type="radio" name="age" id="age-5" value="50-64">50 - 64 
                </label>
                <label class="btn btn-default btn-lg" id="age" data-to="2">
                  <input type="radio" name="age" id="age-5" value="65-">65 - 
                </label>
            </div>
          </div>
        </div>
        
        <div class="row text-left">
          <div class="col-xs-2">
            <label> {$t['demographics_education']}:</label>
          </div>
          <div class="col-xs-10">
            <div class="btn-group" role="group" data-toggle="buttons">
                <label class="btn btn-default btn-lg" id="edu">
                  <input type="radio" name="edu" id="age-1" value="primary">{$t['demographics_education_primary']}  
                </label>
                <label class="btn btn-default btn-lg" id="edu">
                  <input type="radio" name="edu" id="age-1" value="secondary">{$t['demographics_education_secondary']}   
                </label>
                <label class="btn btn-default btn-lg" id="edu">
                  <input type="radio" name="edu" id="age-1" value="uni">{$t['demographics_education_uni']}   
                </label>
            </div>
          </div>
        </div>
        <div class="row text-left">
          <div class="col-xs-12">
            <label> {$t['demographics_outcome']}:</label>
          </div>
        </div>
        <div class="row text-left">
        
          <div class="col-xs-10 col-xs-offset-2">
            <div class="btn-group" role="group" data-toggle="buttons">
                <label class="btn btn-default btn-lg" id="edu">
                  <input type="radio" name="think" value="positive">{$t['demographics_outcome_positive']}
                </label>
                <label class="btn btn-default btn-lg" id="edu">
                  <input type="radio" name="think" value="neutral">{$t['demographics_outcome_neutral']}
                </label>
                <label class="btn btn-default btn-lg" id="edu">
                  <input type="radio" name="think" value="negative">{$t['demographics_outcome_negative']}
                </label>
            </div>
          </div>
        </div>
        
        
        
        <div class="row" style="margin-top:10px">
          <div class="btn btn-success btn-lg btn-block movex">
             <strong>  {$t['overall_results']|capitalize}  > </strong>
           </div>
        </div>
    </div>
    
    <input type="hidden" id='geolocation' name="geolocation">
    <input type="hidden" id='latitude' name="latitude">
    <input type="hidden" id="longitude" name="longitude">
    <input type="hidden" id="accuracy" name="accuracy">


</div> <!-- /cell-11 -->
