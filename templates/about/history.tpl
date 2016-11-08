{**
 * templates/about/history.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal => History
 *
 *}
{strip}
{assign var="pageTitle" value="about.history"}
{include file="common/header.tpl"}
{/strip}
<link rel="stylesheet" href="{$baseUrl}/lib/osu/osuHideSideBar.css" type="text/css">
<div class="row">
  <div class="col-xs-8 col-xs-offset-2">
    {$history}
  </div>
</div>



{include file="common/footer.tpl"}
