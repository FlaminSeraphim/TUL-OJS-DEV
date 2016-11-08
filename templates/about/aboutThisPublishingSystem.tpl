{**
 * templates/about/aboutThisPublishingSystem.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal / About This Publishing System.
 *
 * TODO: Display the image describing the system.
 *
 *}
{strip}
{assign var="pageTitle" value="about.aboutThisPublishingSystem"}
{include file="common/header.tpl"}
{/strip}
<link rel="stylesheet" href="{$baseUrl}/lib/osu/osuHideSideBar.css" type="text/css">
<div class="row">
  <div class="col-xs-8 col-xs-offset-2">

    <p id="aboutThisPublishingSystem">
    {if $currentJournal}
    	{translate key="about.aboutOJSJournal" ojsVersion=$ojsVersion}
    {else}
    	{translate key="about.aboutOJSSite" ojsVersion=$ojsVersion}
    {/if}
    </p>

    <p align="center">
    	<img src="{$baseUrl}/{$edProcessFile}" style="border: 0;" alt="{translate key="about.aboutThisPublishingSystem.altText"}" />
    </p>
  </div>
</div>


{include file="common/footer.tpl"}
