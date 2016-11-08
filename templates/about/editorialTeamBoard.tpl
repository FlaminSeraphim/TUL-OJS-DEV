{**
 * templates/about/editorialTeamBoard.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal index.
 *
 *}
{strip}
{assign var="pageTitle" value="about.editorialTeam"}
{include file="common/header.tpl"}
{/strip}
<link rel="stylesheet" href="{$baseUrl}/lib/osu/osuHideSideBar.css" type="text/css">
<div class="row">
  <div class="col-xs-8 col-xs-offset-2">
    {call_hook name="Templates::About::EditorialTeam::Information"}

    {foreach from=$groups item=group}
    <div id="group">
    	<h4>{$group->getLocalizedTitle()}</h4>
    	{assign var=groupId value=$group->getId()}
    	{assign var=members value=$teamInfo[$groupId]}

    	<ol class="editorialTeam">
    		{foreach from=$members item=member}
    			{assign var=user value=$member->getUser()}
    			<div class="member"><li><a href="javascript:openRTWindow('{url op="editorialTeamBio" path=$user->getId()}')">{$user->getFullName()|escape}</a>{if $user->getLocalizedAffiliation()}, {$user->getLocalizedAffiliation()|escape}{/if}{if $user->getCountry()}{assign var=countryCode value=$user->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}</li></div>
    		{/foreach}{* $members *}
    	</ol>
    </div>
    {/foreach}{* $groups *}
  </div>
</div>

{include file="common/footer.tpl"}
