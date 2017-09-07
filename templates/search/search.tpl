{**
 * templates/search/search.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * A unified search interface.
 *}
{strip}
{assign var="pageTitle" value="navigation.search"}
{include file="common/header.tpl"}
{/strip}
<link rel="stylesheet" href="{$baseUrl}/lib/osu/osuHideSideBar.css" type="text/css" />

<div class="row">
  <div class="col-xs-8 col-xs-offset-2">

    <div id="search">
    	<script type="text/javascript">
    		$(function() {ldelim}
    			// Attach the form handler.
    			$('#searchForm').pkpHandler('$.pkp.pages.search.SearchFormHandler');
    		{rdelim});
    	</script>
    	<form id="searchForm" action="{url op="search"}">

              <!-- <td class="label"><label for="query">{translate key="search.searchAllCategories"}</label></td> -->

              {capture assign="queryFilter"}{call_hook name="Templates::Search::SearchResults::FilterInput" filterName="query" filterValue=$query}{/capture}
              {if empty($queryFilter)}
                <input type="text" id="query" name="query" size="40" maxlength="255" value="{$query|escape}" class="textField" />
              {else}
                {$queryFilter}
              {/if}
              &nbsp;
              <spanclass="fa fa-search" ></span>
              <input type="submit" value="{translate key="common.search"}" class="btn changeRadius" />
          {if $siteSearch}
            <label for="searchJournal">{translate key="search.withinJournal"}</label>
            <select name="searchJournal" id="searchJournal" class="selectMenu">{html_options options=$journalOptions selected=$searchJournal}</select>
          {/if}
          {if $hasActiveFilters}

              <h4>{translate key="search.activeFilters"}</h4>
            {include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="authors" filterValue=$authors key="search.author"}
            {include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="title" filterValue=$title key="article.title"}
            {include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="abstract" filterValue=$abstract key="search.abstract"}
            {include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="galleyFullText" filterValue=$galleyFullText key="search.fullText"}
            {include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="suppFiles" filterValue=$suppFiles key="article.suppFiles"}
            {include file="search/searchFilter.tpl" displayIf="activeFilter" filterType="date" filterName="dateFrom" filterValue=$dateFrom startYear=$startYear endYear=$endYear key="search.dateFrom"}
            {include file="search/searchFilter.tpl" displayIf="activeFilter" filterType="date" filterName="dateTo" filterValue=$dateTo startYear=$startYear endYear=$endYear key="search.dateTo"}
            {include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="discipline" filterValue=$discipline key="search.discipline"}
            {include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="subject" filterValue=$subject key="search.subject"}
            {include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="type" filterValue=$type key="search.typeMethodApproach"}
            {include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="coverage" filterValue=$coverage key="search.coverage"}
            {include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="indexTerms" filterValue=$indexTerms key="search.indexTermsLong"}
          {/if}

        <br />
        {if $hasEmptyFilters}
          {capture assign="emptyFilters"}

              {if empty($authors) || empty($title) || empty($abstract) || empty($galleyFullText) || empty($suppFiles)}
                <h4>{translate key="search.searchCategories"}</h4>
                {include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="authors" filterValue=$authors key="search.author"}
                {include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="title" filterValue=$title key="article.title"}
                {include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="abstract" filterValue=$abstract key="search.abstract"}
                {include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="galleyFullText" filterValue=$galleyFullText key="search.fullText"}
                {include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="suppFiles" filterValue=$suppFiles key="article.suppFiles"}
              {/if}
              {if $dateFrom == '--' || $dateTo == '--'}
                <h4>{translate key="search.date"}</h4>
                {include file="search/searchFilter.tpl" displayIf="emptyFilter" filterType="date" filterName="dateFrom" filterValue=$dateFrom startYear=$startYear endYear=$endYear key="search.dateFrom"}
                {include file="search/searchFilter.tpl" displayIf="emptyFilter" filterType="date" filterName="dateTo" filterValue=$dateTo startYear=$startYear endYear=$endYear key="search.dateTo"}
              {/if}
              {if empty($discipline) || empty($subject) || empty($type) || empty($coverage)}

                  <h4>{translate key="search.indexTerms"}</h4>
                {include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="discipline" filterValue=$discipline key="search.discipline"}
                {include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="subject" filterValue=$subject key="search.subject"}
                {include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="type" filterValue=$type key="search.typeMethodApproach"}
                {include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="coverage" filterValue=$coverage key="search.coverage"}
                {include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="indexTerms" filterValue=$indexTerms key="search.indexTermsLong"}
              {/if}

            <p><input id="addSearch" type="submit" value="{translate key="common.search"}" class="btn changeRadius" /></p>
          {/capture}
          {include file="controllers/extrasOnDemand.tpl" id="emptyFilters" moreDetailsText="search.advancedSearchMore" lessDetailsText="search.advancedSearchLess" extraContent=$emptyFilters}
        {/if}
      </form>

    <br />

    {call_hook name="Templates::Search::SearchResults::PreResults"}

    {if $currentJournal}
      {assign var=numCols value=3}
    {else}
      {assign var=numCols value=4}
    {/if}

    <div id="results">
          &nbsp;
          {if !$currentJournal}{translate key="journal.journal"}{/if}
          <!-- {translate key="issue.issue"}
          {translate key="article.title"} -->
          &nbsp;

        {iterate from=results item=result}
          {assign var=publishedArticle value=$result.publishedArticle}
          {assign var=article value=$result.article}
          {assign var=issue value=$result.issue}
          {assign var=issueAvailable value=$result.issueAvailable}
          {assign var=journal value=$result.journal}
          {assign var=section value=$result.section}

          <div class="row">
            <div class="col-xs-12">

                {if !$currentJournal}
                  <a href="{url journal=$journal->getPath()}">{$journal->getLocalizedTitle()|escape}</a> <br>
                {/if}
                <a href="{url journal=$journal->getPath() page="issue" op="view" path=$issue->getBestIssueId($journal)}">{$issue->getIssueIdentification()|escape}</a>
                {$article->getLocalizedTitle()|strip_unsafe_html}
                  {if $publishedArticle->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN|| $issueAvailable}
                    {assign var=hasAccess value=1}
                  {else}
                    {assign var=hasAccess value=0}
                  {/if}
                  {if $publishedArticle->getLocalizedAbstract() != ""}
                    {assign var=hasAbstract value=1}
                  {else}
                    {assign var=hasAbstract value=0}
                  {/if}
                  {if !$hasAccess || $hasAbstract}
                    <a href="{url journal=$journal->getPath() page="article" op="view" path=$publishedArticle->getBestArticleId($journal)}" class="file">
                      {if !$hasAbstract}
                        {translate key="article.details"}
                      {else}
                        {translate key="article.abstract"}
                      {/if}
                    </a> <br>
                  {/if}
                  {if $hasAccess}
                    {foreach from=$publishedArticle->getGalleys() item=galley name=galleyList}
                      <a href="{url journal=$journal->getPath() page="article" op="view" path=$publishedArticle->getBestArticleId($journal)|to_array:$galley->getBestGalleyId($journal)}" class="file">{$galley->getGalleyLabel()|escape}</a>
                    {/foreach}
                  {/if}
                  <br>
                  {call_hook name="Templates::Search::SearchResults::AdditionalArticleLinks" articleId=$publishedArticle->getId()}

                  {foreach from=$article->getAuthors() item=authorItem name=authorList}
                    {$authorItem->getFullName()|escape}{if !$smarty.foreach.authorList.last},{/if}
                  {/foreach}

              {call_hook name="Templates::Search::SearchResults::AdditionalArticleInfo" articleId=$publishedArticle->getId() numCols=$numCols|escape}
            </div>
          </div>


          &nbsp;
        {/iterate}
        <br>
        {if $results->wasEmpty()}
              {if $error}
                {$error|escape}
              {else}
                {translate key="search.noResults"}
              {/if}
            &nbsp;
        {else}

            {page_info iterator=$results}
              {page_links anchor="results" iterator=$results name="search" query=$query searchJournal=$searchJournal authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText suppFiles=$suppFiles discipline=$discipline subject=$subject type=$type coverage=$coverage indexTerms=$indexTerms dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear orderBy=$orderBy orderDir=$orderDir}
        {/if}

        <h4 id="searchTips">Can't find what you are looking for?  <i class="fa fa-arrow-circle-down toggleDownArrow" aria-hidden="true"></i> <i class="fa fa-arrow-circle-up toggleUpArrow" aria-hidden="true"></i></h4>

        <div id="hideSearchTips">
          {capture assign="syntaxInstructions"}{call_hook name="Templates::Search::SearchResults::SyntaxInstructions"}{/capture}
            {if empty($syntaxInstructions)}
              {translate key="search.syntaxInstructions"}
            {else}
              {* Must be properly escaped in the controller as we potentially get HTML here! *}
              {$syntaxInstructions}
            {/if}
        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">{literal}
$("#searchTips").click(function(){
  $("#hideSearchTips").toggle();
  $(".toggleUpArrow").toggle();
  $(".toggleDownArrow").toggle();
})
{/literal}
</script>

{include file="common/footer.tpl"}
