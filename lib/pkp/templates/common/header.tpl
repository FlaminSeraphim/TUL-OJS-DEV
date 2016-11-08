{**
 * header.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site header.
 *}
{strip}
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{if $pageCrumbTitle}
	{translate|assign:"pageCrumbTitleTranslated" key=$pageCrumbTitle}
{elseif !$pageCrumbTitleTranslated}
	{assign var="pageCrumbTitleTranslated" value=$pageTitleTranslated}
{/if}
{/strip}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
  <meta name="viewport" content="width=device-width">
	<title>{$pageTitleTranslated}</title>
	<meta name="description" content="{$metaSearchDescription|escape}" />
	<meta name="keywords" content="{$metaSearchKeywords|escape}" />
	<meta name="generator" content="{$applicationName} {$currentVersionString|escape}" />
	<!-- {$metaCustomHeaders} -->
	{if $displayFavicon}<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />{/if}
	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/pkp.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src="https://use.fontawesome.com/515cb1f837.js"></script>
  <link rel="stylesheet" href="{$baseUrl}/lib/osu/osuCss.css" type="text/css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <link href="https://fonts.googleapis.com/css?family=Forum" rel="stylesheet">


	<!-- Base Jquery -->
	{if $allowCDN}<script type="text/javascript" src="//www.google.com/jsapi"></script>
		<script type="text/javascript">{literal}
			<!--
			// Provide a local fallback if the CDN cannot be reached
			if (typeof google == 'undefined') {
				document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
				document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js' type='text/javascript'%3E%3C/script%3E"));
			} else {
				google.load("jquery", "{/literal}{$smarty.const.CDN_JQUERY_VERSION}{literal}");
				google.load("jqueryui", "{/literal}{$smarty.const.CDN_JQUERY_UI_VERSION}{literal}");
			}
			// -->
		{/literal}</script>
	{else}
		<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js"></script>
	{/if}

	{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
	{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
	{if $leftSidebarCode || $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/sidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/leftSidebar.css" type="text/css" />{/if}
	{if $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/rightSidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode && $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/bothSidebars.css" type="text/css" />{/if}

	{foreach from=$stylesheets item=cssUrl}
		<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
	{/foreach}

	<!-- Default global locale keys for JavaScript -->
	{include file="common/jsLocaleKeys.tpl" }

	<!-- Compiled scripts -->
	{if $useMinifiedJavaScript}
		<script type="text/javascript" src="{$baseUrl}/js/pkp.min.js"></script>
	{else}
		{include file="common/minifiedScripts.tpl"}
	{/if}

	<!-- Form validation -->
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/validate/jquery.validate.js"></script>
	<script type="text/javascript">
		<!--
		// initialise plugins
		{literal}
		$(function(){
			jqueryValidatorI18n("{/literal}{$baseUrl}{literal}", "{/literal}{$currentLocale}{literal}"); // include the appropriate validation localization
			{/literal}{if $validateId}{literal}
				$("form[name={/literal}{$validateId}{literal}]").validate({
					errorClass: "error",
					highlight: function(element, errorClass) {
						$(element).parent().parent().addClass(errorClass);
					},
					unhighlight: function(element, errorClass) {
						$(element).parent().parent().removeClass(errorClass);
					}
				});
			{/literal}{/if}{literal}
			$(".tagit").live('click', function() {
				$(this).find('input').focus();
			});
		});
		// -->
		{/literal}
	</script>

	{if $hasSystemNotifications}
		{url|assign:fetchNotificationUrl page='notification' op='fetchNotification' escape=false}
		<script type="text/javascript">
			$(function(){ldelim}
				$.get('{$fetchNotificationUrl}', null,
					function(data){ldelim}
						var notifications = data.content;
						var i, l;
						if (notifications && notifications.general) {ldelim}
							$.each(notifications.general, function(notificationLevel, notificationList) {ldelim}
								$.each(notificationList, function(notificationId, notification) {ldelim}
									$.pnotify(notification);
								{rdelim});
							{rdelim});
						{rdelim}
				{rdelim}, 'json');
			{rdelim});
		</script>
	{/if}{* hasSystemNotifications *}

	{$additionalHeadData}
</head>
<body id="pkp-{$pageTitle|replace:'.':'-'}">
<div id="container">

  <div id="header">
    <div id="headerTitle">
      <!-- adding login button on the top right -->

      {if $isUserLoggedIn}
        <!-- <form  action="{url page="login" op="signOut"}" method="get"> -->
          <!-- <button type="button" class="btn btn-default navbar-btn" id="logout"><a href="{url page="login" op="signOut"}">{translate key="user.logOut"}</a></button> -->
          <a id="logout"href="{url page="login" op="signOut"}"><i class="fa fa-sign-out" aria-hidden="true"></i>{translate key="user.logOut"}</a>
        <!-- </form> -->
  		{else}
      <!-- <form  action="{url page="login"}" method="post"> -->
        <!-- <button  type="button" class="btn btn-default navbar-btn" id="logintop"><a href="{url page="login"}">{translate key="navigation.login"}</a></button> -->
        <a id="logintop"href="{url page="login"}">{translate key="navigation.login"}<i class="fa fa-sign-in floatRight" aria-hidden="true"></i></a>
      <!-- </form> -->
  		{/if}{* $isUserLoggedIn *}
      <div id="socialMediaIcons" class="floatRight">
        <i class="fa fa-facebook-official" aria-hidden="true"></i>
        <a href="https://twitter.com/MedProceedings"><i class="fa fa-twitter-square" aria-hidden="true"></i></a>
      </div>
      <div class="clear"></div>
      <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
          <div id="osuHeader">

            {if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
            	<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
            {/if}
            <div class="getInline">
                <!-- <h3 id="osuHeaderH3">
                Oklahoma State -->
                <!-- {if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)}
                	<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} />
                {elseif $displayPageHeaderTitle}
                	{$displayPageHeaderTitle}
                {elseif $alternatePageHeader}
                	{$alternatePageHeader}
                {elseif $siteTitle}
                	{$siteTitle}
                {else}
                	{$applicationName}
                {/if} -->
              <!-- </h3> -->
              <h1 id="osuHeaderH1"> <span id="osuHeaderSpan">OKLAHOMA STATE</span> <img class="" id="osuLogo" src="{$baseUrl}/public/osuImages/StateSeal125px.png" /><span id="forsmall">OKLAHOMA STATE</span> MEDICAL PROCEEDINGS</h1>
            </div>
            <div class="clear"></div>
          </div>
          <form class="form-inline headerSearch" action="{url page="search" op="search"}">
            <div class="form-group">
              <!-- {translate key="plugins.block.navigation.searchScope"} -->
              <select id="searchCategories" name="searchField" size="1" class="selectMenu form-control">
                {html_options_translate options=$articleSearchByOptions}
              </select>
            {capture assign="filterInput"}{call_hook name="Templates::Search::SearchResults::FilterInput" filterName="simpleQuery" filterValue="" size=15}{/capture}
              {if empty($filterInput)}
                <!-- <input id="searchInput" type="text" name="simpleQuery" size="15" maxlength="255" value="" class="textField form-control" placeholder="search"/> -->
                <fieldset>
                  <input type="search" name="simpleQuery" placeholder="Search Our Medical Journal"/>
                  <button type="submit" >
                    <i class="fa fa-search"></i>
                  </button>
                </fieldset>
              {else}
                {$filterInput}
              {/if}
              <!-- <button type="submit" class="btn btn-success">
                <i class="fa fa-search" aria-hidden="true"></i>
              </button> -->

                <!-- <input type="submit" value="<i class="fa fa-search" aria-hidden="true"></i>{translate key="common.search"}" class="button btn btn-default" id="osuHeaderSearchBtn" /> -->
            </div>
          </form>
        </div>
      </div>

  </div>
  <!-- ================ search form added navbar moved ================= -->


  <div class="clear"></div>

  {include file="common/navbar.tpl"}
  <!-- ================ /end search form added and navabar moved================= -->
  </div>


<div id="body">

{if $leftSidebarCode || $rightSidebarCode}
	<div id="sidebar">
		{if $leftSidebarCode}
			<div id="leftSidebar">
				{$leftSidebarCode}
			</div>
		{/if}
		{if $rightSidebarCode}
			<div id="rightSidebar">
				{$rightSidebarCode}
			</div>
		{/if}
	</div>
{/if}

<div id="main">


<!-- {include file="common/breadcrumbs.tpl"} -->



<!-- <h2>{$pageTitleTranslated}</h2> -->

{if $pageSubtitle && !$pageSubtitleTranslated}{translate|assign:"pageSubtitleTranslated" key=$pageSubtitle}{/if}
{if $pageSubtitleTranslated}
	<h3>{$pageSubtitleTranslated}</h3>
{/if}

<div id="content">
