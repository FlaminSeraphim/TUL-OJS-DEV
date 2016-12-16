{**
 * toc.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Help table of contents.
 *
 *}


<div style="padding-top: 0.5em;">
  <div class="row">
    <div class="col-xs-12 col-md-4">
      <form action="{url op="search"}" method="post" style="display: inline">
    	<input type="text" name="keyword" value="{$helpSearchKeyword|escape}" class="textField" />&nbsp;
    </div>
    <div class="col-xs-12 col-md-8">
      <input type="submit" value="{translate key="common.search"}" class="btn changeRadius marginTopSm" />
      </form>
    </div>
  </div>

</div>


<script type="text/javascript">
{literal}
$("#helpDropdown").click(function(){
  $("#toggleHelp").toggleClass('hidden');
  $(".toggleUpArrow").toggle();
  $(".toggleDownArrow").toggle();
});
  {/literal}
</script>


<!-- scrapped code we don't need but afraid to delete. -->
      <!-- {if !empty($helpSearchResult) && !empty($helpSearchKeyword)}
      <br />

      <div><a href="{url op="search" anchor="result-$helpSearchResult"|escape keyword=$helpSearchKeyword|escape}">{translate key="help.searchReturnResults"}</a></div>
      {/if}

      <br />

      <div><a href="{url op="toc"}">{translate key="help.toc"}</a></div>

      <br />

      {if $toc->getParentTopicId() && $toc->getParentTopicId() != $topic->getId()}
      <div id="helpContents">
      {translate key="help.contents"}&nbsp;<a href="{url op="view" path=$toc->getParentTopicId()|explode:"/"}">{translate key="help.upALevel"}</a>
      </div>
      <br />
      {/if} -->
