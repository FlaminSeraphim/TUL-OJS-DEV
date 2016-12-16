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

    <div class="col-xs-12 ">
      <div id="helpToc" class="block">
        <h5>Still can't find what you are looking for?</h5>
      	<h4 id="helpDropdown" class="blockTitle">{$toc->getTitle()} List <i class="fa fa-arrow-circle-down toggleDownArrow" aria-hidden="true"></i><i class="fa fa-arrow-circle-up toggleUpArrow" aria-hidden="true"></i></h4>
      	<ul id="toggleHelp" class="hidden">
      		{foreach from=$toc->getTopics() item=currTopic}
      			{if $currTopic->getId() == $topic->getId()}
      			<li><a href="{url op="view" path=$currTopic->getId()|explode:"/"}" class="current">{$currTopic->getTitle()}</a>
      			{if $subToc}
      			<ul>
      			{foreach from=$subToc->getTopics() item=currSubTopic}
      				<li><a href="{url op="view" path=$currSubTopic->getId()|explode:"/"}">{$currSubTopic->getTitle()}</a></li>
      			{/foreach}
      			</ul>
      			{/if}
      			</li>
      			{else}
      			<li><a href="{url op="view" path=$currTopic->getId()|explode:"/"}">{$currTopic->getTitle()}</a></li>
      			{/if}
      		{/foreach}
      	</ul>
      </div>
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
